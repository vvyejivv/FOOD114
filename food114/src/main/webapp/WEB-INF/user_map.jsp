<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/map.css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>지도로 검색</title>
<style>
[v-cloak] { display: none; }

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
	width: 1470px;
	height: 890px;
	padding-left: 432px;
	margin: 0px auto;
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
	border-right: 1px solid #ddd;
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
	background-color: #fff; /* 변경된 버튼 색상 */
	color: #fff;
	border: 1px solid #ccc;
	border-left: none;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	cursor: pointer;
	padding: 8px 10px 10px 10px;
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
	background-color: #fff; /* 변경된 버튼 색상 */
	color: black;
	border: 1px solid #ccc;
	border-right: none;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	padding: 10px;
}

#menu_wrap .option input:focus {
	outline: none; /* 포커싱이 맞춰질 때 외곽선 제거 */
	border: 1px solid #ccc;
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
	color: #222222;
	padding: 10px 20px;
	width: 50%;
	box-sizing: border-box;
	float: left;
	height: 50px;
	margin: 0px;
	font-size : 14px;
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
	cursor: pointer;
}

.restImg {
	width: 80px;
	height: 80px;
	float: left;
	margin: 10px;
	object-fit: contain;
}
/* 장소 리스트 스타일 */
#placesList1 {
	margin-right: 10px;
}

.select_button {
	padding: 10px;
	background-color: #ff8002;
	border: none;
	cursor: pointer;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	line-height:30px;
}

.none_select_button {
	margin-top: 10px;
	padding: 10px;
	background-color: #fff;
	border: 1px solid #ff7f00;
	cursor: pointer;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	line-height:30px;
}

#menu_view {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	width: 440px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 1);
	z-index: 1;
	border-right: 1px solid #ddd;
	/* box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); */
}

.backBtn {
	position : absolute;
	left: 15px;
	top: 10px;
	font-size:1.5em;
}

.restViewImg {
	width: 100%;
	height: 200px;
	object-fit: contain;
}

.solidImg {
	width:18px;
	height:15px;
	object-fit: contain;
	margin-right:5px;
}

.detailView {
	margin-bottom: 30px;
}

.plusBtn {
	width:100px;
	height:30px;
	background-color:#f7f7f9;
	border-radius:10px;
	border:none;
	color:#777;
}

