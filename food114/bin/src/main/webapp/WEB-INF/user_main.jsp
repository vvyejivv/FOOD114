<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="../css/food114.css">
<script src="js/jquery.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue@2/vue.min.js"></script>
<!-- Vue.js 추가 -->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>FOOD114</title>
</head>
<body>

	<div id="Container" >
		<!-- 헤더 -->
		<%@include file="food114_header.jsp"%>
		<div id="app" v-cloak>
			<!-- 메인 1페이지 -->
			<div id="main1-container">
				<div class="swiper" style="width: 1420px; overflow: visible;">
					<div class="swiper-wrapper"
						style="width: 1420px; overflow: visible;">
						<div class="swiper-slide" style="border-radius: 10px;"
							@click="fnPageChange('food114-event-view.do',{boardNo:18,endYn : 'N'})">
							<img src="../img/event1.png">
						</div>
						<div class="swiper-slide" style="border-radius: 10px;" @click="fnPageChange('food114-event-view.do',{boardNo:19,endYn:'N'})">
							<img src="../img/event2.png">
						</div>
						<div class="swiper-slide" style="border-radius: 10px;" @click="fnPageChange('food114-event-view.do',{boardNo:20,endYn:'N'})">
							<img src="../img/event3.png">
						</div>
					</div>
					<div id="slide-btn-container">
						<div class="swiper-button-prev swiper-prev"
							style="color: #222222;"></div>
						<div class="swiper-button-next swiper-next"
							style="color: #222222;"></div>
					</div>

				</div>
			</div>

			<div id="main1-btn-container">
				<div class="main1-btn-box" @click="fnPageChange('food114-map.do',map)">
					<div class="main1-btn-title">
						<div class="main1-btn-title-text">
							<img src="../img/mapicon.png">
							<span>지도로 검색</span>
						</div>
						<span>❯</span>
					</div>
					<div class="main1-btn-title-subText">내 주변 이벤트를 한눈에</div>
				</div>
				<div class="main1-btn-box" @click="fnPageChange('food114-foodfind.do',map)">
					<div class="main1-btn-title">
						<div class="main1-btn-title-text">
							<img src="../img/truck.png">
							<span>배달시키기</span>
						</div>
						<span>❯</span>
					</div>
					<div class="main1-btn-title-subText">내 주변 이벤트를 한눈에</div>
				</div>
				<div class="main1-btn-box" @click="fnPageChange('food114-town-event.do',map)">
					<div class="main1-btn-title">
						<div class="main1-btn-title-text">
							<img src="../img/gift.png">
							<span>우리 동네 이벤트</span>
						</div>
						<span>❯</span>
					</div>
					<div class="main1-btn-title-subText">내 주변 이벤트를 한눈에</div>
				</div>

			</div>
			<!-- 메인 2페이지 -->
			<div id="main2-container">
				<img src="../img/main2.png">

				<div id="main2-text-container">
					<div id="main2-text-title">우리 동네 인기 맛집 100원부터</div>
					<div id="main2-text-contents" style="">
						푸드114 신규 회원 선착순 100명에게만 제공되는<br> 특별한 이벤트와 쿠폰을 확인해 보세요.
					</div>
					<div style="margin-top: 20px;">
						<button class="main2-text-btn" @click="fnPageChange('food114-event.do',map)">자세히 보기</button>
					</div>
				</div>
			</div>

			<!-- 메인 3페이지 -->
			<div style="overflow: hidden; color: #FFFFFF;">
				<div id="main3-container">
					<img src="../img/Group 3.png" style="width: 1920px; height: 400px;">
					<div style="position: absolute; left: 250px; top: 133px;">
						<div class="main3-title" >가맹점 문의</div>
						<div class="main3-contents">
							FOOD114에 가게 등록하고 아낌없는 지원 받아보세요.<br> 1500-2024
						</div>
						<button class="main3-btn" @click="fnPageChange('food114-biz.do',{})" style="cursor: pointer;">문의하기</button>
					</div>
				</div>
				<div style="width: 1920px;">
					<div style="float: left; position: relative;">
						<img src="../img/Group 1.png" style="width: 960px; height: 350px;">
						<div style="position: absolute; left: 250px; top: 99px;">
							<div class="main3-title">생활 속 환경 살리기</div>
							<div class="main3-contents">
								고객과 가맹점 모두에게 만족할 수 있는 서비스<br> 고객은 지갑 지키고 가맹점은 오늘 우리 가게 매진이요!
							</div>
							<button class="main3-btn" style="cursor: pointer;" @click="fnPageChange('food114-foodfind.do',{})">주문하기</button>
						</div>
					</div>
					<div style="float: left; position: relative;">
						<img src="../img/Group 2.png" style="width: 960px; height: 350px;">
						<div style="position: absolute; left: 110px; top: 99px;">
							<div class="main3-title">인재채용</div>
							<div class="main3-contents">
								FOOD114에서 함께 나아갈 인재를 구합니다.<br> 1500-2024
							</div>
							<button class="main3-btn" @click="fnAlert" style="cursor: pointer;">문의하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 푸터 -->
		<%@include file="food114_footer.jsp"%>
	</div>

</body>
</html>
<script>
	var app = new Vue({
		el : '#app',
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
			fnAlert : function(){
				alert("현재 채용기간이 아닙니다.")
			},
			fnPageChange : function(link,map){
				var self=this;
				$.pageChange(link, map);
			}
			
		},
		created : function() {
			var self = this;
			
		},
		mounted() {
			new Swiper('.swiper', {
				autoplay : {
					delay : 4000, // 4초마다 재생
					disableOnInteraction: false, // 화살표 클릭 이후에도 자동 재생 유지
				},
				loop : true, // 자동 무한 슬라이드
				slidesPerView : 1, // 보이는 슬라이드 개수
				spaceBetween : 50, // 슬라이드 사이 gap
				centeredSlides : true,
				navigation : {
					prevEl : '.swiper-prev',
					nextEl : '.swiper-next',
				},
			});
	      }
	});

	/* 휠 이벤트 막기 */
	window.addEventListener("wheel", function(e) {
		e.preventDefault();
	}, {
		passive : false
	});

	/* 휠 한페이지씩 스크롤 */
	var $html = $("html");
	var page = 1;
	var lastPage = $(".content").length;

	$html.animate({
		scrollTop : 0
	}, 10);
	$(window).on("wheel", function(e) {

		if ($html.is(":animated"))
			return;

		if (e.originalEvent.deltaY > 0) {
			if (page == lastPage)
				return;

			page++;
		} else if (e.originalEvent.deltaY < 0) {
			if (page == 1)
				return;

			page--;
		}
		var posTop = (page - 1) * $(window).height();

		$html.animate({
			scrollTop : posTop
		});

	});
</script>
