<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>Hello World!</title>
</head>
<style>
    body {
        font-family: Arial, sans-serif;
    }

    .popup {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        z-index: 9999;
        text-align: center;
    }

    .pwrap {
        max-width: 400px;
        margin: 0 auto;
    }

    .closebtn {
        position: absolute;
        top: 10px;
        right: 10px;
        cursor: pointer;
        font-size: 20px;
        color: #888;
    }

    .closebtn:hover {
        color: #333;
    }

    table {
        margin: 20px auto;
    }

    table td {
        padding: 10px;
    }

    select {
        padding: 5px;
        font-size: 16px;
        border-radius: 5px;
    }

    .amount {
        margin-top: 20px;
    }

    button {
        padding: 10px 20px;
        font-size: 16px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    button:hover {
        background-color: #0056b3;
    }
</style>
<body>
		<div class="popup">
			<!-- 팝업처럼 하기 위한 배경 -->
			<div class="pwrap">
				<!-- 실제 팝업창 -->
				<a class="closebtn">X</a>
				<!-- 비밀번호 변경창 닫기 버튼 -->
				<div>
					<h1>결제하기</h1>
					<span>(1개월 결제 금액은 100원 입니다.)</span>
				</div>
				<table>
					<tr>
						<td><a href="#" onclick="kakaopay()"><img
								src="../img/kakao.png"></a></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
						<td></td>
					</tr>
				</table>
				<div>
					<h3 class="amount">결제 금액 : 100원</h3>
					<p>개월 수를 선택 해 주세요</p>
					<select onchange="monthSelect(this)">
						<option value="0">선택하기</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
				</div>
			</div>
			<button onclick="requestPay()">카드결제</button>
			<button onclick="requestPay2()">카카오페이</button>
			<button onclick="requestPay3()">토스페이</button>
		</div>
	<script src="/resources/js/common/pay_modal.js"></script>
	<script src="/resources/js/api/kakao_payment.js"></script>
</body>
</html>
<script type="text/javascript">
	var IMP = window.IMP; // 생략가능
	function requestPay() {
		  IMP.init('imp67187845'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    pg: "kcp.AO09C",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : '결제테스트',
		    amount : 100,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		  }, function (rsp) { // callback
		      if (rsp.success) {
		        alert("Success!");
		      } else {
		      	alert("Fail.");
		      }
		  });
		}
	function requestPay2() {
		  IMP.init('imp67187845'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    pg: "kakaopay.TC0ONETIME",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : '결제테스트',
		    amount : 100,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		  }, function (rsp) { // callback
		      if (rsp.success) {
		        alert("Success!");
		      } else {
		      	alert("Fail.");
		      }
		  });
		}
	function requestPay3() {
		  IMP.init('imp67187845'); //iamport 대신 자신의 "가맹점 식별코드"를 사용
		  IMP.request_pay({
		    pg: "tosspay.tosstest",
		    pay_method: "card",
		    merchant_uid : 'merchant_'+new Date().getTime(),
		    name : '결제테스트',
		    amount : 100,
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456'
		  }, function (rsp) { // callback
		      if (rsp.success) {
		        alert("Success!");
		      } else {
		      	alert("Fail.");
		      }
		  });
		}
</script>