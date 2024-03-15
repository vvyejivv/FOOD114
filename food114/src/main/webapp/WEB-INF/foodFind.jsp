<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
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
	width: 450px;
	height: 50px;
	border-radius: 5px;
	border: 1px solid #ccc;
	position: relative;
	background-color: white;
	box-sizing: border-box;
	padding-top: 12px;
}

.addrInput {
	font-size: 17px;
	line-height: 20px;
	margin: 0px 20px;
	width: 400px;
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
}

.searchAddr {
	cursor: pointer;
	font-size: 13px;
	padding: 10px 20px;
	background-color: white;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-weight: 500;
}

.modalBackGround {
	position: fixed;
	top: 0px;
	left: 0px;
	right: 0px;
	bottom: 0px;
	background-color: rgba(0, 0, 0, 0.05)
}

.modalContents {
	width: 500px;
	background-color: white;
	position: fixed;
	top: 100px;
	left: 50%;
	translate: -50%;
	z-index: 10;
	height: 500px;
	overflow-y: auto;
}

.bizLogo {
	width: 90px;
	object-fit: cover;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
}

.bizLogoContainer {
	width: 90px;
	height: 90px;
	border: 1px solid #ccc;
	margin-left: 4px;
	position: relative;
	border-radius: 5px;
	margin-right: 5px;
}

.takeOut>span {
	font-size: 11px;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 1px 2px;
}

.bizContents {
	height: 80px;
	margin-left: 5px;
}
.bizContents>div{
	line-height: 20px;
}

