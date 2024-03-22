<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FOOD114::공지사항</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
.insertRemoveButton{
	width: 300px;
	margin-left: 700px; 
	display:flex;
	
}

.sidebar > li{
cursor: pointer;
}
</style>
</head>
<link rel="stylesheet" href="../css/boardNoticeList.css">
<body>
	<%@include file="food114_header(biz).jsp"%>

	<section>
		<div id="app" v-cloak>
			<div class="container">

				<div style="float: left;">
					<ul class="sidebar">
						<li @click="fnClickNoticeList"><a href="javascript:;">공지사항</a>
							<a href="javascript:;" style="font-size: 17px; color: #a3a2a2;"><span
								style="margin-left: 100px;">❯</span></a></li>
						<li @click="fnClickQnaAsk"><a href="javascript:;">자주하는 질문</a>
							<a href="javascript:;" style="font-size: 17px; color: #a3a2a2;"><span
								style="margin-left: 70px;">❯</span></a></li>
						<li @click="fnClick"><a href="javascript:;">1:1 문의</a> <a
							href="javascript:;" style="font-size: 17px; color: #a3a2a2;"><span
								style="margin-left: 100px;">❯</span></a></li>
					</ul>
				</div>
				<div class="content" style="overflow: hidden;">
					<div style="float: left; width: 800px;">
						<div style="float: left;">
							<br>
							<h2>
								<span style="color: #5F5F5F; font-weight: bold;">| </span><span
									style="text-align: left; color: rgba(72, 72, 72);">공지사항&nbsp;</span>
								<span class="span">새로운 소식과 유용한 정보를 한 곳에서 확인하세요.</span>
							</h2>
						</div>
						<table style="width: 920px">
							<tr>
								<th
									style="width: 10px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									번호</th>
								<th
									style="width: 200px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									제목</th>
								<th
									style="width: 20px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									작성자</th>
								<th
									style="width: 5px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									작성일</th>
							</tr>
							<tr v-for="(item, index) in paginatedList">
								<td style="text-align: center;">{{item.boardNo}}</td>
								<td><a href="javascript:;" style="font-size: 15px;"
									@click="fnClickBoardNoticeView(item.boardNo)">{{item.title}}</a></td>
								<td style="text-align: center; font-size: 14px;">{{item.userId}}</td>
								<td style="text-align: center; font-size: 15px; color: #a3a2a2;">{{formatDate(item.cdateTime)}}</td>
							</tr>
						</table>
						<div class="insertRemoveButton" hidden>
							<button @click="fnInsertNotice">글쓰기</button>
							<button @click="fnNoticeRemove">삭제</button>
						</div>
						<!-- <div style="margin-left: 820px; display:left;">
							<button @click="fnNoticeRemove">삭제</button>
						</div> -->

						<br>
						<div style="text-align: center;">
							<button @click="fnPageList(nowPage-1)" v-if="nowPage > 1">
								<span style="color: #ff7f00; font-size: 20px;">{{prevIcon}}</span>
							</button>
							<button @click="fnPageList(nowPage-1)" v-if="nowPage == 1"
								style="border: 1px solid #f5f3f3; cursor: default;" disabled>
								<span style="color: #f5f3f3; font-size: 20px;">{{prevIcon}}</span>
							</button>
							<template v-for="n in pageCount">
								<a href="javascript:;" @click="fnPageList(n)"> </a>
							</template>
							<button @click="fnPageList(nowPage+1)" v-if="nowPage < pageCount">
								<span style="color: #ff7f00; font-size: 20px;">{{nextIcon}}</span>
							</button>
							<button @click="fnPageList(nowPage-1)"
								v-if="nowPage == pageCount" 
								style="border: 1px solid #f5f3f3; cursor: default;" disabled>
								<span style="color: #f5f3f3; font-size: 20px;">{{nextIcon}}</span>
							</button>
						</div>
					</div>
				</div>

			</div>
		</div>
	</section>


	<%@include file="food114_footer(biz).jsp"%>


	<script type="text/javascript">
		var app = new Vue({
			el : '#app',
			data : {
				list : [],
				boardList : "", // 게시글 목록
				type : "CDATE",
				prevIcon : "❮",
				nextIcon : "❯",
				nowPage : 1,
				pageCount : '',
				searchCnt : 20
			},
			methods : {
				fnPageList : function(page) {
					var self = this;
					if (page >= 1 && page <= self.pageCount) {
						self.nowPage = page;
						var nparmap = {
							startNum : (self.pageCount - page) * self.searchCnt
									+ 1,
							lastNum : (self.pageCount - page + 1)
									* self.searchCnt,
							type : self.type
						}
					}
					;
					$.ajax({
						url : "boardNoticeList.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							console.log(data);
							self.list = data.list.reverse();
							self.pageCount = Math.ceil(data.cnt
									/ self.searchCnt);
							/* self.nowPage = nowPage; */
							if (page == 1) {
								self.prevIcon = "❮";
							} else {
								self.prevIcon = "❮"
							}
						}
					});
				},
				fnClickQnaAsk : function(userId) {
					alert("준비중입니다.");
					return;
				},
				fnClick : function(userId) {
					
					location.href = "/food114-biz-ask.do";
				},
				fnClickNoticeList : function(userId) {
					location.href = "/food114-biz-notice.do";
				},
				fnClickBoardNoticeView : function(boardNo) {
					$.pageChange("/food114-biz-notice-view.do", {
						boardNo : boardNo
					});
					/* location.href="/boardNoticeVeiw.do"; */
				},
				formatDate : function(dateString) {
					if (dateString) {
						return dateString.split(' ')[0];
					}
				},
				fnInsertNotice : function(){
					location.href = "/boardNoticeInsert.do";
				},
				// 공지사항 삭제하기(수정 중)
				fnNoticeRemove : function(userId) {
					location.href = "/food114-biz-notice.do";
					
					var self = this;
					var nparmap = {
						userId : self.sessionId,
						addrNo : addrNo
					};
					$.ajax({
						url : "/boardNoticeRemove.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							if (data.result == "success") {
								alert("주소가 삭제 되었습니다.");
								return location.href = "/food114-biz-notice.do";
							} else {
								alert("오류가 발생하였습니다.");
							}
							self.info = data.info;
							console.log(data.info);
						}
					});
				},
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
				self.fnPageList();
			}
		});
	</script>