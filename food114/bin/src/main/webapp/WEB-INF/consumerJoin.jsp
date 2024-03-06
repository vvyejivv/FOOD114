<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="../css/main.css">

</head>
<style>
.container {
	width: 660px;
	margin: 0px auto;
	margin-top: 0px;
	padding-top: 30px;
	font-size: 17px;
	/* border: 1px solid black; */
}

.container input[type="radio"] {
	accent-color: #ca670359;
	border: 1px solid #e27100;
}

input[type="checkbox"]:checked {
	accent-color: #e27100;
}

.container input[type="text"], .container input[type="password"] {
	width: 300px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	/* outline: #ff7f00 solid; */ transition : border-color 0.3s ease;
	background-color: rgba(255, 255, 255, 0.9);
	/* 입력 필드의 배경을 투명하게 설정 */
	margin-right: 10px;
	margin-top: 10px;
	color: rgb(72, 72, 72);
	transition: border-color 0.3s ease;
}

.container input[type="text"]:focus, .container input[type="password"]:focus,
	.container select:focus {
	outline: #ff7f00 solid thin;
	border: 1px solid white;
}

.title {
	color: #ff7f00;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	padding-bottom: 15px;
}

.container button {
	padding: 10px 20px;
	background-color: #ff7f00;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.container button:hover {
	background-color: #c06000;
}

.container table td button {
	color: #ff8000;
	background-color: white;
	border: 1px solid #ff7f00;
	font-weight: 700;
	padding: 10px 30px;
}

.container table td button:hover {
	background-color: #ff7f00;
	color: white;
}

.container table td input[type="checkbox"] {
	margin-right: 5px;
}

.joinBtn {
	padding: 10px;
	background-color: #ff7f00;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	width: 280px;
}

.container {
	padding-bottom: 50px;
}

.errorMessage {
	color: red;
	height: 17px;
	font-size: 13px;
}

th, td {
	/* border: 1px solid black; */
	padding: 10px 20px;
	color: rgb(72, 72, 72);
}

table {
	border-collapse: collapse;
}

td {
	/* padding-top: 20px; */
	padding-bottom: 0px;
}

.star {
	color: #ff7f00;
}

select {
	width: 115px;
	padding: 10px;
	border-radius: 4px;
	border: 1px solid #ccc;
	color: rgb(72, 72, 72);
}
</style>

