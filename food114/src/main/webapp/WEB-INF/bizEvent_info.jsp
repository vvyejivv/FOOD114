<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>사장님 페이지</title>
<link rel="stylesheet" href="../css/food114.css">
<link rel="stylesheet" href="../css/event_info_biz.css">
</head>
<style>
table {
	margin-top: 30px;
	width: 1000px;
	border-collapse: collapse;
	overflow: hidden;
	font-size : 14px;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

td{
	color:#5F5F5F;
}
tr:hover {
	background-color: #ddd;
}
</style>
<body>
		<div id="Container">
		<%@include file="food114_header(biz).jsp"%>
			<section style="height: 850px">
				<%@include file="sideBar_biz.html"%>
		<div id="app" v-cloak>
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">이벤트&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<div class="infoBox">
					<div class="infoDiv">
						<div class="infoName">이벤트 종류</div>
						<span v-if="!updateFlg" class="viewInfo">{{ eventInfo.type === 'SHORT' ? '우리동네' : (eventInfo.type === 'REGULAR' ? '리뷰 이벤트' : '') }}</span>
						<select v-if="updateFlg" class="updateInput"
							v-model="eventInfo.type">
							<option value="SHORT">우리동네</option>
							<option value="REGULAR">리뷰 이벤트</option>
						</select>
					</div>
					<div class="infoDiv">
						<div class="infoName">이벤트 제목</div>
						<span v-if="!updateFlg" class="viewInfo">{{eventInfo.title}}</span>
						<input v-if="updateFlg" class="updateInput"
							v-model="eventInfo.title">
					</div>
					<div class="infoDiv" style="display:flex;">
						<div class="infoName">이벤트 내용</div>
						<span v-if="!updateFlg" class="viewInfo">{{eventInfo.contents}}</span>
						<textarea v-if="updateFlg" class="updateInput"
							v-model="eventInfo.contents" style="width:200px; height:100px;"></textarea>
					</div>
					<div class="infoDiv">
						<div class="infoName">이벤트 상황</div>
						<span v-if="!updateFlg" class="viewInfo">{{ eventInfo.endYn === 'Y' ? '종료' : (eventInfo.endYn === 'N' ? '진행중' : '') }}</span>
						<select v-if="updateFlg" class="updateInput"
							v-model="eventInfo.endYn">
							<option value="Y">종료</option>
							<option value="N">진행중</option>
						</select>
					</div>
					<div class="infoDiv">
						<div class="infoName">이벤트 기간</div>
						<span v-if="!updateFlg" class="viewInfo">{{eventInfo.beginYear}}-{{eventInfo.beginMonth}}-{{eventInfo.beginDay}} ~ {{eventInfo.endYear}}-{{eventInfo.endMonth}}-{{eventInfo.endDay}}</span>
						<template v-if="updateFlg">
							<select class="timeSelect" v-model="eventInfo.beginYear">
									<option value="2024">2024</option>
									<option value="2025">2025</option>
									<option value="2026">2026</option>
									<option value="2027">2027</option>
									<option value="2028">2028</option>
									<option value="2029">2029</option>
									<option value="2030">2030</option>
							</select>
							<select class="timeSelect" v-model="eventInfo.beginMonth">
								<template v-for="item in 13">
									<option :value="'0'+(item-1)" v-if="item<=10">0{{item-1}}</option>
									<option :value="item-1" v-if="item>10">{{item-1}}</option>
								</template>
							</select>
							<input v-if="updateFlg" class="updateInput"
							v-model="eventInfo.beginDay" style="width:25px;">
							<span style="margin: 0px 10px;">~</span>
							<select class="timeSelect" v-model="eventInfo.endYear">
									<option value="2024">2024</option>
									<option value="2025">2025</option>
									<option value="2026">2026</option>
									<option value="2027">2027</option>
									<option value="2028">2028</option>
									<option value="2029">2029</option>
									<option value="2030">2030</option>
							</select>
							<select class="timeSelect" v-model="eventInfo.endMonth">
								<template v-for="item in 13">
									<option :value="'0'+(item-1)" v-if="item<=10">0{{item-1}}</option>
									<option :value="item-1" v-if="item>10">{{item-1}}</option>
								</template>
							</select>
							<input v-if="updateFlg" class="updateInput"
							v-model="eventInfo.endDay" style="width:25px;">
						</template>
					</div>
					<div class="infoDiv">
					<div class="infoName">이벤트 시간</div>
					<span v-if="!updateFlg" class="viewInfo">{{eventInfo.sepaSetBeginTime}} ~ {{eventInfo.sepaSetEndTime}}</span>
					<template v-if="updateFlg">
							<select class="timeSelect" v-model="eventInfo.beginHour">
								<template v-for="item in 24">
									<option :value="'0'+(item-1)" v-if="item<=10">0{{item-1}}</option>
									<option :value="item-1" v-if="item>10">{{item-1}}</option>
								</template>
							</select>
							시
							<select class="timeSelect" v-model="eventInfo.beginMinute">
								<option v-for="item in 6" :value="(item === 1 ? '00' : (item - 1) * 10)">{{(item-1)*10}}</option>
							</select>
							분 <span style="margin: 0px 10px;">~</span>
							<select class="timeSelect" v-model="eventInfo.endHour">
								<template v-for="item in 24">
									<option :value="'0'+(item-1)" v-if="item<=10">0{{item-1}}</option>
									<option :value="item-1" v-if="item>10">{{item-1}}</option>
								</template>
							</select>
							시
							<select class="timeSelect" v-model="eventInfo.endMinute">
								<option v-for="item in 6" :value="(item === 1 ? '00' : (item - 1) * 10)">{{(item-1)*10}}</option>
							</select>
							분
					</template>
					</div>
				</div>
				<button v-if="!updateFlg" class="btn-modify" @click="fnInfoUpdate()">정보 변경하기</button>
				<div v-if="updateFlg">
					<button style="margin-left: 370px;" class="updateBtn"
						@click="fnAdd()">작성/수정</button>
					<button class="updateBtn" @click="fnInfoUpdate()">취소</button>
				</div>
				<div style="margin-top: 30px; font-size:15px;">
					상품목록 <small>(총 {{menuCnt.cnt}}개)</small>
				</div>
				<table>
					<tr>
						<th>카테고리</th>
						<th>등록상품ID</th>
						<th>등록 상품명</th>
						<th>판매상태</th>
						<th>판매가</th>
						<th>할인가</th>
						<th>적용</th>
					</tr>
					<tr v-for="(item,index) in menuList">
						<td>식음료</td>
						<td>{{item.menuNo}}</td>
						<td>{{item.menu}}</td>
						<td>{{item.sta}}</td>
						<td>{{parseInt(item.price).toLocaleString()}}</td>
						<td v-if="item.saleFlg"><input type="text" v-model="item.salePrice" style="width:50px;"></td>
						<td v-else><input type="text" v-model="item.salePrice" style="width:50px;"></td>
						<td v-if="item.saleFlg"><button class="updateBtn" style="margin:0;"
								@click="fnSalePriceUpdate(item)">적용</button>
								<button class="updateBtn" style="margin:0;"
								@click="fnSalePriceDelete(item)">적용취소</button></td>
						<td v-else><button class="updateBtn" style="margin:0;"
								@click="fnSalePriceInsert(item)">적용</button></td>
					</tr>
				</table>
			</div>
		</div>
	</section>

		<%@include file="food114_footer(biz).jsp"%>
	</div>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionBizId}",
			updateFlg : false,
			eventInfo : {
				boardNo : "",
				title : "",
				type : "",
				contents : "",
				endYn : "",
				beginHour : "",
				beginMinute : "",
				endHour : "",
				endMinute : "",
				beginYear : "",
				beginMonth : "",
				beginDay : "",
				endYear : "",
				endMonth : "",
				endDay : ""
			},
			menuList : [],
			menuCnt : ""
		},
		methods : {
			fnMenuList : function() {
				var self = this;
				var nparmap = {
					bizId : self.sessionId						
				};
				$.ajax({
					url : "menuList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.menuCnt = data.menuCnt;
						console.log(data.menuCnt);
						if(data.menuList){
							self.menuList = data.menuList;
							for(var i = 0; i < self.menuList.length; i++){
								if(self.menuList[i].salePrice){
									self.menuList[i].saleFlg = true;
								} else {
									self.menuList[i].saleFlg = false;
								}
							}
						}
					}
				});
			},
			list : function() {
				var self = this;
				var nparmap = {
					bizId : self.sessionId
				};
				$.ajax({
					url : "listBizEventView.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						console.log(data.listBizEventView);
						if(data.listBizEventView){
							self.eventInfo = data.listBizEventView;
						}
					}
				});
			},
			fnInfoUpdate : function() {
				var self = this;
				self.updateFlg = !self.updateFlg;
			},
			/* fnTempAdd : function() {
				var self = this;
				var form = new FormData();
				var fileInput = document.getElementById('file1');
				if (fileInput.files.length > 0) {
					// 파일이 선택된 경우에만 FormData에 파일 추가
					form.append("file1", fileInput.files[0]);
				}
				form.append("boardNo", self.boardNo);
				form.append("type", self.eventInfo.type);
				form.append("title", self.eventInfo.title);
				form.append("contents", self.eventInfo.contents);
				form.append("endYn", self.eventInfo.endYn);

				// 파일이 선택되었을 때만 업로드 실행
				if (fileInput.files.length > 0) {
					self.upload(form);
					$.pageChange("/bizEvent.do", {});
				} else {
					self.fnNoFile();
				}
			}
			// 파일 업로드
			,
			upload : function(form) {
				var self = this;
				$.ajax({
					url : "/bizEventFileUpload.dox",
					type : "POST",
					processData : false,
					contentType : false,
					data : form,
					success : function(response) {

					}
				});
			}, */
			fnAdd : function() {
				var self = this;
				var nparmap = {
					boardNo : self.eventInfo.boardNo,
					type : self.eventInfo.type,
					title : self.eventInfo.title,
					contents : self.eventInfo.contents,
					endYn : self.eventInfo.endYn,
					beginTime : self.eventInfo.beginHour +''+ self.eventInfo.beginMinute,
					endTime : self.eventInfo.endHour +''+ self.eventInfo.endMinute,
					beginDay : self.eventInfo.beginYear +'-'+ self.eventInfo.beginMonth +'-' + self.eventInfo.beginDay,
					endDay : self.eventInfo.endYear +'-'+ self.eventInfo.endMonth +'-' + self.eventInfo.endDay,
					bizId : self.sessionId
				};
				$.ajax({
					url : "/editBizEventBoard.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						$.pageChange("/bizEvent_info.do", {});
					}
				});
			},
			fnSalePriceUpdate : function(item) {
				var self = this;
				if(!item.salePrice){
					alert("할인가를 작성해주세요.");
					return;
				}
				if(parseInt(item.salePrice) <= 0){
					alert("할인가는 0원보다 커야합니다.");
					return;
				}
				if(parseInt(item.salePrice) > parseInt(item.price)){
					alert("할인가가 판매가보다 높을 수 없습니다.");
					return;
				}
				var nparmap = {
					menuNo : item.menuNo,
					salePrice : item.salePrice
				};
				$.ajax({
					url : "/editSalePrice.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						$.pageChange("/bizEvent_info.do", {});
					}
				});
			},
			fnSalePriceDelete : function(item) {
				var self = this;
				var nparmap = {
					menuNo : item.menuNo,
					salePrice : item.salePrice
				};
				$.ajax({
					url : "/removeSalePrice.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						$.pageChange("/bizEvent_info.do", {});
					}
				});
			},
			fnSalePriceInsert : function(item) {
				var self = this;
				if(!item.salePrice){
					alert("할인가를 작성해주세요.");
					return;
				}
				if(parseInt(item.salePrice) <= 0){
					alert("할인가는 0원보다 커야합니다.");
					return;
				}
				if(parseInt(item.salePrice) > parseInt(item.price)){
					alert("할인가가 판매가보다 높을 수 없습니다.");
					return;
				}
				var nparmap = {
					menuNo : item.menuNo,
					salePrice : item.salePrice,
					eventNo : self.eventInfo.boardNo
				};
				$.ajax({
					url : "/addSalePrice.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						$.pageChange("/bizEvent_info.do", {});
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.list();
			self.fnMenuList();
		}
	});
</script>
