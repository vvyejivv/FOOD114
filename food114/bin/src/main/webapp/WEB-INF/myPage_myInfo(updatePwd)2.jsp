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
<body>
	<div id="Container">
		<%@include file="food114_header.jsp"%>

		<section>
			<div style="width: 1420px; display: flex; margin: 0px auto;">
				<%@include file="myPage_header.jsp"%>
				<div id="app" v-cloak>
					<div class="content" style="width: 900px;">
						<h2>
							<a href="javascript:;" style="font-size: 25px; color: #747171;">
								<span style="color: #ff7f00; font-weight: bold;">| </span>비밀번호
								변경
							</a>
						</h2>
						<div>
							<div class="table">
								<div class="row" style="height: 200px;">
									<div class="cell1">비밀번호 변경</div>
									<div class="cell2">
										<div>
											<div>
												새 비밀번호
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												<input type="password" style="height: 20px;"
													v-model="newPwd" @input="fnNewPwd">
												<span v-if="inputPwd" style="color: red; font-size: 11px;">
													<br> ※영문/숫자/특수문자 2가지 이상 조합(8~20자) 3개 이상 연속되거나 동일한
													문자/숫자 제외
												</span>
											</div>
											<div>
												비밀번호 다시 입력&nbsp;
												<input type="password" style="height: 20px;" v-model="rePwd">
											</div>
											<span v-if="newPwd !== rePwd && rePwd !== '' "
												style="color: red; font-size: 11px;"> ※ 비밀번호가 다릅니다. </span>
										</div>
									</div>
								</div>

								<div class="row" style="padding-top: 20px; justify-content: center;">
									<div style="">
										<button class="buttonSubmit" @click="pwdChange"
											style="float: left;">변경</button>
										<button class="buttonSubmit" @click="pwdRemove">취소</button>
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
	var app = new Vue(
			{
				el : '#app',
				data : {
					list : [],
					info : {},
					sessionId : "${sessionId}",
					newName : '',
					pwd : '',
					newPwd : '',
					rePwd : '',
					inputPwd : false
				},
				methods : {
					fnList : function() {
						var self = this;
						var nparmap = {
							userId : self.sessionId
						};
						$.ajax({
							url : "myInfoPwdUpdate.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.info = data.info;
								console.log(data.info);
							}
						});
					},
					fnNewPwd : function(pwd) {
						var self = this;
						let reg = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/
						if (!reg.test(self.newPwd)) {
							self.inputPwd = true;
							return;
						} else {
							self.a = false;
						}
						/* return reNewPwd.valPwd(pwd); */
						/* return pwd.length >= 8 && pwd.length <= 20  ; */
					},
					checkPwd : function() {
						var self = this;
						if (self.pwd == self.info.pwd) {
							alert("동일");
						} else {
							alert("다름");
						}
					},
					pwdChange : function() {
						var self = this;

						var nparmap = {
							userId : self.sessionId,
							newPwd : self.newPwd
						};
						$.ajax({
							url : "myInfoPwdUpdate.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								if (data.result == "success") {
									alert("변경되었습니다.");
									return location.href = "/myInfo.do";
								} else {
									alert("오류가 발생하였습니다.");
								}
								self.info = data.info;
								console.log(data.info);
							}
						});
					},
					pwdRemove : function() {
						location.href = "/myInfo.do";
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
					//	self.fnList();
				}
			});
</script>
</html>
