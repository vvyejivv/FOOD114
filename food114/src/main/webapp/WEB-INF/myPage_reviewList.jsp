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

.orderListContainer {
	margin: 10px;
	margin-left: 20px;
	width: 1000px;
}

.orderListTable {
	border-left: none;
	border-right: none;
	width: 1000px;
	border-top: 1px solid #c0c0c0;
	border-collapse: collapse;
}

.orderListTable th, td {
	border-right: none;
	border-bottom: 1px solid #e4e3e3;
	padding: 10px 10px;
	color: (72, 72, 72);
	text-align: center;
}

.orderListTable td {
	font-size: 13px;
}
.pageBox{
	margin-left: 400px;
}
a{
	text-decoration: none;
	color: black;
}
[v-cloak] { display: none; }
.reviewButton {
	background-color: #ffffff;
	border: 1px solid #ff7f00;
	color: #ff7f00;
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
	width: 70px;
	height: 35px;
	margin-left: 930px;
	margin-top: 5px;
}
.reviewButton:hover {
	background-color: #ff7f00;
	border: 1px solid #FBCEB1;
	color: #ffffff;
}
</style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(main).css">
<body>

	<header>
		<%@include file="main(header).html"%>
	</header>

	<section>
		<div class="container" >
			<%@include file="myPage_header.jsp"%>
			<div class="orderListContainer">
				<div id="app" v-cloak>
					<h2>
						<a href="javascript:;" style="font-size: 25px; color: #747171;">
							<span style="color: #ff7f00; font-weight: bold;">| </span> My리뷰목록
						</a>
					</h2>
					<div>
						<table class="orderListTable">
							<tr>
								<th
									style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									NO</th>
								<th
									style="width: 250px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									가게명</th>
								<th
									style="width: 300px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									메뉴</th>
								<th
									style="width: 450px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									리뷰 내용</th>
								<th
									style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									금액</th>
								<th
									style="width: 150px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									리뷰 작성일</th>	
							</tr>
							<tr v-for="(item, index) in reviewList">
								<td style="font-size: 13px">{{ index + 1 + startOrder }}</td>
								<td class="reviewFont">{{item.bizName}}</td>
								<td class="reviewFont">{{item.menuList}}</td>
								<td class="reviewFont">{{item.contents}}</td>
								<td class="reviewFont">{{item.totalPrice.toLocaleString()}}원</td>
								<td class="reviewFont">{{item.reviewDate}}</td>
							</tr>
						</table>
					</div>
					<button class="reviewButton" @click="fnReviewAdd">리뷰 쓰기</button>
					<!-- 페이지  -->
					<div class="pageBox">
						<span><a href="javascript:;" @click="fnfirstPage" style="text-decoration: none; color: black;">≤</a></span>
						<span><a href="javascript:;" @click="fnPre" style="text-decoration: none; color: black;">&lt;</a></span> 
						<template v-for="n in pageCount">
							<a href="javascript:;" @click="fnPageList(n)" v-if="nowPage!=n" :class="[nowPage!=n ? 'text' : 'selectText']">{{n}} </a>
							<span v-else :class="[nowPage!=n ? 'text' : 'selectText']">{{n}} </span>
						</template>
						<span><a href="javascript:;" @click="fnNext" style="text-decoration: none; color: black;">></a></span>
						<span><a href="javascript:;" @click="fnLastPage" style="text-decoration: none; color: black;">≥</a></span>
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
			reviewList : [],
			sessionId : "${sessionId}",
			pageCount : 1,
			cnt : 10,
			nowPage : "${map.nowPage}",
			startOrder : 0,
		},
		methods : {
			fnView : function() {
				var self = this;
				self.startOrder = (self.nowPage * 10)-10;
				var nparmap = {
					userId : self.sessionId,
					startOrder : self.startOrder,
					endOrder : self.cnt,
				};
				$.ajax({
					url : "myInfoReview.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.reviewList = data.reviewList;
						console.log(self.reviewList);
						/* 페이지당 10개 올림  */
						self.pageCount = Math.ceil(data.cnt.listCnt/self.cnt);
						console.log(self.pageCount);
					}
				});
			},
			/* 페이지 기능  */
			fnPageList : function(num){
				var self = this;
				$.pageChange("myOrderList.do",{
					nowPage : num
				});
			},
			fnfirstPage : function() {
				var self = this;
				self.nowPage = 1;
				self.fnPageList(self.nowPage);
			},
			fnPre : function() {
				var self = this;
				if(self.nowPage != 1){				
					self.nowPage = self.nowPage-1;
				}
				self.fnPageList(self.nowPage);
			},			
			fnNext : function() {
				var self = this;
				if(self.nowPage < self.pageCount){					
					self.nowPage = self.nowPage+1;
				}
				self.fnPageList(self.nowPage);
			},
			fnLastPage : function() {
				var self = this;			
				self.nowPage = self.pageCount;
				self.fnPageList(self.nowPage);
			
			},
			fnReviewAdd : function() {
				var self = this;
				$.pageChange("myPage_reviewAdd.do", {});
			}
		},
		created : function() {
			var self = this;
			self.fnView();
			console.log(self.nowPage);
		}
	});
</script>
</html>