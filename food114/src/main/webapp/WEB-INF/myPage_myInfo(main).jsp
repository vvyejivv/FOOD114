<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" href="../css/food114.css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
[v-cloak] { display: none; }

/* 모달 스타일링 */
.modal {
	/* display: none; */
	position: fixed;
	top: 47%;
	left: 70%;
	transform: translate(-50%, -50%);
	background-color: #fefefe;
	padding: 25px;
	border: 1px solid #888;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	z-index: 1000;
}

body {
	margin: 0px;
}

.close {
	color: #aaa;
	float: right;
	margin-top: -5px;
	margin-left: 2px;
	font-size: 23px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 모달 추가 css */
.modal-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
}

.modal-content {
	margin-bottom: 10px;
	width: 400px;
	height: 200px;
	border-radius: 10px;
	position: fixed;
	top: 40%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	z-index: 1001;
	text-align: center;
}

.modalButton {
	border: none;
	background-color: white;
	font-size: 14px;
	color: #ff8002;
	font-weight: bold;
	float: none;
	cursor: pointer;
	margin: 10px;
	margin-top: 15px;
}

/* .modalButton:hover {
	 color: white;
	color: #ff7f00;
	font-size: 14px;
	font-weight: bold;
} */

.modalCancel {
	border: none;
	background-color: white;
	font-size: 14px;
	font-weight: bold;
	color: rgb(72, 72, 72);
	cursor: pointer;
	margin: 10px;
	margin-top: 15px;
}

.modalCancel:hover {
	color: rgb(72, 72, 72);
	font-weight: bold;
}

.modalInput {
	width: 300px;
	height: 30px;
	border: 1px solid #f9f9f9;
	background-color: #f9f9f9;
	border-radius: 4px;
	padding: 5px 15px;
}

input[type="text"] {
	border: none;
	margin-left: 10px;
}

input[type='text']:focus {
	outline: none;
}

.phone {
	border: 1px solid #2196F3;
	padding: 5px 10px;
	color: #2196F3;
	border-radius: 5px;
	background-color: white;
	font-size: 14px;
	font-weight: bold;
	float: none;
	cursor: pointer;
	margin: 10px;
	margin-top: 15px;
}


