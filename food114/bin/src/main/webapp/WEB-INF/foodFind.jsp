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
	cursor: pointer;
}

.categoryBox {
	/* border-bottom: 1px solid #ccc; */
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

.addrContainer {
<<<<<<< HEAD
	width: 450px;
	height: 50px;
	border-radius: 5px;
	margin: 0px auto;
	display: flex;
	align-items: center;
	border: 1px solid #ccc;
	position: relative;
	background-color: white;
	box-sizing: border-box;
}

.addrInput {
	font-size: 17px;
	line-height: 20px;
	margin: 0px 20px;
	width: 400px;
}

.addrListBox {
	width: 450px;
	margin: 0px auto;
	border: 1px solid #ccc;
	position: absolute;
	box-sizing: border-box;
	left: -2px;
	border-top: none;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	overflow: hidden;
	left: -1px;
	padding-top: 10px;
	top: 40px;
}

.addrListOne {
	background-color: white;
	padding: 0px 20px;
	margin-top: 2px;
	cursor: pointer;
}

.addrAs {
	font-size: 17px;
	margin-bottom: 5px;
	padding-top: 10px;
	font-weight: 500;
}

.addrText {
	font-size: 14px;
	padding-bottom: 5px;
	border-bottom: 1px solid #ccc;
	margin-bottom: -1px;
	padding-bottom: 10px;
	word-break: break-all
}

.addrText>div {
	margin-bottom: 5px;
}

.addrText>div>span {
	margin-right: 5px;
=======
	width: 600px;
	height: 50px;
	border-radius: 5px;
	margin: 0px auto;
	display: flex;
	align-items: center;
	border: 1px solid #ccc;
	position: relative;
	background-color: white;
	box-sizing: border-box;
}

.addrInput {
	font-size: 17px;
	line-height: 20px;
	margin: 0px 20px;
	width: 550px;
}

.addrListBox {
	width: 600px;
	margin: 0px auto;
	border: 1px solid #ccc;
	position: absolute;
	box-sizing: border-box;
	left: -2px;
	border-top: none;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	overflow: hidden;
	left: -1px;
	padding-top: 10px;
	top: 40px;
}

.addrListOne {
	background-color: white;
	padding: 0px 20px;
	margin-top: 2px;
	cursor: pointer;
}

.addrAs {
	font-size: 17px;
	margin-bottom: 5px;
	padding-top: 10px;
	font-weight: 500;
}

.addrText {
	font-size: 14px;
	padding-bottom: 5px;
	border-bottom: 1px solid #ccc;
	margin-bottom: -1px;
	padding-bottom: 10px;
	word-break: break-all
}

.addrText>div {
	margin-bottom: 5px;
}

.addrText>div>span{
	margin-right:5px;
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
}
</style>
	<div id="app">
		<section style="color: rgb(72, 72, 72)">
			<!-- 카테고리 나열 -->
			<div class="container">
				<div class="categoryBox">
					<div class="category" @click="fnCategorySelect('')"
						:style='{"font-weight" : nowCategory=="" ? "bold" : "none"}'>전체</div>
					<!-- db에서 category 반복문 쓰기 -->
					<div class="category" v-for="item in categoryList"
						@click="fnCategorySelect(item.categoryNo)"
						:style='{"font-weight" : nowCategory==item.categoryNo ? "bold" : "none"}'>{{item.categoryName}}</div>
<<<<<<< HEAD

=======
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
				</div>
				<div class="search">검색</div>


			</div>


			<div style="width: 1000px; margin: 0px auto;">

				<!-- 주소 container -->
				<div style="padding: 20px; margin-bottom: 30px;">
					<!-- 현재 입력된 주소 -->
					<div class="addrContainer">
<<<<<<< HEAD

						<input class="addrInput" placeholder="주소를 입력하세요."
							v-model="inputAddr" @focus="fnShowAddr()">
						<div>
							<img src="../img/magnifying-glass-gray-solid.png" width="30px"
								height="30px"
								style="position: absolute; top: 10px; right: -40px;"
								@click="fnCompleteAddr">
						</div>
=======
						<input class="addrInput" placeholder="주소를 입력하세요."
							@focus="fnShowAddr()" @blur="fnHiddenAddr()">
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git

						<!-- 주소창 더보기 클릭시 display none상태-->
						<template v-if="showAddr">
<<<<<<< HEAD
							<div @click="fnHiddenAddr"
								style="position: fixed; top: 0px; left: 0px; right: 0px; bottom: 0px;"></div>
=======
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
							<div class="addrListBox">
								<!-- 등록된 주소창 v-for 사용할것 -->
<<<<<<< HEAD
								<div class="addrListOne" v-for="(item,index) in addrList"
									@click="fnAddrSelect(index)">
=======
								<div class="addrListOne" v-for="item in addrList" @click="">
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
									<div class="addrAs">{{item.addrAs}}</div>
									<div class="addrText">
										<div>
											<span
												style="border: 1px solid #ccc; border-radius: 5px; padding: 0px 5px;">구주소</span>{{item.oldAddr}},{{item.detail}}
										</div>
										<div>
											<span
												style="border: 1px solid #ccc; border-radius: 5px; padding: 0px 5px;">신주소</span>{{item.newAddr}},{{item.detail}}
										</div>
									</div>
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
							style="border-radius: 4px; width: 460px; height: 100px; border: 1px solid #ccc; margin-bottom: 10px; display: flex; align-items: center; cursor: pointer;"
							@click="fnBizView()">
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
			categoryList : [], // 카테고리 리스트
			sessionId : "${sessionId}", // 현재 로그인된 아이디
			nowCategory : "${map.category}", // 현재 선택된 카테고리
			sortType : "기본 정렬 순", // 정렬
<<<<<<< HEAD
			showAddr : false, // 현재 아이디의 주소 목록 보이기 여부
			addrList : [], // 현재 아이디의 주소 목록
			inputAddr : "",
			addrNo : ""
=======
			showAddr : false, // 현재 아이디의 주소 목록 보기
			addrList : []
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
		},
		methods : {
<<<<<<< HEAD
			fnAddrClick : function() {
=======
			fnAddrClick : function(){
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
				alert("안녕");
			},
			/* 카테고리 목록 불러오기 */
			fnCategoryList : function() {
				var self = this;
				console.log(self.sessionId);
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
			/* 카테고리 선택시 */
			fnCategorySelect : function(category) {
				var self = this;
				$.pageChange("/food114_foodfind.do", {
					category : category
				});
			},
			/* 사업자 리스트 불러오기 */
			fnBizList : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "a.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.categoryList = data.categoryList;
						console.log(self.categoryList);
					}
				});
			},
			/* 회원 주소 목록 불러오기 */
			fnAddrList : function() {
				var self = this;
				var nparmap = {
					userId : self.sessionId
				};
				$.ajax({
					url : "consumerAddrList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.addrList = data.addrList;
					}
				});
			},
<<<<<<< HEAD
			/* 회원 주소 선택시 */
			fnAddrSelect : function(idx) {
				var self = this;
				self.showAddr = false;
				self.inputAddr = self.addrList[idx].oldAddr
			},
			fnCompleteAddr : function() {
				var self=this;
				var nparmap = {
						userId : self.sessionId
					};
					$.ajax({
						url : "consumerAddrList.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.addrList = data.addrList;
						}
					});
			},
=======
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
			fnShowAddr : function() {
				var self = this;
				self.showAddr = true;
			},
			fnHiddenAddr : function() {
				var self = this;
				self.showAddr = false;
			}

		},
		created : function() {
			var self = this;
			self.fnCategoryList();
			self.fnAddrList();

		}
	});
</script>