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
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<%@include file="shopInfo_header.jsp"%>
	<div id="app">
		<section>
			<div id="menuContainer">

				<div class="menuBox">
					<div class="menuTitle">
						<span>메뉴</span>
					</div>
					<!-- 메뉴 테이블 -->
					<template v-for="item in menuList">
						<div class="menuInfo">
							<div class="menuImgBox">
								<!-- <img src="../image/kfood.jpg"> -->
							</div>
							<div class="menuName">
								<table>
									<tr>
										<th>{{item.menu}}</th>
									</tr>
									<tr>
										<td>{{item.menuInfo}}</td>
									</tr>
									<tr>
										<td style="border-bottom: none;">{{item.price}}</td>
									</tr>
								</table>
							</div>
						</div>
					</template>
				</div>
				<div class="menuBox">
					<div class="menuTitle">
						<span>주류</span>
					</div>
					<!-- 주류 테이블 -->
					<div class="menuInfo">
						<div class="menuImgBox"></div>
						<div class="menuName">
							<table>
								<tr>
									<th>메뉴이름</th>
								</tr>
								<tr>
									<td>메뉴소개</td>
								</tr>
								<tr>
									<td style="border-bottom: none;">10,000원</td>
								</tr>
							</table>
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
			bizId : "hi123",
			menuList : [],
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {
					bizId : self.bizId
				};
				$.ajax({
					url : "menuList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.menuList = data.menuList;
						console.log(data.menuList);
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