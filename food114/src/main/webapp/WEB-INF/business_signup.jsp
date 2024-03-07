<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">

<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>회원가입</title>
</head>

<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<!-- 주문하기(영수증창) -->
	<!-- <div class="receipt" style="border-radius: 10px;">
        영수증
        <div class="goOrder">
            주문하기</div>
    </div> -->


	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->

	<style>
.container {
	width: 660px;
	margin: 0px auto;
	margin-top: 0px;
	padding-top: 30px;
	font-size: 17px;
	/* border: 1px solid black; */
}

.container input[type="radio"] {
	accent-color: #ca670359;
	border: 1px solid #e27100;
}

input[type="checkbox"]:checked {
	accent-color: #e27100;
}

.container input[type="text"], .container input[type="password"] {
	width: 300px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	/* outline: none; */
	transition: border-color 0.3s ease;
	background-color: rgba(255, 255, 255, 0.9);
	/* 입력 필드의 배경을 투명하게 설정 */
	margin-right: 10px;
	margin-top: 10px;
	color: rgb(72, 72, 72);
}

.title {
	color: #ff7f00;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	padding-bottom: 15px;
}

.container button {
	padding: 10px 20px;
	background-color: #ff7f00;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.container button:hover {
	background-color: #c06000;
}

.container table td button {
	color: #ff8000;
	background-color: white;
	border: 1px solid #ff7f00;
	font-weight: 700;
	padding: 10px 30px;
}

.container table td button:hover {
	background-color: #ff7f00;
	color: white;
}

.container table td input[type="checkbox"] {
	margin-right: 5px;
}

.joinBtn {
	padding: 10px;
	background-color: #ff7f00;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	height: 50px;
	font-size: 18px;
	font-weight: bold;
	width: 280px;
}

.container {
	padding-bottom: 50px;
}

.errorMessage {
	height: 13px;
	font-size: 12px;
	color: red;
}

th, td {
	/* border: 1px solid black; */
	padding: 10px 20px;
	color: rgb(72, 72, 72);
}

table {
	border-collapse: collapse;
}

td {
	/* padding-top: 20px; */
	padding-bottom: 0px;
}

.star {
	color: #ff7f00;
}

select {
	width: 115px;
	padding: 10px;
	border-radius: 4px;
	border: 1px solid #ccc;
	color: rgb(72, 72, 72);
}

#addrBtn:hover {
	background-color: #ccc;
}

