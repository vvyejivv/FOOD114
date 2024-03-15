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
							<div class="reviewSetBox">
								<div class="reviewBox">
									<!-- 고객  -->
									<div class="userPhoto">
										<img src="../img/기본_프로필.jpg">
									</div>
									<div class="userInfo">
										<div class="userInfoBox">
											<div class="userId">{{item.userId}}님</div>
											<div class="reviewDate">{{item.orderDate}}</div>
												<div class="starRating"
													style="font-size: 12px; color: #ffcc00;">
													<span v-if="item.raiting >= 1">★</span> <span v-else>☆</span>
													<span v-if="item.raiting >= 2">★</span> <span v-else>☆</span>
													<span v-if="item.raiting >= 3">★</span> <span v-else>☆</span>
													<span v-if="item.raiting >= 4">★</span> <span v-else>☆</span>
													<span v-if="item.raiting >= 5">★</span>
												</div>
												
											<div class="reviewContents">
												<div class="reviewMenu">메뉴 : {{item.menu}}</div>
												<div class="foodContents">{{item.contents}}</div>
											</div>
										</div>
										<div class="reviewImg">
											<img :src="item.path">
										</div>
									</div>
								</div>
								<div class="reviewBox">
									<!-- 가게  -->
									<div class="userPhoto">
										<img src="../img/기본_프로필.jpg">
									</div>
									<div class="userInfo">
										<div class="userInfoBox">
											<div class="userId">{{item.userId}}님</div>
											<div class="shop_reviewDate">{{item.orderDate}}</div>
											<div class="reviewContents">									
												<div class="shopContents">{{item.contents}}</div>
											</div>
										</div>
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
			selectTab : '${map.selectTab}', /* 선택한 탭 */
			bizId : '${map.bizId}',
			reviewList : {},
		},
		methods : {
			fnView : function() {
				var self = this;
				console.log(self.bizId);
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
						console.log(data.reviewList);
					}
				});
			},
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>