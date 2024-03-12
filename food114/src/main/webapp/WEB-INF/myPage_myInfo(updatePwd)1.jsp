<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
</style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(updatePwd).css">
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>

	<!-- 광고창 -->
	<!--
        <div class="ad">
            광고창
            <button class="adClose">x</button>
        </div>
    -->
	<section>

		<div class="container">
			<%@include file="myPage_header.jsp"%>
			<div id="app">
				<div class="content">
					<h2>
						<a href="javascript:;" style="font-size: 25px; color: #747171;">
							<span style="color: #ff7f00; font-weight: bold;">| </span>비밀번호 변경
						</a>
					</h2>
					<div>
						<div style="font-size: 13px; color: #969393;">회원님의 정보를 안전하게
							보호하기 위해 비밀번호를 다시 한 번 확인합니다.</div>
						<div class="table">
							<form id="passwodForm">
								<div class="row">
									<div class="cell1">아이디</div>
									<div class="cell2">{{info.userId}}</div>
								</div>
								<div class="row">
									<div class="cell1">비밀번호</div>
									<div class="cell2">
										<input type="password" v-model="pwd">
									</div>
								</div>
								<div class="row">
									<button
										style="background-color: #f9f9f9; color: rgb(72, 72, 72); border: 1px solid #ccc;">취소</button>
									<button @click="checkPwd">확인</button>
								</div>
							</form>
						</div>


					</div>

				</div>
			</div>
		</div>
	</section>

	<%@include file="main(footer).html"%>
</body>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			info : {},
			sessionId : "${sessionId}",
			newName : '',
			pwd : ''
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {
					userId : self.sessionId
				};
				$.ajax({
					url : "myInfo.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.info;
						console.log(data.info);
					}
				});
			},
			checkPwd : function() {
				var self = this;
				if (self.pwd == self.info.pwd) {
					location.href = "/myInfoPwdUpdate.do";
					/* alert("동일"); */
				} else {
					alert("다름");
				}
			},
			fnMyInfo : function() {
				location.href = "/myInfo.do";
			},
			fnMyInfoPwd : function() {
				location.href = "/myInfoPwd.do";
			},
			myInfoAddr : function() {
				location.href = "/myInfoAddr.do";
			},
			fnMyInfoGrade : function() {
				location.href = "/myInfoGrade.do";
			},
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>
</html>
