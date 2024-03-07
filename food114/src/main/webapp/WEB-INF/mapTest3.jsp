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
</style>
</head>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>

	<div id="app">
		<section>
			<div id="map"></div>
		</section>
	</div>

	<footer>
		<%@include file="main(footer).html"%>
	</footer>
	<script>
		// 식당 위치를 얻어서 mapOptions를 업데이트하는 함수
		async
		function updateMapOptionsWithCurrentLocation(markerPosition) {
			const mapOptions = {
				center : markerPosition,
				level : 5
			};
			return mapOptions;
		}

		var app = new Vue(
				{
					el : '#app',
					data : {
						restList : [],
						map : null
					// 지도 객체 초기화
					},
					methods : {
						// db 함수 호출
						fnRestList : function() {
							var self = this;
							var nparmap = {};
							$.ajax({
								url : "bizList.dox",
								dataType : "json",
								type : "POST",
								data : nparmap,
								success : function(data) {
									self.restList = data.list;
									console.log(self.restList);
									self.addMarkerForFirstRestaurant();
								}
							});
						},

						// 첫 번째 식당 위치에 마커를 추가하는 함수
						addMarkerForFirstRestaurant : function() {
							var self = this;

							var markerImage = new kakao.maps.MarkerImage(
									'../img/free-icon-restaurant-4551357.png',
									new kakao.maps.Size(30, 30), // 이미지 크기
									{
										offset : new kakao.maps.Point(15, 30)
									} // 이미지 위치 설정 (가운데 아래로 지정)
							);

							var place = self.restList[0]; // 첫 번째 식당만 가져옴

							var markerPosition = new kakao.maps.LatLng(
									place.latitude, place.longitude);

							// 오버레이 내용 설정
							var overlayContent = '<div class="customoverlay">'
									+ '  <a href="https://map.kakao.com/link/map/11394059" target="_blank">'
									+ '    <span class="title">'
									+ place.bizName + '</span>' + '  </a>'
									+ '</div>';
							var overlay = new kakao.maps.CustomOverlay({
								content : overlayContent, // 오버레이에 표시할 내용
								map : self.map, // 오버레이를 표시할 지도
								position : markerPosition, // 오버레이를 표시할 위치
								yAnchor : 0.00001
							// 오버레이를 마커 아래에 표시하도록 설정
							});
							var isOverlayVisible = false;

							var marker = new kakao.maps.Marker({
								position : markerPosition,
								image : markerImage
							});

							kakao.maps.event.addListener(marker, 'click',
									function() {
										if (!isOverlayVisible) {
											overlay.setMap(self.map); // 오버레이를 지도에 표시
											isOverlayVisible = true; // 오버레이가 보이는 상태로 설정
										} else {
											overlay.setMap(null); // 오버레이를 지도에서 숨김
											isOverlayVisible = false; // 오버레이가 숨겨진 상태로 설정
										}
									});

							overlay.setMap(null);
							marker.setMap(self.map); // 마커를 지도에 표시
						},
					},
					created : function() {
						var self = this;
						// 생성 시점에만 데이터를 가져오도록 변경
						this.fnRestList();
					}
				});
	</script>
</body>
</html>
