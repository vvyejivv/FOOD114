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
<title>가게리뷰</title>
</head>
<style>
</style>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<%@include file="shopInfo_header.jsp"%>
	<div id="app">
		<section>
			<div id="menuContainer">
				<div id="reviewContainer">
					<div id="reviewBox">
						<div class="totalReview">
							<div id="totalText">4.5</div>
							<div>⭐⭐⭐⭐⭐</div>
						</div>
						<div class="reviewBox">
							<div class="consumerImg"><img src="../img/큰로고1.png"></div>
							<div>아이디</div>
							<div>날짜</div>
							<div>⭐⭐⭐⭐⭐</div>
							<div>사진</div>
							<div>리뷰내용</div>
						</div>
					</div>
					
				</div>
			</div>
		</section>
	</div>

	<%@include file="main(footer).html"%>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			selectTab : '${selectTab}', /* 선택한 탭 */
		},
		methods : {

		},
		created : function() {
			var self = this;

		}
	});
</script>