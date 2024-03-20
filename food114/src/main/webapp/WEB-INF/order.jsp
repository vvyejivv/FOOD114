<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- 뷰 구성요소에 type="application/javascript" 추가  -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/order.css">
<title>주문하기</title>
</head>
<style>
</style>
<body style="margin: 0px;">
	<header>
		<%@include file="food114_header.jsp"%>
	</header>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section>
		<div id="app" v-cloak>
			<div id="orderContainer">
				<div id="title">
					<span>주문하기</span>
				</div>
				<div class="subTitle">
					<span>배달정보</span>
				</div>
				<div class="deliveryBox">
					<div class="infoBox" id="addr">
						<!-- 설정 주소 불러오기 -->
						<div class="infoText">주소</div>
						<!--:value="userAddr[0].newAddr"  -->
						<input type="text" :value="!userNewAddr ? orderAddr : userNewAddr" disabled>
						<!-- 상세주소 -->
						<div>
							<input type="text" :value="userDetail ? '' : userDetail">
						</div>
					</div>
					<div class="infoBox" id="phone">
						<div class="infoText">휴대전화번호</div>
						<input type="text" name="phone1" v-model="phone1"> - <input
							type="text" name="phone2" v-model="phone2"> - <input
							type="text" name="phone3" v-model="phone3">
						<!-- <span id="securePhone"> <label><input type="checkbox">안심번호 사용</label> -->
						</span>
					</div>
				</div>
				<div class="subTitle">
					<span>주문 요청사항</span>
				</div>
				<div class="deliveryBox">
					<!-- 				<div id="ecoYN">
						<label><input type="checkbox" v-model="ecoYNChecked">
							일회용 수저, 포크 안 주셔도 됩니다.</label>

					</div> -->
					<textarea v-model="orderRequest" @input="fnRequestLength"
						placeholder="ex) 견과류 빼주세요, 덜 맵게 해주세요."></textarea>
					<div id="requestSize">{{orderRequest.length}} / 60</div>

				</div>
				<div class="subTitle">
					<span>배달 요청사항</span>
				</div>
				<div class="deliveryBox">
					<textarea v-model="deliveryRequest" @input="fnRequestLength"
						placeholder="코로나 19 예방을 위해 비대면 배달을 권장 드립니다."></textarea>
					<div id="requestSize">{{deliveryRequest.length}} / 60</div>

				</div>
				<div class="subTitle">
					<span>결제수단 선택</span>
				</div>
				<div class="deliveryBox">
					<!-- 					<div class="payMargin">
						<div class="payBox">
							<span class="payMainText">바로 결제</span>
							<div id="payText">*등록된 결제 수단으로 결제됩니다.</div>
							<div class="payDivContainer">
								<div class="orderText" id="payPageLeft">&lt;</div>
								<div id="payDivBox" class="orderText">
									<div>등록된 결제 수단</div>
								</div>
								<div class="orderText" id="payPageRight">></div>
							</div>
						</div>
					</div>
					<hr> -->
					<div class="payMargin">
						<div class="payBox">
							<span class="payMainText">다른 결제 수단</span>
							<div class="payDivContainer">
								<div class="payDivBox" @click="fnPayment('card') "
									:class="{'selectedPayment': selectedPaymentMethod === 'card' }">
									<span>신용카드</span>
								</div>
								<div class="payDivBox" @click="fnPayment('phone')"
									:class="{'selectedPayment': selectedPaymentMethod === 'phone' }">
									<span>휴대폰결제</span>
								</div>
								<div class="payDivBox" @click="fnPayment('kakao')"
									:class="{'selectedPayment': selectedPaymentMethod === 'kakao' }">
									<img src="../img/카카오페이.png" id="kakaoPay"> <span>카카오페이</span>
								</div>
								<div class="payDivBox" @click="fnPayment('toss')"
									:class="{'selectedPayment': selectedPaymentMethod === 'toss' }">
									<img src="../img/토스.png" id="tossPay"> <span>토스결제</span>
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div class="payBox">
						<span class="payMainText">현장 결제</span>
						<div class="payDivContainer">
							<div class="payDivBox" @click="fnMeetPayment('meetCard')"
								:class="{'selectedPayment': selectedMeetPaymentMethod === 'meetCard' }">신용카드</div>
							<div class="payDivBox" @click="fnMeetPayment('cash')"
								:class="{'selectedPayment': selectedMeetPaymentMethod === 'cash' }">현금</div>
						</div>
					</div>
				</div>
				<div class="subTitle">
					<span>할인방법 선택</span>
				</div>
				<div class="deliveryBox">
					<div id="couponBox" class="infoText">
						<div id="couponDiv">쿠폰</div>
						<div id="couponInput">
							<input type="text" placeholder="쿠폰 목록에서 선택해주세요"
								class="couponInput" v-model="couponTitle" disabled="disabled">
						</div>
						<button @click="fnCouponPopupOpen">쿠폰 목록</button>
					</div>
					<!--            <div id="couponBox" class="payMainText">
                    <p>포인트 사용</p>
                    <input type="text" placeholder="포인트 입력" class="couponInput">
                    <button>적용</button>
                    <button>전체 포인트</button>
                </div> -->
				</div>


				<!-- 주문하기(영수증창) -->
				<div class="orderListContainer">
					<div class="orderListBox">
						<div class="orderList">주문 내역</div>
						<div class="hrLine"></div>
						<table class="orderListTable">
							<tr>
								<th class="thFirst">제품명</th>
								<th>수량</th>
								<th class="thSecond">금액</th>
								<th>삭제</th>
							</tr>
							<template>
								<tr v-for="(item,index) in selectMenuList">
									<td class="tdFirst">{{item.menuName}}</td>
									<td>{{item.cnt}}</td>
									<td class="tdSecond">{{item.price.toLocaleString()}}원</td>
									<td>
										<div class="removeBtn" @click="fnRemoveMenu(index)">x</div>
									</td>
								</tr>
							</template>
						</table>
						<div class="hrLine"></div>
						<div style="width:400px; display:flex; padding: 10px 30px;">
							<div style="width: 320px; color:#000000; font-size:14px;">쿠폰 할인 금액</div>						
							<div style="margin-left: auto; color:#5F5F5F; font-size:14px;">{{discount}} 원</div>
						</div>
						<div class="hrLine"></div>
						<div class="priceBox" style="width:400px; display :flex; padding : 10px 30px;">
							<div class="priceTxt" style="width: 320px; color:#000000; font-size:14px;">총 금액</div>
							<div class="totalPrice" style="margin-left: auto; color:#5F5F5F; font-size:14px;">{{couponAmount.toLocaleString()}}원</div>
						</div>

						<div class="orderBtn" @click="fnPay">결제하기</div>
					</div>
				</div>

			</div>
		</div>
	</section>

	<%@include file="food114_footer.jsp"%>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionId}",
			orderNo : "${map.orderNo}", /* 주문번호 */
			userAddrList : {}, /* 주소목록  */
			userNewAddr : "", /* DB고객 신주소 */
			userDetail : "", /* DB고객 상세주소 */
			orderAddr : "${map.orderAddr}",/* 주문하기 설정주소  */
			orderAddrDetail : "${map.orderAddrDetail}", /* 주문하기 설정주소(상세)  */
			phone1 : "",
			phone2 : "",
			phone3 : "",
			phone : "", /* 전화번호  */
			ecoYNChecked : false, /* 일회용 수저,포크 체크여부 전달  */
			orderRequest : "", /* 주문 요청사항  */
			deliveryRequest : "", /* 배달 요청사항  */
			status : "", /* 주문상태 */
			selectedPaymentMethod : "", /* 바로 결제 선택  */
			selectedMeetPaymentMethod : "", /* 만나서 결제 선택  */
			paymentType : "", /* 결제방식  */
			couponNo : 0, /* 쿠폰번호  */
			couponTitle : "", /* 쿠폰 이름  */
			couponSaleAmount : 0, /* 쿠폰 할인액 */
			couponSalePercent : 0, /* 쿠폰 할인 퍼센트  */
			discount : 0, /* 할인율 적용 금액  */
			couponList : {}, /* 쿠폰 목록  */
			selectTotalPrice : 0, /* 총 금액  */
			couponAmount : 0, /* 쿠폰 적용된 총 금액 */
			selectMenuList : ${map.selectMenuList}, /* 장바구니에 담아온 메뉴  */
			menuNo :0,
			paymentStatus : "", /* 결제여부  */
			couponId : "",
			flg : false,

		},
		methods : {
			fnView : function() {
				var self = this;
				/* var nparmap = {
					userId : self.sessionId
				};
				console.log("주문번호 : " + self.orderNo);
				$.ajax({
					url : "consumer-addr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.userAddrList = data.customerAddr;
					}
				}); */
				console.log(self.orderAddr);
				console.log(self.orderAddrDetail);
				/* 총 금액  */
				self.selectTotalPrice = self.fnTotalPrice(self.selectMenuList);
				self.couponAmount = self.selectTotalPrice;
				/* 주소 입력 */
				self.userNewAddr = self.orderAddr;
				self.userDetail = self.orderAddrDetail;
			},
			/* 요청사항 60자 이하 제한  */
			fnRequestLength : function() {
				var self = this;
				if (self.orderRequest.length > 60) {
					self.orderRequest = self.orderRequest.slice(0, 60);
				}
				if (self.deliveryRequest.length > 60) {
					self.deliveryRequest = self.deliveryRequest.slice(0, 60);
				}
			},
			/* 바로 결제  */
			fnPayment : function(type) {
				var self = this;
				self.selectedPaymentMethod = type;
				if (self.selectedPaymentMethod === type) {
					self.selectedMeetPaymentMethod = "";
				} 
				if (type == 'card') {
					self.paymentType = type;
				} else if (type == 'phone') {
					self.paymentType = type;
				} else if (type == 'kakao') {
					self.paymentType = type;
				} else if (type == 'toss') {
					self.paymentType = type;
				} else {
					alert("다시 시도하세요");
				}
			},
			/* 만나서 결제  */
			fnMeetPayment : function(type) {
				var self = this;
				self.selectedMeetPaymentMethod = type;
				if (self.selectedMeetPaymentMethod === type) {
					self.selectedPaymentMethod = "";
				}
				if (type == 'meetCard') {
					self.paymentType = type;
				} else if (type == 'cash') {
					self.paymentType = type;
				}
			},
			/* 쿠폰 팝업(open)  */
			fnCouponPopupOpen : function(){
				var self = this;
				var left = (screen.availWidth) / 2;
		        var top = (screen.availHeight) / 2;
		        var width = 700;
		        var height = 300;
		        pop = window.open("couponList.do", "couponPopup", 'width=' + width + ',height=' + height + ',left=' + (left - (width / 2)) + ',top=' + (top - (height / 2)));
				
		        self.flg = false;
		     // 팝업 창에서 부모 창의 데이터를 전달 받을 수 있도록 콜백 함수 설정
		        pop.onApplyCoupon = function (couponNo, title, saleAmount, salePercent) {
		        	self.onApplyCoupon(couponNo, title, saleAmount, salePercent); 
		        };
			},
			/* 쿠폰 적용  */
			fnUseCoupon : function(){	
				var self = this;
				if(self.couponSaleAmount == 0){
					console.log("쿠폰 적용 전 : " + self.selectTotalPrice );
					self.discount = self.selectTotalPrice * self.couponSalePercent;
					self.couponAmount = self.selectTotalPrice - self.discount;
					console.log("쿠폰 적용 후 : " + self.couponAmount );
					return;
				}
				if(self.couponSalePercent == 0){					
					console.log("쿠폰 적용 전 : " + self.selectTotalPrice );
					self.discount = self.couponSaleAmount;
					self.couponAmount = self.selectTotalPrice - self.couponSaleAmount;
					console.log("쿠폰 적용 후 : " + self.couponAmount );
					return;
				}
				return;
				if(self.couponNo !== "" || self.couponNo !== 0){
					if(self.couponSalePercent > 0){	
						self. discount = selectTotalPrice * (couponSalePercent/100); //쿠폰 할인율금액
						self.couponAmount = selectTotalPrice - discount; //쿠폰 할인 금액
					}else if(self.couponSaleAmount > 0){
						self.couponAmount = selectTotalPrice - self.couponSaleAmount //쿠폰 할인 금액
					}
				}
			},
			/* 주문 상태변경  */
			fnStatus : function(type){
				var self = this;
				if(type == "결제중"){
					self.status = "결제중";
				}else if(type == "결제완료"){
					self.status = "결제완료";
				}else{
					self.status = "결제실패"
					alert("다시 시도하세요.");
					return;
				}
				var nparmap = {	
						orderNo : self.orderNo,
						userId : self.sessionId,
						status : self.status,
					};
	             $.ajax({
		                url:"orderStatusUpdate.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) { 
		                }
		            }); 
			},
			/* 결제방법 */
			fnPay : function(){
				var self = this;
				/* 결제중으로 상태변경  */
				self.fnStatus("결제중");
				 if (self.paymentType == 'card') {
					self.fnPayInfoSave(); /* 결제정보 저장  */
					self.fnCreditCard();  /* 신용카드 결제 */
				} else if (self.paymentType == 'phone') {
					self.fnPayInfoSave(); /* 결제정보 저장  */
					self.fnPhonePayment();
				} else if (self.paymentType == 'kakao') {
					self.fnPayInfoSave(); /* 결제정보 저장  */
					self.fnKakaoPay();
				} else if (self.paymentType == 'toss') {
					self.fnPayInfoSave(); /* 결제정보 저장  */
					self.fnToss();
				} else if (self.paymentType == 'meetCard'){
					self.fnPayInfoSave(); /* 결제정보 저장  */
					self.fnOrder();
					self.fnPageChang('success'); /* 결제완료 후 페이지이동 */
				} else if (self.paymentType == 'cash'){
					self.fnPayInfoSave(); /* 결제정보 저장  */		
					self.fnOrder();
					self.fnPageChang('success'); /* 결제완료 후 페이지이동 */
				}  else {
					alert("다시 시도하세요");
				}		 
			},
			/* 주문 정보 저장  */
			fnOrder : function(){
				var self = this;
				self.phone = self.phone1 + self.phone2 + self.phone3;
/* 				if(!self.orderAddr){
					self.userNewAddr = self.orderAddr;
				}else{							
					self.userNewAddr = self.userAddrList[0].newAddr;
					self.userDetail = self.userAddrList[0].detail;
				} */
				var nparmap = {	
					orderNo : self.orderNo,
					userId : self.sessionId,
					addr : self.userNewAddr,
					detail : self.userDetail,
					phone : self.phone,
					orderRequest : self.orderRequest,
					deliveryRequest : self.deliveryRequest,
					status : self.status,
					couponNo : self.couponNo,
					menuNo : self.menuNo,
				};
				 $.ajax({
		                url:"orderUpdate.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) { 
		        			self.fnStatus("결제완료");
		        			console.log("주문정보결과 : " + data.result);
		                }
		            }); 
			},
			/* 결제정보 저장  */
			fnPayInfoSave : function(){
				var self = this;
				var nparmap = {	
						orderNo : self.orderNo,
						userId : self.sessionId,
						couponNo : self.couponNo,
						type : self.paymentType,
						price : self.couponAmount, /* 결제 금액 확인  */
					};
					 $.ajax({
			                url:"PaymentInfoSave.dox",
			                dataType:"json",	
			                type : "POST", 
			                data : nparmap,
			                success : function(data) {
			        			console.log("결제정보 결과 : " + data.result);
			                }
			            });
			},
			fnRemoveMenu : function(index){
				var self = this;
				self.menuNo = self.selectMenuList[index].menuNo; /* 삭제한 메뉴 번호  */
				self.selectMenuList.splice(index,1);
				self.couponAmount = self.fnTotalPrice(self.selectMenuList);
				var nparmap = {	
						orderNo : self.orderNo,
						menuNo : self.menuNo,
					};
					 $.ajax({
			                url:"removeMenu.dox",
			                dataType:"json",	
			                type : "POST", 
			                data : nparmap,
			                success : function(data) {
			        			console.log("삭제 결과 : " + data.result);
			                }
			            });
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
			/* 신용카드 결제  */
			fnCreditCard : function() {
	            var self = this;
	            IMP.init('imp67187845'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
	            IMP.request_pay({
	               pg : "kicc.T5102001",
	               pay_method : "card",
	               merchant_uid : 'merchant_' + new Date().getTime(),
	               name : '결제테스트',
	               amount : 100,
	               buyer_email : 'iamport@siot.do',
	               buyer_name : '구매자',
	               buyer_tel : '010-1234-5678',
	               buyer_addr : '서울특별시 강남구 삼성동',
	               buyer_postcode : '123-456'
	            }, (rsp) => { // 화살표 함수로 변경하여 콜백 함수 정의
	                 if (rsp.success) {    
	                	 console.log("결제 : success");
	                     self.paymentStatus = "success";
	                     self.fnOrder();/* 주문내용 저장  */
	                 } else {
	                     console.error("Fail. Reason:", rsp.error_msg); // 오류 메시지 출력
	                     self.paymentStatus = "fail";
	                 }
	             });
	         },
	         /* 휴대폰 결제  */
			fnPhonePayment : function() {
				var self = this;
				IMP.init('imp67187845'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
				IMP.request_pay({
					pg : "danal.A010002002",
					pay_method : "card",
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '결제테스트',
					amount : 100,
					buyer_email : 'iamport@siot.do',
					buyer_name : '구매자',
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울특별시 강남구 삼성동',
					buyer_postcode : '123-456'
					}, function(rsp) { // callback
						if (rsp.success) {
							 console.log("결제 : success");
		                     self.paymentStatus = "success";
		                     self.fnOrder();/* 주문내용 저장  */
		                     self.fnPageChang('success'); /* 결제완료 후 페이지이동 */
						} else {
							alert("Fail.");
						}
					});
			},
	         /* 카카오페이 결제  */
			fnKakaoPay : function() {
				var self = this;
				IMP.init('imp67187845'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
				IMP.request_pay({
					pg : "kakaopay.TC0ONETIME",
					pay_method : "card",
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '결제테스트',
					amount : 100,
					buyer_email : 'iamport@siot.do',
					buyer_name : '구매자',
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울특별시 강남구 삼성동',
					buyer_postcode : '123-456'
				}, function(rsp) { // callback
					if (rsp.success) {
						 console.log("결제 : success");
	                     self.paymentStatus = "success";
	                     self.fnOrder();/* 주문내용 저장  */
	                     self.fnPageChang('success'); /* 결제완료 후 페이지이동 */
					} else {
						alert("Fail.");
					}
				});
			},
			/* 토스 결제 */
			fnToss : function() {
				var self = this;
				IMP.init('imp67187845'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
				IMP.request_pay({
					pg : "tosspay.tosstest",
					pay_method : "card",
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '결제테스트',
					amount : 100,
					buyer_email : 'iamport@siot.do',
					buyer_name : '구매자',
					buyer_tel : '010-1234-5678',
					buyer_addr : '서울특별시 강남구 삼성동',
					buyer_postcode : '123-456'
				}, function(rsp) { // callback
					if (rsp.success) {
						 console.log("결제 : success");
	                     self.paymentStatus = "success";
	                     self.fnOrder();/* 주문내용 저장  */
	                     self.fnPageChang('success'); /* 결제완료 후 페이지이동 */
					} else {
						alert("Fail.");
					}
				});
			},
			fnPageChang : function(type){
				var self = this;
				if(type == "success"){
					$.pageChange("/paymentCompleted.do", {orderNo : self.orderNo});
				}else if(type == "fail"){
					/* 오류창 */
				}
			}
		},
		watch : {
			/* 장바구니 총 금액 */
			selectMenuList: function (newMenuList, oldMenuList) {
                var self = this;
                self.selectTotalPrice = self.fnTotalPrice(newMenuList);
            },
            flg : function (){
            	var self = this;
            	self.fnUseCoupon();
            }
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
	function onApplyCoupon(couponNo, title, saleAmount, salePercent,couponId){
		app.couponNo = couponNo;
		app.couponTitle = title;
		app.couponSaleAmount = saleAmount;
		app.couponSalePercent = salePercent;
		app.couponId = couponId;
		app.flg = true;
	} 
</script>