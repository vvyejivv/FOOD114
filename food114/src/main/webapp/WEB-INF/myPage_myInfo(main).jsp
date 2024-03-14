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
body{
	margin:0px;
}
.modal-content {
	margin-bottom: 10px;
	width: 400px;
	height: 200px;
	border-radius: 10px;
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
	position: fixed;
	top: 50%;
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
	color: rgb(161, 1, 161);
	font-weight: bold;
	margin-top: 10px;
	margin-left: auto;
	float: none;
	cursor: pointer;
	
}

.modalButton:hover {
	/* color: white; */
	color: #ff7f00;
	font-size: 14px;
	font-weight: bold;
}

.modalCancel {
	border: none;
	background-color:white;
	font-size: 14px;
	font-weight: bold;
	color: rgb(72, 72, 72);
	margin-top: 10px;
	cursor: pointer;
	margin-right: 40px;
}

.modalCancel:hover {
	color: rgb(72, 72, 72);
	font-weight: bold;
}

.modalInput {
	width: 300px;
	height: 40px;
	border: 1px solid #f9f9f9;
	background-color: #f9f9f9;
	border-radius: 4px;
}

input[type="text"] {
	border: none;
	margin-left: 10px;
}

input[type='text']:focus {
	outline: none;
}
</style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(main).css">
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
				<div class="content" style="width : 900px;">
					<h2>
						<a href="javascript:;" style="font-size: 25px; color: #747171;">
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
								<div class="cell2">
									{{info.name}}
									<button class="buttonSubmit" @click="openNameModal('open')">이름 변경</button>
								</div>
							</div>
							<!-- name 모달 창 -->
							<div class="modal-backdrop" id="nameModal" v-if="nameModalFlg">
									<div class="modal-content">
										<h2>이름 변경</h2>
											<p style="color: #888; margin-top:none;">변경할 이름을 입력해주세요.</p>
											<input class="modalInput" v-model="info.name" type="text" id="newNameInput" placeholder="새로운 이름을 입력하세요.">
										<div>
											<button class="modalButton" @click="fnSubmit">저장</button>
											<button class="modalCancel" @click="closeNameModal('close')">닫기</button>
										</div>
									</div>
							</div>
							<div class="row">
								<div class="cell1">별명</div>
								<div class="cell2">
									{{info.nickName}}
									<button class="buttonSubmit" @click="openNickNameModal('open')">별명 변경</button>
								</div>
							</div>
							
							<!-- nickName 모달 창 -->
							<div class="modal-backdrop"  id="nickNameModal" v-if="nickNameModalFlg">
								<div class="modal-content">
									<h2>별명 변경</h2>
											<p style="color: #888; margin-top:none;">변경할 별명을 입력해주세요.</p>
											<input class="modalInput" v-model="info.nickName" type="text" id="newNickNameInput" placeholder="새로운 별명을 입력하세요.">
										<div>
											<button class="modalButton" @click="fnSubmit">저장</button>
											<button class="modalCancel" @click="closeNickNameModal('close')">닫기</button>
										</div>
								</div>
							</div>
							<div class="row">
								<div class="cell1">생일</div>
								<div class="cell2">
									{{info.birth}}
									</button>
								</div>
							</div>
							<div class="row">
								<div class="cell1">휴대폰번호</div>
								<div class="cell2">
									{{info.phone}}
									<button class="buttonSubmit" @click="openPhoneModal('open')">연락처 변경</button>
								</div>
							</div>
							<!-- phone 모달 창 -->
							<div class="modal-backdrop" id="phoneModal" v-if="phoneModalFlg">
								<div class="modal-content">
									<h2>연락처 변경</h2>
										<p style="color: #888; margin-top:none;">변경할 연락처를 입력해주세요.</p>
										<input class="modalInput" v-model="info.phone" type="text" id="newPhoneInput" placeholder="새로운 연락처를 입력하세요.">
									<div>
										<button class="modalButton" @click="fnSubmit">저장</button>
										<button class="modalCancel" @click="closePhoneModal('close')">닫기</button>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="cell1">이메일</div>
								<div class="cell2">
									<span id="email">{{info.email}}</span>
									<button class="buttonSubmit" @click="openEmailModal('open')">이메일 변경</button>
								</div>
							</div>
							<!-- email 모달 창 -->
							<div class="modal-backdrop" id="emailModal" v-if="emailModalFlg">
								<div class="modal-content">
									<h2>E-MAIL 변경</h2>
										<p style="color: #888; margin-top:none;">변경할 이메일을 입력해주세요.</p>
										<input class="modalInput" v-model="info.email" type="email" id="newEmailInput" placeholder="새로운 이메일을 입력하세요.">
									<div>
										<button class="modalButton" @click="fnSubmit">저장</button>
										<button class="modalCancel" @click="closeEmailModal('close')">닫기</button>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="cell1">회원가입일자</div>
								<div class="cell2">{{info.cdate}}</div>
							</div>
							<div class="row">
								<div style="margin-top: 10px; margin-left: 520px; right; font-size: 13px; color: #747171;">
									탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.&nbsp; <a href="javascript:;"><span
										class="span">회원탈퇴</span></a>
								</div>
							</div>
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
					modalFlg : false,
					newNickName : '',
					newPhone : '',
					newEmail : '',
					nameModalFlg : false,
					nickNameModalFlg : false,
					phoneModalFlg : false,
					emailModalFlg : false
					
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
					/* 모달창에서 저장 */
					fnSubmit : function() {
						var self = this;						
						var nparmap = {
							userId : self.info.userId,
							name : self.info.name,
							nickName : self.info.nickName,
							phone : self.info.phone,
							email : self.info.email
						};
						$.ajax({
							url : "updateMyInfo.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								if(data.result == "success"){
									alert("변경되었습니다.");
									return location.href = "/myInfo.do";
								}else{
									alert("오류가 발생하였습니다.");
								}
								self.info = data.info;
								console.log(data.info);
							}
						});
					},
					fnClick : function() {
						location.href = "/myInfo.do";
					},
					// openNameModal 클릭시 오픈 모달창
					openNameModal : function(type) {
						var self = this;
						if (type == "open") {
							self.nameModalFlg = true;
							document.body.style.overflow = 'hidden';
						}
						if (type == "close") {
							self.nameModalFlg = false;
							document.body.style.overflow = 'auto';
						}
					},
					openNickNameModal : function(type) {
						var self = this;
						if (type == "open") {
							self.nickNameModalFlg = true;
							document.body.style.overflow = 'hidden';
						}
						if (type == "close") {
							self.nickNameModalFlg = false;
							document.body.style.overflow = 'auto';
						}
					},
					openPhoneModal : function(type) {
						var self = this;
						if (type == "open") {
							self.phoneModalFlg = true;
							document.body.style.overflow = 'hidden';
						}
						if (type == "close") {
							self.phoneModalFlg = false;
							document.body.style.overflow = 'auto';
						}
					},
					openEmailModal : function(type) {
						var self = this;
						if (type == "open") {
							self.emailModalFlg = true;
							document.body.style.overflow = 'hidden';
						}
						if (type == "close") {
							self.emailModalFlg = false;
							document.body.style.overflow = 'auto';
						}
					},
					// 취소시 closeNameModal
					closeNameModal : function() {
						var self = this;
						self.nameModalFlg = false;
					},
					// 취소시 closeNickNameModal
					closeNickNameModal : function() {
						var self = this;
						self.nickNameModalFlg = false;
					},
					// 취소시 closePhoneModal
					closePhoneModal : function() {
						var self = this;
						self.phoneModalFlg = false;
					},
					// 취소시 closeEmailModal
					closeEmailModal : function() {
						var self = this;
						self.emailModalFlg = false;
					},
					changeName : function() {
						location.href = "/boardNoticeList.do";
					}
				},
				created : function() {
					var self = this;
					self.fnList();
				}
			});
</script>
</html>