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
	<title>사장님 페이지 로그인</title>
</head>

<body style="margin: 0px auto;">
	<header>
		<%@include file="food114_header(biz).jsp"%>
	</header>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section>
		<div id="app">
			<div class="login_Container"
				style="width: fit-content; margin: 0px auto; margin-top: 150px;">
				<div class="login_Box" style="width: fit-content">
					<p id="login_font" style="color: #222222;">로그인</p>
					<div id="login_Form" style="width: fit-content;">
						<input type="text" placeholder="아이디" class="idPwd_input" v-model="bizId" @change="fnInput"
						style="width: 400px; height: 32px; border: 1px solid #ededed; border-radius: 8px;"> 
						<!-- :style="{border: flg? '1px solid red' : '1px solid #ccc'}"   -->
						<div class="login_text" v-html="idErrormsg"></div>
						<input type="password" placeholder="비밀번호" class="idPwd_input" v-model="pwd"  @keyup.enter="fnLogin" @change="fnInput"
						style="width: 400px; height: 32px; border: 1px solid #ededed; border-radius: 8px;"> 
						<!-- :style="{border: pwdFlg? '1px solid red' : '1px solid #ccc'}"  -->
						<div class="login_text" v-html="pwdErrormsg"></div>
						<div class="login_text" id="login_text" v-html="errormsg"></div>
						<!-- <span id="login_checkBox"><input type="checkbox">로그인 상태 유지</span> -->
						<button class="login_button" @click="fnLogin" style="color: #222222; background-color:rgb(240,240,240);">로그인</button>
						<button class="join_button" @click="fnJoin"style="height: 58px; border-radius: 8px; border: 1px solid #ededed; background-color: #fff; color: #5F5F5F;">사업자 회원가입</button>
					</div>
<!-- 					<ul class="login_find">
						<li><a href="javascript:;"> 아이디 찾기</a></li>
						<li><span> | </span></li>
						<li><a href="javascript:;"> 비밀번호 찾기</a></li>
					</ul> -->
				</div>
	
			</div>
		</div>
	</section>


		<%@include file="food114_footer(biz).jsp"%>

</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			bizId : "",
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
				self.pwdErrormsg = "";
				if(self.bizId == null || self.bizId == ""){
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
					bizId : self.bizId,
					pwd : self.pwd
				};
				$.ajax({
					url : "biz-login.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.pwd == "pwdSuccess") {
							location.href="/biz_main.do";							
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