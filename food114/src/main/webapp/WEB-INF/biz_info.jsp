<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/sideBar_biz.css">
<title>로그인</title>
</head>
<style>
.infoBox {
	width: 1000px;
	/* height: 495px; */
	margin-top: 13px;
	border: 1px solid #ddd;
	border-radius: 2px;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
	color: #555;
}

.btn-modify {
	width: 200px;
	margin-top: 30px;
	margin-left: 370px;
	background-color: #ffffff; /* 버튼 배경색 (흰색) */
	border: 1px solid #2196F3; /* 버튼 테두리 (파란색) */
	color: #2196F3; /* 텍스트 색상 (파란색) */
	padding: 8px 12px; /* 내부 여백 */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
}

.btn-modify:hover {
	border: 1px solid #ff7f00;
	color: #ff7f00;
}

.infoBox .infoDiv {
	margin: 15px 0 25px 20px;
}

.infoName {
	display: inline-block;
	width: 250px;
}

.updateBtn {
	width: 98px;
	margin-top: 30px;
	background-color: #ffffff; /* 버튼 배경색 (흰색) */
	border: 1px solid #2196F3; /* 버튼 테두리 (파란색) */
	color: #2196F3; /* 텍스트 색상 (파란색) */
	padding: 8px 12px; /* 내부 여백 */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
}

.updateBtn:hover {
	border: 1px solid #ff7f00;
	color: #ff7f00;
}

.viewInfo {
	
}

.updateInput {
	height: 17px;
	border: 1px solid #ddd;
	border-radius: 3px;
	padding: 10px 15px;
}

input[type="file"] {
	border: 1px solid #ddd;
	border-radius: 3px;
}

.mainImg {
	position: absolute;
	width: 200px;
	height: 200px;
	right: 10px;
	top: 10px;
}

.mainImg img {
	width: 90%;
	height: 90%;
	object-fit: cover;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 1px solid #ccc;
}

.infoSelect {
	padding: 10px 15px;
	border: 1px solid #ccc;
	width: 200px;
}

section {
	color: rgb(72, 72, 72);
}

.infoDiv input {
	font-size: 15px;
	width: 300px;
}

.timeSelect {
	padding: 10px 15px;
	border: 1px solid #ccc;
	font-size: 15px;
}

