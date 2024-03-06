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
	width: 400px;
	padding: 20px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
	font-size: 14px;
	border-radius: 5px;
	/* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
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

#menu_wrap .option select {
	background-color: #fff; /* 변경된 버튼 색상 */
	color: #000;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	width: 150px;
	padding: 10px;
	margin-right: 10px;
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

/* 페이지네이션 스타일 */
.search-bar {
	position: relative;
	margin-top: 20px;
}

button img {
	width: 13px;
	height: 13px;
}

section {
	margin-top: 1px;
}

#menu1, #menu2 {
	font-size: 16px;
	color: #000;
	padding: 10px 20px;
	width: 50%;
	box-sizing: border-box;
	float: left;
	height: 50px;
	margin: 0px;
}

.option {
	padding-bottom: 20px;
}

.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

ul, ol {
	list-style-type: none;
}

.restList {
	padding-top: 10px;
	border-top: 1px solid rgb(200, 200, 200);
	background-color: #fff;
	height: 105px;
	width: 100%; /* restList의 너비를 화면 전체 너비로 설정 */
	overflow-x: hidden; /* 가로 스크롤 숨김 */
	overflow-y: auto; /* 세로 스크롤 자동으로 생성 */
}

.restImg {
	width: 80px;
	height: 80px;
	float: left;
	margin: 10px;
	border: 1px solid black;
}
/* 장소 리스트 스타일 */
#placesList1 {
	margin-right: 10px;
}
</style>
</head>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>

	<div id="app">
		<section>
			<div class="map_wrap">
				<div id="map"
					style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>

				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<div id="menuBar" class="menuBar"
								style="padding: 10px; border-radius: 5px; background-color: white; overflow: hidden; padding: 0px; width: 400px; display: block">
								<div>
									<a href="javascript:;" id="menu1" @click="fnSearchType1()"
										:style="{'background-color' : searchFlg1 ? '#bbb' : '#eee'}">지역검색</a>
								</div>
								<div>
									<a href="javascript:;" id="menu2" @click="fnSearchType2()"
										:style="{'background-color' : searchFlg2 ? '#bbb' : '#eee'}">가게명</a>
								</div>
							</div>
							<div v-if="searchFlg2" class="search-bar">
								<input type="text" id="keyword" size="30"
									placeholder="가게명을 입력해주세요">
								<button>
									<img src="../img/magnifying-glass-solid.png">
								</button>
							</div>
							<div v-if="searchFlg1" class="search-bar">
								<select
									style="padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
									<option>선택</option>
									<option>선택</option>
								</select> <select
									style="padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
									<option>선택</option>
									<option>선택</option>
								</select>
								<button style="background-color: white; margin: 0;">
									<img src="../img/magnifying-glass-solid.png">
								</button>
							</div>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
					<div class="restList">
						<img src="" alt="Hi" class="restImg">
						<h3 style="font-size: 1.5em; margin-top: 8px;">List 1</h3>
						<div id="placesList1">
							<span style="color: #ff7f00;">★ 점수</span>
							| 리뷰개수
							<p style="margin-left: 60px;">이벤트정보이벤트이벤트이벤트이벤트이벤트이벤트이벤트이이벤트이벤트이벤트이벤트이벤트이벤</p>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<footer>
		<%@include file="main(footer).html"%>
	</footer>

	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
	<script>
	// 현재 위치를 얻는 함수
    function getCurrentLocation() {
        return new Promise((resolve, reject) => {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(
                    position => {
                        resolve(position.coords);
                    },
                    error => {
                        reject(error);
                    }
                );
            } else {
                reject(new Error('Geolocation is not supported by this browser.'));
            }
        });
    }

    // 현재 위치를 얻어서 mapOptions를 업데이트하는 함수
    async function updateMapOptionsWithCurrentLocation() {
        try {
            const coords = await getCurrentLocation();
            const mapOptions = {
                center: new kakao.maps.LatLng(coords.latitude, coords.longitude),
                level: 5
            };
            return mapOptions;
        } catch (error) {
            console.error('Error getting current location:', error.message);
            // 기본 위치 (서울)를 반환할 수 있도록 기본적인 오류 처리를 수행할 수 있습니다.
            return {
                center: new kakao.maps.LatLng(37.566826, 126.9786567),
                level: 5
            };
        }
    }
    
    // 반경 계산
    function calculateDistance(lat1, lon1, lat2, lon2) {
        var R = 6371; // 지구의 반지름 (단위: km)
        var dLat = (lat2 - lat1) * (Math.PI / 180);
        var dLon = (lon2 - lon1) * (Math.PI / 180);
        var a =
            Math.sin(dLat / 2) * Math.sin(dLat / 2) +
            Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *
            Math.sin(dLon / 2) * Math.sin(dLon / 2);
        var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        var distance = R * c; // 두 지점 사이의 거리 (단위: km)
        return distance * 1000; // 거리를 미터로 변환하여 반환
    }
		var app = new Vue({
			el: '#app',
			data: {
				searchFlg1: true,
				searchFlg2: false,
				restList: [],
				markers: [],
				map: null
			},
			methods: {
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
							self.addMarkers();
						}
					});
				},
				fnSearchType1: function () {
					var self = this;
					self.searchFlg1 = true;
					self.searchFlg2 = false;
					document.getElementById("menu1").style.backgroundColor = "#bbb";
					document.getElementById("menu2").style.backgroundColor = "#eee";
				},
				fnSearchType2: function () {
					var self = this;
					self.searchFlg1 = false;
					self.searchFlg2 = true;
					document.getElementById("menu1").style.backgroundColor = "#eee";
					document.getElementById("menu2").style.backgroundColor = "#bbb";
				},
				addMarkers: function () {
	                var self = this;
	                // 기존 마커 제거
	                /* self.markers.forEach(function(marker) {
	                    marker.setMap(null);
	                }); 
	                self.markers = [];
	                */
	                
	                var markerImage = new kakao.maps.MarkerImage('../img/free-icon-restaurant-4551357.png',
	                        new kakao.maps.Size(30, 30), // 이미지 크기
	                        { offset: new kakao.maps.Point(15, 30) } // 이미지 위치 설정 (가운데 아래로 지정)
	                    );
	                
	             	// 현재 위치를 기준으로 반경을 설정합니다. 예를 들어 반경을 1km로 설정합니다.
	                const radius = 2000; // meter
	                
	                getCurrentLocation().then(function(currentLocation) {
		                self.restList.forEach(function (place) {
		                    
		                 	// 현재 위치와 각 장소의 위치 사이의 거리를 계산합니다.
		                    var distance = calculateDistance(currentLocation.latitude, currentLocation.longitude, place.latitude, place.longitude);
		                    
		                 	// 반경 내에 있는지 확인 후 마커 생성.
		                    if (distance <= radius) {
		                    	var markerPosition = new kakao.maps.LatLng(place.latitude, place.longitude); // 위도와 경도 정보 활용
		                        var marker = new kakao.maps.Marker({
		                            position: markerPosition,
		                            image: markerImage
		                        });
		                    
		                    // 오버레이 내용 설정
		                    var overlayContent = '<div class="customoverlay">' +
	    								'  <a href="https://map.kakao.com/link/map/11394059" target="_blank">' +
	    								'    <span class="title">'+place.bizName+'</span>' +
	    								'  </a>' +
	   									'</div>';
		                    var overlay = new kakao.maps.CustomOverlay({
		                        content: overlayContent, // 오버레이에 표시할 내용
		                        map: self.map, // 오버레이를 표시할 지도
		                        position: markerPosition, // 오버레이를 표시할 위치
		                        yAnchor: 0.00001 // 오버레이를 마커 아래에 표시하도록 설정
		                    });
		                    var isOverlayVisible = false;
		                    kakao.maps.event.addListener(marker, 'click', function() {
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
		                    self.markers.push(marker);
		                }
		            })
		                console.log(self.markers);
	             })
			  }
			},
			mounted() {
				 updateMapOptionsWithCurrentLocation().then(mapOptions => {
				        this.map = new kakao.maps.Map(this.$el.querySelector('#map'), mapOptions);
				        this.fnRestList();
				    }).catch(error => {
				        console.error('Failed to initialize map:', error.message);
				    });
			},
			created : function() {
				var self = this;
			}
		});
	</script>
</body>
</html>
