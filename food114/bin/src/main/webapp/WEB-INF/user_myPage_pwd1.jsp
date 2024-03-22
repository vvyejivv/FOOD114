<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FOOD114::마이페이지(비밀번호변경)</title>
<style>
[v-cloak] { display: none; }
</style>
</head>
<body>
<div id="Container">
		<%@include file="food114_header.jsp"%>
		
	<section>
		<div style="width: 1420px; display: flex; margin: 0px auto;">
			<%@include file="myPage_header.jsp"%>
			<div id="app" v-cloak>
				<div class="content">
					<h2>
						<a  style="font-size: 25px; color: #747171;">
							<span style="color: #ff7f00; font-weight: bold;">| </span>비밀번호 변경
						</a>
					</h2>
					<div>
						<div style="font-size: 13px; color: #969393;margin-bottom: 5px;">회원님의 정보를 안전하게
							보호하기 위해 비밀번호를 다시 한 번 확인합니다.</div>
						<div class="table">

							<div class="row">
								<div class="cell1">아이디</div>
								<div class="cell2">{{info.userId}}</div>
							</div>
							<div class="row">
								<div class="cell1">비밀번호</div>
								<div class="cell2">
									<input type="password" v-model="pwd" style="margin-left: 0px;">
								</div>

							</div>
							<div class="row" style="justify-content: center; padding-top:20px;">
								<div style="">
									<button class="buttonSubmit" @click="fnClick" >취소</button>
									<button class="buttonSubmit" @click="checkPwd">확인</button>
								</div>
							</div>
						</div>


					</div>

				</div>
			</div>
		</div>
	</section>

	<%@include file="food114_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			info : {},
			sessionId : "${sessionId}",
			newName : '',
			pwd : '',
			errorMessage : ''
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
					$.pageChange("food114-myPage-pwd2.do", {
						result : "success"
					});
					
					/* alert("동일"); */
				} else if(self.pwd == "" || self.pwd == null){
					alert("비밀번호를 입력해주세요.");
				} else{
					alert("비밀번호가 다릅니다.");
				}
			},			
			fnClick : function() {
				location.href = "/food114-myPage.do";
			},
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>
</html>
