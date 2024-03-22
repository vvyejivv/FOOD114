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
<title>FOOD114::우리동네이벤트</title>
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
	min-height: 400px;
	max-height: 830px;
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
	cursor: pointer;
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
	object-fit: scale-down;
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
	margin-top: 3px;
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

		<div id="app" v-cloak>
			<div id="container">
				<div class="topSection">
					<div id="title">우리 동네 이벤트</div>
					<div id="addrContainer">
						<input id="addrInput" placeholder="주소를 입력해 주세요."
							disabled="disabled" v-model="map.inputAddr">
						<button class="addrSearchBtn addrSearch"
							@click="openAddressSearch">주소 검색하기</button>
						<button class="addrSearchBtn addrLoad" @click="fnAddrClick">내
							주소지 불러오기</button>
					</div>
				</div>

				<!-- 모달 -->
				<div id="modal-back" hidden>
					<div
						style="position: fixed; top: 0px; left: 0px; right: 0px; bottom: 0px; background-color: rgba(0, 0, 0, 0.1);"
						@click="fnCloseModal"></div>
					<div
						style="position: fixed; top: 25px; left: 50%; width: 500px; background-color: white; transform: translate(-50%); border-radius: 8px; border: 1px solid #9e9e9e; overflow: hidden; height: 840px;">
						<div
							style="background-color: #f7f7f7; margin-bottom: 10px; padding: 10px; color: #222222; font-weight: 500; text-align: center;">내
							주소지</div>
						<span
							style="position: absolute; top: 7px; right: 10px; cursor: pointer;"
							@click="fnCloseModal">✖</span>
						<div
							style="display: flex; flex-direction: column; gap: 10px; padding: 10px;">
							<template v-for="item in list.addrList">
								<div
									style="font-size: 14px; height: fit-content; display: flex; flex-direction: column; gap: 5px; padding: 10px; border: 1px solid #ededed; border-radius: 8px;">

									<div>이름 : {{item.addrAs}}</div>
									<div>연락처 : {{item.phone}}</div>
									<div>주소 : {{item.newAddr}}</div>
									<div>상세주소 : {{item.detail}}</div>
									<button class="main2-text-btn" @click="fnAddrSelect(item)">선택</button>
								</div>
							</template>
						</div>

					</div>
				</div>


				<div class="bottomSection">
					<div style="width: 1420px; margin: 0 auto;">
						<div
							style="height: 44px; display: flex; justify-content: end; gap: 10px;">

							<div style="display: inline-block;">
								<input placeholder="검색어를 입력해주세요." v-model="keyword"
									style="font-size: 14px; border: 1px solid #ededed; border-radius: 5px; padding: 12px 23.5px 12px 23.5px; color: #5f5f5f;">
							</div>
							<button @click="fnList()"
								style="border-radius: 5px; background-color: #ff8002; color: white; border: 1px solid #ffffff; padding: 5px 15px; cursor: pointer;">검색</button>


							<select class="orderSelect" v-model="map.order">
								<option value="ORDER BY ENDYN DESC">기본 정렬순</option>
								<option value="ORDER BY ENDYN DESC,REVIEWAVG DESC">별점
									높은순</option>
								<option value="ORDER BY ENDYN DESC,ORDERCNT DESC">주문
									많은순</option>
								<option value="ORDER BY ENDYN DESC,SETBEGINTIME ASC">이벤트
									시간순</option>
							</select>

						</div>
					</div>
					<div id="bizListContainer">
						<div style="margin-top: 20px; width: 1420px; text-align: center;"
							v-if="list.bizBaedalOkList.length==0">현재 조회되는 매장이 없습니다.</div>
						<div id="bizListGrid">
							<div v-for="(item,index) in list.bizBaedalOkList" class="bizBox"
								:style="{'background-color': !item.contents? '#edededa6':'white'}"
								v-if="(map.nowPage*showCnt-showCnt)<= index && index<(map.nowPage*showCnt)">
								<div class="bizBoxContent">
									<img :src="item.path" style="border-radius: 0px;">

									<div class="bizInfo">

										<div class="bizInfoName">
											<div style="width: fit-content">{{item.bizName}}</div>
											<div style="display: flex; gap: 5px;">
												<div class="takeOutStatus" v-if="item.takeOut!=2">배달</div>
												<div class="takeOutStatus" v-if="item.takeOut!=1">포장</div>
											</div>
										</div>

										<div class="bizInfoBottom">
											<span class="bizInfoBottomText">⭐
												{{item.reviewAvg}}({{item.reviewCnt}})</span> <span
												class="bizInfoBottomText" style="color: #9e9e9e;">
												{{item.beginTime}} ~ {{item.endTime}} </span>
										</div>
										<div
											style="font-size: 14px; ine-height: 14px; color: #9e9e9e; display: flex; justify-content: end; margin-top: 3px;">
											<template
												v-if="typeof item.setBeginTime!='undefined'&&typeof item.setEndTime!='undefined'">
												{{item.setBeginTime.slice(0,2)}}:{{item.setBeginTime.slice(2)}}~{{item.setEndTime.slice(0,2)}}:{{item.setEndTime.slice(2)}}
											</template>
										</div>
										<div class="bizInfoEvent">
											<span>{{item.contents}}</span> <span
												v-if="typeof item.contents=='undefined'"
												style="font-size: 12px; color: #9e9e9e">현재 진행중인 이벤트가
												없습니다.</span>
										</div>
									</div>

								</div>
								<div style="clear: both; margin-left: -20px;">
									<button class="bizDetailBtn"
										@click="fnPageChange('food114-shop-info.do',Object.assign(map, {selectTab : 'menu', bizId : item.bizId}))">자세히
										보기</button>
								</div>
							</div>

						</div>

					</div>
				</div>
				<div style="border: none; margin: 0 auto; margin-top: 60px;">
					<div style="text-align: center;">
						<div
							style="display: flex; justify-content: center; align-items: center; width: fit-content; margin: 0px auto; gap: 10px;">
							<!-- <span style="display: inline-block; color: #9e9e9e;">&lt;</span> -->

							<template v-for="(item,index) in totalPage">
								<span style="display: inline-block; cursor: pointer"
									:style="{'color' : index + 1==map.nowPage ? '#ff7f00' : '#222222'}"
									@click="map.nowPage=index+1">{{index+1}}</span>
							</template>
							<!-- <span style="display: inline-block;">&gt;</span> -->
						</div>
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
};

	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionId}",
			map : {
				inputAddr : "${map.inputAddr}",				
				nowCategory : "%%",
				order : "${map.order}",
				latitude : "${map.latitude}",
				longitude : "${map.longitude}",
				nowPage : ${map.nowPage},
				detail : "${map.detail}",
				addrNo : "${map.addrNo}",
				phone : "${map.phone}",
				request : "${map.request}"
			},
			list : {
				bizBaedalOkList : [] ,
				bizInfo : [],
				addrList : []
				
			},
			totalPage : "", // 총 페이지 
			showCnt : 9, //보여지는 개수
			totalCnt : "", // 총 개수
			keyword : ""
		},		
		methods : {
			// 주소 선택시
			fnAddrSelect : function(item){
				var self=this;
				self.map.addrNo=item.addrNo;
				self.map.detail=item.detail;				
				self.map.phone=item.phone;
				self.map.request=item.request;
				self.map.inputAddr=item.newAddr;
			},
			
			fnCloseModal:function(){
				var self=this;
				$("#modal-back").prop("hidden",true);
				$("body").css({
					"overflow-y" : "auto"
				})
			},
			fnAddrClick : function(){
				var self=this;
				if(!self.sessionId){
					alert("로그인 후 이용 가능합니다");
					return;
				}
				$("#modal-back").prop("hidden",false);
				$("body").css({
					"overflow" : "hidden"
				})
			}
			,
			// 내 주소 불러오기
			fnLoadMyAddr : function(){
				var self=this;	
				if(self.sessionId==""){
					return;
				}
				var nparmap = {
					userId : self.sessionId
				}
				$.ajax({
					url : "myInfoAddr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list.addrList=data.list;
						if(data.list.length==0){							
							return;
						}
						console.log(data);
						if(self.map.addrNo==""){
						self.map.addrNo=self.list.addrList[0].addrNo;
						self.map.inputAddr=self.list.addrList[0].newAddr;
						self.map.detail=self.list.addrList[0].detail;
						self.map.phone=self.list.addrList[0].phone;
						self.map.request=self.list.addrList[0].request;
						}
						console.log(self.map.request);
						
					}
				});
			},
			// 페이지 체인지
			fnPageChange : function(link,map){
				var self=this;
				$.pageChange(link, map);
			},
			// 해당 주소의 위도 경도 구하기
			convertAddressToCoordinates : function(addr) {
				var self = this;
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				var callback = function(result, status) {
				if (status === kakao.maps.services.Status.OK) {
					self.map.latitude = result[0].y;
					self.map.longitude = result[0].x;
				} else{
					self.map.latitude = "";
					self.map.longitude = "";
				}
				};
				geocoder.addressSearch(addr,callback);
			},
			// 배달가능한 가게목록 전체
			fnList : function() {
				var self=this;
				var keyword="AND (BIZNAME LIKE('%"+self.keyword+"%') OR CONTENTS LIKE('%"+self.keyword+"%'))"
				var nparmap = {
						nowCategory : self.map.nowCategory,
						order : self.map.order,
						keyword : keyword
				};
				$.ajax({
					url : "baedalok.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list.bizInfo=data.list;
						self.bizInfo = data.list;
						if(self.map.latitude!="" && self.map.longitude!=""){
							self.fnBaedalOk();
						}
					}
				});
			},
			/* 배달 가능한 가게 리스트 채우기 */
			fnBaedalOk : function () {
				var self=this;
				
				self.list.bizBaedalOkList=[];
				
	                self.list.bizInfo.forEach(function (item) {
	                	
	                 	// 현재 위치와 각 장소의 위치 사이의 거리를 계산합니다.
	                    var distance = calculateDistance(self.map.latitude, self.map.longitude, item.latitude, item.longitude);
	                    
	                 	// 반경 내에 있는지 확인 후 배달가능리스트 push
	                    if (distance <= item.range) {
	                    	item["distance"]=distance;
	                    	self.list.bizBaedalOkList.push(item);
	                    }
	                })
	                self.totalCnt=self.list.bizBaedalOkList.length;	// 총 개수 초기화     
	                self.totalPage=Math.ceil(self.totalCnt/9); // 총 페이지 초기화
			},
			//주소조회 api
			openAddressSearch : function() {
				var self = this;
				new daum.Postcode({
					oncomplete : function(data) {
						self.map.inputAddr = data.roadAddress;		
						self.convertAddressToCoordinates(data.address);								
					}
				}).open();
			}
		},
		watch: {
		  'map.inputAddr': function(newVal, oldVal) {
			  var self=this;
			  self.map.nowPage=1;
			  self.convertAddressToCoordinates(self.map.inputAddr);
			  setTimeout(function(){
			  $.pageChange("/food114-town-event.do", self.map);
			}, 50)	
		  },
		  'map.nowPage' : function(){
			  var self=this;
			  $.pageChange("/food114-town-event.do", self.map);
		  },
		  'map.order' : function(){
			  var self=this;
			  $.pageChange("/food114-town-event.do", self.map);
		  }
		},
		created : function() {
			var self = this;
			self.fnList();
			self.fnLoadMyAddr();
			
				

		}
			});
</script>