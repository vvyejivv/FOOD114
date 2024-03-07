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
	<title>로그인</title>
</head>

<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section>
		<div id="app">
			<div class="login_Container">
				<div class="login_Box">
					<p id="login_font">로그인</p>
					<div id="login_Form">
						<input type="text" placeholder="아이디" class="idPwd_input" v-model="userId" :style="{border: flg? '1px solid red' : '1px solid #ccc'}" @change="fnInput"> 
						<div class="login_text" v-html="idErrormsg"></div>
						<input type="password" placeholder="비밀번호" class="idPwd_input" v-model="pwd" :style="{border: pwdFlg? '1px solid red' : '1px solid #ccc'}"  @keyup.enter="fnLogin" @change="fnInput"> 
						<div class="login_text" v-html="pwdErrormsg"></div>
						<div class="login_text" id="login_text" v-html="errormsg"></div>
						<!-- <span id="login_checkBox"><input type="checkbox">로그인 상태 유지</span> -->
						<button class="login_button" @click="fnLogin">로그인</button>
						<button class="join_button" @click="fnJoin">회원가입</button>
					</div>
					<ul class="login_find">
						<li><a href="javascript:;"> 아이디 찾기</a></li>
						<li><span> | </span></li>
						<li><a href="javascript:;"> 비밀번호 찾기</a></li>
					</ul>
				</div>
	
			</div>
		</div>
	</section>

	<footer>
		<%@include file="main(footer).html"%>
	</footer>
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
						if (data.pwd == "pwdSuccess") {
							location.href="/main.do";							
						}else{
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