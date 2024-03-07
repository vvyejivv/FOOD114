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
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41"></script>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>Document</title>
</head>
<body>
	<div id="app">
		<header>
			<div id="container" style="height: 50px;">
				<div id="logo">
					<img src="../img/logo.png" class="logo">
				</div>
				<div id="status">
					<a class="buttonBox">로그인 </a> <a class="join"> 회원가입 </a> <a
						class="join"> 사장님사이트 </a>
				</div>
			</div>
			<!-- menuBar -->
			<div id="menuBar">
				<div id="container" class="menuBar">
					<a class="menu">메뉴 </a> <a class="menu">지도로 찾기</a> <a class="menu">우리동네</a>
					<a class="menu">이벤트</a> <a class="menu">고객지원</a>
				</div>
			</div>
		</header>
		<!-- 광고창 -->
		<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
		<section>
			<div id="map"></div>
			<input type="text" id="searchInput" placeholder="주소를 입력하세요">
			<button onclick="searchAddress()">검색</button>
			<button onclick="openAddressPopup()">주소검색</button>
		</section>
		<footer>
			<div class="footerImg">
				<img src="../img/logo_gray.png">
			</div>
			<div style="float: right; padding-right: 50px;">가맹점 문의</div>
			<div style="clear: both; font-size: 12px;">
				<div>주소 : 인천광역시 부평구 경원대로 1366(부평동. 스테이션타워 7F)</div>
				<div>
					대표이사 : 박경빈 <span class="partition"> | </span>사업자등록번호 :
					010-6382-4246
				</div>

				<div>
					제휴문의 : djl01@naver.com <span class="partition"> | </span>고객만족센터 :
					1588-****
				</div>
				안심센터 FOOD114 클린리뷰 고객만족센터 1588-****(유료) 24시간, 연중무휴
				<div>호스팅 제공자 : 더조은 FOOD114</div>
			</div>
		</footer>
	</div>
