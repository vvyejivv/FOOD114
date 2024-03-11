<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
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
	height: 370px;
	overflow: hidden;
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
	<!-- 	<div class="ad">
		광고창
		<button class="adClose">x</button>
	</div> -->


	<section>
		<div class="eventSlide" style="background: white; margin-top: 2px;">
			<!-- <h1>이벤트 슬라이드</h1> -->
			<img src="../img/event1.jpg" width="1200px" height="370px">
		</div>
		<div class="clickBoxList">
			<div class="clickBox">
				<div style="cursor: pointer">
					<div
						style="color: green; font-size: 40px; height: 100px; display: flex; align-items: center; gap: 10px;">
						지도로검색 <a
							style="background-color: green; color: white; display: inline-block; width: 30px; height: 30px; font-size: 20px; border-radius: 50%; text-align: center;">❯</a>
					</div>
					<div>내 주변 이벤트들을 한눈에</div>
				</div>
			</div>
			<div class="clickBox">
				<div style="cursor: pointer">
					<div
						style="color: orange; font-size: 32px; height: 100px; display: flex; align-items: center; gap: 10px;">
						배달시키기 <a
							style="background-color: orange; color: white; display: inline-block; width: 30px; height: 30px; font-size: 20px; border-radius: 50%; text-align: center;">❯</a>
					</div>
					<div>배달시키러가기</div>
				</div>
			</div>
			<div class="clickBox">
				<div style="cursor: pointer">
					<div
						style="color: #ff7f00; font-size: 32px; height: 100px; display: flex; align-items: center; gap: 10px;">
						우리동네이벤트 <a
							style="background-color: #ff7f00; color: white; display: inline-block; width: 30px; height: 30px; font-size: 20px; border-radius: 50%; text-align: center;">❯</a>
					</div>
					<div>매장 이벤트 전체 보기</div>
				</div>
			</div>
		</div>

	</section>

	<%@include file="main(footer).html"%>

</body>

</html>
<script>
	
</script>