.nullSpace {
	width: 100px;
	height: 10px;
	display: inline-block;
	border-bottom: 1px solid #ccc
}
</style>
<body>
	<%@include file="main(header)_biz.html"%>

	<section style="height: 950px;">
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold" style="height: auto;">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span> <span
						style="text-align: left; color: rgba(72, 72, 72);">판매자정보<span
						v-if="updateFlg"> 변경</span></span>
				</h2>
				<div class="infoBox" style="position: relative;">
					<div class="infoDiv">
						<div class="infoName">메인 이미지</div>
						<span class="viewInfo">
							<template v-if="updateFlg">
								<input type="file" id="file1" name="file1"
									accept=".jpg, .png, .gif" @change="fnFileUpload">
							</template>
							<div v-if="!updateFlg"
								style="width: 400px; display: inline-block">사진 변경을 위해서 하단에
								정보 변경하기 버튼을 눌러주세요.</div>

						</span>

						<div class="mainImg">
							<div style="position: relative; width: 100%; height: 100%;">
								<img v-if="bizFile" :src="bizFile.path">
								<div
									style="font-size: 12px; position: absolute; top: 90px; left: 20px;"
									v-if="bizFile=='nothing'">현재 등록된 이미지가 없습니다.</div>
								<div style="position: absolute; bottom: -15px; left: 70px">300x300</div>
							</div>
						</div>


					</div>
					<div class="infoDiv">
						<div class="infoName">사업자번호</div>
						<span class="viewInfo">{{bizInfo.bizNo}}</span>
					</div>
					<div class="infoDiv">
						<div class="infoName">상호</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.bizName}}</span>
						<input v-if="updateFlg" class="updateInput"
							v-model="bizInfo.bizName">
					</div>
					<div class="infoDiv">
						<div class="infoName">판매 카테고리</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.categoryName}}</span>
						<select v-model="bizInfo.bizCategory" v-if="updateFlg"
							class="infoSelect">
							<option value="">선택</option>
							<option v-for="item in categoryList" :value="item.categoryNo">{{item.categoryName}}</option>
						</select>
					</div>
					<div class="infoDiv">
						<div class="infoName">사업장 주소</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.newAddr}}
							{{bizInfo.detail}}</span>
						<template v-if="updateFlg">
							<input class="updateInput" v-model="bizInfo.newAddr" disabled>
							<button @click="openAddressSearch()" class="btn-modify"
								style="margin: 0px; width: auto;">주소조회</button>
							<div style="margin-top: 5px;">
								<div class="infoName"></div>
								<input class="updateInput" v-model="bizInfo.detail">
							</div>
						</template>



					</div>
					<div class="infoDiv">
						<div class="infoName">대표 이름</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.ownerName}}</span>
						<input v-if="updateFlg" class="updateInput"
							v-model="bizInfo.ownerName">
					</div>
					<div class="infoDiv">
						<div class="infoName">대표연락처</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.phone}}</span>
						<input v-if="updateFlg" class="updateInput" id="phoneInput"
							@change="phoneFlg=false" v-model="bizInfo.phone">
						<button class="btn-modify" style="margin: 0px; width: auto;"
							@click="fnPhoneCheck"
							v-if="!phoneFlg&&!inputPhoneCheckFlg&&updateFlg">인증</button>
						<button class="btn-modify"
							style="margin: 0px; width: auto; border: 1px solid red; color: red;"
							v-if="inputPhoneCheckFlg">취소</button>
						<div style="margin-top: 5px;" v-if="inputPhoneCheckFlg">
							<div class="infoName" style="height: 10px;"></div>
							<div style="display: inline-block;">
								<input class="updateInput" placeholder="인증번호를 입력하세요."
									v-model="phoneConfirmInputNum">
								<button class="btn-modify" style="margin: 0px; width: auto;"
									v-if="inputPhoneCheckFlg" @click="fnPhoneConfirm">확인</button>
							</div>
						</div>
					</div>
					<div class="infoDiv">
						<div class="infoName">대표이메일주소</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.email}}</span>
						<template v-if="updateFlg">
							<input class="updateInput" style="width: 150px;" v-model="email">
							@
							<input class="updateInput" style="width: 150px;"
								v-model="emailAddr">
						</template>
					</div>
					<div class="infoDiv">
						<div class="infoName">은행</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.bankName}}</span>
						<select class="infoSelect" v-model="bizInfo.bank" v-if="updateFlg">
							<option value="">선택</option>
							<option v-for="item in bankList" :value="item.value">{{item.name}}</option>
						</select>
					</div>
					<div class="infoDiv">
						<div class="infoName">계좌번호</div>
						<span v-if="!updateFlg" class="viewInfo">{{bizInfo.accountNumber}}</span>
						<input v-if="updateFlg" class="updateInput"
							v-model="bizInfo.accountNumber">
					</div>
					<div class="infoDiv">
						<div class="infoName">영업시간</div>

						<span v-if="!updateFlg" class="viewInfo">
							{{openHour}}시{{openMinute}}분
							<div v-if="bizInfo.openTime==null" class="nullSpace"></div> 부터
							{{closeHour}}시{{closeMinute}}분
							<div v-if="bizInfo.closeTime==null" class="nullSpace"></div> 까지
						</span>
						<template v-if="updateFlg">
							<select class="timeSelect" v-model="openHour">
								<template v-for="item in 24">
									<option :value="'0'+(item-1)" v-if="item<=10">0{{item-1}}</option>
									<option :value="item-1" v-if="item>10">{{item-1}}</option>
								</template>
							</select>
							시
							<select class="timeSelect" v-model="openMinute">
								<option v-for="item in 6" :value="(item-1)*10">{{(item-1)*10}}</option>
							</select>
							분 <span style="margin: 0px 10px;">~</span>
							<select class="timeSelect" v-model="closeHour">
								<template v-for="item in 24">
									<option :value="'0'+(item-1)" v-if="item<=10">0{{item-1}}</option>
									<option :value="item-1" v-if="item>10">{{item-1}}</option>
								</template>
							</select>
							시
							<select class="timeSelect" v-model="closeMinute">
								<option v-for="item in 6" :value="(item-1)*10">{{(item-1)*10}}</option>
							</select>
							분
						</template>

					</div>
				</div>
				<button v-if="!updateFlg" class="btn-modify" @click="fnInfoUpdate()">정보
					변경하기</button>
				<div v-if="updateFlg">
					<button style="margin-left: 370px;" class="updateBtn"
						@click="fnInfoUpdateComplete">수정</button>
					<button class="updateBtn" @click="fnCancel()">취소</button>
				</div>
			</div>
		</div>
	</section>
	<%@include file="main(footer)_biz.html"%>