<body>
	<header>
		<%@include file="main(header).html"%>
	</header>

	<section>
		<div id="app">
			<div class="container">
				<div class="title">회원가입</div>
				<div
					style="border-bottom: 1px solid #ccc; font-size: 13px; height: 25px; margin-bottom: 5px;">
					<div style="float: right; color: rgb(72, 72, 72);">
						<span class="star">*</span>필수입력사항
					</div>
				</div>
				<table>
					<tr>
						<th>아이디<span class="star">*</span></th>
						<td>
							<input type="text" placeholder="아이디를 입력해주세요."
								v-model="userInfo.userId" @change="fnChangeId">
							<div class="errorMessage" v-html="idCheckMessage"
								:style="{color : idCheckFlg ? 'blue' : 'red'}"></div>
						</td>
						<td style="padding: 0px;">
							<button @click="fnIdCheck()">중복 확인</button>
						</td>
						</td>
					</tr>
					<tr>
						<th>비밀번호<span class="star">*</span></th>
						<td>
							<input type="password" placeholder="비밀번호를 입력해주세요."
								v-model="userInfo.pwd">
							<div class="errorMessage"></div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 확인<span class="star">*</span></th>
						<td>
							<input type="password" placeholder="비밀번호를 한번 더 입력해주세요."
								v-model="userInfo.pwdCheck">
							<div class="errorMessage"></div>
						</td>
					</tr>
					<tr>
						<th>이름<span class="star">*</span></th>
						<td>
							<input type="text" placeholder="이름을 입력해주세요."
								v-model="userInfo.userName">
							<div class="errorMessage"></div>
						</td>
					</tr>

					<tr>
						<th>이메일<span class="star">*</span></th>
						<td>
							<div>
								<input type="text" style="width: 150px; margin-right: 5px;"
									placeholder="이메일을 입력해주세요." v-model="userInfo.email">
								<span style="margin-right: 5px; font-size: 17px;">@</span>
								<select style="" v-model="userInfo.emailAddr"
									@change="fnEmailAddrInput()">
									<option value="">직접입력</option>
									<template v-for="item in emailList">
										<option :value="item.value">{{item.name}}</option>
									</template>
								</select>
							</div>
							<div>
								<input type="text" placeholder="이메일 주소를 입력해주세요."
									v-if="emailAddrInputFlg" v-model="userInfo.emailAddrInput">
							</div>
							<div class="errorMessage" v-html="emailCheckMessage"
								:style="{color : emailCheckFlg ? 'blue' : 'red'}"></div>
						</td>
						<td style="padding: 0px;">
							<button @click="fnEmailCheck()">중복 확인</button>
						</td>
					</tr>
					<tr>
						<th>휴대폰<span class="star">*</span></th>
						<td>
							<input type="text" placeholder="'-'를 제외한 휴대폰 번호를 입력해주세요."
								v-model="userInfo.phone">
							<div class="errorMessage"></div>
						</td>
						<td style="padding: 0px;">
							<button @click="fnPhoneCheck()">인증 요청</button>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>
							<input type="text" placeholder="닉네임 미입력시 리뷰 작성시 실명으로 등록됩니다."
								v-model="userInfo.nickName">
							<div class="errorMessage"></div>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td>
							<label style="margin-right: 59px;">
								<input type="radio" name="gender" v-model="userInfo.gender"
									value="M">
								남자
							</label>
							<label style="margin-right: 59px;">
								<input type="radio" name="gender" v-model="userInfo.gender"
									value="F">
								여자
							</label>
							<label>
								<input type="radio" name="gender" v-model="userInfo.gender"
									value="">
								선택안함
							</label>
							<div class="errorMessage"></div>
						</td>
					</tr>
					<tr>
						<th>생일</th>
						<td>
							<select style="margin-right: 20px;" v-model="userInfo.birthM">
								<template v-for="index in 12">
									<option :value="index">{{index}}</option>
								</template>
							</select>
							월
							<select style="margin-right: 20px; margin-left: 20px;"
								v-model="userInfo.birthD">
								<template v-for="index in 31" v-if="userInfo.birthM%2==1">
									<option :value="index">{{index}}</option>
								</template>
								<template v-for="index in 30"
									v-if="userInfo.birthM%2==0 && userInfo.birthM!=2">
									<option :value="index">{{index}}</option>
								</template>
								<template v-for="index in 29" v-if="userInfo.birthM==2">
									<option :value="index">{{index}}</option>
								</template>
							</select>
							일
							<div class="errorMessage"></div>
						</td>
					</tr>
				</table>
				<div style="border-bottom: 1px solid #ccc; padding-top: 25px;"></div>
				<table>
					<tr>
						<th rowspan="6">이용약관동의<span class="star">*</span></th>
						<td style="font-size: 20px; font-weight: 500;">
							<label>
								<input type="checkbox">
								전체 동의합니다.
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="checkbox">
								이용약관 동의(필수)
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="checkbox">
								개인정보 수집·이용 동의(필수)
							</label>
						</td>
					</tr>
					<tr>
						<td>
							<label>
								<input type="checkbox">
								할인쿠폰 등 혜택/정보 수신 동의(선택)
							</label>
						</td>
					</tr>
				</table>
				<div style="border-bottom: 1px solid #ccc; padding-top: 25px;"></div>
				<div
					style="text-align: center; margin-top: 50px; padding-bottom: 50px;">
					<button @click="fnJoin()" class="joinBtn">가입하기</button>
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
			userInfo : {
				userId : "",
				pwd : "",
				pwdCheck : "",
				userName : "",
				email : "",
				emailAddr : "naver.com",
				emailAddrInput : "",
				phone : "",
				nickName : "",
				gender : "M",
				birthM : "1",
				birthD : "1",
				birthMD : ""
			},
			idCheckMessage : "",
			emailCheckMessage : "",
			idCheckFlg : false, //아이디 중복확인 성공시 true
			emailCheckFlg : false, //이메일 중복확인 성공시 true
			emailList : [],
			emailAddrInputFlg : false
		//이메일 직접입력시 true
		},
		methods : {
			// 가입하기 버튼 클릭시
			fnJoin : function() {
				var self = this;
				// birthM + birthD = birthMD(4자리)
				if (self.userInfo.birthM < 10) {
					self.userInfo.birthMD = '0' + self.userInfo.birthM;
				} else {
					self.userInfo.birthMD = self.userInfo.birthM;
				}
				if (self.userInfo.birthD < 10) {
					self.userInfo.birthMD += '0' + self.userInfo.birthD;
				} else {
					self.userInfo.birthMD += self.userInfo.birthD;
				}
				var nparmap = self.userInfo;
				$.ajax({
					url : "consumer-join.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							location.href="consumer-join-success.do";
						} else {
							alert("실패");
						}
					}
				});
			},
			// 아이디 중복 확인
			fnIdCheck : function() {
				var self = this;
				var nparmap = {
					userId : self.userInfo.userId
				};
				$.ajax({
					url : "consumer-idCheck.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "dup") {
							self.idCheckMessage = "현재 사용중인 아이디 입니다.";
							self.idCheckFlg = false;
						} else if (data.result == "success") {
							self.idCheckMessage = "사용 가능한 아이디 입니다."
							self.idCheckFlg = true;
						}
					}
				});
			},
			// 아이디 입력시 중복확인 Flg false 변경
			fnChangeId : function() {
				var self = this;
				self.idCheckFlg = false;
				self.idCheckMessage = "";
			},
			// 이메일 중복확인
			fnEmailCheck : function() {
				var self = this;
				var nparmap = {
					email : self.userInfo.email,
					emailAddr : self.userInfo.emailAddr,
					emailAddrInput : self.userInfo.emailAddrInput
				};
				$.ajax({
					url : "email-check.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "dup") {
							self.emailCheckMessage = "현재 사용중인 이메일 입니다.";
							self.emailCheckFlg = false;
						} else if (data.result == "success") {
							self.emailCheckMessage = "사용 가능한 이메일 입니다.";
							self.emailCheckFlg = true;
						}
					}
				});
			},
			// 이메일 리스트 가져오기
			fnEmailList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "email-list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.emailList = data.list;
					}
				});
			},
			// 이메일 직접입력 선택시
			fnEmailAddrInput : function() {
				var self = this;
				if (self.userInfo.emailAddr == "") {
					self.emailAddrInputFlg = true;
				} else {
					self.emailAddrInputFlg = false;
				}
			},
			// 휴대폰 인증 확인시
			fnPhoneCheck : function() {
				var self = this;
				alert('구현중');
				return;
			}
		},
		created : function() {
			var self = this;
			self.fnEmailList();

		}
	});
</script>