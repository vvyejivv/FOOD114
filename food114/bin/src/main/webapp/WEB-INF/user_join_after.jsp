<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>

</head>

<body>
	<div id="Container">
		<%@include file="food114_header.jsp"%>



	<style>
.container {
	width: 660px;
	margin: 0px auto;
	margin-top: 0px;
	padding-top: 200px;
	font-size: 17px;
	padding-bottom: 50px;
	color: rgb(72, 72, 72);
	/* border: 1px solid black; */
}

.container input[type="radio"] {
	accent-color: #ca670359;
	border: 1px solid #e27100;
}

.title {
	color: #ff7f00;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	padding-bottom: 15px;
}

.container button {
	padding: 10px 20px;
	background-color: #ff7f00;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.container button:hover {
	background-color: #c06000;
}

th, td {
	border: 1px solid #ccc;
	padding: 20px 30px;
	color: rgb(72, 72, 72);
}

table {
	border-collapse: collapse;
	margin: 0px auto;
	border-radius: 5px;
}

th {
	background-color: #cccccc1c;
}

.star {
	color: #ff7f00;
}

select {
	width: 115px;
	padding: 10px;
	border-radius: 4px;
	border: 1px solid #ccc;
	color: rgb(72, 72, 72);
}
</style>

	<section>
		<div id="app">
			<div class="container">
				<div class="title">환영합니다</div>
				<div style="text-align: center; margin-top: 30px;">회원가입이 모두
					완료되었습니다.</div>
				<div style="text-align: center; margin-top: 5px;">로그인 후
					마이페이지에서 카드와 주소지를 등록하면 더욱 편리하게 서비스 이용이 가능합니다.</div>
				<div
					style="text-align: center; margin-top: 50px; margin-bottom: 100px;">
					<button style="width: 250px; height: 50px; font-size: 18px;"
						@click="fnLogin()">로그인하러가기</button>
				</div>
			</div>
		</div>
	</section>


		<%@include file="food114_footer.jsp"%>
	</div>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {},
		methods : {
			fnLogin : function() {
				location.href = "food114-login.do";
			}
		},
		created : function() {
			var self = this;

		}
	});
</script>