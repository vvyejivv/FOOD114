<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- 지도  -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>

<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/shopInfo.css">
<title>가게정보 페이지</title>
</head>
<style>
</style>
<body style="margin: 0px;">
	<div id="shopInfoHeader" style="width: 1920px; margin: 0px auto;">
		<div>
			<!-- 메뉴 / 리뷰 탭 -->
			<div id="tabContainer">
				<ul class="tab">
					<li>
						<div class="tabBox" :class="{'selectTab' : selectTab === 'menu'}"
							@click="fnChangeTab('menu') ">
							<a href="javascript:;">메뉴</a>
						</div>
					</li>
					<li>
						<div class="tabBox"
							:class="{'selectTab' : selectTab === 'review'}"
							@click="fnChangeTab('review')">
							<a href="javascript:;">리뷰</a>
						</div>
					</li>
				</ul>
			</div>
			<!-- 가게 정보 -->
			<div
				style="display: flex; width: fit-content; gap: 20px; margin: 0px auto; margin-top: 50px; margin-bottom: 50px;">
				<!-- 가게 이미지 -->
				<div style="width: 369px; height: 369px; border-radius: 10px;">
					<img :src="bizInfo.path" style="width: 369px; height: 369px; border-radius: 10px;">
				</div>
				<!-- 가게 정보 내용 -->
				<div style="width: 451px; height: 369px;">
					<div
						style="width: fit-content; height: 139px; margin-bottom: 40px;">
						<div style="display: flex; margin-bottom: 25px;">
							<div
								style="width: 100px; color: #5F5F5F; font-size: 16px; line-height: 16px;">가게명</div>
							<span
								style="width: fit-content; color: #222222; font-size: 16px; line-height: 16px;">{{bizInfo.bizName}}</span>
						</div>
						<div style="display: flex; margin-bottom: 25px;">
							<div
								style="width: 100px; color: #5F5F5F; font-size: 16px; line-height: 16px;">영업시간</div>
							<span
								style="width: 129px; color: #222222; font-size: 16px; line-height: 16px;">{{bizInfo.open}} ~ {{bizInfo.close}}</span>
						</div>
						<div style="display: flex; margin-bottom: 25px;">
							<div
								style="width: 100px; color: #5F5F5F; font-size: 16px; line-height: 16px;">운영시간</div>
							<span
								style="width: 129px; color: #222222; font-size: 16px; line-height: 16px;">{{bizInfo.shopOpenYN}}</span>
						</div>
						<div style="display: flex; margin-bottom: 25px;">
							<div
								style="width: 100px; color: #5F5F5F; font-size: 16px; line-height: 16px;">전화번호</div>
							<span
								style="width: 129px; color: #222222; font-size: 16px; line-height: 16px;">{{bizInfo.phone}}</span>
						</div>
					</div>
					<div
						style="width: 451px; height: 190px; border-radius: 10px; background-color: #F7F7F7;">
						<div
							style="width: 377px; height: 150px; padding: 20px; line-height: 160%; color: #5F5F5F;">
							<div>‼ {{bizInfo.bizName}} 이벤트 ‼</div>
							<div>{{event.title}}</div>	
							<div>{{event.contents}}</div>	

						</div>
					</div>
				</div>
				<!-- 지도 -->
				<div style="width: 560px; height: 369px; position: relative; background-color: #767676;">
					<div id="map"></div>
					<div style="background-color: #EDEDED; width: 520px; height: 61px; position: absolute; bottom: 0px; left: 0px; padding: 15px 20px; display: flex; justify-content: space-between; align-items: center;">
						<div style="width: fit-content; height: 16px; display: flex; align-items: center;">
							<div style="width: fit-content; height: 16px; line-height: 16px; color: #222222; margin-right: 20px; font-size: 16px;">주소</div>
							<div style="width: 350px; height: 16px; line-height: 16px; color: #222222; word-break: break-all; overflow: hidden; font-size: 16px;">{{bizInfo.newAddr}} {{bizInfo.detail}}</div>
						</div>
						<div style="width: 60px; height: 16px; padding: 15px 20px; background-color: #ffffff50; border-radius: 1px; color: #5F5F5F; line-height: 16px; border-radius: 8px; cursor: pointer;">거리확인</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<script type="text/javascript">
	/* 지도  */
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
	var shopInfoHeader = new Vue({
		el : '#shopInfoHeader',
		data : {
			selectTab : '${map.selectTab}', /* 선택한 탭 */
			bizId : "${map.bizId}",/* 가게 누른 파라미터값 불러와야함 */
			bizInfo : {}, /* DB 가게정보  */
			map : null,
			event : {}, /* 이벤트 정보 */
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
						bizId : self.bizId
				};
				$.ajax({
					url : "shopInfo.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.bizInfo = data.bizInfo;
						self.event = data.shopEvent;
						console.log(self.event);
						// 데이터베이스에서 가져온 첫 번째 항목의 위치를 이용하여 지도 설정 및 마커 추가
		                self.setMapCenterAndAddMarker(self.bizInfo.latitude, self.bizInfo.longitude);
					}
				});
			},
			fnChangeTab : function(type){
				var self = this;
				if(type == 'menu'){
					self.selectTab = type;
					$.pageChange("/shopInfo.do", { bizId: self.bizId, selectTab: type });
				}else if(type == 'event'){
					self.selectTab = type;
					$.pageChange("/shopEvent.do", { bizId: self.bizId, selectTab: type });
				}else if(type == 'review'){
					self.selectTab = type;
					$.pageChange("/shopReview.do", { bizId: self.bizId, selectTab: type });
				}
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
/* 		        self.map.setCenter(markerPosition); */
 				// 지도가 초기화되었을 때만 실행
                if (self.map) {
                    self.map.setCenter(markerPosition);
                    var marker = new kakao.maps.Marker({
                        position: markerPosition,
                        image: markerImage
                    });
                    marker.setMap(self.map);
                }
 
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
			        this.fnView();
			    }).catch(error => {
			        console.error('Failed to initialize map:', error.message);
			    });
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});

</script>