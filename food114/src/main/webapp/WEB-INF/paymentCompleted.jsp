<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<title>결제완료</title>
</head>
<style>
</style>
<body style="margin: 0px;">
	<header>
		<%@include file="food114_header.jsp"%>
	</header>
	<div id="app" style="width: 1920px; margin: 0px auto;">
		<div
			style="width: 1420px; height: 650px; border: 1px solid #EDEDED; margin: 40px auto; border-radius: 5px;">
			<div style="width: 1420px;">
				<div
					style="width: fit-content; margin: 20px auto; padding: 10px 40px; font-size: 20px;">
					주문이 성공적으로 완료되었습니다.</div>
				<div
					style="width: fit-content; margin: 0px auto; padding: 10px 10px; font-size: 16px;">
					주문번호 : {{orderList.orderNo}}</div>
				<div
					style="display: flex; justify-content: center; gap: 10px; margin-top: 20px;">
					<div
						style="width: fit-content; padding: 10px 60px; border-radius: 8px; background-color: #FF8002; color: #FFFFFF; cursor: pointer;"
						@click="fnPageChang('home')">HOME</div>
					<div
						style="width: fit-content; padding: 10px 55px; border-radius: 8px; border: 1px solid #EDEDED; color: #5F5F5F; background-color: #FFFFFF; cursor: pointer;"
						@click="fnPageChang('myPage')">마이페이지</div>
				</div>
			</div>
			<div style="width: 1420px; height: 400px;">
				<div
					style="width: fit-content; height: 10px; margin: 40px auto; font-size: 16px;">주문내역</div>
				<div>
					<table class="orderListTable"
						style="margin: 0px auto; border-top: 1px solid #c0c0c0;">
						<tr>
							<th
								style="width: 130px; border-top: 2px solid #5F5F5F; border-bottom: 1px solid #979797; color: #5F5F5F;">
								주문번호</th>
							<th
								style="width: 200px; border-top: 2px solid #5F5F5F; border-bottom: 1px solid #979797; color: #5F5F5F;">
								주문한 가게</th>
							<th
								style="width: 350px; border-top: 2px solid #5F5F5F; border-bottom: 1px solid #979797; color: #5F5F5F;">
								메뉴</th>
							<th
								style="width: 130px; border-top: 2px solid #5F5F5F; border-bottom: 1px solid #979797; color: #5F5F5F;">
								가격</th>
							<th
								style="width: 200px; border-top: 2px solid #5F5F5F; border-bottom: 1px solid #979797; color: #5F5F5F;">
								주문일</th>

						</tr>
						<tr style="height: 120px; text-align: center;">
							<td>{{orderList.orderNo}}</td>
							<td>{{orderList.bizName}}</td>
							<td>{{orderList.menus}}</td>
							<td>{{orderList.price}}원</td>
							<td>{{orderList.orderDate}}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%@include file="food114_footer.jsp"%>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionId}",
			orderNo : "${map.orderNo}",
			orderList : {}
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
					orderNo : self.orderNo,
				};

				console.log(self.orderNo);
				console.log(self.sessionId);
				$.ajax({
					url : "paymentCompleted.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.orderList = data.order;
						console.log(data.order);
					}
				});
			},
			fnPageChang : function(type) {
				var self = this;
				if(type == "home"){
					$.pageChange("/food114.do", {});
				}else if(type == "myPage"){
					$.pageChange("/food114-myPage.do", {});
				}
			}

		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>