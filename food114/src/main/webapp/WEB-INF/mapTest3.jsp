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
#map {
	width: 100%;
	height: 500px; /* 높이는 필요에 따라 조절하세요. */
}
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
		var app = new Vue({
			el: '#app',
			data: {
				restList: [],
				map: null
			},
			methods: {
				fnRestList: function() {
			        var self = this;
			        var nparmap = {};
			        $.ajax({
			            url: "bizList.dox",
			            dataType: "json",
			            type: "POST",
			            data: nparmap,
			            success: function(data) {
			                self.restList = data.list;
			                console.log(self.restList);
			                // 데이터베이스에서 가져온 첫 번째 항목의 위치를 이용하여 지도 설정 및 마커 추가
			                self.setMapCenterAndAddMarker(self.restList[0].latitude, self.restList[0].longitude);
			            }
			        });
			    },
			    setMapCenterAndAddMarker: function(latitude, longitude) {
			        var self = this;
			        // 마커 이미지 설정
			        var markerImage = new kakao.maps.MarkerImage('../img/free-icon-restaurant-4551357.png',
			            new kakao.maps.Size(30, 30), // 이미지 크기
			            { offset: new kakao.maps.Point(15, 30) } // 이미지 위치 설정 (가운데 아래로 지정)
			        );
			        // 마커 위치 설정
			        var markerPosition = new kakao.maps.LatLng(latitude, longitude);
			        // 지도 중심 위치 설정
			        self.map.setCenter(markerPosition);
			        // 마커 생성
			        var marker = new kakao.maps.Marker({
			            position: markerPosition,
			            image: markerImage
			        });
			        // 마커를 지도에 표시
			        marker.setMap(self.map);
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
