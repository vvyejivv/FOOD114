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
<link rel="stylesheet" href="../css/boardNotice.css">
<body>

	<header>
		<%@include file="main(header).html"%>
	</header>
	<section>
		<div id="app">
			<div class="container">
				<div class="content">
					<div style="float: left;">
						<ul class="sidebar">
							<li @click="fnClickNoticeList">공지사항<a href="javascript:;"
								style="font-size: 17px; color: #a3a2a2;"><span
									style="margin-left: 85px;">❯</span></a></li>
							<li>자주하는 질문 <a href="javascript:;"
								style="font-size: 17px; color: #a3a2a2;"><span
									style="margin: 0px;">❯</span></a></li>
							<li>1:1 문의<a href="javascript:;"
								style="font-size: 17px; color: #a3a2a2;"><span
									style="margin-left: 85px;">❯</span></a></li>
						</ul>
					</div>

					<br>
					<h2>
						<span style="color: #ff7f00; font-weight: bold;">| </span><span
							style="text-align: left; color: rgba(72, 72, 72);">공지사항&nbsp;</span>
						<span class="span">새로운 소식과 유용한 정보를 한 곳에서 확인하세요.</span>
					</h2>
					<div>
						<table border="1"
							style="border-collapse: collapse; margin: 10px; width: 850px;">
							<tr>
								<td colspan="1"
									style="background-color: #f9f9f9; border-top: 2px solid rgba(72, 72, 72);">제목</td>
								<td style="border-top: 2px solid rgba(72, 72, 72);">{{info.title}}</td>
							</tr>
							<tr>
								<td colspan="1" style="background-color: #f9f9f9; width: 50px;">작성자</td>
								<td>{{info.userId}}</td>
							</tr>
							<tr>
								<td style="background-color: #f9f9f9;">작성일</td>
								<td colspan="1">{{formatDate(info.cdateTime)}}</td>
							</tr>
							<tr>
								<td colspan="4" style="padding-top: 30px; padding-bottom: 30px;">
									<div style="text-align: justify; font-size: 16px;">
										{{info.contents}}</div>
								</td>
							</tr>
						</table>
						<div>
							<button @click="fnClickNoticeList"
								style="width: 150px; font-size: 15px; margin-top: 15px; margin-left: 620px; margin-bottom: 100px;">목록</button>
						</div>
					</div>
	</section>

	<%@include file="main(footer).html"%>

	<script type="text/javascript">
		var app = new Vue({
			el : '#app',
			data : {
				boardNo : "${boardNo}",
				list : [],
				info : {},
				boardList : ""
			},
			methods : {
				fnList : function() {
					var self = this;
					var nparmap = {
						boardNo : self.boardNo
					};
					$.ajax({
						url : "boardNoticeVeiw.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.info = data.info;
						}
					});
				},
				fnclick : function(userId) {
					location.href = "/boardQnaInsert.do";
				},
				fnClickNoticeList : function(userId) {
					location.href = "/boardNoticeList.do";
				},
				formatDate : function(dateString) {
					if (dateString) {
						return dateString.split(' ')[0];
					}
				}
			},
			computed : {
				paginatedList : function() {
					var self = this;
					var startIndex = (this.nowPage - 1) * self.searchCnt;
					var endIndex = startIndex + self.searchCnt;
					return this.list.slice(startIndex, endIndex);
				}
			},
			created : function() {
				var self = this;
				self.fnList();
			}
		});
	</script>