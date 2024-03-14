<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}

* {
	font-family: 'Noto Sans KR';
}

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
</style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(main).css">
<body>

	<header>
		<%@include file="main(header).html"%>
	</header>

	<!-- 광고창 -->
	<!--
        <div class="ad">
            광고창
            <button class="adClose">x</button>
        </div>
    -->
	<section>
		<div class="container">
			<%@include file="myPage_header.jsp"%>
			<div class="orderListContainer">
				<div id="app">
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
									상태</th>
							</tr>
							<tr v-for="(item, index) in orderList">
								<td style="font-size: 13px">{{ index + 1 }}</td>
								<td class="reviewFont">{{ item.orderNo }}</td>
								<td class="reviewFont">{{ item.bizName }}</td>
								<td class="reviewFont">{{ item.menus }}</td>
								<td class="reviewFont">{{ item.price }}</td>
								<td class="reviewFont">{{ item.orderDate }}</td>
								<td class="reviewFont">{{ item.status }}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>

	<%@include file="main(footer).html"%>
</body>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			orderList : [],
			sessionId : "${sessionId}",
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
				};
				$.ajax({
					url : "myOrderList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.orderList = data.orderList;
						console.log(data.orderList);
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>
</html>