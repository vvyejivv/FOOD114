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
            top: 45%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fefefe;
            padding: 20px;
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
				<div class="sidebar" id="sidebar">
					<ul>
						<li>나의정보<span style="color: #b1b0b0;">───────────</span>
							<ul>
								<li><a href="javascript:;">MY정보 확인/변경</a></li>
								<li><a href="javascript:;">비밀번호 변경</a></li>
								<li><a href="javascript:;">MY주소지 관리</a></li>
								<li><a href="javascript:;">등급</a></li>
							</ul>
						</li>
						<br>
						<li>결제/주문/리뷰<span style="color: #b1b0b0;">───────────</span>
							<ul>
								<li><a href="javascript:;">결제수단 관리</a></li>
								<li><a href="javascript:;">주문내역</a></li>
								<li><a href="javascript:;">MY리뷰목록</a></li>
							</ul>
						</li>
						<br>
						<li>이벤트<span style="color: #b1b0b0;">───────────</span>
							<ul>
								<li><a href="javascript:;">쿠폰</a></li>
								<li><a href="javascript:;">포인트</a></li>
							</ul>
						</li>						
					</ul>
				</div>
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
									<span id="name">{{info.name}}</span>
									<button @click="openModal">이름 변경</button>
								</div>
							</div>
							<!-- 모달 창 -->
							<div id="myModal" class="modal">
							    <div class="modal-content">
							        <span class="close" @click="closeModal()">&times;</span>
							        <input type="text" id="newNameInput" placeholder="새로운 이름을 입력하세요">
							        <div><button @click="saveName()">저장</button>
							        <button @click="closeModal()">취소</button></div>
							    </div>
							</div>
							
							<!-- <div id="popup" style="display: none;">
							    <input type="text" id="newNameInput" placeholder="새로운 이름을 입력하세요">
							    <button @click="changeName()">저장</button>
							    <button @click="hidePopup()">취소</button>
							</div> -->
							<div class="row">
								<div class="cell1">별명</div>
								<div class="cell2">
									{{info.nickName}}
									<button>별명 변경</button>
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
									<button>연락처 변경</button>
								</div>
							</div>
							<div class="row">
								<div class="cell1">이메일</div>
								<div class="cell2">
									{{info.email}}
									<button>이메일 변경</button>
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
				// 모달 창
				openModal : function(){
					 	var modal = document.getElementById('myModal');
				        modal.style.display = 'block';
		        },
		        closeModal : function(){
		        	 var modal = document.getElementById('myModal');
		             modal.style.display = 'none';
	        },
	        saveName : function(){
	        	  var newNameInput = document.getElementById('newNameInput').value;
	              if (newNameInput !== "") {
	                  document.getElementById('name').textContent = newNameInput;
	                  closeModal();
	              } else {
	                  alert("이름을 입력하세요.");
	              }
        },
				changeName : function(){
					location.href="/boardNoticeList.do";
		        }	
			},
			created : function() {
				var self = this;
				self.fnList();
			}
		});
	</script>