.container input[type="text"]:focus, .container input[type="password"]:focus,
	.container select:focus {
	outline: #ff7f00 solid thin;
	border: 1px solid white;
}
</style>

	<section>
		<div id="app">
			<div class="container" style="width: 650px;">
				<div class="title">회원가입</div>
				<div
					style="border-bottom: 1px solid #ccc; font-size: 13px; height: 25px; margin-bottom: 5px;">
					<div style="float: right; color: rgb(72, 72, 72);">
						<span class="star">*</span>필수입력사항
					</div>
				</div>
				<table>
					<tr>
						<th>사업자등록번호<span class="star">*</span></th>
						<td><input type="text" placeholder="사업자등록번호를 입력해주세요."
							id="businessNum" v-model="businessNo">
							<div class="errorMessage"></div></td>
						<td style="padding: 0px;"><button @click="business()"
								v-if="!bizNumFlg">등록 확인</button></td>
						</td>
					</tr>
					<tr>
						<th>상호명<span class="star">*</span></th>
						<td><input type="text" placeholder="상호명을 입력해주세요."
							v-model="businessName">
							<div class="errorMessage"></div></td>
					</tr>
					<tr>
						<th>대표자 이름<span class="star">*</span></th>
						<td><input type="text" placeholder="대표자 이름을 입력해주세요."
							v-model="businessRename">
							<div class="errorMessage"></div></td>
					</tr>
					<tr>
						<th>사업장 주소<span class="star">*</span></th>
						<td>
							<div>
								<input id="addressInput" v-model="businessAddr" type="text"
									placeholder="주소 조회를 클릭해주세요." disabled>
							</div>
						</td>
						<td style="padding: 0px;"><button
								style="border: 1px solid #ccc; color: rgb(72, 72, 72); margin-top: 20px;"
								id="addrBtn" @click="openAddressSearch()">주소 조회</button></td>
						</td>
					</tr>
					<tr>
						<td></td>
						<td style="padding-bottom: 20px;"><input type="text"
							style="margin-top: 0px;" placeholder="상세주소를 입력해주세요."
							v-model="businessDetailAddr"></td>
						<td></td>

					</tr>
					<tr>
						<th>휴대폰<span class="star">*</span></th>
						<td><input id="phoneNum" v-model="phone" type="text"
							placeholder="'-'를 제외한 휴대폰번호를 입력해주세요.">
							<div class="errorMessage"></div></td>
						<td style="padding: 0px;"><button id="success" v-if="!flg2"
								@click="fnSmsTest()">인증 요청</button></td>
					</tr>
					<tr v-if="flg">
						<td></td>
						<td><input type="text" v-model="hello"
							:placeholder="timerPlaceholder">
							<div class="errorMessage"></div></td>
						<td style="padding: 0px;"><button @click="authentication()">인증</button></td>
					</tr>
					<tr>
						<th>아이디<span class="star">*</span></th>
						<td><input type="text" placeholder="아이디를 입력해주세요."
							v-model="businessId" @keyup="idCheck()">
							<div class="errorMessage">
								<template v-if="businessId != ''">
									<span style="color: blue;" v-if="checkFlg">사용 가능한
										아이디입니다.</span> <span v-else>중복된 아이디입니다.</span>
								</template>
							</div></td>
						<td></td>
					</tr>
					<tr>
						<th>비밀번호<span class="star">*</span></th>
						<td><input type="password" placeholder="비밀번호를 입력해주세요."
							v-model="businessPwd" @keyup="validatePassword">
							<div class="errorMessage">
								<template v-if="businessPwd != ''">
									<div v-if="!valid">영어, 숫자, 특수문자 조합, 8글자 이상이어야 합니다.</div>
									<div style="color: blue;" v-else>유효한 비밀번호입니다.</div>
								</template>
							</div></td>
						<td></td>
					</tr>
					<tr>
						<th>비밀번호 확인<span class="star">*</span></th>
						<td><input type="password" placeholder="비밀번호를 한번 더 입력해주세요."
							v-model="businessPwd2" @keyup="validatePassword2">
							<div class="errorMessage">
								<template v-if="businessPwd2 != '' && valid">
									<div v-if="!valid2">비밀번호가 일치하지 않습니다.</div>
									<div style="color: blue;" v-else>비밀번호가 일치합니다.</div>
								</template>
							</div></td>
						<td></td>
					</tr>
					<tr>
						<th>이메일<span class="star">*</span></th>
						<td>
							<div>
								<input type="text" style="width: 150px; margin-right: 5px;"
									placeholder="이메일을 입력해주세요." v-model="businessEmail"
									@keyup="emailChange()"> <span
									style="margin-right: 5px; font-size: 17px;">@</span> <select
									id="emailDomain" v-model="businessDomain"
									@change="fnEmailInputOnOff">
									<option value="">직접입력</option>
									<option v-for="item in emailList" :value="item.value">{{item.name}}</option>
								</select>
							</div>
							<div>
								<input type="text" placeholder="이메일 플랫폼을 입력해주세요."
									v-if="emailAddrFlg" v-model="businessTempDomain">
							</div>
							<div class="errorMessage"></div>
						</td>
						<td style="padding: 0px;"><button @click="emailCheck()">중복
								확인</button></td>
					</tr>

					<tr>
						<th>입금 계좌(은행)<span class="star">*</span></th>
						<td><select style="width: 320px;" v-model="businessBank">
								<option value="">은행을 선택하세요</option>
								<option v-for="item in bankList" :value="item.value">{{item.name}}</option>
						</select>
							<div class="errorMessage"></div></td>
					</tr>
					<tr>
						<th>입금 계좌번호<span class="star">*</span></th>
						<td><input type="text" placeholder="계좌번호를 입력해주세요."
							v-model="businessAccountNum">
							<div class="errorMessage"></div></td>
					</tr>

				</table>
				<div style="border-bottom: 1px solid #ccc; padding-top: 25px;"></div>
				<table>
					<tr>
						<th rowspan="4">이용약관동의<span class="star">*</span></th>
						<td style="font-size: 20px; font-weight: 500;"><label><input
								v-model="allChecked" @change="checkAll" type="checkbox">전체
								동의합니다.</label></td>
					</tr>
					<tr>
						<td><label><input type="checkbox"
								v-model="termsChecked">이용약관 동의(필수)</label></td>
					</tr>
					<tr>
						<td><label><input type="checkbox"
								v-model="privacyChecked">개인정보 수집·이용 동의(필수)</label></td>
					</tr>
					<tr>
						<td><label><input type="checkbox"
								v-model="offerChecked">할인쿠폰 등 혜택/정보 수신 동의(선택)</label></td>
					</tr>
				</table>
				<div style="border-bottom: 1px solid #ccc; padding-top: 25px;"></div>
				<div
					style="text-align: center; margin-top: 50px; padding-bottom: 50px;">
					<button @click="signUp()" class="joinBtn">가입하기</button>
				</div>

			</div>
		</div>
	</section>


	<footer>
		<%@include file="main(footer).html"%>
	</footer>
