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
	width: 420px;
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

button {
	padding: 11px 45px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	background-color: #f9f9f9;
	color: #727272;
	border: 1px solid #ccc;
}

button:hover {
	background-color: #ccc;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="app">
		<table border="1">
			<tr>
				<th></th>
				<th>쿠폰번호</th>
				<th>사용여부</th>
				<th>쿠폰발행일</th>
				<th>쿠폰만료일</th>
			</tr>
			<tr v-for="item in couponList">
					<td><input type="checkbox"></td>
					<td>{{item.couponId}}</td>
					<td>{{item.useYN}}</td>
					<td>{{item.beginDate}}</td>
					<td>{{item.endDate}}</td>
			</tr>
		</table>
		<div id="btnBox">
<!-- 			<button>적용하기</button> -->
			<button @click="fnClose">닫기</button>
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
			couponList : {}
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
			fnClose : function(){
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