</body>

</html>
<script>
	var app = new Vue(
			{
				el : '#app',
				data : {
					updateFlg : false,
					sessionId : "${sessionBizId}",
					bizInfo : {},
					bizFile : {},
					categoryList : [],
					bankList : [],
					emailList : [],
					category : "",
					bank : "",
					openHour : "",
					openMinute : "",
					closeHour : "",
					closeMinute : "",
					changeImgFlg : false, //이미지 변경 여부
					email : "",
					emailAddr : "",
					phoneConfirmNum : "1234", //인증번호
					phoneConfirmInputNum : "", //인증번호 입력값 
					phoneFlg : true, // 휴대폰 인증 여부
					inputPhoneCheckFlg : false, // 휴대폰 인증/취소 버튼 활성화 여부					
				},
				methods : {
					// 해당 주소의 위도 경도 구하기
					convertAddressToCoordinates : function(addr) {
						var self = this;
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						var callback = function(result, status) {
							if (status === kakao.maps.services.Status.OK) {								
								self.bizInfo.latitude = result[0].y;
								self.bizInfo.longitude = result[0].x;								
							}
						};
						geocoder.addressSearch(addr, callback);
					},
					//주소조회 api
					openAddressSearch : function() {
						var self = this;
						new daum.Postcode({
							oncomplete : function(data) {
							self.businessAddr = data.address;
							self.bizInfo.oldAddr = data.jibunAddress != "" ? data.jibunAddress: data.autoJibunAddress;
							self.bizInfo.newAddr = data.roadAddress;
							self.convertAddressToCoordinates(data.address);
							}
						}).open();
					},
					// 휴대폰 인증번호 기입 후 확인시
					fnPhoneConfirm : function() {
						var self = this;
						if (self.phoneConfirmInputNum == self.phoneConfirmNum) {
							self.phoneFlg = true;
							self.inputPhoneCheckFlg = false;
						} else {
							self.phoneFlg = false;
							alert("인증 실패");
						}
					},
					// 휴대폰 인증 클릭시
					fnPhoneCheck : function() {
						var self = this;
						let phone = /^(010|011)[0-9]{7,8}$/
						if (!phone.test(self.bizInfo.phone)) {
							alert("휴대폰번호를 제대로 입력해주세요.");
							return;
						}
						$("#phoneInput").prop('disabled', true);
						$("#phoneInput").css({
							"background-color" : "#cccccc4d"
						})
						self.inputPhoneCheckFlg = true;

						var nparmap = {
							phone : self.bizInfo.phone
						};
						$.ajax({
							url : "send-one",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.phoneConfirmNum = data.number;
								$("#phoneInput").prop('disabled', true);
							}
						});
					},
					// 수정버튼 클릭시
					fnInfoUpdateComplete : function() {
						var self = this;
						if (self.bizInfo.bizName == ""
								|| self.bizInfo.ownerName == ""
								|| self.bizInfo.accountNumber == ""
								|| self.email == "" || self.emailAddr == "") {
							alert("판매자 정보를 제대로 기입해주세요.");
							return;
						}
						if (!self.phoneFlg) {
							alert("휴대폰 인증을 진행해주세요.");
							return;
						}
						self.bizInfo.openTime = self.openHour + self.openMinute;
						self.bizInfo.closeTime = self.closeHour
								+ self.closeMinute;
						self.bizInfo["imgFlg"] = self.changeImgFlg;
						self.bizInfo["email"] = self.email + "@"
								+ self.emailAddr;						
						var nparmap = self.bizInfo;
						$.ajax({
							url : "bizInfoUpdate.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								if (data.result == "success") {
									alert("정보변경완료");
									location.href = "biz-info.do";
								} else {
									alert("잠시 후 다시 시도해주세요. 해당 오류가 지속된다면 관리자에게 문의하세요.")
								}
							}
						});
					},
					// 취소
					fnCancel : function() {
						var self = this;
						self.fnBizView();
						self.updateFlg = false;
					},
					// 정보 변경하기 클릭시
					fnInfoUpdate : function() {
						var self = this;
						self.updateFlg = true;
					},
					// 사용자 정보 불러오기
					fnBizView : function() {
						var self = this;
						var nparmap = {
							bizId : self.sessionId
						};
						$.ajax({
							url : "bizView.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.bizInfo = data.bizInfo;
								self.category = data.bizInfo.bizCategory;
								self.bank = data.bizInfo.bank;
								self.openHour = data.bizInfo.openTime
										.substring(0, 2);
								self.openMinute = data.bizInfo.openTime
										.substring(2, 4);
								self.closeHour = data.bizInfo.closeTime
										.substring(0, 2);
								self.closeMinute = data.bizInfo.closeTime
										.substring(2, 4);
								/* self.email = data.bizInfo.email.substring(0,instr("@")) */
								self.email = data.bizInfo.email.substring(0,
										data.bizInfo.email.indexOf("@"));
								self.emailAddr = data.bizInfo.email
										.substring(data.bizInfo.email
												.indexOf("@") + 1);
								console.log(data.bizInfo);
								
								if (data.bizFile) {
									self.bizFile = data.bizFile;
								} else {
									self.bizFile = "nothing";
								}
							}
						});
					},
					// 파일업로드1
					fnFileUpload : function() {
						var self = this;
						self.changeImgFlg = true;
						var form = new FormData();
						form.append("file1", $("#file1")[0].files[0]);
						form.append("bizId", self.sessionId);
						self.upload(form);
					}
					// 파일 업로드2
					,
					upload : function(form) {
						var self = this;
						$.ajax({
							url : "/fileUpload.dox",
							type : "POST",
							processData : false,
							contentType : false,
							data : form,
							success : function(response) {
								self.fnBizFileView();
							}
						});
					},
					// select 내용들 db에서 가져오기
					fnSelectAll : function() {
						var self = this;
						var nparmap = {};
						$.ajax({
							url : "selectAll.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.categoryList = data.categoryList;
								self.bankList = data.bankList;
								self.emailList = data.emailList;
							}
						});
					},
					// 이미지만 새로고침
					fnBizFileView : function() {
						var self = this;
						var nparmap = {
							bizId : self.sessionId
						};
						$.ajax({
							url : "bizFile.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								console.log(data);
								if (data.bizFile) {
									self.bizFile = data.bizFile;
								} else {
									self.bizFile = "nothing";
								}
							}
						});
					}
				},
				created : function() {
					var self = this;
					self.fnSelectAll();
					self.fnBizView();

				}
			});
</script>