.sampleImg {
	width: 200px;
	height: 200px;
	margin-left:5px;
	margin-top:10px;
	object-fit: contain;
}
</style>
<link rel="stylesheet" href="../css/food114.css">
</head>
<body>
	<div id="Container">
	<%@include file="food114_header.jsp"%>

	<div id="app" v-cloak>
		<section>
			<div class="map_wrap">
				<div id="map"
					style="height: 100%; position: relative; overflow: hidden;"></div>
				<div id="menu_view" class="bg_white">
					<img :src="restView.path" class="restViewImg">
					<a href="javascript:;" @click="fnRestClose()" class="backBtn">❮</a>
					<div style="margin:20px;">
						<h1 style="font-size: 1.5em;">{{restView.bizName}}<span style="color:#ccc; margin-top:5px;"> {{restView.categoryName}}</span></h1>
						<div style="margin-top:10px;"><a href="javascript:;" @click="fnShopInfoReview(restView.bizId)">리뷰 {{restView.reviewCnt}}</a></div>
					</div>
						<div style="border-top:1px solid #eee; width:414px; margin:20px 0px 20px 10px;"></div>
					<div style="margin:10px;">
						<div class="detailView">
							<img class="solidImg" src="../img/location-dot-solid.png">
							<span style="font-size:14px;">{{restView.newAddr}} {{restView.detail}}</span>
						</div>
						<div class="detailView">
							<img class="solidImg" src="../img/clock-solid.png">
							<span style="font-size:14px;">{{restView.sepaOpenTime}} - {{restView.sepaCloseTime}}</span>
						</div>
						<div class="detailView">
							<img class="solidImg" src="../img/phone-solid.png">
							<span style="font-size:14px;">{{restView.sepaPhone}}</span>
						</div>
						<div class="detailView">
							<img class="solidImg" src="../img/store-solid.png">
							<span style="font-size:14px;">{{restView.devType}}</span>
						</div>
						<div class="detailView">
							<img class="solidImg" src="../img/store-solid.png">
							<span style="font-size:16px;">가게이벤트</span>
							<div style="font-size:14px; margin-left:25px; margin-top:10px;">{{restView.title}}</div>
							<div style="font-size:14px; margin-left:25px; margin-top:10px;">{{restView.contents}}</div>
						</div>
						<div style="width:100%; text-align:center;">
							<button @click="fnShopInfo(restView.bizId)" class="plusBtn">정보 더보기 ❯</button>
						</div>
						<div style="border-top:1px solid #eee; width:415px; margin:20px auto;"></div>
						<div style="margin-left:10px;">
							<span style="font-size:1.5em; font-weight:bold;">메뉴</span><span style="font-size:16px; color:#aaa;"> {{menuCnt.totalCnt}}</span>
						</div>
						<div class="detailView" v-for="item in menuSampleList" style="float:left;">
							<img class="sampleImg" :src="item.path">
							<div style="font-size:15px; margin-left:10px; width:195px; text-align:center;">{{item.menu}}</div>
							<div style="font-size:15px; margin-left:10px; margin-top:10px; font-weight:bold; width:195px; text-align:center;">{{parseInt(item.price).toLocaleString()}}<span style="font-size:15px; font-weight:100;">원</span></div>
						</div>
						<div style="width:100%; text-align:center; clear:both;">
							<button @click="fnShopInfo(restView.bizId)" class="plusBtn">메뉴 더보기 ❯</button>
						</div>
					</div>
				</div>
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<div id="menuBar" class="menuBar"
								style="padding: 10px; border-radius: 5px; background-color: white; overflow: hidden; padding: 0px; width: 400px; display: block">
								<div>
									<a href="javascript:;" id="menu1" @click="fnSearchType1()"
										:style="{'color': searchFlg1 ? '#fff' : '#ff8002'}"
										:class="searchFlg1 ? 'select_button' : 'none_select_button'"  style="border-top-left-radius: 5px;border-bottom-left-radius: 5px;">지역검색</a>
								</div>
								<div>
									<a href="javascript:;" id="menu2" @click="fnSearchType2()"
										:style="{'color': searchFlg2 ? '#fff' : '#ff8002'}"
										:class="searchFlg2 ? 'select_button' : 'none_select_button'" style="border-top-right-radius: 5px;border-bottom-right-radius: 5px;">가게명</a>
								</div>
							</div>
							<div v-if="searchFlg2" class="search-bar">
								<input v-model="restNameInput" type="text" size="30" placeholder="가게명을 입력해주세요" @keyup.enter="restNameSearch()">
								<button @click="restNameSearch()">
									<img src="../img/magnifying-glass-solid.png">
								</button>
							</div>
							<div v-if="searchFlg1" class="search-bar">
								<select v-model="si" @change="fnGuList()"
									style="padding: 8px; border-radius: 5px; border: 1px solid #ccc; margin-right: 45px; width: 313px;">
									<option value="">선택</option>
									<option v-for="item in siList" :value="item.si">{{item.si}}</option>
								</select>
							</div>
							<div v-if="searchFlg1" class="search-bar">
								<select v-model="gu" @change="fnDongList()"
									style="padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
									<option value="">선택</option>
									<option v-for="item in guList" :value="item.gu">{{item.gu}}</option>
								</select> <select v-model="dong"
									style="padding: 8px; border-radius: 5px; border: 1px solid #ccc;">
									<option value="">선택</option>
									<option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
								</select>
								<button @click="fnAreaSearch()"
									style="background-color: white; margin: 0; border: none;">
									<img src="../img/magnifying-glass-solid.png">
								</button>
							</div>
						</div>
					</div>
					<div class="restList" v-if="areaRestList.length == 0 && searchFlg" v-for="item in locationRestList">
						<img :src="item.path" alt="Hi" class="restImg">
						<h3 style="margin-top: 8px;">
							<a style="font-size: 16px;" href="javascript:;"
								@click="fnRestView(item.bizId)">{{item.bizName}}</a><span style="color: #aaa;"> {{item.categoryName}}</span>
						</h3>
						<div id="placesList1" style="margin-top:5px;">
							<span style="color: #ff7f00;">★ {{item.reviewAvg}}</span> | 리뷰 {{item.reviewCnt}}
							<p style="margin-left: 60px; margin-top:5px;">{{item.title}}</p>
							<p style="margin-left: 60px; margin-top:5px;">{{item.contents}}</p>
						</div>
					</div>
					<div class="restList" v-if="areaRestList.length > 0" v-for="item in areaRestList" @click="fnRestView(item.bizId)">
						<img :src="item.path" alt="Hi" class="restImg">
						<h3 style="margin-top: 8px;">
							<a style="font-size: 1.5em;" href="javascript:;"
								>{{item.bizName}}</a><span style="color: #aaa;"> {{item.categoryName}}</span>
						</h3>
						<div id="placesList1" style="margin-top:5px;">
							<span style="color: #ff7f00;">★ {{item.reviewAvg}}</span> | 리뷰 {{item.reviewCnt}}
							<p style="margin-left: 60px; margin-top:5px;">{{item.title}}</p>
							<p style="margin-left: 60px; margin-top:5px;">{{item.contents}}</p>
						</div>
					</div>
					<div class="restList" v-if="areaRestList.length == 0 && !searchFlg">
						<span style="color: #aaa;">검색된 매장이 없습니다.</span>
					</div>
				</div>
			</div>
		</section>
	</div>
	<%@include file="food114_footer.jsp"%>

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
	        var mapOptions = {
	            center: new kakao.maps.LatLng(coords.latitude, coords.longitude),
	            level: 4
	        };

            return mapOptions;
            
        } catch (error) {
            console.error('Error getting current location:', error.message);
            // 기본 위치 (서울)를 반환할 수 있도록 기본적인 오류 처리를 수행할 수 있습니다.
            return {
                center: new kakao.maps.LatLng(37.566826, 126.9786567),
                level: 4
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
    
    function goToPage(bizId){
    	$.pageChangeBlank("/food114-shop-info.do", {bizId : bizId, selectTab : 'menu'});
    }
    
		var app = new Vue({
			el: '#app',
			data: {
				searchFlg: true,
				searchFlg1: true,
				searchFlg2: false,
				restList: [],
				locationRestList: [],
				markers: [],
				overlays : [],
				map: null,
				siList : [],
				guList : [],
				dongList : [],
				si : "",
				gu : "",
				dong : "",
				latitude : "",
				longitude : "",
				areaRestList : [],
				restView : {},
				restNameInput : "",
				menuSampleList : [],
				menuCnt : {}
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
				fnSiList : function() {
					var self = this;
					var nparmap = {};
					$.ajax({
						url : "siList.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.siList = data.siList;
						}
					});
				},
				fnGuList : function() {
					var self = this;
					self.gu = "";
					self.dong ="";
					self.dongList = [];
					var nparmap = {si : self.si};
					$.ajax({
						url : "guList.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.guList = data.guList;
						}
					});
				},
				fnDongList : function() {
					var self = this;
					self.dong = "";
					var nparmap = {si : self.si, gu : self.gu};
					$.ajax({
						url : "dongList.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.dongList = data.dongList;
						}
					});
				},
				fnSearchType1: function () {
					var self = this;
					self.searchFlg1 = true;
					self.searchFlg2 = false;
				},
				fnSearchType2: function () {
					var self = this;
					self.searchFlg1 = false;
					self.searchFlg2 = true;
				},
				fnAreaSearch : function() {
					var self = this;
					self.fnRestClose();
					var area = "";
					if(!self.si){
						return;
					} else if(self.si && !self.gu){
						area = self.si;
					} else if(self.si && self.gu && !self.dong){
						area = self.si + ' ' + self.gu;
					} else if(self.si && self.gu && self.dong){
						area = self.si + ' ' + self.gu + ' ' + self.dong;
					}
					
					self.convertAddressToCoordinates(area, function() {
				        var nparmap = { area : area };
				        $.ajax({
				            url: "areaRestList.dox",
				            dataType: "json",
				            type: "POST",
				            data: nparmap,
				            success: function(data) {
				            	if(data.areaRestList.length == 0){
				            		self.areaRestList = [];
				            		self.searchFlg = false;
				            	} else {
				                	self.areaRestList = data.areaRestList;
				            		self.searchFlg = true;
				            	}
				                // 좌표 변환 작업이 완료된 후에 setCenter 함수 호출
				                self.setCenter();
				            }
				        });
				    });
				},
				convertAddressToCoordinates: function(addr, callback) {
				    var self = this;
				    var geocoder = new kakao.maps.services.Geocoder();

				    geocoder.addressSearch(addr, function(result, status) {
				        if (status === kakao.maps.services.Status.OK) {
				            self.latitude = result[0].y;
				            self.longitude = result[0].x;
				            
				         	// 기존 마커 제거
						    self.markers.forEach(function(marker) {
						        marker.setMap(null);
						    }); 
						    
						    self.markers = [];
						    
						 	// 기존 오버레이 제거
						    self.overlays.forEach(function(overlay) {
						        overlay.setMap(null);
						    }); 

						    self.overlays = [];
						    
				            callback(); // 콜백 함수 호출하여 비동기 작업 완료를 알림
				        }
				    });
				},
				setCenter : function() {
					var self = this;
				    // 이동할 위도 경도 위치를 생성합니다
				    var moveLatLon = new kakao.maps.LatLng(self.latitude, self.longitude);
				    // 지도 중심을 이동 시킵니다
				    self.map.setCenter(moveLatLon);
				    self.map.setLevel(4);
				    console.log(self.areaRestList);
				    for(var i = 0; i < self.areaRestList.length; i++){
				    	self.searchAddMarkers(self.areaRestList[i].newAddr, self.areaRestList[i].bizName, self.areaRestList[i].bizId);
				    }
				},
				searchSetCenter : function(latitude, longitude) {
					var self = this;
				    // 이동할 위도 경도 위치를 생성합니다
				    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
				    // 지도 중심을 이동 시킵니다
				    console.log(self.overlays);
				    for(var i = 0; i < self.overlays.length; i++){
				    	var overlayPosition = self.overlays[i].getPosition();
				        var overlayLatitude = overlayPosition.getLat();
				        var overlayLongitude = overlayPosition.getLng();
				     	// 위치의 근접성을 확인하도록 수정 (좌표의 오차가 약간 있을 수 있음)
				        var distance = calculateDistance(overlayLatitude, overlayLongitude, latitude, longitude);
				     	// 10미터 이내에 있으면 일치하는 것으로 간주
				        if (distance < 10) {
				            self.overlays[i].setMap(self.map);
				        } else {
				        	self.overlays[i].setMap(null);
				        }
				    }
				    self.map.setCenter(moveLatLon);
				    self.map.setLevel(4);
				},
				// 현위치 기반 반경 2km 가게들 마커찍기
				addMarkers : function () {
	                var self = this;
	                // 기존 마커 제거
	                self.markers.forEach(function(marker) {
	                    marker.setMap(null);
	                }); 
	                
	                self.markers = [];
	                
	             	// 기존 오버레이 제거
	                self.overlays.forEach(function(overlay) {
	                    overlay.setMap(null);
	                }); 

	                self.overlays = [];
	                
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
		                     '  <a href="javascript:;" onclick="goToPage(\'' + place.bizId + '\')">' +
		                     '    <span class="title">' + place.bizName + '</span>' +
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
		                    self.overlays.push(overlay);
		                    self.locationRestList.push(place);
		                }
		            })
		                console.log(self.markers);
		                console.log(self.locationRestList);
	             })
			  },
			  // 검색한 위치 기반 반경 2km 마커 찍기
			  areaAddMarkers : function (latitude, longitude) {
				    var self = this;
				 	// 기존 마커 제거
				    self.markers.forEach(function(marker) {
				        marker.setMap(null);
				    }); 
				    
				    self.markers = [];
				    
				 	// 기존 오버레이 제거
				    self.overlays.forEach(function(overlay) {
				        overlay.setMap(null);
				    }); 

				    self.overlays = [];
				    
				    var markerImage = new kakao.maps.MarkerImage('../img/free-icon-restaurant-4551357.png',
				            new kakao.maps.Size(30, 30), // 이미지 크기
				            { offset: new kakao.maps.Point(15, 30) } // 이미지 위치 설정 (가운데 아래로 지정)
				        );
				    
				    // 현재 위치를 기준으로 반경을 설정합니다. 예를 들어 반경을 1km로 설정합니다.
				    const radius = 2000; // meter
				    
				    getCurrentLocation().then(function(currentLocation) {
				        self.areaRestList.forEach(function (place) {
				            
				            // 현재 위치와 각 장소의 위치 사이의 거리를 계산합니다.
				            var distance = calculateDistance(latitude, longitude, place.latitude, place.longitude);
				            
				            // 반경 내에 있는지 확인 후 마커 생성.
				            if (distance <= radius) {
				                var markerPosition = new kakao.maps.LatLng(place.latitude, place.longitude); // 위도와 경도 정보 활용
				                var marker = new kakao.maps.Marker({
				                    position: markerPosition,
				                    image: markerImage
				                });
				            
				            // 오버레이 내용 설정
				            var overlayContent = '<div class="customoverlay">' +
		                     '  <a href="javascript:;" onclick="goToPage(\'' + place.bizId + '\')">' +
		                     '    <span class="title">' + place.bizName + '</span>' +
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
				            self.overlays.push(overlay);
				            }
				        })
				            console.log(self.markers);
				    })
				},
				// 검색된 지역에 해당하는 가게들 마커찍기
				searchAddMarkers : function (searchedLocation,bizName,bizId) {
				    var self = this;
				    
				    var markerImage = new kakao.maps.MarkerImage('../img/free-icon-restaurant-4551357.png',
				        new kakao.maps.Size(30, 30), // 이미지 크기
				        { offset: new kakao.maps.Point(15, 30) } // 이미지 위치 설정 (가운데 아래로 지정)
				    );

				    // 검색한 위치를 좌표로 변환합니다.
				    var geocoder = new kakao.maps.services.Geocoder();
				    geocoder.addressSearch(searchedLocation, function (result, status) {
				        if (status === kakao.maps.services.Status.OK) {
				            var markerPosition = new kakao.maps.LatLng(result[0].y, result[0].x); // 변환된 좌표
				            var marker = new kakao.maps.Marker({
				                position: markerPosition,
				                image: markerImage
				            });

				            // 오버레이 내용 설정
				            var overlayContent = '<div class="customoverlay">' +
		                     '  <a href="javascript:;" onclick="goToPage(\'' + bizId + '\')">' +
		                     '    <span class="title">' + bizName + '</span>' +
		                     '  </a>' +
		                     '</div>';
				            var overlay = new kakao.maps.CustomOverlay({
				                content: overlayContent,
				                map: self.map,
				                position: markerPosition,
				                yAnchor: 0.00001
				            });
				            var isOverlayVisible = false;
				            kakao.maps.event.addListener(marker, 'click', function () {
				                if (!isOverlayVisible) {
				                    overlay.setMap(self.map);
				                    isOverlayVisible = true;
				                } else {
				                    overlay.setMap(null);
				                    isOverlayVisible = false;
				                }
				            });
				            overlay.setMap(null);
				            marker.setMap(self.map); // 마커를 지도에 표시
				            self.markers.push(marker);
				            self.overlays.push(overlay);
				        } else {
				            console.error('Geocoder failed due to: ' + status);
				        }
				    });
				},
			  fnRestView: function(bizId) {
				    var self = this;
				    var menuView = document.getElementById("menu_view");
				    menuView.style.transition = "left 0.5s ease"; // 슬라이드 효과를 위한 CSS transition 속성 적용
				    menuView.style.left = "441px";
					var nparmap = {bizId : bizId};
					$.ajax({
						url : "restView.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.restView = data.restView;
							self.menuSampleList = data.menuSampleList;
							self.menuCnt = data.menuCnt;
							console.log(data.restView.latitude);
							self.searchSetCenter(data.restView.latitude, data.restView.longitude);
						}
					});
				},
				restNameSearch : function() {
					var self = this;
					if(!self.restNameInput){
						return;
					}
					self.fnRestClose();
					var nparmap = {bizName : self.restNameInput};
					$.ajax({
						url : "nameRestList.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							if(data.nameRestList.length == 0){
			            		self.areaRestList = [];
			            		self.searchFlg = false;
			            	} else {
			                	self.areaRestList = data.nameRestList;
			            		self.searchFlg = true;
			            		console.log(data.nameRestList[0].latitude);
							    var moveLatLon = new kakao.maps.LatLng(data.nameRestList[0].latitude, data.nameRestList[0].longitude);
							 	// 기존 마커 제거
							    self.markers.forEach(function(marker) {
							        marker.setMap(null);
							    }); 
							    
							    self.markers = [];
							    
							 	// 기존 오버레이 제거
							    self.overlays.forEach(function(overlay) {
							        overlay.setMap(null);
							    }); 

							    self.overlays = [];
							    
							    for(var i = 0; i < self.areaRestList.length; i++){
							    	self.searchAddMarkers(self.areaRestList[i].newAddr, self.areaRestList[i].bizName, self.areaRestList[i].bizId);
							    }
							    self.map.setCenter(moveLatLon);
							    self.map.setLevel(4);
			            	}
						}
					});
				},
			  fnRestClose: function() {
				    var self = this;
				    var menuView = document.getElementById("menu_view");
				    menuView.style.transition = "left 0.5s ease"; // 슬라이드 효과를 위한 CSS transition 속성 적용
				    menuView.style.left = "0";
				},
			  fnShopInfo: function(bizId) {
				  $.pageChangeBlank("/food114-shop-info.do", {bizId : bizId, selectTab : 'menu'});
			  },
			  fnShopInfoReview: function(bizId) {
				  $.pageChangeBlank("/food114-shop-review.do", {bizId : bizId, selectTab : 'review'});
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
				self.fnSiList();
			}
		});
	</script>
	</div>
</body>
</html>
