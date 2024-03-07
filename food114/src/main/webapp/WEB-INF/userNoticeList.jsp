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

.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}

* {
	font-family: 'Noto Sans KR';
}

body {
	margin: 0px;
}

table {
	border-left: none;
	border-right: none;
	width: 1000px;
	border-top: 1px solid #c0c0c0;
	border-collapse: collapse;
}

th, td {
	border-right: none;
	border-bottom: 1px solid #e4e3e3;
	padding: 15px 25px;
	color: (72, 72, 72);
}

th:first-child, td:first-child {
	border-left: none;
}

.container {
	width: 1400px;
	margin: 5px auto;
	padding: 10px;
}

a {
	font-size: 15px;
	text-decoration: none;
	color: #333;
}

.content {
	margin: 10px;
	padding: 5px;
	/* border: 1px solid black; */
}

a {
	font-size: 14px;
}

.border {
	border-width: 0 0 1px;
	border-width: 0;
}

textarea {
	border: none;
	resize: none;
	width: 700px;
	height: 100px;
	resize: none;
	/* 크기고정 */
}

textarea:focus {
	outline: none;
}

button {
	background-color: white;
	border: 1px solid #f8dec7;
	border-radius: 4px;
	width: 50px;
	height: 40px;
	margin: 5px;
	cursor: pointer;
	font-size: 12px;
}

.span {
	font-size: 14px;
	color: #979696c9;
}

.sidebar {
	margin-top: 87px;
	margin-right: 60px;
	width: 150px;
	height: 800px;
	padding: 10px;
}

li {
	border: 1px solid #e9e7e7b0;
	width: 170px;
	height: 40px;
	list-style-type: none;
	text-align: left;
	padding: 10px;
	margin: auto;
}

li:hover {
	background-color: #f5f3f3;
	font-weight: bold;
}

h2 {
	display: left;
}
</style>
</head>

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
			<div class="content" style="overflow: hidden;">
				<div style="float: left;">
					<ul class="sidebar" >
						<li><a href="javascript:;">공지사항</a> <a href="javascript:;"
							style="font-size: 17px; color: #a3a2a2;"><span
								style="margin-left: 100px;">❯</span></a></li>
						<li><a href="javascript:;">자주하는 질문</a> <a href="javascript:;"
							style="font-size: 17px; color: #a3a2a2;"><span
								style="margin-left: 70px;">❯</span></a></li>
						<li><a href="javascript:;">1:1 문의</a> <a href="javascript:;"
							style="font-size: 17px; color: #a3a2a2;"><span
								style="margin-left: 100px;">❯</span></a></li>

					</ul>
				</div>
				<div style="float: left; width: 1000px;">
					<div style="float: left;">
						<br>
						<h2>
							<span style="color: #ff7f00; font-weight: bold;">| </span><span
								style="text-align: left; color: rgba(72, 72, 72);">공지사항&nbsp;</span>
							<span class="span">새로운 소식과 유용한 정보를 한 곳에서 확인하세요.</span>
						</h2>
					</div>
					<table>
						<tr>
							<th
								style="width: 20px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								번호</th>
							<th
								style="width: 300px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								제목</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성자</th>
							<th
								style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성일</th>
						</tr>
						<tr v-for="(item, index) in list">
							<td style="text-align: center;">{{item.boardNo}}</td>
							<td><a href="javascript:;" style="font-size: 15px;">{{item.title}}</a></td>
							<td style="text-align: center; font-size: 14px;">{{item.userId}}</td>
							<td style="text-align: center; font-size: 15px; color: #a3a2a2;">{{formatDate(item.cdateTime)}}</td>
						</tr>
					</table>
					<br>
						<div style="text-align: center;">
						<button @click="fnPageList(nowPage-1)" v-if="nowPage !=1">
							<span style="color: #ff7f00; font-size: 20px;">{{prevIcon}}</span>
						</button>
							<template v-for="n in pageCount">
								  <a href="javascript:;" @click="fnPageList(n)">
								    <span v-if="n !== '❮' && n !== '❯'">
								    </span>
								    <span v-else>{{n}}</span>
								  </a>
								</template>
						<button @click="fnPageList(nowPage+1)" v-if="nowPage != pageCount">
							<span style="color: #ff7f00; font-size: 20px;">{{nextIcon}}</span>
						</button>
					</div>
				</div>
			</div>

		</div>
</div>
	</section>

	<footer>
		<%@include file="main(footer).html"%>
	</footer>

	<script type="text/javascript">
		var app = new Vue({
			el : '#app',
			data : {
				list : [],
				boardList : "",	// 게시글 목록
				type : "CDATE",
				prevIcon : "❮",
				nextIcon : "❯",
				nowPage : 1,
				pageCount : '',
				searchCnt: 10
				},
			methods : {
				fnPageList : function() {
					var self = this;
					self.nowPage =1;
					var nparmap = {			
							startNum : 1,
		            		lastNum : 10,
							type : self.type
					};
					$.ajax({
						url : "userNoticeList.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							console.log(data);
							self.list = data.list;
							self.pageCount = Math.ceil(data.cnt/self.searchCnt);
						}
					});
				},
				formatDate: function (dateString) {
				      if (dateString) {
				        return dateString.split(' ')[0];
				      }
				    }
			},
			created : function() {
				var self = this;
				self.fnPageList();
			}
		});
	</script>