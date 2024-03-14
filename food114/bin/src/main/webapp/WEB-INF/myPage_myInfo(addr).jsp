<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<<<<<<< HEAD
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
</style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(updatePwd).css">
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
				<div class="content">
					<h2>
						<a href="javascript:;" style="font-size: 25px; color: #747171;">
							<span style="color: #ff7f00; font-weight: bold;">| </span>MY주소지
							관리
						</a>
					</h2>
					<div>
						<div class="table">
							<div style="border: 1px solid #c2bfbf; padding: 10px;">
								<div
									style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;">
									| MY주소 : 우리집 🏠</div>
								<div class="row" style="border-top: none;">
									<div class="cell1">받는사람</div>
									<div class="cell2">홍길동</div>
									<!-- <div class="cell2"> <input type="text"></div> -->
								</div>
								<div class="row">
									<div class="cell1">주소</div>
									<div class="cell2">인천광역시 부평구 경원대로 1366</div>
									<!-- <div class="cell2"> <input type="text"></div> -->
								</div>
								<div class="row">
									<div class="cell1">휴대폰번호</div>
									<div class="cell2">010-1111-2222</div>
									<!-- <div class="cell2"> <input type="text"></div> -->
								</div>
								<div class="row">
									<div class="cell1">배송요청사항</div>
									<div class="cell2">문 앞에 두고 가 주세요</div>
									<!-- <div class="cell2"> <input type="text"></div> -->
								</div>
								<label><input type="checkbox">기본 주소지로 선택</label>
							</div>

							<div
								style="border: 1px solid #c2bfbf; padding: 10px; margin-top: 5px;">
								<div
									style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;">
									| MY주소 : 회사 🏦</div>
								<div class="row" style="border-top: none;">
									<div class="cell1">받는사람</div>
									<div class="cell2">홍길동</div>
									<!-- <div class="cell2"> <input type="text"></div> -->
								</div>
								<div class="row">
									<div class="cell1">주소</div>
									<div class="cell2">인천광역시 부평구 경원대로 1366</div>
									<!-- <div class="cell2"> <input type="text"></div> -->
								</div>
								<div class="row">
									<div class="cell1">휴대폰번호</div>
									<div class="cell2">010-1111-2222</div>
									<!-- <div class="cell2"> <input type="text"></div> -->
								</div>
								<div class="row">
									<div class="cell1">배송요청사항</div>
									<div class="cell2">문 앞에 두고 가 주세요</div>
									<!-- <div class="cell2"> <input type="text"></div> -->
								</div>
								<label><input type="checkbox">기본 주소지로 선택</label>
							</div>
							<div class="row">
								<button class="buttonSubmit" style="margin-left: 400px;">추가</button>
							</div>
						</div>
						<br>
						<div style="border-top: 1px solid #c2bfbf;">
							<div class="table">
								<div
									style="border: 1px solid #c2bfbf; padding: 10px; margin-top: 5px;">
									<div
										style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;">
										| MY주소 : 회사2 🏦</div>
									<div class="row" style="border-top: none;">
										<div class="cell1">받는사람</div>
										<div class="cell2">
											<input type="text">
										</div>
									</div>
									<div class="row">
										<div class="cell1">주소 찾기</div>
										<div class="cell2">
											<input type="text" placeholder="">
										</div>
									</div>
									<div class="row">
										<div class="cell1">휴대폰번호</div>
										<div class="cell2">
											<input type="text">
										</div>
									</div>
									<div class="row">
										<div class="cell1">배송요청사항</div>
										<div class="cell2">
											<input type="text">
										</div>
									</div>
									<label><input type="checkbox">기본 주소지로 선택</label>
								</div>
								<div class="row">
									<button class="buttonSubmit" style="margin-left: 450px">추가</button>
									<button class="buttonRemove">취소</button>
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
			pwd : ''
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
			checkPwd : function() {
				var self = this;
				if (self.pwd == self.info.pwd) {
					alert("동일");
				} else {
					alert("다름");
				}
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
			self.fnList();
		}
	});
