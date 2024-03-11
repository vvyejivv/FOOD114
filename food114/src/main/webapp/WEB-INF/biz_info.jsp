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
	height: 405px;
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

input {
	height:17px;
	border: 1px solid #ddd;
	border-radius: 3px;
}
</style>
<body>
	<%@include file="main(header).html"%>
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
							사업자번호
						</div>
						<span class="viewInfo">123-12-12345</span>
					</div>
					<div class="infoDiv">
						<div class="infoName">
							상호
						</div>
						<span v-if="!updateFlg" class="viewInfo">오아저씨철판</span>
						<input v-if="updateFlg" class="viewInfo" value="오아저씨철판">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							사업장 주소
						</div>
						<span v-if="!updateFlg" class="viewInfo">인천 부평구 경원대로 1366</span>
						<input v-if="updateFlg" class="viewInfo" value="인천 부평구 경원대로 1366">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							대표 이름
						</div>
						<span v-if="!updateFlg" class="viewInfo">오아재</span>
						<input v-if="updateFlg" class="viewInfo" value="오아재">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							대표연락처
						</div>
						<span v-if="!updateFlg" class="viewInfo">01055555555</span>
						<input v-if="updateFlg" class="viewInfo" value="01055555555">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							대표이메일주소
						</div>
						<span v-if="!updateFlg" class="viewInfo">honghong@hong.co.kr</span>
						<input v-if="updateFlg" class="viewInfo" value="honghong@hong.co.kr">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							은행
						</div>
						<span v-if="!updateFlg" class="viewInfo">신한은행</span>
						<input v-if="updateFlg" class="viewInfo" value="신한은행">
					</div>
					<div class="infoDiv">
						<div class="infoName">
							계좌번호
						</div>
						<span v-if="!updateFlg" class="viewInfo">110439130740</span>
						<input v-if="updateFlg" class="viewInfo" value="110439130740">
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
	<%@include file="main(footer).html"%>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			updateFlg : false
		},
		methods : {
			fnInfoUpdate : function() {
				var self = this;	
				self.updateFlg = !self.updateFlg;
			}
		},
		created : function() {
			var self = this;

		}
	});
</script>