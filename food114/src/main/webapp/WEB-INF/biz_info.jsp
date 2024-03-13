<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/sideBar_biz.css">
<title>로그인</title>
</head>
<style>
.infoBox {
	width: 1000px;
	/* height: 495px; */
	margin-top: 13px;
	border: 1px solid #ddd;
	border-radius: 2px;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
	color:#555;
}

.btn-modify {
	width: 200px;
	margin-top: 30px;
	margin-left: 370px;
	background-color: #ffffff; /* 버튼 배경색 (흰색) */
	border: 1px solid #2196F3; /* 버튼 테두리 (파란색) */
	color: #2196F3; /* 텍스트 색상 (파란색) */
	padding: 8px 12px; /* 내부 여백 */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
}

.btn-modify:hover {
	border: 1px solid #ff7f00;
	color: #ff7f00;
}

.infoBox .infoDiv {
	margin: 15px 0 25px 20px;
}

.infoName {
	display:inline-block;
	width:300px;
}

.updateBtn {
	width:98px;
	margin-top: 30px;
	background-color: #ffffff; /* 버튼 배경색 (흰색) */
	border: 1px solid #2196F3; /* 버튼 테두리 (파란색) */
	color: #2196F3; /* 텍스트 색상 (파란색) */
	padding: 8px 12px; /* 내부 여백 */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
}

.updateBtn:hover {
	border: 1px solid #ff7f00;
	color: #ff7f00;
}

.viewInfo {
	
}

.updateInput {
	height:17px;
	border: 1px solid #ddd;
	border-radius: 3px;
}

input[type="file"] {
    border: 1px solid #ddd;
	border-radius: 3px;
}

.mainImg {
	width:100px;
	height:50px;
}
</style>
<body>
	<%@include file="main(header)_biz.html"%>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
               	<span style="color: #ff7f00; font-weight: bold;">| </span><span
                  style="text-align: left; color: rgba(72, 72, 72);">판매자정보&nbsp;</span>
            	</h2>
				<div class="infoBox">
					<div class="infoDiv">
						<div class="infoName">
							메인 이미지
						</div>
						<span class="viewInfo">
							<img class="mainImg" v-if="bizFile" :src="bizFile.path">
							<input type="file" id="file1" name="file1" accept=".jpg, .png, .gif">
							<button v-if="!bizFile" @click="fnFileUpload()">저장</button>
							<button v-if="bizFile" @click="fnFileUpload()">변경</button>
						</span>
					</div>
					<div class="infoDiv">
						<div class="infoName">
							사업자번호
						</div>
						<span class="viewInfo">{{bizInfo.bizNo}}</span>
					</div>
					<div class="infoDiv">
						<div class="infoName">
							상호
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.bizName}}</span>
						<input v-if="updateFlg" class="updateInput" :value="bizInfo.bizName">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							판매 카테고리
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.categoryName}}</span>
						<input v-if="updateFlg" class="updateInput" :value="bizInfo.categoryName">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							사업장 주소
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.newAddr}} {{bizInfo.detail}}</span>
						<input v-if="updateFlg" class="updateInput" :value="bizInfo.newAddr +' '+ bizInfo.detail">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							대표 이름
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.ownerName}}</span>
						<input v-if="updateFlg" class="updateInput" :value="bizInfo.ownerName">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							대표연락처
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.phone}}</span>
						<input v-if="updateFlg" class="updateInput" :value="bizInfo.phone">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							대표이메일주소
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.email}}</span>
						<input v-if="updateFlg" class="updateInput" :value="bizInfo.email">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							은행
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.bankName}}</span>
						<input v-if="updateFlg" class="updateInput" :value="bizInfo.bankName">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							계좌번호
						</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.accountNumber}}</span>
						<input v-if="updateFlg" class="updateInput" :value="bizInfo.accountNumber">
					</div>
				</div>
				<button v-if="!updateFlg" class="btn-modify" @click="fnInfoUpdate()">정보 변경하기</button>
				<div v-if="updateFlg">
					<button style="margin-left: 370px;" class="updateBtn" @click="fnInfoUpdate()">수정</button>
					<button class="updateBtn" @click="fnInfoUpdate()">취소</button>
				</div>
			</div>
		</div>
	</section>
	<%@include file="main(footer)_biz.html"%>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			updateFlg : false,
			sessionId : "${sessionId}",
			bizInfo : {},
			bizFile : {}
		},
		methods : {
			fnInfoUpdate : function() {
				var self = this;	
				self.updateFlg = !self.updateFlg;
			},
			fnBizView : function() {
				var self = this;
				var nparmap = {
					bizId : self.sessionId						
				};
				$.ajax({
					url : "bizView.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.bizInfo = data.bizInfo;
						if(data.bizFile){
							self.bizFile = data.bizFile;
						}
					}
				});
			},
			fnFileUpload : function(){
				var self = this;
				var form = new FormData();
	   	        form.append( "file1",  $("#file1")[0].files[0] );
	   	     	form.append( "bizId",  self.sessionId);
	       		self.upload(form);
	       		$.pageChange("/biz-info.do", {});
	        }
			// 파일 업로드
		    , upload : function(form){
		    	var self = this;
		         $.ajax({
		             url : "/fileUpload.dox"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { 
		        	   
		           }	           
		       });
			}
		},
		created : function() {
			var self = this;
			self.fnBizView();
		}
	});
</script>