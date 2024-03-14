<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>나의 쿠폰</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}

* {
	font-family: 'Noto Sans KR';
}

table {
	margin: 5px auto;
	border-left: none;
	border-right: none;
	width: 620px;
	border-top: 1px solid #c0c0c0;
	border-collapse: collapse;
	text-align: center;
}

th {
	font-size: 14px;
	background-color: #f9f9f9;
}

td {
	font-size: 13px;
}

th, td {
	border-right: none;
	border-bottom: 1px solid #e4e4e3;
	padding: 10px 5px;
	color: (72, 72, 72);
}

th:first-child, td:first-child {
	border-left: none;
}

#btnBox {

	width: 300px;
	height: 43px;
	margin: 20px auto;
	display: flex;
	justify-content: center;
	align-items: center;
}

#apply {
	margin-right: 10px;
}

#apply button {
	padding: 11px 30px;
}

#close button {
	padding: 11px 20px;
}

button {
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #fff;
	color: #ff7f00;
	border: 1px solid #ff7f00;
	transition: background-color 0.3s, color 0.3s, border 0.3s;
}

button:hover {
	/* border: 1px solid #e66800; */
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="app">
		<table border="1">
			<tr>
				<th width="5%"></th>
				<th width="10%">쿠폰번호</th>
				<th width="20%">쿠폰이름</th>
				<th width="25%">쿠폰내용</th>
				<th width="15%">쿠폰발행일</th>
				<th width="15%">쿠폰만료일</th>
			</tr>
			<tr v-for="item in couponList" @click="fnSelect(item.couponNo, item.title, item.saleMount, item.salePercent)">
				<td><input type="radio" v-model="selectCoupon" :value="item.couponNo" ></td>
				<td>{{item.couponId}}</td>
				<td>{{item.title}}</td>
				<td>{{item.contents}}</td>
				<td>{{item.beginDate}}</td>
				<td>{{item.endDate}}</td>
			</tr>
		</table>
		<div id="btnBox">
			<div id="apply">
				<button @click="fnApply">적용하기</button>
			</div>
			<div id="close">
				<button @click="fnClose">닫기</button>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			userId : "yeji",
			/* sessionId : "${userId}" */
			couponList : {},
			selectCoupon : "",
			selectTitle : "",
			saleMount : "",
			salePercent : "",
		},
		methods : {
			/* 쿠폰 리스트  */
			fnCouponList : function() {
				var self = this;
				var nparmap = {
					userId : self.userId
				};
				$.ajax({
					url : "couponList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data.coupon);
						self.couponList = data.coupon;
					}
				});
			},
			fnSelect : function(couponNo, title, saleMount, salePercent){
				var self = this
				self.selectCoupon = couponNo;
				self.selectTitle = title;
				self.saleMount = saleMount;
				self.salePercent = salePercent;
			},
			/* 적용하기  */
			fnApply : function(){
				var self = this;
	
				// 부모 창으로 데이터 전달
			    if (self.selectCoupon == "") {
			        alert("선택하세요");
			        return;
			    }
			    window.opener.onApplyCoupon(self.selectCoupon, self.selectTitle, self.saleMount, self.salePercent);
			    
			    // 팝업 창 닫기 (옵션)
			    window.close();
			},
			/* 닫기 */
			fnClose : function() {
				var self = this;
				window.close();
			}
		},
		created : function() {
			var self = this;
			self.fnCouponList();
		}
	});
</script>