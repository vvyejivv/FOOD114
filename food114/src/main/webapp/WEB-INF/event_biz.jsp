<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="../js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
</style>
</head>

<body>


	<style>
select {
	padding: 8px;
	border-radius: 5px;
	border: 1px solid rgb(204, 204, 204);
	margin-right: 5px;
}

section {
	color: rgb(72, 72, 72);
}

.ourTownTitle {
	text-align: center;
	font-size: 20px;
	margin-top: 35px;
}

#eventBizContainer {
	width: 1200px;
	margin: 0px auto;
	padding: 25px;
	padding-bottom: 50px;
	padding-left: 100px;
}

.subTitleText {
	font-size: 20px;
	font-weight: 500;
	margin-bottom: 10px;
}

.subTitleText>span {
	color: #ff7f00;
	font-weight: bold;
	margin-right: 5px;
}

.areaSelect>select {
	width: 200px;
}

.ingEventBizContainer {
	width: 1110px;
	margin-top: 2px;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	row-gap: 25px;
	column-gap: 25px;
	padding-top: 25px;
}

.EventBizBox {
	border: 1px solid #ccc;
	width: 350px;
	height: 150px;
	border-radius: 5px;
}

a {
	text-decoration: none;
	color:#222222;
}

.sortText>a:hover {
	font-weight: 500;
}
</style>

	<div id="Container">
		<%@include file="food114_header.jsp"%>
			<div id="app" v-cloak>
				<div class="ourTownTitle">우리 동네 이벤트</div>
				<!-- 컨테이너 -->
				<div id="eventBizContainer">
					<!-- 상세옵션 -->
					<div style="margin-bottom: 25px;">
						<div class="subTitleText">
							<span>|</span>지역설정
						</div>
						<div class="areaSelect">
							<select @change="fnGuList()" v-model="selectSi">
								<option value="">선택</option>
								<option v-for="item in siList" :value="item.si">{{item.si}}</option>
							</select>
							<select @change="fnDongList()" v-model="selectGu">
								<option value="">선택</option>
								<option v-for="item in guList" :value="item.gu">{{item.gu}}</option>
							</select>
							<select v-model="selectDong" @change="fnBizList()">
								<option value="">선택</option>
								<option v-for="item in dongList" :value="item.dong">{{item.dong}}</option>
							</select>


						</div>
					</div>

					<!-- 현재 이벤트 중인 가게 -->
					<div class="subTitleText">
						<span>|</span>현재 이벤트 중인 가게
					</div>
					<div class="sortText">
						<a href="javascript:;" style="margin-right: 10px;"
							@click="fnOrder('ORDER BY B.CDATETIME')">최근등록순</a><a
							href="javascript:;" @click="fnOrder('ORDER BY REVIEWAVG DESC')">리뷰높은순</a>
					</div>

					<!-- 이벤트 중인 가게 리스트 -->
					<div class="ingEventBizContainer">
						<!-- 가게 박스 -->
						<div class="EventBizBox" v-for="item in bizList"
							v-if="selectDong!=''" @click="fnShopInfo(item.bizId)">
							<div style="overflow: hidden; margin: 10px; cursor: pointer;">
								<!-- 가게 이미지 -->
								<div
									style="width: 80px; height: 80px; border: 1px solid #ccc; float: left; position: relative;">
									<img :src="item.path"
										style="width: 80px; height: 80px; object-fit: cover; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); border: 1px solid #ccc;">
									<div
										style="width: 80px; height: 80px; font-size: 10px; padding: 5px;"
										v-if="item.path==null">
										등록된 이미지가<br> 없습니다
									</div>
								</div>
								<!-- 가게 설명 -->
								<div
									style="float: left; width: 230px; height: 80px; font-size: 14px; margin-left: 10px;">
									<div>{{item.bizName}}</div>
									<div style="color: orange">★
										{{item.reviewAvg}}({{item.reviewCnt}})</div>
									<div>행사기간 : {{item.beginTime}} ~ {{item.endTime}}</div>
									<div>행사시간 : {{item.setBeginTime}}시 ~ {{item.setEndTime}}시</div>
								</div>
							</div>
							<div
								style="width: 330px; margin: 10px; height: 40px; overflow: hidden; text-overflow: ellipsis; font-size: 13px; word-break: break-all; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical">
								{{item.contents}}</div>
						</div>
						<div style="font-weight: bold;" v-html="bizListMsg"></div>

					</div>
				</div>
			</div>

		<%@include file="food114_footer.jsp"%>
	</div>
</body>

</html>
<script>
	var app = new Vue(
			{
				el : '#app',
				data : {
					siList : [],
					guList : [],
					dongList : [],
					selectSi : "",
					selectGu : "",
					selectDong : "",
					bizList : [],
					bizListMsg : "<div style='height:200px'>지역을 설정해주세요.</div>",
					order : "ORDER BY B.CDATETIME"

				},
				methods : {
					/* 정렬 방법 */
					fnOrder : function(order) {
						var self = this;
						self.order = order;
						self.fnBizList();
					},
					/* select 시 불러오기 */
					fnSiList : function() {
						var self = this;
						var nparmap = {

						};
						$.ajax({
							url : "siList.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.siList = data.siList;

							}
						});
					},
					/* select 구 불러오기 */
					fnGuList : function() {
						var self = this;
						self.selectGu = "";
						self.selectDong = "";
						self.dongList = [];
						var nparmap = {
							si : self.selectSi
						};
						$.ajax({
							url : "guList.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.guList = data.guList;
							}
						});
					},
					/* select 동 불러오기 */
					fnDongList : function() {
						var self = this;
						self.selectDong = "";
						var nparmap = {
							si : self.selectSi,
							gu : self.selectGu
						};
						$.ajax({
							url : "dongList.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.dongList = data.dongList;

							}
						});
					},
					/* 가게 목록 불러오기 */
					fnBizList : function() {
						var self = this;
						var nparmap = {
							selectSi : self.selectSi,
							selectGu : self.selectGu,
							selectDong : self.selectDong,
							order : self.order
						};
						$
								.ajax({
									url : "eventBizList.dox",
									dataType : "json",
									type : "POST",
									data : nparmap,
									success : function(data) {
										self.bizList = data.list;
										console.log(data.list.length);

										if (data.list.length == 0) {
											self.bizListMsg = "<div style='height:200px'>선택하신 지역에 현재 이벤트 중인 매장이 없습니다.</div>";
										} else {
											self.bizListMsg = "";
										}
									}
								});
					},
					fnShopInfo : function(bizId) {
						var self = this;
						$.pageChange("shopEvent.do", {
							bizId : bizId,
							selectTab : "event"
						});
					}
				},
				created : function() {
					var self = this;
					self.fnSiList();
				}
			});
</script>