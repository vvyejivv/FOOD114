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
.container {
	width: 1150px;
	margin: 0 auto;
	padding: 10px;
	margin-top: 50px;
	display: flex;
	justify-content: space-between;
}

.buttonRemove {
	/* padding: 0px 20px;  */
	width: 90px;
	height: 40px;
	border: 1px solid #ccc;
	background-color: #f9f9f9;
	border-radius: 3px;
	font-size: 14px;
	line-height: 30px;
	color: rgb(72, 72, 72);
	margin: 5px;
	margin-top: 10px;
	float: right;
	cursor: pointer;
}

.buttonRemove:hover {
	border: 1px solid #ccc;
	background-color: #ccc;
	color: white;
}

.sidebar {
	margin: 10px;
	width: 200px;
	/* height: 800px; */
	background-color: none;
	padding: 10px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
}

.sidebar ul li {
	margin-bottom: 5px;
}

.sidebar ul li a {
	display: block;
	padding: 5px 10px;
	text-decoration: none;
	color: #333;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.sidebar ul li a:hover {
	font-size: 15.5px;
	color: #646464;
	font-weight: bold;
}

.sidebar ul li ul {
	margin-left: 15px;
}

a {
	font-size: 15px;
	text-decoration: none;
	color: #333;
}

.content {
	margin: 10px;
	margin-left: 20px;
	/* padding: 5px;
	padding-left: 30px; */
	width: 1000px;
	height: 800px;
	/* border: 1px solid black; */
}

.span {
	color: #b1b0b0;
	border: 1px solid #d1d0d0;
	border-radius: 4px;
	padding: 6px;
	font-size: 13px;
}

.span:hover {
	border: 1px solid #ccc;
	background-color: #ccc;
	color: white;
}

.table {
	display: left;
}

.row {
	display: flex;
	border-top: 1px solid #ccc;
	height: 60px;
}

.cell1 {
	display: flex;
	background-color: #f3f2f2b7;
	width: 150px;
	border: none;
	text-align: center;
	padding: 5px;
	color: #222222;
	background-color: #f3f2f2b7;
	justify-content: center;
	align-items: center;
}

.cell2 {
	margin-left: 10px;
	line-height: 40px;
	font-size: 14px;
	color: #5f5f5f;
	width: 720px;
	border: none;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.buttonSubmit{
	border:1px solid #ededed;
	background-color: white;
	border-radius: 8px;
	font-size: 14px;
	line-height: 30px;
	color: #5f5f5f;
	margin: 5px;
	float: right;
	cursor: pointer;
	padding: 5px 10px;
	width: 100px;
}

input[type="text"] {
	border: none;
	margin-left: 10px;
}

input[type="text"]:focus {
	outline: none;
}

input[type="password"] {
	border: none;
	border-bottom: 1px solid #ccc;
	margin-left: 10px;
}

input[type="password"]:focus {
	outline: none;
}

input[type="email"] {
	border: none;
	border-bottom: 1px solid #ccc;
	margin-left: 10px;
}

input[type="email"]:focus {
	outline: none;
}
</style>
</head>

<body>

	<section>
		<div id="myPageHeader">
			<div class="sidebar" id="sidebar">
				<ul>
					<li>나의정보<span style="color: #b1b0b0;">───────────</span>
						<ul>
							<li><a href="javascript:;" @click="fnMyInfo">MY정보 확인/변경</a></li>
							<li><a href="javascript:;" @click="fnMyInfoPwd">비밀번호 변경</a></li>
							<li><a href="javascript:;" @click="myInfoAddr">MY주소지 관리</a></li>
							<li><a href="javascript:;" @click="fnMyInfoGrade">등급</a></li>
						</ul>
					</li>
					<br>
					<li>결제/주문/리뷰<span style="color: #b1b0b0;">───────────</span>
						<ul>
							<li><a href="myInfoPayment.do">결제수단 관리</a></li>
							<li><a href="javascript:;" @click="fnMyOrderList">주문내역</a></li>
							<li><a href="myInfoReview.do">MY리뷰목록</a></li>
						</ul>
					</li>
					<br>
					<li>이벤트<span style="color: #b1b0b0;">───────────</span>
						<ul>
							<li><a href="myInfoCoupon.do">쿠폰</a></li>
							<li><a href="myInfoPoint.do">포인트</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</section>

</body>

<script type="text/javascript">
	var myPageHeader = new Vue({
		el : '#myPageHeader',
		data : {},
		methods : {
			fnMyInfo : function() {
				location.href = "/myInfo.do";
			},
			fnMyInfoPwd : function() {
				location.href = "/myInfoPwd.do";
			},
			myInfoAddr : function() {
				location.href = "/myInfoAddr.do";
			},
			fnMyInfoGrade : function() {
				location.href = "/myInfoGrade.do";
			},
			fnMyOrderList : function() {
				location.href = "/myOrderList.do";
			}
		},
		created : function() {
			var self = this;
		}
	});
</script>
</html>