=======
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MAIN</title>
    <style>
    @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
    </style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(updatePwd).css">
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
                    <li>
                        나의정보<span style="color: #b1b0b0;">───────────</span>
                        <ul>
                             <li><a href="javascript:;"@click="fnMyInfo">MY정보 확인/변경</a></li>
                            <li><a href="javascript:;" @click="fnMyInfoPwd">비밀번호 변경</a></li>
                            <li><a href="javascript:;" @click="myInfoAddr">MY주소지 관리</a></li>
                            <li><a href="javascript:;" @click="fnMyInfoGrade">등급</a></li>
                        </ul>
                    </li>
                    <br>
                    <li>
                        결제/주문/리뷰<span style="color: #b1b0b0;">───────────</span>
                        <ul>
                            <li><a href="javascript:;">결제수단 관리</a></li>
                            <li><a href="javascript:;">주문내역</a></li> 
                            <li><a href="javascript:;">MY리뷰목록</a></li>  
                        </ul>
                    </li>
                    <br> 
                    <li>
                        이벤트<span style="color: #b1b0b0;">───────────</span>
                        <ul>
                            <li><a href="javascript:;">쿠폰</a></li>
                            <li><a href="javascript:;">포인트</a></li>
                        </ul>
                    </li>
                    <br><br><br><br><br><br><br><br>      
                </ul>
            </div>
            <div class="content"> 
               <h2><a href="javascript:;" style="font-size: 25px; color: #747171;"> <span style="color: #ff7f00; font-weight: bold;">| </span>MY주소지 관리</a></h2>
                <div>
                    <div class="table">
                       <div style="border: 1px solid #c2bfbf; padding: 10px; "> 
                        <div style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;"> | MY주소 : 우리집 🏠</div>
                            <div class="row" style="border-top: none;">
                                <div class="cell1">받는사람</div>
                                <div class="cell2"> 홍길동</div>
                                <!-- <div class="cell2"> <input type="text"></div> -->
                            </div>
                            <div class="row">
                                <div class="cell1">주소</div>
                                <div class="cell2"> 인천광역시 부평구 경원대로 1366</div>
                                <!-- <div class="cell2"> <input type="text"></div> -->
                            </div>
                            <div class="row">
                                <div class="cell1">휴대폰번호</div>
                                <div class="cell2"> 010-1111-2222</div>
                                <!-- <div class="cell2"> <input type="text"></div> -->
                            </div>
                            <div class="row">
                                <div class="cell1">배송요청사항</div>
                                <div class="cell2"> 문 앞에 두고 가 주세요</div>
                                <!-- <div class="cell2"> <input type="text"></div> -->
                            </div>
                                <label><input type="checkbox">기본 주소지로 선택</label>
                            </div>
                   
                        <div style="border: 1px solid #c2bfbf; padding: 10px; margin-top: 5px;"> 
                            <div style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;"> | MY주소 : 회사 🏦</div>
                            <div class="row" style="border-top: none;">
                                <div class="cell1">받는사람</div>
                                <div class="cell2"> 홍길동</div>
                                <!-- <div class="cell2"> <input type="text"></div> -->
                            </div>
                            <div class="row">
                                <div class="cell1">주소</div>
                                <div class="cell2"> 인천광역시 부평구 경원대로 1366</div>
                                <!-- <div class="cell2"> <input type="text"></div> -->
                            </div>
                            <div class="row">
                                <div class="cell1">휴대폰번호</div>
                                <div class="cell2"> 010-1111-2222</div>
                                <!-- <div class="cell2"> <input type="text"></div> -->
                            </div>
                            <div class="row">
                                <div class="cell1">배송요청사항</div>
                                <div class="cell2"> 문 앞에 두고 가 주세요</div>
                                <!-- <div class="cell2"> <input type="text"></div> -->
                            </div>
                                <label><input type="checkbox">기본 주소지로 선택</label>
                            </div>
                            <div class="row">
                                <button class="buttonBox1" style="margin-left: 400px;">추가</button>
                        </div>
                    </div>
                    <br>
                    <div style="border-top: 1px solid #c2bfbf;">
                    <div class="table">
                         <div style="border: 1px solid #c2bfbf; padding: 10px; margin-top: 5px;"> 
                            <div style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;"> | MY주소 : 회사2 🏦</div> 
                            <div class="row" style="border-top: none;">
                                 <div class="cell1">받는사람</div>
                                 <div class="cell2"> <input type="text"></div>
                             </div>
                             <div class="row">
                                 <div class="cell1">주소 찾기</div>
                                 <div class="cell2"> <input type="text" placeholder=""></div>
                             </div>
                             <div class="row">
                                 <div class="cell1">휴대폰번호</div>
                                 <div class="cell2"> <input type="text"></div>
                             </div>
                             <div class="row">
                                 <div class="cell1">배송요청사항</div>
                                 <div class="cell2"> <input type="text"></div>
                             </div>
                                <label><input type="checkbox">기본 주소지로 선택</label>
                             </div>
                             <div class="row">
                                <button class="buttonBox1">추가</button>
                                <button class="buttonBox2">취소</button>
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
var app = new Vue(
		{
			el : '#app',
			data : {
				list : [],
				info : {},
				sessionId : "${sessionId}",
				newName : '',
				pwd : ''
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
				checkPwd : function() {
					var self = this;
					if(self.pwd == self.info.pwd){
						alert("동일");
					}else{
						alert("다름");
					}
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
				
			},
			created : function() {
				var self = this;
				self.fnList();
			}
		});
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
</script>
</html>