[v-cloak] {
	display: none;
}
</style>
	<div id="app" v-cloak>
		<section style="color: rgb(72, 72, 72); font-size: 15px;">
			<!-- 카테고리 나열 -->
			<div class="container">
				<div class="categoryBox">
					<div class="category" @click="fnCategorySelect({category:'%%%%'})"
						:style='{"font-weight" : nowCategory=="%%%%" ? "bold" : "none"}'>전체</div>
					<!-- db에서 category 반복문 쓰기 -->
					<div class="category" v-for="(item,index) in categoryList"
						@click="fnCategorySelect({category : item.categoryNo})"
						:style='{"font-weight" : nowCategory==item.categoryNo ? "bold" : "none"}'>{{item.categoryName}}</div>

				</div>


			</div>

			<!-- container -->
			<div style="width: 1000px; margin: 0px auto;">

				<!-- 주소 container -->
				<div style="overflow: hidden">
					<!-- 현재 입력된 주소 -->
					<div class="addrContainer"
						style="padding-top: 8px; height: 40px; margin: 0px auto; margin-top: 40px;">
						<input class="addrInput" placeholder="주소검색 혹은 등록된 주소지를 선택해주세요."
							disabled v-model="inputAddr"
							style="background-color: white; font-size: 14px;">

						<!-- 주소창 더보기 클릭시-->
						<template v-if="showAddr">
							<div @click="fnHiddenAddr" class="modalBackGround"></div>
							<div class="modalContents" style="padding: 10px;">
								<div>내 주소록</div>
								<!-- 반복 box -->
								<div
									style="border: 1px solid #ccc; border-radius: 5px; padding: 10px; margin-bottom: 10px; cursor: pointer;"
									v-for="(item,index) in addrList" @click="fnAddrSelect(index)">

									<div>이름 : {{item.addrAs}}</div>
									<div>
										<span
											style="border: 1px solid #ccc; border-radius: 5px; padding: 0px 5px;">구주소</span>
										{{item.newAddr}}
									</div>
									<div>
										<span
											style="border: 1px solid #ccc; border-radius: 5px; padding: 0px 5px;">신주소</span>
										{{item.oldAddr}}
									</div>
									<div>상세주소 : {{item.detail}}</div>
								</div>
							</div>
						</template>
					</div>
					<!-- addr 컨테이너 종료 -->

					<!-- 버튼 -->
					<div
						style="margin: 10px auto; width: 450px; display: flex; justify-content: center;">
						<button @click="openAddressSearch"
							style="margin-left: 50px; margin-right: 10px;" class="searchAddr">주소
							검색하기</button>
						<button @click="fnShowAddr()" class="searchAddr"
							v-if="sessionId!=''">내 주소 불러오기</button>
					</div>


				</div>
				<!-- 주소 container 끝-->

				<!-- 가게 정렬순 -->
				<div style="height: 35px; margin-top: 70px;" v-if="searchFlg">
					<div style="float: right; padding-right: 35px;">
						<select v-model="order" @change="fnList()"
							style="width: 300px; font-size: 13px; padding: 3px; border: 1px solid #ccc; border-radius: 5px;">
							<option value="">기본 정렬 순</option>
							<option value="ORDER BY ORDERCNT DESC">주문 많은 순</option>
							<option value="ORDER BY REVIEWAVG DESC">별점 높은 순</option>
						</select>
					</div>

				</div>


				<!-- 음식점 목록 container -->
				<div
					style="background-color: white; width: 1000px; margin: 0px auto; padding: 10px 0px; margin-bottom: 25px;">
					<!-- 목록 정렬 -->
					<div
						style="width: 960px; margin: 0px auto; display: grid; grid-template-columns: 1fr 1fr;"
						:style="{height: !searchFlg ? '300px' : 'auto'}">
						<!-- :style="{height: bizBaedalOk.length <7 ? '300px' : 'auto'}" -->
						<div v-if="bizBaedalOk.length==0&&longitude!=''&&searchFlg"
							style="text-align: center">해당 위치에 배달가능한 가게가 없습니다.</div>

						<!-- 가게 1개 -->
						<div
							style="border-radius: 5px; width: 460px; height: 100px; border: 1px solid #ccc; margin-bottom: 10px; display: flex; align-items: center; cursor: pointer;"
							@click="fnBizView({selectTab : 'menu', bizId : item.bizId})"
							v-for="item in bizBaedalOk">
							<!-- 가게 로고 -->
							<div class="bizLogoContainer">
								<img :src="item.path" class="bizLogo">
							</div>

							<div style="" class="bizContents">
								<!-- 가게 이름 -->
								<div
									style="font-weight: bold; margin-bottom: 3px; margin-top: -5px; line-height: 20px;">
									{{item.bizName}} <span style="font-size: 11px;">
										{{item.categoryName}}</span>
								</div>
								<div style="color: #ccc; font-size: 14px;">

									<!-- 가게 평점 -->
									<span
										style="color: orange; line-height: 20px; letter-spacing: 20;">
										★ {{item.reviewAvg}}({{item.reviewCnt}})</span>

									<!-- 판매 형식 -->
									<div style="color: black; padding-top: 3px; line-height: 20px;"
										v-if="item.takeOut=='1'">
										<span>배달</span>
									</div>
									<div style="color: black; padding-top: 3px;"
										v-if="item.takeOut=='2'">
										<span>포장</span>
									</div>
									<div style="color: black; padding-top: 3px;"
										v-if="item.takeOut=='3'" class="takeOut">
										<span>배달</span> <span>포장</span>
									</div>
									<!-- 운영시간 -->
									<div
										style="color: black; font-size: 11px; margin-top: 3px; letter-spacing: 20">
										<div
											v-if="typeof item.openTime!='undefined'||typeof item.closeTime!='undefined'">운영시간
											:
											{{item.openTime.substring(0,2)}}:{{item.openTime.substring(2,4)}}~{{item.closeTime.substring(0,2)}}:{{item.closeTime.substring(2,4)}}</div>
									</div>
								</div>
							</div>
						</div>
						<div style="height: 200px; width: 10px;"
							v-if="bizBaedalOk.length<7"></div>


					</div>
					<!-- 음식점 container 끝-->
				</div>
			</div>
		</section>
	</div>

	<%@include file="main(footer).html"%>
</body>
</html>

