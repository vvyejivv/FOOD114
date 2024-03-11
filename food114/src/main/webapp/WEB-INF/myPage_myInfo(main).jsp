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
                    <li>
                        나의정보<span style="color: #b1b0b0;">───────────</span>
                        <ul>
                            <li><a href="javascript:;" @click="fnClick1">MY정보 확인/변경</a></li>
                            <li><a href="javascript:;">비밀번호 변경</a></li>
                            <li><a href="javascript:;">MY주소지 관리</a></li>
                            <li><a href="javascript:;">등급</a></li>
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
               <h2><a href="javascript:;" style="font-size: 25px; color: #747171;"> <span style="color: #ff7f00; font-weight: bold;">| </span>MY정보 확인/변경</a></h2>
                <div>
                    <div class="table">
                        <div class="row">
                            <div class="cell1">아이디</div>
                            <div class="cell2"> test123</div>
                        </div>
                        <div class="row">
                            <div class="cell1">이름</div>
                            <div class="cell2">홍길동 <button class="buttonBox3">이름 변경</button></div>
                        </div>
                        <div class="row">
                            <div class="cell1">별명</div>
                            <div class="cell2">홍사장 <button class="buttonBox3" >별명 변경</button></div>
                        </div>
                        <div class="row">
                            <div class="cell1">생일</div>
                            <div class="cell2">2000.01.01</button></div>
                        </div>
                        <div class="row">
                            <div class="cell1">휴대폰번호</div>
                            <div class="cell2">010-1111-2222<button class="buttonBox3">연락처 변경</button></div>
                        </div>
                        <div class="row">
                            <div class="cell1">이메일</div>
                            <div class="cell2">test@naver.com<button class="buttonBox3">이메일 변경</button></div>
                        </div>
                        <div class="row">
                            <div class="cell1">회원가입일자</div>
                            <div class="cell2">2024.01.01</div>
                        </div>
                        <div  class="row">  
                            <div style="margin-top: 10px; margin-left: 520px; right; font-size: 13px; color: #747171;">탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.&nbsp; 
                                <a href="javascript:;"><span class="span">회원탈퇴</span></a></div>   
                        </div>
                      
                    </div>
                 
                   
                </div>

            </div>
					</div>
	</section>

	<%@include file="main(footer).html"%>

	<script type="text/javascript">
		var app = new Vue({ 
		    el: '#app',
		    data: {
		    	boardNo : "${boardNo}",
		    	list : [],
		    	info : {},
		    	boardList : ""
		    },   
		     methods : {
		    	fnList : function(){
		            var self = this;		            		            
		            var nparmap = {
		            		boardNo : self.boardNo
		            };
		            $.ajax({
		                url:"myPage_myInfo(main).dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) {
		                	self.info = data.info;		                	
		                }
		            }); 
		    } ,
		    fnclick : function(userId){
				location.href="/boardQnaInsert.do";
	        },
	        fnclick1 : function(userId){
				location.href="/myPage_myInfo(main).do";
	        }
				}
		    , created: function () {
		    	var self = this;
		    	self.fnList();
			}
		});
</script>