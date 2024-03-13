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
							<img class="mainImg" v-if="eventFile" :src="eventFile.path">
							<input type="file" id="file1" name="file1" accept=".jpg, .png, .gif">
							<button class="button-detail" v-if="!eventFile" @click="fnFileUpload()">저장</button>
							<button class="button-detail" v-if="eventFile" @click="fnFileUpload()">변경</button>
						</span>
					</div>
					<div class="infoDiv">
						<div class="infoName">
							이벤트 종류 카테고리
						</div>
						<span v-if="!updateFlg" class="viewInfo">우리동네</span>
						<input v-if="updateFlg" class="updateInput" :value="bizEventInfo.eventCategory">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							이벤트 제목
						</div>
						<span v-if="!updateFlg" class="viewInfo">우리동네 첫 오픈 이벤트!</span>
						<input v-if="updateFlg" class="updateInput" :value="bizEventInfo.eventTitle">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							이벤트 내용
						</div>
						<span v-if="!updateFlg" class="viewInfo">첫 오픈 기념으로 15000원 이상 배달시 사이드메뉴 하나 드려요!</span>
						<input v-if="updateFlg" class="updateInput" :value="bizEventInfo.eventContent">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							이벤트 상태
						</div>
						<span v-if="!updateFlg" class="viewInfo">진행중</span>
						<input v-if="updateFlg" class="updateInput" :value="bizEventInfo.eventState">
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
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "test.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
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
