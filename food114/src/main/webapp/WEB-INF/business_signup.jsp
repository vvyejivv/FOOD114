<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/business-signup.css">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<script type="text/javascript"
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<title>Document</title>
</head>
<body>
	<div id="app">
		<header>
			<div id="container" style="height: 50px;">
				<div id="logo">
					<img src="../img/logo.png" class="logo">
				</div>
				<div id="status">
					<a class="buttonBox">로그인 </a> <a class="join"> 회원가입 </a> <a
						class="join"> 사장님사이트 </a>
				</div>
			</div>
			<!-- menuBar -->
			<div id="menuBar">
				<div id="container" class="menuBar">
					<a class="menu">메뉴 </a> <a class="menu">지도로 찾기</a> <a class="menu">우리동네</a>
					<a class="menu">이벤트</a> <a class="menu">고객지원</a>
				</div>
			</div>
		</header>
		<!-- 광고창 -->
		<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
		<section>
			<div class="container">
				<div>
					<h2 style="color: #ff7f00; text-align: center;">회원가입</h2>
					사업자등록번호 <input id="businessNum" type="text"
						placeholder="'-' 제외 숫자 10자리 입력" v-model="businessNo">
					<button @click="business()">사업자등록번호 조회</button>
				</div>
				<div>
					사업자아이디 <input type="text" placeholder="입력해 주세요"
						v-model="businessId">
					<button @click="">중복체크</button>
				</div>
				<div>
					비밀번호 <input type="text" placeholder="입력해 주세요" v-model="businessPwd">
				</div>
				<div>
					비밀번호 확인 <input type="text" placeholder="입력해 주세요"
						v-model="businessPwd2">
				</div>
				<div>
					상호명 <input type="text" placeholder="입력해 주세요" v-model="businessName">
				</div>
				<div>
					대표자명 <input type="text" placeholder="입력해 주세요"
						v-model="businessRename">
				</div>
				<div>
					전화번호 <input id="phoneNum" type="text" placeholder="'-' 제외 입력"
						v-model="phone">
					<button id="success" v-if="!flg2" @click="fnSmsTest()">인증
						요청</button>
				</div>
				<div v-if="flg">
					<input type="text" v-model="hello" :placeholder="timerPlaceholder">
					<button @click="authentication()">인증</button>
				</div>
				<div>
					이메일 <input type="email" placeholder="입력해 주세요"
						v-model="businessEmail">
				</div>
				<div>
					사업자 소재지 <input id="addressInput" type="text" placeholder="입력해 주세요"
						v-model="businessAddr">
					<button style="margin-bottom: 10px;" @click="openAddressSearch()">주소
						조회</button>
					<input type="text" placeholder="(필수)상세 주소를 입력해 주세요"
						v-model="businessDetailAddr">
				</div>
				<div>
					입금은행 <select v-model="businessBank">
						<option value="">은행을 선택하세요</option>
						<option value="kb">국민은행</option>
						<option value="sh">신한은행</option>
						<option value="wr">우리은행</option>
						<option value="hn">하나은행</option>
						<option value="nh">농협은행</option>
						<option value="ibk">기업은행</option>
						<!-- 필요한 만큼 은행 옵션을 추가하세요 -->
					</select>
				</div>
				<div>
					입금계좌번호 <input type="text" placeholder="'-' 제외 입력"
						v-model="businessAccountNum">
				</div>
				<button @click="signUp()">가입하기</button>
			</div>
		</section>
		<footer>
			<div class="footerImg">
				<img src="../img/logo_gray.png">
			</div>
			<div style="float: right; padding-right: 50px;">가맹점 문의</div>
			<div style="clear: both; font-size: 12px;">
				<div>주소 : 인천광역시 부평구 경원대로 1366(부평동. 스테이션타워 7F)</div>
				<div>
					대표이사 : 박경빈 <span class="partition"> | </span>사업자등록번호 :
					010-6382-4246
				</div>

				<div>
					제휴문의 : djl01@naver.com <span class="partition"> | </span>고객만족센터 :
					1588-****
				</div>
				안심센터 FOOD114 클린리뷰 고객만족센터 1588-****(유료) 24시간, 연중무휴
				<div>호스팅 제공자 : 더조은 FOOD114</div>
			</div>
		</footer>
	</div>
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
					businessAccountNum : "",
					oldAddr : "",
					newAddr : "",
					latitude : "",
					longitude : ""
				},
				methods : {
					fnSmsTest : function() {
						var self = this;
						if (self.phone == "") {
							alert("전화번호를 입력해주세요.");
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
										document.getElementById('addressInput').value = data.address;
										self.convertAddressToCoordinates(data.address);
										self.oldAddr = data.jibunAddress;
										self.newAddr = data.roadAddress;
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
						    }
						};
						geocoder.addressSearch(addr, callback);  
					},
					signUp : function() {
						var self = this;
						var nparmap = {
							bizId : self.businessId,
							bizPwd : self.businessPwd,
							bizNo : self.businessNo,
							bizName : self.businessName,
							ownerName : self.businessRename,
							email : self.businessEmail,
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
								
							}
						});
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
				}
			});
</script>