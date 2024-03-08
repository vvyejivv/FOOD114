<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/login.css">
<title>로그인</title>
</head>
<style>
section {
	position: relative;
	width: 100%;
	height: 815px;
}

#menu_list {
	position: absolute;
	top: 2px;
	left: 0;
	bottom: 0;
	width: 200px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
	font-size: 14px;
	border-right: 1px solid #ddd;
}
.selectList {
	margin: 20px;
	font-size: 18px;
}
.selectList img {
	width: 18px;
	height: 18px;
	margin-right: 10px;
}
.selectList a {
	float:right;
	text-decoration: none;
    color: #ff7f00;
}
</style>
<body>
	<%@include file="main(header).html"%>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<div id="app">
		<section>
			<div id="menu_list">
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">상품관리<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">주문/배송<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">정산<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">고객관리<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">마이샵<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">프로모션<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">광고 관리<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">판매 통계<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">판매자정보<a href="javascript:;">❯</a></div>
				<div class="selectList"><img src="../img/free-icon-restaurant-4551357.png">공지사항<a href="javascript:;">❯</a></div>
				<div style="margin:30px;">관련사이트</div>
				<div>쿠팡 마켓플레이스</div>
				<div>쿠팡 광고</div>
			</div>
		</section>
	</div>

	<%@include file="main(footer).html"%>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {

		},
		methods : {

		},
		created : function() {
			var self = this;

		}
	});
</script>