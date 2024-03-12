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
		display: none;
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
	
	.modal-content {
		margin-bottom: 10px;
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
		<div id="app">
			<div class="container">
				<%@include file="myPage_header.jsp" %>
				
				<div class="content">
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
									<button @click="openNameModal('open')">이름 변경</button>
								</div>
							</div>
							<!-- name 모달 창 -->
							<div id="nameModal" class="modal">
								<div class="modal-content">
										<input v-model="newName" type="text" id="newNameInput" placeholder="새로운 이름을 입력하세요.">
									<div>
										<button @click="closeNameModal()" style="background-color: #f9f9f9; color: rgb(72,72,72); border: 1px solid #ccc;">취소</button>
										<button @click="saveName()">저장</button>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="cell1">별명</div>
								<div class="cell2">
										{{info.nickName}}
									<button @click="openNickNameModal">별명 변경</button>
								</div>
							</div>
							<!-- nickName 모달 창 -->
							<div id="nickNameModal" class="modal">
								<div class="modal-content">
										<input type="text" id="newNickNameInput" placeholder="새로운 별명을 입력하세요.">
									<div>
										<button @click="closeNickNameModal()" style="background-color: #f9f9f9; color: rgb(72,72,72); border: 1px solid #ccc;">취소</button>
										<button @click="saveNickName()">저장</button>
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
									<button @click="openPhoneModal">연락처 변경</button>
								</div>
							</div>
							<!-- phone 모달 창 -->
							<div id="phoneModal" class="modal">
								<div class="modal-content">
										<input type="text" id="newPhoneInput" placeholder="새로운 번호를 입력하세요.">
									<div>
										<button @click="closePhoneModal()" style="background-color: #f9f9f9; color: rgb(72,72,72); border: 1px solid #ccc;">취소</button>
										<button @click="savePhone()">저장</button>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="cell1">이메일</div>
								<div class="cell2">
									<span id="email">{{info.email}}</span>
									<button @click="openEmailModal">이메일 변경</button>
								</div>
							</div>
							<!-- email 모달 창 -->
							<div id="emailModal" class="modal">
								<div class="modal-content">
										<input type="text" id="newEmailInput" placeholder="새로운 이메일을 입력하세요.">
									<div>
										<button @click="closeEmailModal()" style="background-color: #f9f9f9; color: rgb(72,72,72); border: 1px solid #ccc;">취소</button>
										<button @click="saveEmail()">저장</button>
									</div>
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
							 <div style="text-align: center; margin-top: 5px;">
		                        <button style="float:none;">등록하기</button>
		                        <button style="background-color: #f9f9f9; color: rgb(72,72,72); border: 1px solid #ccc; float: none;">취소</button>
		                       <!--  <button @click="fnInsert" style="float:none;">등록하기</button>
		                        <button @click="fnRemove" style="background-color: #f9f9f9; color: rgb(72,72,72); border: 1px solid #ccc; float: none;">취소</button> -->
		                    </div>
						</div>
					</div>
				</div>
			</div>
	</section>

	<%@include file="main(footer).html"%>
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
					modalFlg: false
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
					fnMyInfo : function(){
						location.href="/myInfo.do";
					},
					fnMyInfoPwd : function(){
						location.href="/myInfoPwd.do";
					},
					myInfoAddr : function(){
						location.href="/myInfoAddr.do";
					},
					fnMyInfoGrade : function(){
						location.href="/myInfoGrade.do";
					},
					// openNameModal 클릭시 오픈 모달창
					openNameModal : function(type) {
						var self = this;
						if(type == "open"){
							self.modalFlg = true;
							document.body.style.overflow = 'hidden';
						}
						if(type == "close"){
							self.modalFlg = false;
							document.body.style.overflow = 'auto';
						}
					},
					// openNameModal 클릭시 오픈 모달창
					/* openNameModal : function() {
						var nameModal = document.getElementById('nameModal');
						nameModal.style.display = 'block';
					}, */
					// openNickNameModal 클릭시 오픈 모달창
					openNickNameModal : function() {
						var nickNameModal = document.getElementById('nickNameModal');
						nickNameModal.style.display = 'block';
					},
					// openPhoneModal 클릭시 오픈 모달창
					openPhoneModal : function() {
						var phoneModal = document.getElementById('phoneModal');
						phoneModal.style.display = 'block';
					},
					// openEmailModal 클릭시 오픈 모달창
					openEmailModal : function() {
						var emailModal = document.getElementById('emailModal');
						emailModal.style.display = 'block';
					},
					// 취소시 closeNameModal
					closeNameModal : function() {
						var nameModal = document.getElementById('nameModal');
						nameModal.style.display = 'none';
					},
					// 취소시 closeNickNameModal
					closeNickNameModal : function() {
						var nickNameModal = document.getElementById('nickNameModal');
						nickNameModal.style.display = 'none';
					},
					// 취소시 closePhoneModal
					closePhoneModal : function() {
						var phoneModal = document.getElementById('phoneModal');
						phoneModal.style.display = 'none';
					},
					// 취소시 closeEmailModal
					closeEmailModal : function() {
						var emailModal = document.getElementById('emailModal');
						emailModal.style.display = 'none';
					},
					// saveName 모달창
					saveName : function() {
			            var self = this;
			            if(self.newName == self.info.name){
			            	alert("동일한 이름입니다.");
			            	return;
			            }else{
			            	alert("사용 가능합니다.");
			            }
			            var nparmap = {
			            		name : newNameInput
			            		};
			            $.ajax({
			                url:"updateMyInfo.dox",
			                dataType:"json",	
			                type : "POST", 
			                data : nparmap,
			                success : function(data) { 
			                	if(data == "success"){
			                		this.info.name = newNameInput;
									this.closeNameModal();
			                	}else {
									alert("이름을 입력하세요.");
								}
			                }
			            }); 
					},
					/* saveName : function() {
						var newNameInput = document.getElementById('newNameInput').value;
						if (newNameInput !== "") {
							// document.getElementById('name').textContent = newNameInput;
							this.info.name = newNameInput;
							this.closeNameModal();
						} else {
							alert("이름을 입력하세요.");
						}
					}, */
					
					// saveNickName 모달창
					saveNickName : function() {
						var newNickNameInput = document.getElementById('newNickNameInput').value;
						if(newNickNameInput !== ""){
						// document.getElementById('nickName').textContent = newNickNameInput;
							this.info.nickName = newNickNameInput;
							this.closeNickNameModal();
						}else{
							alert("별명을 입력하세요.");
						}
					},
					// savePhone 모달창
					savePhone : function() {
						var newPhoneInput = document.getElementById('newPhoneInput').value;
						if(newPhoneInput !== ""){
						//	document.getElementById('phone').textContent = newPhoneInput;
							this.info.phone = newPhoneInput;
							this.closePhoneModal();
						}else{
							alert("연락처를 입력하세요.");
						}
					},
					// saveEmail  모달창
					saveEmail : function() {
						var newEmailInput = document.getElementById('newEmailInput').value;
						if(newEmailInput !== ""){
						//	document.getElementById('email').textContent = newEmailInput;
							this.info.email = newEmailInput;
							this.closeEmailModal();
						}else{
							alert("이메일을 입력하세요.");
						}
					},
					   /*  등록하기 버튼 활성화할 경우 사용할 예정(수정必)
					   fnInsert: function () {
		                    var self = this;
		                    var nparmap = {
		                        userId: self.userId,
		                        title: self.title,
		                        contents: self.contents,
		                        kind: self.kind
		                    };
		                    $.ajax({
		                        url: "boardInsert.dox",
		                        dataType: "json",
		                        type: "POST",
		                        data: nparmap,
		                        success: function (data) {
		                            if (data.result == "success") {
		                                alert("작성되었음");
		                            } else {
		                                alert("오류 발생");
		                            }
		                        }
		                    });
		                },
		                취소하기 버튼 활성화할 경우 사용할 예정(수정必)
		                fnRemove: function () {
		                    var self = this;
		                    var nparmap = {
		                        userId: self.userId,
		                        title: self.title,
		                        contents: self.contents,
		                        kind: self.kind
		                    };
		                    $.ajax({
		                        url: "boardInsert.dox",
		                        dataType: "json",
		                        type: "POST",
		                        data: nparmap,
		                        success: function (data) {
		                            if (data.result == "success") {
		                                alert("작성되었음");
		                            } else {
		                                alert("오류 발생");
		                            }
		                        }
		                    });
		                } */
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