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
<link rel="stylesheet" href="../css/myPage_myInfo(grade).css">
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
                            <li><a href="javascript:;" @click="fnMyInfo">MY정보 확인/변경</a></li>
                            <li><a href="javascript:;" @click="fnMyInfoPwd">비밀번호 변경</a></li>
                            <li><a href="javascript:;"@click="myInfoAddr">MY주소지 관리</a></li>
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
               <h2><a href="javascript:;" style="font-size: 25px; color: #747171;"> <span style="color: #ff7f00; font-weight: bold;">| </span>비밀번호 변경</a></h2>
                <div>
                   <!--  <div style="font-size: 13px; color: #969393;">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인합니다.</div>
                    <div class="table">
                        <div class="row">
                            <div class="cell1">아이디</div>
                            <div class="cell2"> test123</div>
                        </div>
                        <div class="row">
                            <div class="cell1">비밀번호</div>
                            <div class="cell2"> <input type="text"></div>
                        </div>
                        <div class="row">
                            <button class="buttonBox1">확인</button>
                            <button class="buttonBox2">취소</button>
                        </div>
                       
                    </div>
                  -->
                    <div class="row">
                            <div style="margin-top: 100px; color: #747171;">
                                 <h1 style="margin-left: 300px; font-size: 30px;">아직 개발 중입니다.</h1>
                                <p style="margin-left: 200px; font-size: 15px;">이 페이지는 아직 개발 중에 있습니다. 곧 완성될 예정입니다. 양해 부탁드립니다.</p>
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
				newName : ''
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