</body>

</html>
<script type="text/javascript">
	var app = new Vue(
			{
				el : '#app',
				data : {
					timer : 30,
					// 타이머 인터벌 객체
					timerInterval : null,
					flg : false,
					aut : "",
					hello : "",
					flg2 : false,
					businessNo : "",
					businessId : "",
					businessPwd : "",
					businessPwd2 : "",
					businessName : "",
					businessRename : "",
					phone : "",
					businessEmail : "",
					businessAddr : "",
					businessDetailAddr : "",
					businessBank : "",
					businessDomain : "naver.com",
					businessTempDomain : "",
					businessAccountNum : "",
					oldAddr : "",
					newAddr : "",
					latitude : "",
					longitude : "",
					checkFlg : false,
					valid : true,
					valid2 : true,
					bizNumFlg : false,
					emailFlg : false,
					emailAddrFlg : false,
					emailList : [],
					bankList : [],
					allChecked : false,
					termsChecked : false,
					privacyChecked : false,
					offerChecked : false
				},
				methods : {
					fnEmailList : function() {
						var self = this;
						var nparmap = {};
						$.ajax({
							url : "email-list.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								self.emailList = data.emailList;
								self.bankList = data.bankList;
							}
						});
					},
					emailChange : function() {
						var self = this;
						self.emailFlg = false;
					},
					fnEmailInputOnOff : function() {
						var self = this;
						self.emailChange();
						if (self.businessDomain == "") {
							self.emailAddrFlg = true;
						} else {
							self.emailAddrFlg = false;
						}
					},
					fnSmsTest : function() {
						var self = this;
						if (self.phone == "") {
							alert("휴대폰번호를 입력해주세요.");
							return;
						}
						self.flg = !self.flg;
						var nparmap = {};
						$.ajax({
							url : "send-one",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								if (data.response.statusCode == '2000') {
									alert("문자 전송 완료");
									console.log(data.number);
									self.aut = data.number;
									// 타이머 시작
									self.startTimer();
								} else {
									alert("문자 전송 실패");
								}
								console.log(data);
							}
						});
					},
					authentication : function() {
						var self = this;
						if (self.hello == self.aut && self.timer > 0) {
							alert("인증완료");
							self.flg = !self.flg;
							self.flg2 = !self.flg2;
							var inputElement = document
									.getElementById("phoneNum");
							inputElement.setAttribute("disabled", "disabled");
							inputElement.style.backgroundColor = "#f2f2f2";
						} else if (self.timer <= 0) {
							alert("시간초과");
							location.reload(true);
						} else {
							alert("인증실패");
							location.reload(true);
						}
					},
					startTimer : function() {
						var self = this;
						self.timerInterval = setInterval(function() {
							self.timer--; // 1초마다 타이머 감소
							if (self.timer <= 0) {
								clearInterval(self.timerInterval); // 타이머가 0 이하이면 중지
							}
						}, 1000); // 1초 간격으로 실행
					},
					openAddressSearch : function() {
						var self = this;
						new daum.Postcode(
								{
									oncomplete : function(data) {
										console.log(data);
										console.log(data.jibunAddress);
										console.log(data.roadAddress);
										self.businessAddr = data.address;
										self.oldAddr = data.jibunAddress != "" ? data.jibunAddress
												: data.autoJibunAddress;
										self.newAddr = data.roadAddress;
										self
												.convertAddressToCoordinates(data.address);
									}
								}).open();
					},
					business : function() {
						var self = this;
						if (!self.businessNo) {
							alert("사업자등록번호를 입력해주세요");
							return;
						}
						var data = {
							"b_no" : [ self.businessNo ]
						};
						$
								.ajax({
									url : "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=aaOkWYW43tLVfKTxrCfvJwGJrsAd0D%2B2r37HcFJW0r3nBEFJaoalBB3sAgMYk6I5Jxe8dz%2BbsGzMBlb6nMfUKQ%3D%3D", // serviceKey 값을 xxxxxx에 입력
									type : "POST",
									data : JSON.stringify(data), // json 을 string으로 변환하여 전송
									dataType : "JSON",
									contentType : "application/json",
									accept : "application/json",
									success : function(result) {
										console.log(result);
										if (result.match_cnt == 1) {
											alert("확인되었습니다.");
											var inputElement = document
													.getElementById("businessNum");
											inputElement.setAttribute(
													"disabled", "disabled");
											inputElement.style.backgroundColor = "#eee";
											self.bizNumFlg = !self.bizNumFlg;
										} else {
											alert("등록되지 않은 사업자등록번호입니다.");
										}
									},
									error : function(result) {
										console.log(result.responseText); //responseText의 에러메세지 확인
									}
								});
					},
					convertAddressToCoordinates : function(addr) {
						var self = this;
						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						var callback = function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								console.log(result);
								console.log(status);
								console.log("위도:" + result[0].y);
								console.log("경도:" + result[0].x);
								self.latitude = result[0].y;
								self.longitude = result[0].x;
								console.log(self.latitude);
								console.log(self.longitude);
								console.log(self.oldAddr);
								console.log(self.newAddr);
							}
						};
						geocoder.addressSearch(addr, callback);
					},
					idCheck : function() {
						var self = this;
						var nparmap = {
							bizId : self.businessId
						};
						$.ajax({
							url : "idCheck.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								if (data.result == "success") {
									self.checkFlg = true;
								} else {
									self.checkFlg = false;
								}
							}
						});
					},
					emailCheck : function() {
						var self = this;
						var nparmap = {
							email : self.businessEmail + "@"
									+ self.businessDomain
						};
						$.ajax({
							url : "emailCheck.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								if (data.result == "success") {
									alert("사용 가능한 이메일입니다.");
									self.emailFlg = true;
								} else {
									alert("사용 중인 이메일입니다.");
									self.emailFlg = false;
								}
							}
						});
					},
					validatePassword : function() {
						// 정규식 패턴
						var pattern = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9]).{8,}$/;

						// 비밀번호 검증
						if (pattern.test(this.businessPwd)) {
							this.valid = true; // 유효한 비밀번호
						} else {
							this.valid = false; // 유효하지 않은 비밀번호
						}
					},
					validatePassword2 : function() {
						var self = this;
						if (self.businessPwd == self.businessPwd2) {
							self.valid2 = true;
						} else {
							self.valid2 = false;
						}
					},
					checkAll() {
			            if (this.allChecked) {
			                this.termsChecked = true;
			                this.privacyChecked = true;
			                this.offerChecked = true;
			            } else {
			                this.termsChecked = false;
			                this.privacyChecked = false;
			                this.offerChecked = false;
			            }
			        },
					signUp : function() {
						var self = this;
						let domain = self.businessDomain == "" ? self.businessTempDomain
								: self.businessDomain;
						if (!self.businessId || !self.businessPwd
								|| !self.businessNo || !self.businessName
								|| !self.businessRename || !self.businessEmail
								|| !self.phone || !self.businessAddr
								|| !self.businessDetailAddr
								|| !self.businessBank
								|| !self.businessAccountNum || !domain) {
							alert("모두 입력해주세요.");
							return;
						}
						var inputElement = document
								.getElementById("businessNum");
						var inputElement2 = document.getElementById("phoneNum");
						if (!inputElement.hasAttribute('disabled')) {
							alert("사업자등록번호를 확인해주세요.");
							return;
						}
						if (!inputElement2.hasAttribute('disabled')) {
							alert("인증을 완료해주세요.");
							return;
						}
						if (!self.emailFlg) {
							alert("이메일을 확인해주세요.");
							return;
						}
						if (!self.valid || !self.valid2) {
							alert("비밀번호를 확인해주세요.");
							return;
						}
						if (!self.checkFlg) {
							alert("아이디를 확인해주세요.");
							return;
						}
						var nparmap = {
							bizId : self.businessId,
							bizPwd : self.businessPwd,
							bizNo : self.businessNo,
							bizName : self.businessName,
							ownerName : self.businessRename,
							email : self.businessEmail + "@" + domain,
							phone : self.phone,
							newAddr : self.newAddr,
							oldAddr : self.oldAddr,
							detail : self.businessDetailAddr,
							latitude : self.latitude,
							longitude : self.longitude,
							bank : self.businessBank,
							accountNum : self.businessAccountNum
						};
						$.ajax({
							url : "bizSignup.dox",
							dataType : "json",
							type : "POST",
							data : nparmap,
							success : function(data) {
								if (data.result == "success") {
									alert("가입되었습니다.");
									location.reload(true);
								} else {
									alert("다시 시도해주세요.");
									location.reload(true);
								}
							}
						});
					}
				},
				watch: {
			        termsChecked(val) {
			            if (!val) this.allChecked = false;
			        },
			        privacyChecked(val) {
			            if (!val) this.allChecked = false;
			        },
			        offerChecked(val) {
			            if (!val) this.allChecked = false;
			        }
			    },
				computed : {
					timerPlaceholder : function() {
						// 남은 시간을 분과 초로 변환하여 표시
						var minutes = Math.floor(this.timer / 60);
						var seconds = this.timer % 60;
						return minutes + "분 " + seconds + "초";
					}
				},
				created : function() {
					var self = this;
					self.fnEmailList();
				}
			});
</script>