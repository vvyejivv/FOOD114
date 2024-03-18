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
	<link rel="stylesheet" href="../css/login.css">
	<link rel="stylesheet" href="../css/food114.css">
	<title>로그인</title>
</head>

<body>
	<div id="Container">
	<header>
		<%@include file="food114_header.jsp"%>
	</header>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section>
		<div id="app">
			<div class="login_Container" style="width: fit-content; margin: 0px auto; margin-top: 150px; ">
				<div class="login_Box" style="width: fit-content">
					<p id="login_font" style="color:#ff8002">로그인</p>
					<div id="login_Form" style="width: fit-content;">
						<input type="text" placeholder="아이디" class="idPwd_input" v-model="userId" :style="{border: flg? '1px solid red' : '1px solid #ccc'}" @change="fnInput" style="width: 400px; height: 32px; border: 1px solid #ededed; border-radius: 8px;"> 
						<div class="login_text" v-html="idErrormsg"></div>
						<input type="password" placeholder="비밀번호" class="idPwd_input" v-model="pwd" :style="{border: pwdFlg? '1px solid red' : '1px solid #ccc'}"  @keyup.enter="fnLogin" @change="fnInput" style="width: 400px;height: 32px; border: 1px solid #ededed; border-radius: 8px;">  
						<div class="login_text" v-html="pwdErrormsg"></div>
						<div class="login_text" id="login_text" v-html="errormsg"></div>
						<!-- <span id="login_checkBox"><input type="checkbox">로그인 상태 유지</span> -->
						<button class="login_button" @click="fnLogin" style="height: 58px; border-radius: 8px; background-color: #ff8002">로그인</button>
						<button class="join_button" @click="fnJoin" style="height: 58px; border-radius: 8px; border: 1px solid #ededed; color:#5f5f5f;">회원가입</button>
					</div>
					<!-- <ul class="login_find">
						<li><a href="javascript:;"> 아이디 찾기</a></li>
						<li><span> | </span></li>
						<li><a href="javascript:;"> 비밀번호 찾기</a></li>
					</ul> -->
				</div>
	
			</div>
		</div>
	</section>

		<%@include file="food114_footer.jsp"%>
	</div>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			userId : "",
			pwd : "",
			idErrormsg : "",
			pwdErrormsg : "",
			flg : false,
			pwdFlg : false,
			errormsg : ""
		},
		methods : {
			fnLogin : function() {
				var self = this;
				self.flg = false;
				if(self.userId == null || self.userId == ""){
					self.idErrormsg = "아이디를 입력해주세요.";
					self.errormsg ="";
					self.flg = true;
					return;
				}
				if(self.pwd == null || self.pwd == ""){
					self.pwdErrormsg = "비밀번호를 입력해주세요.";
					self.errormsg ="";
					self.pwdFlg = true;
					return;
				}
				var nparmap = {
					userId : self.userId,
					pwd : self.pwd
				};
				$.ajax({
					url : "consumer-login.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data);
						if (data.pwd == "pwdSuccess"&&data.status=="success") {														
							location.href="/food114-2.do";			
						}
						else{
							self.errormsg = data.message;						
						}
					}
				});
			},
			fnInput : function(){
				var self = this;
				self.idErrormsg = "";
				self.pwdErrormsg = "";
				self.flg = false;
				self.pwdFlg = false;
			},
			fnJoin : function() {
				location.href="consumer-join.do";
			}
		},
		created : function() {
			var self = this;

		}
	});
</script>