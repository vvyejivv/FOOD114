<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
<link rel="stylesheet" href="../css/event_info_biz.css">
</head>
<body>
	<header>
		<%@include file="main(header)_biz.html"%>
	</header>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">이벤트&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<div class="infoBox">
					<div class="infoDiv">
						<div class="infoName">
							이벤트 메인 이미지
						</div>
						<span class="viewInfo">
							<img class="mainImg" v-if="!updateFlg" :src="eventInfo.path">
							<input v-if="updateFlg" type="file" id="file1" name="file1" accept=".jpg, .png, .gif">
						</span>
					</div>
					<div class="infoDiv">
						<div class="infoName">
							이벤트 종류 
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{eventInfo.type}}</span>
						<input v-if="updateFlg" class="updateInput" v-model="eventInfo.type">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							이벤트 제목
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{eventInfo.title}}</span>
						<input v-if="updateFlg" class="updateInput" v-model="eventInfo.title">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							이벤트 내용
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{eventInfo.contents}}</span>
						<input v-if="updateFlg" class="updateInput" v-model="eventInfo.contents">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							이벤트 상태
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{eventInfo.endYn}}</span>
						<input v-if="updateFlg" class="updateInput" v-model="eventInfo.endYn">
					</div>									
				</div>
				<button v-if="!updateFlg" class="btn-modify" @click="fnInfoUpdate()">정보 변경하기</button>
				<div v-if="updateFlg">
					<button style="margin-left: 370px;" class="updateBtn" @click="fnAdd()">수정</button>
					<button class="updateBtn" @click="fnInfoUpdate()">취소</button>
				</div>
			</div>
		</div>
	</section>

	<%@include file="main(footer)_biz.html"%>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			boardNo : '${map.boardNo}',
			sessionId : "${sessionBizId}",
			updateFlg : false,
			eventInfo : {}
		},
		methods : {
			list : function() {
				var self = this;
				if(!self.sessionId){
					$.pageChange("/bizLogin.do", {});
					return;
				}
				var nparmap = {boardNo : self.boardNo};
				$.ajax({
					url : "listBizEventView.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data.listBizEventView);
						console.log(self.boardNo);
						self.eventInfo = data.listBizEventView;
					}
				});
			},
			fnInfoUpdate : function() {
				var self = this;
				if(!self.sessionId){
					$.pageChange("/bizLogin.do", {});
					return;
				}
				self.updateFlg = !self.updateFlg;
			},
			fnAdd : function(){
                var self = this;
                if(!self.sessionId){
					$.pageChange("/bizLogin.do", {});
					return;
				}
            var form = new FormData();
            var fileInput = document.getElementById('file1');
             if (fileInput.files.length > 0) {
                 // 파일이 선택된 경우에만 FormData에 파일 추가
                 form.append( "file1",  fileInput.files[0] );
             }
             form.append( "boardNo",  self.boardNo);
             form.append( "type",  self.eventInfo.type);
             form.append( "title",  self.eventInfo.title);
             form.append( "contents",  self.eventInfo.contents);
             form.append( "endYn",  self.eventInfo.endYn);
             
                 // 파일이 선택되었을 때만 업로드 실행
                 if (fileInput.files.length > 0) {
                     self.upload(form);
                     $.pageChange("/bizEvent.do", {});
                 } else {
                    self.fnNoFile();
                 }
           }
         // 파일 업로드
          , upload : function(form){
             var self = this;
               $.ajax({
                   url : "/bizEventFileUpload.dox"
                 , type : "POST"
                 , processData : false
                 , contentType : false
                 , data : form
                 , success:function(response) { 
                    
                 }              
             });
         },
         fnNoFile : function() {
             var self = this;
             var nparmap = {
                boardNo : self.boardNo,
                type : self.eventInfo.type,
                title : self.eventInfo.title,
                contents : self.eventInfo.contents,
                endYn : self.eventInfo.endYn
             };
             $.ajax({
                url : "/editBizEventBoard.dox",
                dataType : "json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                   $.pageChange("/bizEvent.do", {});
                }
             });
          }
		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>