<script>
//반경 계산
function calculateDistance(lat1, lon1, lat2, lon2) {
    var R = 6371; // 지구의 반지름 (단위: km)
    var dLat = (lat2 - lat1) * (Math.PI / 180);
    var dLon = (lon2 - lon1) * (Math.PI / 180);
    var a =
        Math.sin(dLat / 2) * Math.sin(dLat / 2) +
        Math.cos(lat1 * (Math.PI / 180)) * Math.cos(lat2 * (Math.PI / 180)) *
        Math.sin(dLon / 2) * Math.sin(dLon / 2);
    var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
    var distance = R * c; // 두 지점 사이의 거리 (단위: km)
    return distance * 1000; // 거리를 미터로 변환하여 반환
}
	var app = new Vue({
		el : '#app',
		data : {
			categoryList : [], // 카테고리 리스트
			sessionId : "${sessionId}", // 현재 로그인된 아이디
			sortType : "기본 정렬 순", // 정렬
			showAddr : false, // 현재 아이디의 주소 목록 보이기 여부
			addrList : [], // 현재 아이디의 주소 목록
			addrNo : "",
			oldAddr : "",
			newAddr : "",
			bizInfo : [],
			nowCategory : "${map.category}", // 현재 선택된 카테고리
			inputAddr : "${map.inputAddr}",
			latitude : "${map.latitude}",
			longitude : "${map.longitude}",
			bizBaedalOk : [],
			order : "",
			searchFlg : "${map.flg}"
			
			
		},
		methods : {
			fnBizView : function(map){
				var self=this;
				$.pageChange("/shopInfo.do", map);				
			},
			// 배달가능한 가게목록 전체
			fnList : function() {
				var self=this;
				console.log(self.searchFlg);
				var nparmap = {
						category : self.nowCategory,
						order : self.order
				};
				$.ajax({
					url : "baedalok.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.bizInfo = data.list;
						if(self.latitude!="" && self.longitude!=""){
							self.fnBaedalOk();
						}
					}
				});
			},
			fnBaedalOk : function () {
				var self=this;
				self.bizBaedalOk=[];
				self.searchFlg=true;
				
	                self.bizInfo.forEach(function (item) {
	                	
	                 	// 현재 위치와 각 장소의 위치 사이의 거리를 계산합니다.
	                    var distance = calculateDistance(self.latitude, self.longitude, item.latitude, item.longitude);
	                    
	                 	// 반경 내에 있는지 확인 후 배달가능리스트 push
	                    if (distance <= item.range) {
	                    	self.bizBaedalOk.push(item);
	                    }
	                })
	                console.log(self.bizBaedalOk);
			}
			,
			// 해당 주소의 위도 경도 구하기
			convertAddressToCoordinates : function(addr) {
				var self = this;
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
						var callback = function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								self.latitude = result[0].y;
								self.longitude = result[0].x;
								console.log("1."+self.latitude);
							}
						};
						geocoder.addressSearch(addr,callback);
						
						console.log("2."+self.latitude);
					},
					//주소조회 api
					openAddressSearch : function() {
						var self = this;
						new daum.Postcode(
								{
									oncomplete : function(data) {
										self.oldAddr = data.jibunAddress != "" ? data.jibunAddress
												: data.autoJibunAddress;
										self.inputAddr = data.roadAddress;
										self.newAddr = data.roadAddress;
										self
												.convertAddressToCoordinates(data.address);
										
									}
								}).open();
					},
					fnAddrClick : function() {
						alert("안녕");
					},
					/* 카테고리 목록 불러오기 */
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
							}
						});
					},
					/* 카테고리 선택시 */
					fnCategorySelect : function(map) {
						var self = this;
						map["latitude"]=self.latitude;
						map["longitude"]=self.longitude;
						map["inputAddr"]=self.inputAddr;
						$.pageChange("/food114_foodfind.do", map);
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
					/* 회원 주소 선택시 */
					fnAddrSelect : function(idx) {
						var self = this;
						console.log("클릭")
						self.showAddr = false;
						self.inputAddr = self.addrList[idx].newAddr;
						self.convertAddressToCoordinates(self.inputAddr);
						console.log("3."+self.latitude);
						setTimeout(function(){
							$.pageChange("/food114_foodfind.do", {
								latitude : self.latitude,
								longitude : self.longitude,
								inputAddr : self.inputAddr,
								category : self.nowCategory
							});
						}, 50)							
					},
					fnPageChange : function(){
						var self = this;
					},
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
					console.log(self.sessionId);
					self.fnList();
					self.fnCategoryList();
					self.fnAddrList();

				}
			});
</script>
