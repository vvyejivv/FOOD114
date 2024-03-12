<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- 지도  -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/shopInfo.css">
<link rel="stylesheet" href="../css/orderList.css">
<link rel="stylesheet" href="../css/menuInfo.css">
<title>가게정보 페이지</title>
</head>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<%@include file="shopInfo_header.jsp"%>
	<div id="app">
		<section>
			<div id="menuContainer">

				<div class="menuBox">
					<div class="menuTitle">
						<span>메뉴</span>
					</div>
					<!-- 메뉴 테이블 -->
					<template v-for="(item,index) in menuList">
						<div class="menuInfo" @click="fnMenuClick('open',index)">
							<div class="menuImgBox">
								<!-- <img src="../image/kfood.jpg"> -->
							</div>
							<div class="menuName">
								<table>
									<tr>
										<th>{{item.menu}}</th>
									</tr>
									<tr>
										<td>{{item.menuInfo}}</td>
									</tr>
									<tr>
										<td style="border-bottom: none;">{{item.price}}원</td>
									</tr>
								</table>
							</div>
						</div>
					</template>
				</div>
				<div class="menuBox">
					<div class="menuTitle">
						<span>주류</span>
					</div>
					<!-- 주류 테이블 -->
					<div class="menuInfo">
						<div class="menuImgBox"></div>
						<div class="menuName">
							<table>
								<tr>
									<th>메뉴이름</th>
								</tr>
								<tr>
									<td>메뉴소개</td>
								</tr>
								<tr>
									<td style="border-bottom: none;">10,000원</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<!-- 장바구니(영수증창) -->
			<div class="orderListContainer">
				<div class="orderListBox">
					<div class="orderList">장바구니</div>
					<div class="hrLine"></div>
					<table class="orderListTable">
						<tr>
							<th class="tdFirst th" style="">제품명</th>
							<th class="tdAmount th">수량</th>
							<th class="tdSecond th" style="text-align: center;">금액</th>
							<th class="th tdremove">삭제</th>
						</tr>
					</table>
					<div class="receiptt"
						style="height: 400px; overflow-y: scroll; width: 405px;">
						<table class="orderListTable">
							<tr>
								<td class="tdFirst">메뉴이름</td>
								<td class="tdAmount">1</td>
								<td class="tdSecond">1,008,000</td>
								<td class="tdremove">
									<div class="removeBtn">×</div>
								</td>
							</tr>
							<tr>
								<td class="orderListDelivery">배달료</td>
								<td></td>
								<td>1,000</td>
								<td></td>
							</tr>
						</table>
					</div>
					<div class="hrLine"></div>
					<div class="priceBox">
						<div class="totalPrice">원</div>
					</div>
					<div class="orderBtn">주문하기</div>
				</div>
			</div>

			<!-- 메뉴 상세(modal) -->
			<!-- 모달 백드롭 -->
			<template v-if="modalFlg">
				<div class="modal-backdrop" @click="fnMenuClick('close',0)"></div>
				<!-- 모달 대화상자 -->
				<div class="modal-content">
					<div id="menuListContainer">
						<div id="menuListHeader">
							<div id="menuListDetail">메뉴 상세</div>
							<div id="menuClose" @click="fnMenuClick('close',0)">Ⅹ</div>
						</div>
						<div id="menuListImg">
							<img src="../img/메가커피_아아.jpg">
						</div>
						<div id="menuListInfoBox">
							<div id="menuNameBox">{{menu}}</div>
							<div id="menuInfoBox">{{selectMenu.menuInfo}}</div>
						</div>
						<div id="menuListPrice">
							<div class="menuPriceBox">가격</div>
							<div class="menuPriceTxt">{{selectMenu.price}}원</div>
						</div>
						<div id="menuListQuantity">
							<div class="menuPriceBox">수량</div>
							<a id="quantityDown">─</a><input id="quantityInput" type="text"
								v-model="cnt"><a id="quantityUp">┼</a>
						</div>
						<!-- 						<div id="menuListOption">
							<div class="menuPriceBox">옵션</div>
							<a id="quantityUp">┼</a>
						</div> -->
						<div id="menuListTotalPrice">
							<div class="menuPriceBox">총 주문금액</div>
							<div class="menuPriceTxt">{{totalPrice}}원</div>
						</div>
						<div id="menuListBtnBox">
							<button id="menuListAddBtn" @click="fnOrderAdd('add')">주문표에
								추가</button>
							<button id="menuListOrderBtn" @click="fnOrderAdd('order')">주문하기</button>
						</div>
					</div>
				</div>
			</template>
		</section>
	</div>

	<%@include file="main(footer).html"%>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			bizId : "hi123",
			menuList : [],
			modalFlg : false,
			menuNo : "",
			cnt : "1",
			selectMenu : [],
			selectMenuPrice : "",
			totalPrice : "",
			clickMenu : {},
			
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
					bizId : self.bizId
				};
				$.ajax({
					url : "menuList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.menuList = data.menuList;
						console.log(data.menuList);
					}
				});
			},
			fnMenuClick : function(type, index) {
				var self = this;
/* 				self.clickMenu =self.menuList[index];
				console.log(self.clickMenu);
				return;
				self.menuNo = menuNo; */
				var nparmap = {
					menuNo : self.menuNo
				};
				if (type == "open") {
					/* $.ajax({
						url : "selectMenu.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.selectMenu = data.menu;
							self.selectMenuPrice = data.menu.price;
							self.totalPrice = self.selectMenuPrice * self.cnt;
							self.modalFlg = true;
							document.body.style.overflow = 'hidden';
						}
					}); */
				}
				if (type == "close") {
					self.modalFlg = false;
					document.body.style.overflow = 'auto';
				}

			},
			fnOrderAdd : function(type) {
				var self = this;
				var nparmap = {

				};
				if (type == "add") {

				}
				if (type == "order") {

				}
			}

		},
		created : function() {
			var self = this;
			self.fnView();

		}
	});
</script>