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
	float: none;
	cursor: pointer;
	margin: 10px;
	margin-top: 15px;
}

.modalButton:hover {
	/* color: white; */
	color: #ff7f00;
	font-size: 14px;
	font-weight: bold;
}

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
				<div class="content" style="width: 900px;">
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
									<button class="buttonSubmit" @click="openNameModal('name')">이름
										변경</button>
								</div>
							</div>
							<!-- name 모달 창 -->
							<div class="modal-backdrop" id="Modal" v-if="modalFlg">
								<div class="modal-content">
									<h2 v-html="modalTitle">이름 변경</h2>
									<p style="color: #888; margin-top: none;" v-html="modalText">변경할
										이름을 입력해주세요.</p>
									<input class="modalInput" v-model="changeValue" type="text"
										placeholder="이름" v-if="modalType=='name'">
									<input class="modalInput" v-model="changeValue" type="text"
										placeholder="닉네임" v-if="modalType=='nickName'">
									<input class="modalInput" v-model="changeValue" type="text"
										placeholder="연락처" v-if="modalType=='phone'">
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
								<div class="cell2">
									{{info.birth}}
									<button class="buttonSubmit" @click="openNameModal('nickName')">생일
										변경</button>
								</div>
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

							<div class="row">
								<div class="cell1">회원가입일자</div>
								<div class="cell2">{{info.cdate}}</div>
							</div>
							<div class="row">
								<div
									style="margin-top: 10px; margin-left: 520px; right; font-size: 13px; color: #747171;">
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
			emailModalFlg : false,
			modalTitle : "", // 모달창 제목 (이름변경/닉네임변경 등)
			modalText : "", // 모달창 내용 (이름을 변경해주세요 등)
			modalType : "",
			changeValue :"",
			email :"",
			emailAddr :""

		},
		methods : {
			fnConcat : function(){
				var self=this;				
				self.changeValue=self.email+"@"+self.emailAddr;
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
				
				map["userId"]=self.info.userId;
				
				if(self.changeValue==""){
					alert("최소 한글자 이상 입력해주세요");
					return;
				}
				if(self.modalType=="email"&& !emailAddr.test(self.email))
				
				$.ajax({
					url : "updateMyInfo.dox",
					dataType : "json",
					type : "POST",
					data : map,
					success : function(data) {
						if(data.result=="success"){
							alert("정보가 수정되었습니다");
							self.modalFlg=false;
							self.fnList();
						} else{
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
			cancelModal : function(){
				var self=this;
				self.modalFlg=false;
				self.changeValue="";
				self.email="";
				self.emailAddr="";
			}
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>
</html>