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
					<div id="reviewList">
						<!-- 리뷰 작성 -->
						<template v-for="item in reviewList">
							<div class="reviewBox">
								<div class="userPhoto">
									<img src="../img/기본_프로필.jpg">
								</div>
								<div class="userInfo">
									<div class="userInfoBox">
										<div class="userId">님</div>
										<div class="reviewContents">
											<div class="reviewMenu" style="">주문하신 메뉴 : </div>
											<div class="starRating">⭐⭐⭐⭐⭐</div>
											<div class="reviewDate">2024.03.11</div>
											<div class="foodContents">메가커피의 향쌀한 아로마와 부드러운 맛이 중독적!
												다양한 커피 종류와 편안한 분위기는 언제나 기분 좋게 만들어줘. 커피 뿐만 아니라 서비스와 친절한 직원들까지
												만족스럽다. 소소한 일상의 즐거움을 찾을 때 언제나 메가커피를 선택하게 돼.</div>
										</div>
									</div>
									<div class="reviewImg">
										<img src="../img/메가커피_리뷰사진.jpg">
									</div>
								</div>
							</div>
						</template>

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
			bizId : '${bizId}',
			reviewList : {},
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
					bizId : self.bizId
				};
				$.ajax({
					url : "reviewList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.reviewList = data.reviewList;

					}
				});
			},
		},
		created : function() {
			var self = this;

		}
	});
</script>