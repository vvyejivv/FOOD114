<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>

</head>
<style>
.clickBoxList {
	width: 1000px;
	margin: 0px auto;
	/* border: 1px solid black; */
	height: 300px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.clickBox {
	width: 250px;
	height: 250px;
	float: left;
	margin: 10px;
	box-sizing: border-box;
	padding-top: 20px;
}

.eventSlide {
	margin: 20px auto;
	width: 100%;
	background-color: aliceblue;
	box-sizing: border-box;
	text-align: center;
	margin-bottom: 0px;
	margin-top: 0px;
}
</style>
<body>

	<%@include file="main(header).html"%>

	<!-- 주문하기(영수증창) -->
	<!-- <div class="receipt" style="border-radius: 10px;">
        영수증
        <div class="goOrder">
            주문하기</div>
    </div> -->


	<!-- 광고창 -->
	<div class="ad">
		광고창
		<button class="adClose">x</button>
	</div>


	<section>
		<div class="eventSlide">
			<!-- <h1>이벤트 슬라이드</h1> -->
			<img src="../boardFile/event1.png" width="100%" height="370px">
		</div>
		<div class="clickBoxList">
			<div class="clickBox">
				<div style="border: 1px solid black; width: 50px; height: 50px;">img</div>
				<div
					style="color: green; font-size: 40px; padding: 10px 0px; padding-bottom: 20px; height: 100px; display: flex; align-items: center; gap:10px;">
					지도로검색

					<a style="background-color: green; color: white; display: inline-block; width: 30px; height: 30px; font-size: 20px; border-radius: 50%; text-align: center;">❯</a>


				</div>
				<div>지도로검색하세요</div>
			</div>
			<div class="clickBox">
				<div style="border: 1px solid black; width: 50px; height: 50px;">img</div>
				<h1>오늘뭐먹지</h1>
				<div>뭐먹어오늘</div>
			</div>
			<div class="clickBox">
				<div style="border: 1px solid black; width: 50px; height: 50px;">img</div>
				<h1>우리동네이벤트</h1>
				<div>이벤트확인하셈</div>
			</div>
		</div>

	</section>

	<footer>
		<%@include file="main(footer).html"%>
	</footer>
</body>

</html>
<script>
	
</script>