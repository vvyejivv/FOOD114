<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
</style>
</head>

<body>
	<header>
		<%@include file="main(header).html"%>
	</header>

	<style>
input:focus {
	outline: none;
}

input {
	border: none;
}

.category:hover {
	font-weight: bold;
}

.category {
	border-radius: 5px;
	background-color: white;
	padding: 5px 10px;
	display: inline-block;
	margin: 5px;
}

.categoryBox {
	border-bottom: 1px solid #ccc;
	padding: 10px 25px;
	width: 1100px;
	text-wrap: nowrap;
	overflow: hidden;
	justify-content: center;
	display: flex;
}

.search {
	width: 50px;
	height: 50px;
	text-align: center;
	font-size: 20px;
	line-height: 50px;
}

.container {
	height: 50px;
	display: flex;
	align-items: center;
	justify-content: center;
	margin-top: 10px;
}
</style>
	<div id="app">
		<section>
			<!-- 카테고리 나열 -->
			<div class="container">
				<div class="categoryBox">
					<!-- db에서 category 반복문 쓰기 -->

					<div class="category" v-for="item in categoryList" @click="">{{item.categoryName}}</div>
				</div>
				<!-- <div class="search">검색</div> -->

			</div>


			<div style="width: 1000px; margin: 0px auto;">

				<!-- 주소 container -->
				<div style="padding: 20px; margin-bottom: 30px;">
					<!-- 현재 입력된 주소 -->
					<div
						style="width: 600px; height: 50px; border-radius: 10px; margin: 0px auto; display: flex; align-items: center; border: 1px solid #ff7f00; position: relative; background-color: white; box-sizing: border-box;">
						<input
							style="font-size: 20px; line-height: 20px; margin: 0px 20px; width: 500px;"
							placeholder="주소를 입력하세요.">
						<div
							style="background-color: green; color: white; display: inline-block; width: 30px; height: 30px; font-size: 20px; border-radius: 50%; text-align: center; cursor: pointer;"
							@click="fnAddrtrue" >ㅁ</div>

						<!-- 주소창 더보기 클릭시 display none상태-->
						<template v-if="showAddr">
							<div
								style="width: 600px; margin: 0px auto; border: 1px solid #ff7f00; position: absolute;box-sizing: border-box; left: -2px; border-top: none; border-bottom-left-radius: 10px; border-bottom-right-radius: 10px; overflow: hidden; left:-1px;  padding-top:10px; top: 40px; ">
								<!-- 등록된 주소창 v-for 사용할것 -->
								<div
									style="background-color: white; padding: 0px 10px; margin-top: 2px;">
									<div
										style="font-size: 20px; margin-bottom: 5px; padding-top: 10px;">집</div>
									<div
										style="font-size: 15px; padding-bottom: 5px; border-bottom: 1px solid #ffbe98; margin-bottom: -1px; padding-bottom: 10px;">
										주소주소주소주소주소주소주소주소</div>
								</div>
								<div
									style="background-color: white; padding: 0px 10px; margin-top: 2px;">
									<div
										style="font-size: 20px; margin-bottom: 5px; padding-top: 10px;">집</div>
									<div
										style="font-size: 15px; padding-bottom: 5px; border-bottom: 1px solid #ffbe98; margin-bottom: -1px; padding-bottom: 10px;">
										주소주소주소주소주소주소주소주소</div>
								</div>
							</div>
						</template>
					</div>
				</div>
				<!-- 주소 container 끝-->

				<!-- 가게 정렬순 -->
				<div style="height: 35px; border-bottom: 1px solid #ccc;">
					<div style="float: right; padding-right: 35px;">
						<select
							style="width: 300px; font-size: 15px; padding: 3px; border: 1px solid #ccc;">
							<option>기본 정렬 순</option>
							<option>주문 많은 순</option>
							<option>별점 좋은 순</option>
							<option>거리 가까운 순</option>
						</select>
					</div>

				</div>


				<!-- 음식점 목록 container -->
				<div
					style="background-color: white; width: 1000px; margin: 0px auto; padding: 10px 0px; margin-bottom: 25px;">
					<!-- 목록 정렬 -->
					<div
						style="width: 960px; margin: 0px auto; display: grid; grid-template-columns: 1fr 1fr;">

						<!-- 가게 1개 -->
						<div
							style="border-radius: 4px; width: 460px; height: 100px; border: 1px solid #ccc; margin-bottom: 10px; display: flex; align-items: center; cursor: pointer;">
							<!-- 가게 로고 -->
							<div
								style="width: 90px; height: 90px; border: 1px solid #ccc; margin-left: 4px;">img</div>

							<div style="height: 80px; margin-left: 5px;">
								<!-- 가게 이름 -->
								<div
									style="font-weight: bold; margin-bottom: 3px; margin-top: -5px;">가게이름</div>
								<div style="color: #ccc; font-size: 14px;">
									<!-- 가게 평점 -->
									<span style="color: orange;"> ★ 점수</span> |
									<!-- 가게 리뷰 수 -->
									<span style="color: black;">리뷰개수</span>
									<!-- 배달 최소 금액 -->
									<div style="color: black; padding-top: 3px;">최소 주문 금액
										12,000원</div>
									<!-- 배달비 -->
									<div style="color: black;">배달요금 : 1000원 ~ 4000원</div>
								</div>
							</div>
						</div>


					</div>
					<!-- 음식점 container 끝-->
				</div>
		</section>
	</div>

	<%-- <%@include file="main(footer).html"%> --%>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			categoryList : [],
			nowCategory : "",
			sortType : "기본 정렬 순",
			showAddr : true
		},
		methods : {
			fnCategoryList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "foodCategoryAll.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.categoryList = data.categoryList;
						console.log(self.categoryList);
					}
				});
			},
			fnBizList : function() {
			},
			fnAddrfalse : function() {
				var self = this;
				self.showAddr=false;
				return;
				if(self.showAddr==false){
				self.showAddr=true;
				} else{
					self.showAddr=false;
				}
			},
			fnAddrtrue : function() {
				var self = this;
				self.showAddr=true;				
			}


		},
		created : function() {
			var self = this;
			self.fnCategoryList();
		}
	});
</script>