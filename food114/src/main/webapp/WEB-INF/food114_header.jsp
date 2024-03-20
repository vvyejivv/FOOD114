<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="../css/food114.css">
<title>Document</title>
</head>
<style>
</style>
<body>
	<!-- 헤더 -->
	<div id="header">
		<div id="header-container">
			<div id="header-contents">
				<div id="header-contents-left">
					<div id="header-logo" @click="fnPageChange('food114.do',map)">FOOD114</div>
					<div id="header-menu-container">
						<!-- <div id="header-menu" @click="fnPageChange('food114_foodfind.do',map)">메뉴</div> -->
						<div id="header-menu" class="header-menu-order" @click="fnPageChange('food114-foodfind.do',map)">
							<div class="header-point"></div>
							주문하기
						</div>
						<div id="header-menu" @click="fnPageChange('mapTest2.do',map)">지도로 찾기</div>
						<div id="header-menu" @click="fnPageChange('event-biz-list.do',map)">우리동네</div>
						<div id="header-menu" @click="fnPageChange('event-web-list.do',map)">이벤트</div>
						<div id="header-menu" @click="fnPageChange('biz_main.do',{})">사장님페이지</div>
					</div>
				</div>
				<!-- 로그인 했을때 -->
				<div id="header-contents-right" v-if="map.sessionId!=''">
					<img src="../img/myPage.png" @click="fnPageChange('food114-myPage.do',{})">
					<img src="../img/log-out.png" @click="fnLogout">
				</div>
				<div id="header-contents-right" v-if="map.sessionId==''">
				<img src="../img/myPage.png" @click="fnPageChange('food114-login.do',{})">
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<script>
	var app = new Vue({
		el : '#header',
		data : {
			map : {
				sessionId : "${sessionId}", // 현재 로그인된 아이디
				nowCategory : "${map.category}", // 현재 선택된 카테고리
				inputAddr : "${map.inputAddr}", // 현재 입력된 주소
				latitude : "${map.latitude}", // 현재 입력된 주소의 위도
				longitude : "${map.longitude}",	 // 현재 입력된 주소의 경도	
				nowPage:1,
				detail : "${map.detail}",
				addrNo : "${map.addrNo}",
				phone : "${map.phone}",
				request : "${map.request}"
			}
		},
		methods : {
			fnLogout : function() {
				var self = this;
				if(!confirm("정말 로그아웃 하시겠습니까?")){
					return;
				}
				var nparmap = {};
				$.ajax({
					url : "logout.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						location.reload();
					}
				});
			},
			fnPageChange : function(link, map) {
				var self = this;
				$.pageChange(link, self.map);
			}
		},
		created : function() {
			var self = this;
		}
	});
</script>
