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
/* 모달 스타일링 */
.modal {
	/* display: none; */
	position: fixed;
	top: 47%;
	left: 70%;
	transform: translate(-50%, -50%);
	background-color: #fefefe;
	padding: 25px;
	border: 1px solid #888;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	z-index: 1000;
}
body{
	margin:0px;
}
.modal-content {
	margin-bottom: 10px;
	width: 400px;
	height: 200px;
	border-radius: 10px;
}

.close {
	color: #aaa;
	float: right;
	margin-top: -5px;
	margin-left: 2px;
	font-size: 23px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 모달 추가 css */
.modal-backdrop {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
	z-index: 1000;
}

.modal-content {
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: white;
	padding: 20px;
	z-index: 1001;
	text-align: center;
}

.modalButton {
	border: none;
	background-color: white;
	font-size: 14px;
	color: rgb(161, 1, 161);
	font-weight: bold;
	margin-top: 10px;
	margin-left: auto;
	float: none;
	cursor: pointer;
	
}

.modalButton:hover {
	/* color: white; */
	color: #ff7f00;
	font-size: 14px;
	font-weight: bold;
}

.modalCancel {
	border: none;
	background-color:white;
	font-size: 14px;
	font-weight: bold;
	color: rgb(72, 72, 72);
	margin-top: 10px;
	cursor: pointer;
	margin-right: 40px;
}

.modalCancel:hover {
	color: rgb(72, 72, 72);
	font-weight: bold;
}

.modalInput {
	width: 300px;
	height: 40px;
	border: 1px solid #f9f9f9;
	background-color: #f9f9f9;
	border-radius: 4px;
	padding: 5px 15px;
}

input[type="text"] {
	border: none;
	margin-left: 10px;
}

input[type='text']:focus {
	outline: none;
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
			<div id="app">
				<div class="content" style="width : 900px;">
					<h2>
						<a href="javascript:;" style="font-size: 25px; color: #747171;">
							<span style="color: #ff7f00; font-weight: bold;">| </span>
							주문내역
						</a>
					</h2>
					<div>
						<table class="review">
						<tr>
							<th
								style="width: 30px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								NO</th>
							<th
								style="width: 30px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								주문번호</th>
							<th
								style="width: 110px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								주문한 가게</th>
							<th
								style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								메뉴</th>
							<th
								style="width: 180px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								가격</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								주문일</th>

						</tr>
						<tr v-for="(item, index) in orderList">
							<td style="font-size: 13px">{{ index + 1 }}</td>
							<td class="reviewFont">{{ item.orderNo }}</td>
							<td class="reviewFont">{{ item.bizName }}</td>
							<td class="reviewFont">{{ item.menu }}</td>
							<td class="reviewFont">{{ item.price }}</td>
							<td class="reviewFont">{{ item.orderDate }}</td>
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