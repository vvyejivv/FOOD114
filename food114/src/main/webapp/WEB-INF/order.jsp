<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="js/jquery.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/order.css">
	<title>주문하기</title>
</head>
<style>
</style>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
    <section>
	<div id="app">
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
                    <input type="text" :value="userAddr.newAddr" disabled>
                    <!-- 상세주소 -->
                    <div><input type="text" :value="userAddr.detail" disabled></div>
                </div>
                <div class="infoBox" id="phone">
                    <div class="infoText">휴대전화번호</div>
                    <input type="text" name="phone1" v-model="phone1"> - <input type="text" name="phone2" v-model="phone2"> - <input type="text"
                        name="phone3" v-model="phone3">
                    <span id="securePhone">
                    	<label><input type="checkbox"> 안심번호 사용</label>
                    
                    </span>
                </div>
            </div>
            <div class="subTitle">
                <span>주문 요청사항</span>
            </div>
            <div class="deliveryBox">
                <div id="ecoYN">
                	<label><input type="checkbox" v-model="ecoYNChecked"> 일회용 수저, 포크 안 주셔도 됩니다.</label>
                
                </div>
                <textarea  v-model="orderRequest" @input="fnRequestLength" placeholder="ex) 견과류 빼주세요, 덜 맵게 해주세요."></textarea>
                <div id="requestSize">{{orderRequest.length}} / 60</div>

            </div>
            <div class="subTitle">
                <span>배달 요청사항</span>
            </div>
            <div class="deliveryBox">
                <textarea v-model="deliveryRequest" @input="fnRequestLength" placeholder="코로나 19 예방을 위해 비대면 배달을 권장 드립니다." ></textarea>
                <div id="requestSize">{{deliveryRequest.length}} / 60</div>

            </div>
            <div class="subTitle">
                <span>결제수단 선택</span>
            </div>
            <div class="deliveryBox">
                <div class="payMargin">
                    <div class="payBox">
                        <span class="payMainText">바로 결제</span>
                        <div id="payText">*등록된 결제 수단으로 결제됩니다.</div>
                        <div class="payDivContainer">
                            <div class="orderText" id="payPageLeft"> &lt; </div>
                            <div id="payDivBox" class="orderText">
                                <div>등록된 결제 수단</div>
                            </div>
                            <div class="orderText" id="payPageRight"> > </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="payMargin">
                    <div class="payBox">
                        <span class="payMainText">다른 결제 수단</span>
                        <div class="payDivContainer">
                            <div class="payDivBox" @click="fnPayment('card')">
                                <span>신용카드</span>
                            </div>
                            <div class="payDivBox" @click="fnPayment('phone')">
                                <span>휴대폰결제</span>
                            </div>
                            <div class="payDivBox" @click="fnPayment('kakao')">
                                <img src="../img/카카오페이.png" id="kakaoPay">
                                <span>카카오페이</span>
                            </div>
                            <div class="payDivBox" @click="fnPayment('toss')">
                                <img src="../img/토스.png" id="tossPay">
                                <span>토스결제</span>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <!-- 커밋테스트  -->
                <div class="payBox">
                    <span class="payMainText">현장 결제</span>
                    <div class="payDivContainer">
                        <div class="payDivBox" @click="fnMeetPayment('card')">신용카드</div>
                        <div class="payDivBox" @click="fnMeetPayment('cash')">현금</div>
                    </div>
                </div>
            </div>
            <div class="subTitle">
                <span>할인방법 선택</span>
            </div>
            <div class="deliveryBox">
                <div id="couponBox" class="payMainText">
                    <p>쿠폰</p>
                    <input type="text" placeholder="쿠폰 코드 입력">
                    <button>적용</button>
                </div>
                <div id="couponBox" class="payMainText">
                    <p>포인트 사용</p>
                    <input type="text" placeholder="포인트 입력">
                    <button>적용</button>
                    <button>전체 포인트</button>
                </div>
            </div>
        </div>
	</div>
    </section>
    <footer>
		<%@include file="main(footer).html"%>
	</footer>
</body>
</html>
<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    	userId : "yeji",
    	/* sessionId : "${userId}" */
    	userAddr : {},
    	phone1 : "",
    	phone2 : "",
    	phone3 : "",
    	ecoYNChecked : false, /* 일회용 수저,포크 체크여부 전달  */
    	orderRequest : "", /* 주문 요청사항  */
    	deliveryRequest : "", /* 배달 요청사항  */
    }   
    , methods: {
    	fnView : function(){    		
            var self = this;
            var nparmap = {
            	/* userId : self.sessionId */
            	userId : self.userId
            };
            $.ajax({
                url:"consumer-addr.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                	self.userAddr = data.customerAddr;
                	console.log(data.customerAddr);
                }
            }); 
        },
        /* 요청사항 60자 이하 제한  */
        fnRequestLength : function(){
        	var self = this;
        	if(self.orderRequest.length > 60){
        		self.orderRequest = self.orderRequest.slice(0,60);
        	}
        	if(self.deliveryRequest.length > 60){
        		self.deliveryRequest = self.deliveryRequest.slice(0,60);
        	}
        },
        /* 바로 결제  */
        fnPayment : function(type){
        	var self = this;
        	if(type == 'card'){
        		alert("신용카드결제~");
        	}else if(type == 'phone'){
        		alert("핸드폰 결제~");
        	}else if(type == 'kakao'){
        		alert("카카오페이 결제");
        	}else if(type == 'toss'){
        		alert("토스 결제");
        	}else{
        		alert("다시 시도하세요");
        	}
        },
        /* 만나서 결제  */
        fnMeetPayment : function(type){
        	var self = this;
        	if(type =='card'){
        		alert("카드 결제")
        	}else if(type == 'cash'){
        		alert("현금 결제")
        	}
        }
    }   
    , created: function () {
    	var self = this;    	
    	self.fnView();
	}
});
</script>