</style>
</head>
<body>
	<div id="Container" >
			<%@include file="food114_header.jsp"%>

	<section>
		<div style="width: 1420px; display: flex; margin: 0px auto;">
			<%@include file="myPage_header.jsp"%>
			<div id="app" v-cloak>
				<div class="content">
					<h2>
						<a style="font-size: 25px; color: #747171;">
							<span style="color: #ff7f00; font-weight: bold;">| </span>MY정보
							확인/변경
						</a>
					</h2>
					<div>
						<div class="table">
							<div class="row">
								<div class="cell1">아이디</div>
								<div class="cell2">{{info.userId}}</div>
							</div>
							<div class="row">
								<div class="cell1">이름</div>
								<div class="cell2"><div style="width:fit-content;">
									{{info.name}}</div>
									<button class="buttonSubmit" @click="openNameModal('name')">이름
										변경</button>
								</div>
							</div>
							<!-- name 모달 창 -->
							<div class="modal-backdrop" id="Modal" v-if="modalFlg">
								<div class="modal-content"
									:style="{height: modalType=='phone'&&!phoneCheckFlg&&phoneCheckShow ?'270px':'220px'}">
									<h2 v-html="modalTitle">이름 변경</h2>
									<p style="color: #888; margin-top: none;" v-html="modalText">변경할
										이름을 입력해주세요.</p>
									<input class="modalInput" v-model="changeValue" type="text"
										placeholder="이름" v-if="modalType=='name'">
									<input class="modalInput" v-model="changeValue" type="text"
										placeholder="닉네임" v-if="modalType=='nickName'">
									<input class="modalInput" v-model="changeValue" type="text"
										placeholder="연락처" v-if="modalType=='phone'" id="phone"
										style="width: 200px">


									<!-- 연락처 변경시 -->
									<template v-if="modalType=='phone'">
										<button class="phone" @click="fnPhoneCheck"
											v-if="!phoneCheckShow&&!phoneCheckFlg">인증</button>
										<div style="color: #2196F3; font-size: 14px;"
											v-html="phoneCheckText" v-if="phoneCheckFlg">인증되었습니다</div>
										<div style="padding-left: 10px;" v-if="phoneCheckShow">
											<input class="modalInput" style="width: 125px;"
												placeholder="인증번호" v-model="phoneCheckInput">
											<button class="phone" @click="fnPhoneCheckConfirm">확인</button>
										</div>
										<div style="height: 20px">
											<div style="color: red; font-size: 14px;"
												v-html="phoneCheckText"
												v-if="!phoneCheckFlg&&phoneCheckShow">인증번호가 일치하지 않습니다.</div>
										</div>
									</template>

									<!-- 이메일 변경시 -->
									<template v-if="modalType=='email'">
										<input class="modalInput" v-model="email" type="text"
											@input="fnConcat" placeholder="이메일"
											style="width: 130px; margin-right: 5px;">
										@
										<input class="modalInput" v-model="emailAddr" type="text"
											@input="fnConcat" style="width: 130px;" placeholder="주소">
									</template>
									<div>
										<button class="modalButton"
											@click="fnSubmit({column:modalType, value:changeValue})">저장</button>

										<button class="modalCancel" @click="cancelModal">닫기</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="cell1">별명</div>
								<div class="cell2">
									{{info.nickName}}
									<button class="buttonSubmit" @click="openNameModal('nickName')">별명
										변경</button>
								</div>
							</div>

							<div class="row">
								<div class="cell1">생일</div>
								<div class="cell2">{{info.birth}}</div>
							</div>
							<div class="row">
								<div class="cell1">휴대폰번호</div>
								<div class="cell2">
									{{info.phone}}
									<button class="buttonSubmit" @click="openNameModal('phone')">연락처
										변경</button>
								</div>
							</div>

							<div class="row">
								<div class="cell1">이메일</div>
								<div class="cell2">
									<span id="email">{{info.email}}</span>
									<button class="buttonSubmit" @click="openNameModal('email')">이메일
										변경</button>
								</div>
							</div>

							<div class="row" >
								<div class="cell1">회원가입일자</div>
								<div class="cell2">{{info.cdate}}</div>
							</div>
							<div class="row" style="justify-content: flex-end; align-items: center">
								<div
									style="font-size: 13px; color: #747171;">
									탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.&nbsp; <a href="javascript:;"><span
										class="span" @click="fnLeave">회원탈퇴</span></a>
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
	var app = new Vue(
			{
				el : '#app',
				data : {
					list : [],
					info : {},
					sessionId : "${sessionId}",
					newName : '',
					modalFlg : false,
					newNickName : '',
					newPhone : '',
					newEmail : '',
					nameModalFlg : false,
					nickNameModalFlg : false,
					phoneModalFlg : false,
					emailModalFlg : false,
					modalTitle : "", // 모달창 제목 (이름변경/닉네임변경 등)
					modalText : "", // 모달창 내용 (이름을 변경해주세요 등)
					modalType : "",
					changeValue : "",
					email : "",
					emailAddr : "",
					phoneCheckNum : "111", // 인증번호
					phoneCheckInput : "", // 인증번호 입력값
					phoneCheckFlg : false, //휴대폰 인증여부
					phoneCheckShow : false, //인증번호 입력란 보이기 여부
					phoneCheckText : ""

				},
				methods : {
					/* 회원탈퇴시 */
					fnLeave : function() {
						var self = this;
						if (!confirm("회원탈퇴시 30일 이후 고객님의 데이터가 완전히 삭제됩니다. 그래도 계속하시겠습니까? ")) {
							return;
						}

						var nparmap = {
							userId : self.sessionId
						};
						$.ajax({
							url : "consumer-leave.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								location.href="food114.do";
							}
						});

					},
					/* 휴대폰 인증번호 입력 확인시 */
					fnPhoneCheckConfirm : function() {
						var self = this;
						if (self.phoneCheckNum == self.phoneCheckInput) {
							self.phoneCheckShow = false;
							self.phoneCheckFlg = true;
							self.phoneCheckText = "인증되었습니다";
						} else {
							self.phoneCheckText = "인증번호가 일치하지 않습니다.";
							self.phoneCheckFlg = false;
						}
					},
					/* 휴대폰 인증 클릭시 */
					fnPhoneCheck : function() {
						var self = this;
						let phone = /^(010|011)[0-9]{7,8}$/
						if (!phone.test(self.changeValue)) {
							alert("휴대폰번호를 제대로 입력해주세요.");
							return;
						}
						var nparmap = {
							phone : self.changeValue
						};
						$.ajax({
							url : "send-one",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.phoneCheckNum = data.number;
								self.phoneCheckShow = true;
								$("#phone").prop("disabled", true);
							}
						});

					},
					/* email 합치기 */
					fnConcat : function() {
						var self = this;
						self.changeValue = self.email + "@" + self.emailAddr;
						console.log(self.changeValue);
					},
					/* 유저 정보 호출 */
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
							}
						});
					},
					/* 모달창에서 저장 - map 키 2개 column, value */
					fnSubmit : function(map) {
						var self = this;
						var regex = /^[^\d\s가-힣]*\..*$/; // 이메일 정규식

						map["userId"] = self.info.userId;
						
						let name = /^[^\d\W]+$/
						if (!name.test(self.changeValue)) {
							alert("이름을 제대로 입력해주세요.");
							return;
						}
						

						if (self.modalType == "email"
								&& (self.email == "" || self.emailAddr == "")) {
							alert("최소 한글자 이상 입력해주세요");
							return;
						}
						
						let email = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/
						if (!email.test(self.changeValue)) {
							alert("메일 주소를 제대로 입력해주세요.");
							return;
						}
						
						if (self.modalType == "email"
								&& !regex.test(self.emailAddr)) {
							alert("올바른 이메일 형식이 아닙니다.");
							return;
						}
						if (self.modalType == "phone" && !self.phoneCheckFlg) {
							alert("휴대폰 인증을 진행해주세요.");
							return;
						}

						$.ajax({
							url : "updateMyInfo.dox",
							dataType : "json",
							type : "POST",
							data : map,
							success : function(data) {
								if (data.result == "success") {
									alert("정보가 수정되었습니다");
									self.cancelModal();
									self.fnList();
								} else {
									alert("실패");
								}
							}
						});
					},
					fnClick : function() {
						location.href = "/myInfo.do";
					},
					// 변경 클릭시 오픈 모달창
					openNameModal : function(type) {
						var self = this;
						self.modalType = type;
						self.modalFlg = true;
						self.modalType = type;
						if (type == "name") {
							self.modalTitle = "이름 변경";
							self.modalText = "변경하실 이름을 입력해주세요."
							return;
						}
						if (type == "nickName") {
							self.modalTitle = "별명 변경";
							self.modalText = "변경하실 별명을 입력해주세요."
							return;
						}
						if (type == "phone") {
							self.modalTitle = "휴대폰번호 변경";
							self.modalText = "변경하실 휴대폰번호를 입력해주세요."
							return;
						}
						if (type == "email") {
							self.modalTitle = "이메일 변경";
							self.modalText = "변경하실 이메일을 입력해주세요."
							return;
						}
					},
					/* 모달창 닫기 */
					cancelModal : function() {
						var self = this;
						self.modalFlg = false;
						self.changeValue = "";
						self.email = "";
						self.emailAddr = "";
						self.phoneCheckShow = false;
						self.phoneCheckFlg = false;
						self.phoneCheckText = "";
					}
				},
				created : function() {
					var self = this;
					self.fnList();
				}
			});
</script>
</html>