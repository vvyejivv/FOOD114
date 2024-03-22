<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FOOD114::마이페이지(주문내역)</title>
<style>
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

.pageBox {
	margin-left: 400px;
}

a {
	text-decoration: none;
	color: black;
}

[v-cloak] {
	display: none;
}
</style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(main).css">
<body>
	<div id="Container">
		<%@include file="food114_header.jsp"%>

		<section>
			<div style="width: 1420px; display: flex; margin: 0px auto;">
				<%@include file="myPage_header.jsp"%>
				<div class="orderListContainer">
					<div id="app" v-cloak>
						<h2>
							<a href="javascript:;" style="font-size: 25px; color: #747171;">
								<span style="color: #ff7f00; font-weight: bold;">| </span> 주문내역
							</a>
						</h2>
						<div>
							<table class="orderListTable">
								<tr>
									<th
										style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										NO</th>
									<th
										style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										주문번호</th>
									<th
										style="width: 150px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										주문한 가게</th>
									<th
										style="width: 450px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										메뉴</th>
									<th
										style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										가격</th>
									<th
										style="width: 200px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										주문일</th>
									<th
										style="width: 150px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										주문상태</th>
								</tr>
								<tr v-for="(item, index) in orderList">
									<td style="font-size: 13px">{{ index + 1 + startOrder }}</td>
									<td class="reviewFont">{{ item.orderNo }}</td>
									<td class="reviewFont">{{ item.bizName }}</td>
									<td class="reviewFont">{{ item.menus }}</td>
									<td class="reviewFont">{{ item.price.toLocaleString() }}원</td>
									<td class="reviewFont">{{ item.orderDate }}</td>
									<td class="reviewFont">{{ item.status }}</td>
								</tr>
							</table>
						</div>
						<!-- 페이지  -->
						<div class="pageBox" style="margin-top: 10px; display: flex; margin-left: 0px; justify-content: center; align-items: center; gap:10px;">
							<span><a href="javascript:;" @click="fnfirstPage"
								style="text-decoration: none; color: black;">≤</a></span> <span><a
								href="javascript:;" @click="fnPre"
								style="text-decoration: none; color: black;">&lt;</a></span>
							<template v-for="n in pageCount">
								<a href="javascript:;" @click="fnPageList(n)" v-if="nowPage!=n"
									:class="[nowPage!=n ? 'text' : 'selectText']">{{n}} </a> <span
									v-else :class="[nowPage!=n ? 'text' : 'selectText']">{{n}}
								</span>
							</template>
							<span><a href="javascript:;" @click="fnNext"
								style="text-decoration: none; color: black;">></a></span> <span><a
								href="javascript:;" @click="fnLastPage"
								style="text-decoration: none; color: black;">≥</a></span>
						</div>
					</div>
				</div>
			</div>
	</div>
	</section>

	<%@include file="food114_footer.jsp"%>
	</div>
</body>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			orderList : [],
			sessionId : "${sessionId}",
			pageCount : 1,
			cnt : 10,
			nowPage : "${map.nowPage}",
			startOrder : 0,
		},
		methods : {
			fnView : function() {
				var self = this;
				self.startOrder = (self.nowPage * 10) - 10;
				var nparmap = {
					userId : self.sessionId,
					startOrder : self.startOrder,
					endOrder : self.cnt,
				};
				$
						.ajax({
							url : "myOrderList.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.orderList = data.orderList;
								/* 페이지당 10개 올림  */
								self.pageCount = Math.ceil(data.cnt.listCnt
										/ self.cnt);
								console.log(self.sessionId);
							}
						});
			},
			/* 페이지 기능  */
			fnPageList : function(num) {
				var self = this;
				$.pageChange("food114-myPage-order.do", {
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
				if (self.nowPage != 1) {
					self.nowPage = self.nowPage - 1;
				}
				self.fnPageList(self.nowPage);
			},
			fnNext : function() {
				var self = this;
				if (self.nowPage < self.pageCount) {
					self.nowPage = parseInt(self.nowPage) + 1;
				}
				self.fnPageList(self.nowPage);
			},
			fnLastPage : function() {
				var self = this;
				self.nowPage = self.pageCount;
				self.fnPageList(self.nowPage);

			}
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>
</html>