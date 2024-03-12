<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>메뉴 페이지</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}

* {
	font-family: 'Noto Sans KR';
}

#menuListContainer {
	width: 500px;
	border: 1px solid #ccc;
	border-radius: 5px;
	margin: 0px auto;
}

#menuListHeader {
	width: 500px;
	height: 30px;
	border-bottom: 1px solid #ccc;
	font-size: 15px;
	text-align: center;
	margin: 0px auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

#menuListImg {
	width: 500px;
	height: 250px;
	display: flex;
	justify-content: center;
	align-items: center;
}

#menuListImg img {
	width: 300px;
	height: 250px;
}

#menuListInfoBox {
	width: 500px;
	height: 80px;
	border-bottom: 1px solid #ccc;
}
/* font  */
#menuNameBox {
	font-size: 18px;
	text-align: center;
	font-weight: bold;
	margin-top: 10px;
	color: rgb(72, 72, 72);
}

#menuInfoBox {
	font-size: 15px;
	text-align: center;
	margin-top: 5px;
	color: #999;
}

#menuListQuantity {
	width: 500px;
	height: 60px;
	border-bottom: 1px solid #ccc;
}
#quantityDown{
	float: left;
	margin-right : 10px;
	margin-top: 15px;
	margin-left : 85px;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	color: rgb(72, 72, 72);
	cursor: pointer;
}
#quantityUp{
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	color: rgb(72, 72, 72);
	float: right;
	margin-right: 10px;
	margin-top: 15px;
	cursor: pointer;
	
}
#quantityInput{
	width: 20px;
    padding: 5px;
    border: 1px solid #ccc;
    margin-top: 15px;
}
#quantityInput:focus {
    outline:  #ff7f00 solid thin;
    border: none;
}
#menuListPrice {
	width: 500px;
	height: 60px;
	border-bottom: 1px solid #ccc;
}
.menuPriceBox{
	font-weight: bold;
	color : rgb(72, 72, 72);
	font-size : 18px;
	float:left;
	width: 300px;
	margin-top: 15px;
	margin-left: 15px;
}
.menuPriceTxt{
	font-weight: bold;
	color : rgb(72, 72, 72);
	font-size : 17px;
	float: right;
	margin-top: 15px;
	margin-right : 5px;
}
#menuListTotalPrice {
	width: 500px;
	height: 60px;
}

#menuListBtnBox {
	width: 500px;
	margin: 0px auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

#menuListAddBtn {
	padding: 21px 15px;
	background-color: rgb(72, 72, 72);
	color: #fff;
	border: none;
	font-weight: bold;
	width: 350px;
}

#menuListOrderBtn {
	padding: 21px 15px;
	background-color: #ff7f00;
	color: #fff;
	border: none;
	font-weight: bold;
	width: 250px;
}
</style>
</head>
<body>
	<div id="app">
		<div id="menuListContainer">
			<div id="menuListHeader">메뉴 상세</div>
			<div id="menuListImg">
				<img src="../img/메가커피_아아.jpg">
			</div>
			<div id="menuListInfoBox">
				<div id="menuNameBox">아메리카노</div>
				<div id="menuInfoBox">메가커피의 아메리카노 입니다.</div>
			</div>
			<div id="menuListPrice">
				<div class="menuPriceBox">가격</div>
				<div class="menuPriceTxt">10000000000원</div>
			</div>
			<div id="menuListQuantity">
				<div class="menuPriceBox">수량</div>
				<a id="quantityDown">─</a><input id="quantityInput"type="text"><a id="quantityUp">┼</a>
			</div>
			<div id="menuListTotalPrice">
				<div class="menuPriceBox">총 주문금액</div>
				<div class="menuPriceTxt">10000원</div>
			</div>
			<div id="menuListBtnBox">
				<button id="menuListAddBtn">주문표에 추가</button>
				<button id="menuListOrderBtn">주문하기</button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "test.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>