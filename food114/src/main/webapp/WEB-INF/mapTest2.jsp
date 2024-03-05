<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/map.css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>지도로 검색</title>
<style>
/* 공통 스타일 */
.map_wrap, .map_wrap * {
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap a, .map_wrap a:hover, .map_wrap a:active {
	color: #000;
	text-decoration: none;
}

.map_wrap {
	position: relative;
	width: 100%;
	height: 820px;
}

/* 메뉴 스타일 */
#menu_wrap {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 300px;
	padding: 20px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.9);
	z-index: 1;
	font-size: 14px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

#menu_wrap hr {
	border-top: 1px solid #ccc;
	margin: 20px 0;
}

#menu_wrap .option {
	text-align: center;
}

#menu_wrap .option p {
	margin: 10px 0;
}

#menu_wrap .option button {
	background-color: #eee; /* 변경된 버튼 색상 */
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px;
	margin-left: -10px;
}

#menu_wrap .option input {
	background-color: #eee; /* 변경된 버튼 색상 */
	color: black;
	border: none;
	border-radius: 5px;
	padding: 10px;
}

#menu_wrap .option input:focus {
	outline: none; /* 포커싱이 맞춰질 때 외곽선 제거 */
	border: none; /* 포커싱이 맞춰질 때 테두리 제거 */
}

/* 장소 리스트 스타일 */
#placesList {
	list-style: none;
	margin-top: 20px;
}

#placesList .item {
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
}

#placesList .item h5 {
	font-weight: bold;
	margin-bottom: 5px;
}

#placesList .item .info {
	color: #888;
}

#placesList .item .info p {
	margin: 3px 0;
}

#placesList .item .info .tel {
	color: #ff7f00; /* 변경된 전화번호 색상 */
}

/* 페이지네이션 스타일 */
#pagination {
	margin-top: 20px;
	text-align: center;
}

#pagination a {
	display: inline-block;
	margin: 0 5px;
	padding: 5px 10px;
	background-color: #ff7f00; /* 변경된 페이지네이션 색상 */
	color: #fff;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

#pagination a:hover {
	background-color: #e66900; /* hover 시 색상 변경 */
}

#pagination .on {
	background-color: #0056b3;
}

.search-bar {
	position: relative;
	margin-top: 20px;
}

button img {
	width: 13px;
	height: 13px;
}
</style>
</head>
<body>
	<div id="app">
		<header>
- 			<%@include file="main(header).html" %> 
		</header>
		<!-- 광고창 -->
		<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->

		<section>
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<div id="menuBar" class="menuBar"
								style="display: flex; justify-content: space-between; align-items: center; padding: 10px; border-radius: 5px; background-color: #ff7f00;">
								<div>
									<a class="searchMenu"
										style="font-size: 16px; color: #fff; padding: 10px 20px; border-radius: 5px;">지역검색</a>
								</div>
								<div>
									<a class="menu"
										style="font-size: 16px; color: #fff; padding: 10px 20px; border-radius: 5px;">가게명</a>
								</div>
							</div>
							<div class="search-bar">
								<input type="text" id="keyword" size="30"
									placeholder="가게명을 입력해주세요">
								<button>
									<img src="../img/magnifying-glass-solid.png">
								</button>
							</div>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>

			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places();
			</script>
		</section>

		<footer>
			<%@include file="main(footer).html" %>
		</footer>
	</div>
</body>
</html>