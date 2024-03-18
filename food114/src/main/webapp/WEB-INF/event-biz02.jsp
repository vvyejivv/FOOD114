<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<style>
#container {
	width: 100%;
	margin: 0px auto;
}

.topSection {
	height: 195px;
	padding-top: 105px;
}

.bottomSection {
	height: 830px;
}

#title {
	font-size: 20px;
	line-height: 20px;
	text-align: center;
	margin-bottom: 50px;
}

#addrContainer {
	width: fit-content;
	box-sizing: border-box;
	height: 54px;
	margin: 0px auto;
	display: flex;
	gap: 10px;
}

#addrInput {
	width: 660px;
	padding: 20px;
	border: 1px solid #ededed;
	border-radius: 8px;
}

.addrSearchBtn {
	padding: 20px;
	font-size: 14px;
	line-height: 14px;
	border-radius: 8px;
}

.addrSearch {
	border: none;
	background-color: #ff7f00;
	color: #fff;
}

.addrLoad {
	border: 1px solid #ededed;
	background-color: #fff;
	color: #5f5f5f;
}

.orderSelect {
	float: right;
	font-size: 14px;
	border: 1px solid #ededed;
	border-radius: 5px;
	padding: 12px 23.5px 12px 23.5px;
	color: #5f5f5f;
}

#bizListContainer {
	width: 1420px;
	margin: 0 auto;
}

#bizListGrid {
	margin-top: 20px;
	display: grid;
	gap: 20px;
	grid-template-columns: 1fr 1fr 1fr;
}

.bizBox {
	height: 200px;
	border: 1px solid #ededed;
	padding: 20px;
	border-radius: 8px;
	overflow: hidden;
}

.bizBoxContent {
	display: flex;
	gap: 18px;
}

.bizBoxContent>img {
	width: 136px;
	height: 136px;
	border-radius: 8px;
	box-sizing: border-box;
}

.bizInfo {
	width: 264px;
	height: 136px;
	box-sizing: border-box;
}

.bizInfoName {
	display: flex;
	gap: 10px;
	align-items: center
}

.takeOutStatus {
	padding: 6px 7px;
	background-color: #f7f7f7;
	border-radius: 3px;
	font-size: 13px;
	color: #5f5f5f;
}

.bizInfoBottom {
	margin-top: 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.bizInfoBottomText {
	font-size: 14px;
	line-height: 14px;
}

.bizInfoEvent {
	padding: 10px;
	background-color: #f7f7f7;
	margin-top: 20px;
	height: 44px;
	border-radius: 5px;
	font-size: 14px;
	line-height: 160%
}

.bizDetailBtn {
	margin: 20px;
	width: 420px;
	height: 46px;
	color: #5f5f5f;
	background-color: #fff;
	border: 1px solid #ededed;
	font-size: 14px;
	cursor: pointer;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div id="Container">
		<%@include file="food114_header.jsp"%>

		<div id="app">
			<div id="container">
				<div class="topSection">
					<div id="title">우리 동네 이벤트</div>
					<div id="addrContainer">
						<input id="addrInput" placeholder="주소를 입력해 주세요." v-model="inputAddr">
						<button class="addrSearchBtn addrSearch">주소 검색하기</button>
						<button class="addrSearchBtn addrLoad">내 주소지 불러오기</button>
					</div>
				</div>
				<div class="bottomSection">
					<div style="width: 1420px; margin: 0 auto;">
						<div style="height: 44px;">
							<select class="orderSelect">
								<option>기본 정렬순</option>
							</select>
						</div>
					</div>
					<div id="bizListContainer">
						<div id="bizListGrid">
							<div v-for="item in 9" class="bizBox">
								<div class="bizBoxContent">
									<img src="../image/yu3.jpg">

									<div class="bizInfo">
										<div class="bizInfoName">
											<div style="width: fit-content">메가커피 인천연수점</div>
											<div style="display: flex; gap: 5px;">
												<div class="takeOutStatus">배달</div>
												<div class="takeOutStatus">포장</div>
											</div>
										</div>

										<div class="bizInfoBottom">
											<span class="bizInfoBottomText">⭐ 3.0(12)</span> <span
												class="bizInfoBottomText" style="color: #9e9e9e;">운영시간
												09:50~18:20</span>
										</div>
										<div class="bizInfoEvent">10,000원 이상 주문 시 배달비 무료입니다
											EVENT 텍스트 두 줄 이후는 점으로 생략.....</div>
									</div>

								</div>
								<div style="clear: both; margin-left: -20px;">
									<button class="bizDetailBtn">자세히 보기</button>
								</div>
							</div>

						</div>

					</div>
				</div>
				<div style="border: none; margin: 0 auto; margin-top: 60px;">
					<div style="text-align: center;">
						<span
							style="display: inline-block; margin-right: 20px; color: #9e9e9e;">&lt;</span>
						<span
							style="display: inline-block; margin-right: 10px; color: #ff7f00;">1</span>
						<span style="display: inline-block; margin-right: 10px;">2</span>
						<span style="display: inline-block; margin-right: 10px;">3</span>
						<span style="display: inline-block; margin-right: 10px;">4</span>
						<span style="display: inline-block; margin-right: 10px;">5</span>
						<span style="display: inline-block; margin-right: 20px;">6</span>
						<span style="display: inline-block;">&gt;</span>
					</div>
				</div>
			</div>

		</div>
	<%@include file="food114_footer.jsp"%>
	</div>
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
			sortType : "기본 정렬 순", // 정렬
			showAddr : false, // 현재 아이디의 주소 목록 보이기 여부
			addrList : [], // 현재 아이디의 주소 목록
			addrNo : "",
			oldAddr : "",
			newAddr : "",
			bizInfo : [],
			sessionId : "${sessionId}", // 현재 로그인된 아이디
			nowCategory : "${map.category}", // 현재 선택된 카테고리
			inputAddr : "${map.inputAddr}",
			latitude : "${map.latitude}",
			longitude : "${map.longitude}",
			bizBaedalOk : [],
			order : "",
			searchFlg : ${map.flg}
			
			
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
								console.log("1."+self.longitude);
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
					fnAddrChange : function(){
						var self=this;
						console.log("변경");
							
						
					},
					/* 회원 주소 선택시 */
					fnAddrSelect : function(idx) {
						var self = this;
						self.showAddr = false;
						self.inputAddr = self.addrList[idx].newAddr;
							
										
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
				watch: {
					  inputAddr: function(newVal, oldVal) {
						  var self=this;
					    return;
					    self.convertAddressToCoordinates(self.inputAddr);
						setTimeout(function(){
							$.pageChange("/food114_foodfind.do", {
								latitude : self.latitude,
								longitude : self.longitude,
								inputAddr : self.inputAddr,
								category : self.nowCategory
							});
						}, 50)	
					  }
					},
				created : function() {
					var self = this;
					self.fnList();
					self.fnCategoryList();
					self.fnAddrList();

				}
			});
</script>