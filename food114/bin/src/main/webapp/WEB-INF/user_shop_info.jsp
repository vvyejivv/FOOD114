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
<title>FOOD114::가게정보</title>
</head>

<style>
.noPrice {
	text-decoration: line-through;
	text-decoration-color: red;
	color: red;
}
</style>

<body style="margin: 0px;">
	<header>
		<%@include file="food114_header.jsp"%>
	</header>
	<%@include file="user_shop_header.jsp"%>
	<div id="app" v-cloak>
		<div id="menuContainer">
			<div class="menuBox">
				<div class="menuTitle">
					<span>메뉴</span>
				</div>
				<!-- 메뉴 테이블 -->
				<template v-for="(item,index) in menuList" v-if="item.sta != '판매종료'">
					<div class="menuInfo" 
						style="position: relative; padding:5px;">
						
						<!-- 품절시 클릭막기 -->
						<div
							style="position: absolute; background-color: rgba(0, 0, 0, 0.1); width: 100%; height: 100%; z-index: 999; border-radius: 8px;color:red;top:0px;left:0px; text-align: center; padding-top: 5px;" v-if="item.sta=='품절'">
							해당 메뉴는 품절되었습니다.</div>

						<div class="clickBox" style="overflow: hidden;" @click="fnMenuClick('open',index)">
							<div class="menuImgBox">
								<img :src="item.path">
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
										<td style="border-bottom: none;"><span
											:class="{noPrice : item.salePrice&&eventStatus==1}">{{parseInt(item.price).toLocaleString()}}원</span>
											<span v-if="item.salePrice&&eventStatus==1">→
												{{parseInt(item.salePrice).toLocaleString()}}원</span></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</template>
			</div>
			<!-- 		<div class="menuBox">
					<div class="menuTitle">
						<span>주류</span>
					</div> -->
			<!--주류 테이블-->
			<!-- 				<div class="menuInfo">
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
				</div> -->
		</div>
		<!-- 장바구니(영수증창) -->
		<div class="orderListContainer" style="z-index: 999;">
			<div class="orderListBox">
				<div class="orderList">장바구니</div>
				<div class="hrLine"></div>
				<table class="orderListTable">
					<tr>
						<th class="tdFirst th">제품명</th>
						<th class="tdAmount th">수량</th>
						<th class="tdSecond th" style="text-align: center;">금액</th>
						<th class="th tdremove">삭제</th>
					</tr>
				</table>
				<div class="hrLine"></div>
				<div class="receiptt"
					style="height: 400px; overflow-y: scroll; width: 405px;">
					<table class="orderListTable">
						<tr v-for="(order, index) in selectMenuList">
							<td class="tdFirst">{{order.menuName}}</td>
							<td class="tdAmount">{{order.cnt}}</td>
							<td class="tdSecond">{{order.price.toLocaleString()}} <span></span></td>
							<td class="tdremove">
								<div class="removeBtn" @click="fnRemoveMenu(index)">×</div>
							</td>
						</tr>
						<!-- 						<tr>
								<td class="orderListDelivery">배달료</td>
								<td></td>
								<td>1,000</td>
								<td></td>
							</tr> -->
					</table>
				</div>
				<div class="hrLine"></div>
				<div class="priceBox">
					<div class="totalPriceTxt">총 주문금액</div>
					<div class="totalPrice">{{selectTotalPrice.toLocaleString()}}
						원</div>
				</div>
				<div class="orderBtn" @click="fnOrder">주문하기</div>
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
						<div id="menuClose" @click="fnMenuClick('close',0)">×</div>
					</div>
					<div id="menuListImg">
						<img :src="clickMenu.path">
					</div>
					<div id="menuListInfoBox">
						<div id="menuNameBox">{{clickMenu.menu}}</div>
						<div id="menuInfoBox">{{clickMenu.menuInfo}}</div>
					</div>
					<div id="menuListPrice">
						<div class="menuPriceBox">가격</div>

						<div class="menuPriceTxt">
							<span :class="{noPrice : clickMenu.salePrice&&eventStatus==1}">{{parseInt(clickMenu.price).toLocaleString()}}원</span>
							<span v-if="clickMenu.salePrice&&eventStatus==1">→
								{{parseInt(clickMenu.salePrice).toLocaleString()}}원</span>
						</div>
					</div>
					<div id="menuListQuantity">
						<div class="menuPriceBox">수량</div>
						<div id="quantityDown" @click="fnCntUpDown('down')">─</div>
						<input id="quantityInput" type="number" v-model="cnt" :max="1000"
							@input="onInput">
						<div id="quantityUp" @click="fnCntUpDown('up')">┼</div>
					</div>
					<!-- 						<div id="menuListOption">
							<div class="menuPriceBox">옵션</div>
							<a id="quantityUp">┼</a>
						</div> -->
					<div id="menuListTotalPrice">
						<div class="menuPriceBox">총 주문금액</div>
						<div class="menuPriceTxt">{{totalPrice.toLocaleString()}}원</div>
					</div>
					<div id="menuListBtnBox">
						<button id="menuListAddBtn" @click="fnOrderAdd">주문표에 추가</button>
					</div>
				</div>
			</div>
		</template>
	</div>

	<%@include file="food114_footer.jsp"%>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			bizId : "${map.bizId}",
			sessionId : "${sessionId}",
			addr : "",		/* 주소값 */
			menuList : [], /* 메뉴 목록  */
			modalFlg : false, /* modal창 */
			cnt : 1, /* modal창 수량  */
			totalPrice : 0, /* modal창 총 금액 */
			clickMenu : {},/* 클릭한 메뉴  */
			selectMenu : "", /* 클릭한 메뉴 index  */
			selectMenuList : [],/* 장바구니에 담은 메뉴  */
			selectTotalPrice : 0, /* 장바구니 총 금액  */
			status : "결제전", /* 주문상태  */
			orderNo : "", /* 주문번호  */
			eventStatus : "",
			orderAddr :"${map.inputAddr}", /* 주문하기에서 설정한 주소  */
			orderAddrDetail :"${map.detail}", /* 주문하기에서 설정한 상세 주소  */
			phone : "${map.phone}",
			orderRequest :"${map.request}",
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
						self.eventStatus = data.eventStatus;
		
					}
				});
				
			},
			/* 메뉴 선택 */
			fnMenuClick : function(type, index) {
				var self = this;
				self.cnt = 1;
				self.selectMenu = index;
				if (type == "open") {
					
					self.clickMenu = self.menuList[index];
					if(self.eventStatus==1&&self.clickMenu.salePrice){
					self.totalPrice = self.clickMenu.salePrice * self.cnt;
					} else{
						self.totalPrice = self.clickMenu.price * self.cnt;
					}
					self.modalFlg = true;
					document.body.style.overflow = 'hidden';
				}
				if (type == "close") {
					self.modalFlg = false;
					document.body.style.overflow = 'auto';
				}

			},
			/* - / + 버튼  */
			fnCntUpDown : function(type) {
				var self = this;
				var total = parseInt(self.clickMenu.price, 10);					
				
				if(self.eventStatus==1&&self.clickMenu.salePrice){
					var total=parseInt(self.clickMenu.salePrice, 10);
				}
				self.cnt = parseInt(self.cnt, 10);
				/* cnt값이 0이거나, null일때 0으로 처리  */
				if (!self.cnt || isNaN(parseInt(self.cnt, 10))) {
					self.cnt = 0;
					self.totalPrice = 0;
					return;
				}
				/* 문자열로 받아온 값 숫자로 변경, 1000단위 구분 기호  */
				if (type === "down" && parseInt(self.cnt, 10) > 0) {
					self.cnt = (parseInt(self.cnt, 10) - 1);
					self.totalPrice = (total * parseInt(self.cnt, 10)).toLocaleString();
				}

				if (type === "up" && parseInt(self.cnt, 10) < 1000) {
					self.cnt = (parseInt(self.cnt, 10) + 1);
					self.totalPrice = (total * parseInt(self.cnt, 10)).toLocaleString();
				}else if (type === "up" && parseInt(self.cnt, 10) >= 1000) {
			        // 최대값(1000)으로 설정
			        self.cnt = "1000";
			        self.totalPrice = (total * parseInt(self.cnt, 10)).toLocaleString();
			    }
			},
			/* 수량 input */
			onInput: function(event) {
		        var self = this;
		        self.cnt = parseInt(event.target.value, 10);
		    },
		    /* 주문표에 추가 / 주문하기  */
			fnOrderAdd : function() {
				var self = this;
				/* 중복메뉴 확인  */
				var checkMenu = self.selectMenuList.find(item => item.menuNo === self.clickMenu.menuNo);
				if(checkMenu){
					/* 중복메뉴일 경우  */
					checkMenu.cnt += parseInt(self.cnt,10); /* 수량추가  */
					checkMenu.price += parseInt(self.totalPrice, 10); /* 가격 추가  */	
				}else{			
					
					
					
					
					
					/* 장바구니에 메뉴 추가 */
					self.selectMenuList.push({ 	menuName : self.clickMenu.menu,
												cnt : self.cnt, 
												index : self.selectMenu,
												price : parseInt(self.totalPrice, 10),
												unitPrice : self.totalPrice/self.cnt, 
												menuNo : self.clickMenu.menuNo
											});
					
					console.log(self.totalPrice/self.cnt);
					}
				self.selectTotalPrice = self.fnTotalPrice(self.selectMenuList);
				self.fnMenuClick('close',self.selectMenu);
			},
			/* 장바구니 총 금액  */
			fnTotalPrice : function(menuList){
				var self = this;
				var totalPrice = 0;
				for (var i = 0; i < menuList.length; i++) {
		            totalPrice += parseInt(menuList[i].price, 10);
		        }
		        return totalPrice;
			},
			fnRemoveMenu : function(index){
				var self = this;
				self.selectMenuList.splice(index,1);
				self.selectTotalPrice = self.fnTotalPrice(self.selectMenuList);
			},
			/* 주문하기 */
			fnOrder : function(){
				var self = this;
				if(self.orderAddr==""){
					alert("주문하기 페이지에서 주소 입력후 다시 시도해주세요.");
					return;
				}
 				if(self.selectMenuList.length == 0){
					alert("장바구니에 메뉴를 담아주세요.");
					return;
				} 
				/* 주문하기 DB 생성  */
				 var nparmap = {
						userId : self.sessionId, 
						bizId : self.bizId, 
						selectMenuList: JSON.stringify(self.selectMenuList),
						status : self.status, /* 결제전  */
						addr : self.orderAddr,
						detail : self.orderAddrDetail,
						phone : self.phone,
						orderRequest : self.orderRequest,
						
					};
					$.ajax({
						url : "orderAdd.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.orderNo = data.orderNo;
							$.pageChange("/food114-shop-order.do", {userId : self.sessionId, selectMenuList: self.selectMenuList, orderNo : self.orderNo, orderAddr : self.orderAddr, orderAddrDetail : self.orderAddrDetail, phone : self.phone, request : self.orderRequest});
						}
					});  
			}
			

		},
		watch : {
			/* modal창 수량 */
			cnt : function(newCnt, oldCnt) {
				var self = this;
				var total = parseInt(self.clickMenu.price, 10);
				if(self.eventStatus==1&&self.clickMenu.salePrice){
					var total=parseInt(self.clickMenu.salePrice, 10);
				}
				if (!self.cnt || isNaN(parseInt(self.cnt, 10))) {
					self.cnt = 0;
					self.totalPrice = 0;
					return;
				}
				 // cnt 값이 1000 이하인 경우에만 totalPrice 업데이트
	            if (newCnt >= 0 && newCnt <= 1000) {
	                self.totalPrice = (total * parseInt(newCnt, 10));
	            } else {
	                // 1001 이상이면 cnt를 0으로 초기화
	                self.cnt = 0;
	                self.totalPrice = 0;
	            }
				if (newCnt >= 0 && newCnt <= 100) {
					self.totalPrice = (total * parseInt(newCnt, 10));
				}
				self.selectTotalPrice = self.fnTotalPrice(self.selectMenuList);
			},
			/* 장바구니 총 금액 */
			selectMenuList: function (newMenuList, oldMenuList) {
                var self = this;
                self.selectTotalPrice = self.fnTotalPrice(newMenuList);
            }
		},
		created : function() {
			var self = this;
			self.fnView();

		}
	});
	// javascript 영역에 추가 
	window.addEventListener('scroll', function() {
		    var orderListBox = document.querySelector('.orderListBox');
		    var currentPosition = window.scrollY;

		    // 스크롤 위치에 따라 top 값을 조정
		    if (currentPosition > 200) {
		        orderListBox.style.top = '250px';
		    } else {
		        orderListBox.style.top = '560px';
		    }
		});
</script>