</body>
</html>
<script>
        var map = new kakao.maps.Map(document.getElementById('map'), {
            center: new kakao.maps.LatLng(37.5665, 126.9780),
            level: 3
        });

        // 마커를 담을 배열
        var markers = [];
        var infowindow;
        // 커스텀 오버레이를 담을 배열
        var customOverlays = [];

        // 사용자의 현재 위치를 가져와서 지도에 표시
        navigator.geolocation.getCurrentPosition(function (position) {
            var userPosition = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude);

            // 사용자의 현재 위치 마커 생성
            var userMarker = new kakao.maps.Marker({
                position: userPosition,
                map: map
            });
            
            markers.push(userMarker);
            // 사용자의 현재 위치를 중심으로 반경 1km 이내의 임의의 마커 5개 생성
            for (var i = 0; i < 5; i++) {
                // 임의의 위치 생성 (검색 위치를 중심으로 반경 내에서)
                var markerPosition = new kakao.maps.LatLng(
                    position.coords.latitude + (Math.random() - 0.5) * 0.01,
                    position.coords.longitude + (Math.random() - 0.5) * 0.01
                );

                var imageSrc = '../img/free-icon-restaurant-4551357.png'; // 마커이미지의 주소입니다    
                var imageSize = new kakao.maps.Size(64, 69); // 마커이미지의 크기입니다
                var imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

                // 마커 생성
                var marker = new kakao.maps.Marker({
                    position: markerPosition,
                    image: markerImage,
                    map: map
                });

                // 마커를 배열에 추가
                markers.push(marker);

                // 마커 클릭 이벤트 등록
                /* kakao.maps.event.addListener(marker, 'click', function() { */
                	var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            카카오 스페이스닷원' + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';
                    var overlay = new kakao.maps.CustomOverlay({
                        content: content,
                        position: markerPosition
                    });

                    // 커스텀 오버레이를 지도에 표시합니다
                    overlay.setMap(map);

                    // 커스텀 오버레이를 배열에 추가합니다
                    customOverlays.push(overlay);

                /* }); */
            }
            // 사용자의 현재 위치를 중심으로 지도 이동
            map.setCenter(userPosition);
        });

        function searchAddress() {
            var keyword = document.getElementById('searchInput').value;

            // 기존의 검색 결과 마커들과 커스텀 오버레이들을 모두 제거
            clearMarkers();
            clearCustomOverlays();

            fetch('https://dapi.kakao.com/v2/local/search/address.json?query=' + encodeURIComponent(keyword), {
                headers: {
                    'Authorization': 'KakaoAK f59fa2e28a7255dbc31a7e29bf9b0b31'
                }
            })
                .then(response => response.json())
                .then(data => {
                    if (data.meta.total_count > 0) {
                        var result = data.documents[0];
                        var coords = new kakao.maps.LatLng(result.y, result.x);

                        // 검색 위치에 마커 생성
                        var searchMarker = new kakao.maps.Marker({
                            position: coords,
                            map: map
                        });
                        markers.push(searchMarker);
						
                     	// 인포윈도우를 닫습니다.
                        if (infowindow) {
                            infowindow.close();
                        }
                        
                        // 인포윈도우 생성
                        infowindow = new kakao.maps.InfoWindow({
                            content: '<div style="padding:5px;font-size:12px;">' + result.address_name + '</div>',
                            position: coords
                        });

                        // 인포윈도우 표시
                        infowindow.open(map, searchMarker);

                        // 검색 위치로 지도 이동
                        map.panTo(coords);
                        
                        // 검색 위치 주변에 여러 개의 마커와 커스텀 오버레이 추가
                        addRandomMarkers(coords);
                    } else {
                        alert('검색 결과가 없습니다.');
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('주소 검색 중 오류가 발생했습니다.');
                });
        }

        function openAddressPopup() {
            new daum.Postcode({
                oncomplete: function (data) {
                    document.getElementById('searchInput').value = data.address;

                    // 기존의 검색 결과 마커들과 커스텀 오버레이들을 모두 제거
                    clearMarkers();
                    clearCustomOverlays();

                    // 주소 검색 기능과 동일한 코드
                    fetch('https://dapi.kakao.com/v2/local/search/address.json?query=' + encodeURIComponent(data.address), {
                        headers: {
                            'Authorization': 'KakaoAK f59fa2e28a7255dbc31a7e29bf9b0b31'
                        }
                    })
                        .then(response => response.json())
                        .then(data => {
                            if (data.meta.total_count > 0) {
                            	searchAddress();
                            } else {
                                alert('검색 결과가 없습니다.');
                            }
                        })
                        .catch(error => {
                            console.error('Error:', error);
                            alert('주소 검색 중 오류가 발생했습니다.');
                        });
                }
            }).open();
        }

        // 주어진 위치 주변에 임의의 마커와 커스텀 오버레이를 추가하는 함수
        function addRandomMarkers(center) {
            for (var i = 0; i < 5; i++) {
                // 임의의 위치 생성 (검색 위치를 중심으로 반경 내에서)
                var markerPosition = new kakao.maps.LatLng(
                    center.getLat() + (Math.random() - 0.5) * 0.01,
                    center.getLng() + (Math.random() - 0.5) * 0.01
                );

                var imageSrc = '../img/free-icon-restaurant-4551357.png'; // 마커이미지의 주소입니다    
                var imageSize = new kakao.maps.Size(64, 69); // 마커이미지의 크기입니다
                var imageOption = { offset: new kakao.maps.Point(27, 69) }; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

                // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

                // 마커 생성
                var marker = new kakao.maps.Marker({
                    position: markerPosition,
                    image: markerImage,
                    map: map
                });
				
             	// 마커를 배열에 추가
                markers.push(marker);
                
                // 마커 클릭 이벤트 등록
                /* kakao.maps.event.addListener(marker, 'click', function() { */
                	     	var content = '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            카카오 스페이스닷원' + 
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>';
                    var overlay = new kakao.maps.CustomOverlay({
                        content: content,
                        position: markerPosition
                    });

                    // 커스텀 오버레이를 지도에 표시합니다
                    overlay.setMap(map);

                    // 커스텀 오버레이를 배열에 추가합니다
                    customOverlays.push(overlay);
                /* }); */
            }
        }

        // 모든 마커들을 지우는 함수
        function clearMarkers() {
            for (var i = 0; i < markers.length; i++) {
                markers[i].setMap(null);
            }
            // 배열을 비워줌
            markers = [];
        }

        // 모든 커스텀 오버레이들을 지우는 함수
        function clearCustomOverlays() {
            for (var i = 0; i < customOverlays.length; i++) {
                customOverlays[i].setMap(null);
            }
            // 배열을 비워줍니다
            customOverlays = [];
        }
        
     	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
        function closeOverlay() {
            overlay.setMap(null);     
        }
    </script>