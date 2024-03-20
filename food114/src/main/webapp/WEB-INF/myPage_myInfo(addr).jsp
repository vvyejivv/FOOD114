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
<title>MAIN</title>
<style>
[v-cloak] {
	display: none;
}
</style>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(updatePwd).css">
<body>


	<div id="Container">
		<%@include file="food114_header.jsp"%>
		<section>

			<div style="width: 1420px; display: flex; margin: 0px auto;">
				<%@include file="myPage_header.jsp"%>
				<div id="app" v-cloak>
					<div class="content" style="width: 880px;">
						<h2>
							<a href="javascript:;" style="font-size: 25px; color: #747171;">
								<span style="color: #ff7f00; font-weight: bold;">| </span>MY주소지
								관리
							</a>
						</h2>

						<!-- 모달창 -->
						<div class="modal-backdrop" id="Modal" v-if="modalFlg">
							<div class="modal-content"
								:style="{height: modalType=='phone'&&!phoneCheckFlg&&phoneCheckShow ?'270px':'250px'}">
								<h2 v-html="modalTitle">이름 변경</h2>
								<p style="color: #888; margin-top: none;" v-html="modalText">변경할
									주소를 입력해주세요.</p>
								<input class="modalInput" v-model="changeNewAddr"
									type="text" placeholder="주소" style="margin-left: 90px;"
									disabled>
								<button @click="changeAddressSearch()" class="btn-modify"
									style="margin: 0px; width: auto;">주소조회</button>
								<input class="modalInput" v-model="changeDetail" type="text"
									placeholder="상세 주소를 입력해주세요" style="margin-left: 10px;">


								<input style="text-align: left;" class="modalInput"
									v-model="changePhone" type="text" placeholder="연락처"
									style="width: 200px"> <input class="modalInput"
									v-model="changeRequest" type="text" placeholder="배송 요청 사항">
								<div>
									<button class="modalButton"
										@click="fnUpdate()">저장</button>
									<button class="modalCancel" @click="cancelModal">닫기</button>
								</div>
							</div>
						</div>

						<div>
							<div class="table" v-for="(info,index) in list"
								style="margin-bottom: 10px;">
								<div style="border: 1px solid #c2bfbf; padding: 10px;">
									<div
										style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;">
										| {{info.addrAs}} <span v-if="info.defaultYn=='Y'">(기본
											주소지)</span>
									</div>
									<div class="row">
										<div class="cell1">주소</div>
										<div class="cell2">{{info.newAddr}}, {{info.detail}}</div>
									</div>
									<div class="row">
										<div class="cell1">휴대폰번호</div>
										<div class="cell2">{{info.phone}}</div>
									</div>
									<div class="row" style="border-bottom: 1px solid #ccc">
										<div class="cell1">배송요청사항</div>
										<div class="cell2">{{info.request}}</div>
									</div>

									<div class="addrSelectDiv">
										<button @click="setDefaultAddr(info.addrNo)"
											class="addrSelect" style="display: inline;">기본주소지 설정</button>
										<button @click="openModal(index)" class="addrUpdate"
											style="display: inline;">수정</button>
										<button @click="selectDelAddr(info.addrNo)" class="addrRemove"
											style="display: inline;">삭제</button>
									</div>
								</div>
							</div>
							<div class="row">
								<button @click="toggleTable" class="buttonSubmit"
									style="margin-left: 400px;">추가</button>
							</div>
						</div>
						<br>
						<div v-if="showTable"
							style="border-top: 1px solid #c2bfbf; overflow-y: auto; max-height: 500px;">
							<div>
								<div class="table" style="margin-bottom: 10px;">
									<div style="border: 1px solid #c2bfbf; padding: 10px;">
										<div
											style="color: #555454; font-weight: bold; font-size: 17px; margin-bottom: 5px;">
											| <input v-model="inputAddrAs" type="text"
												placeholder="별칭을 입력해주세요">
										</div>
										<!-- <div class="row" style="border-top: none;">
									<div class="cell1">받는사람</div>
									<div class="cell2"><input type="text" placeholder="입력란(가칭)"></div>
								</div> -->
										<div class="row">
											<div class="cell1">주소</div>
											<div class="cell2">
												<input type="text" v-model="inputAddr"
													size="30px;" style="background-color: white;"
													placeholder="주소" disabled> <input
													v-model="inputDetail " type="text" size="20px;"
													placeholder="상세 주소를 입력해주세요" style="margin-right: 140px;">
												<button @click="inputAddressSearch()" class="btn-modify"
													style="margin: 0px; width: auto;">주소조회</button>
											</div>
										</div>
										<div class="row">
											<div class="cell1">휴대폰번호</div>
											<div class="cell2">
												<input v-model="inputPhone" type="text" size="30px;"
													placeholder="연락처를 입력해주세요">
											</div>
										</div>
										<div class="row" style="border-bottom: 1px solid #ccc">
											<div class="cell1">배송요청사항</div>
											<div class="cell2">
												<input v-model="inputRequest" type="text" size="70px;"
													placeholder="배송 요청 사항을 입력해주세요">
											</div>
										</div>
										<div class="addrSelectDiv">
											<button @click="" class="addrSelect" style="display: inline;">기본주소지
												설정</button>
										</div>
									</div>
								</div>
								<div class="row">
									<button @click="fnSubmit" class="buttonSubmit"
										style="margin-left: 400px;">새주소 추가</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<%@include file="food114_footer.jsp"%>
	</div>
</body>

</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			info : {},
			sessionId : "${sessionId}",
			showTable : false,
			inputAddrAs : '',
			inputAddr : '',
			inputDetail : '',
			inputPhone : '',
			inputRequest : '',
			modalTitle : "",
			modalText : "",
			modalType : "",
			changeValue : "",
			changeNewAddr : "",
			changeOldAddr : "",
			changeDetail : "",
			changePhone : "",
			changeRequest : "",
			changeAddrNo : "",
			modalFlg : false,
			addrNo : '',
			updateFlg : false,
			selectedAddr : {},

		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
				};
				$.ajax({
					url : "myInfoAddr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
						console.log(self.list);
					}
				});
			},
			toggleTable : function() {
				var self = this;
				self.showTable = !self.showTable;
			},
			setDefaultAddr : function(addrNo) {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
					addrNo : addrNo
				};
				$.ajax({
					url : "myInfoAddrListYn.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("기본 주소지로 변경되었습니다.");
							location.reload();
							return;
						} else {
							alert("오류가 발생하였습니다.");
						}
						self.info = data.info;
						console.log(data.info);
					}
				});
			},
			// 수정 클릭시 오픈 모달창
			openModal : function(idx) {
				var self = this;
				var selectAddrInfo = self.list[idx];
				console.log("선택하신 주소는 list["+idx+"] 입니다")
				console.log(self.list[idx].newAddr);	
				console.log(self.list[idx].detail);
				console.log(self.list[idx].phone);
				console.log(self.list[idx].request);
				console.log(self.selectedAddr);
				
				self.changeNewAddr = self.list[idx].newAddr;
				self.changeOldAddr = self.list[idx].oldAddr;
				self.changeAddrNo = self.list[idx].addrNo;
				self.changeDetail = self.list[idx].detail;
				self.changePhone = self.list[idx].phone;
				self.changeRequest = self.list[idx].request;
				
				
				self.modalFlg = true;
				
			},
			// 해당 주소의 위도 경도 구하기
			convertAddressToCoordinates : function(addr) {
				var self = this;
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				var callback = function(result, status) {
					if (status === kakao.maps.services.Status.OK) {								
						self.info.latitude = result[0].y;
						self.info.longitude = result[0].x;								
					}
				};
				geocoder.addressSearch(addr, callback);
			},
			//주소조회 : 수정 api 
			changeAddressSearch : function() {
				var self = this;
				new daum.Postcode({
					oncomplete : function(data) {
						self.changeOldAddr = data.jibunAddress;
						self.changeNewAddr = data.roadAddress;
						self.convertAddressToCoordinates(data.address);
					}
				}).open(()=>{});
			},
			//주소조회 : 추가 api
			inputAddressSearch : function() {
				var self = this;
				new daum.Postcode({
					oncomplete : function(data) {
					/* self.selectedAddr = data.address; */
						console.log(data);
						self.inputAddr = data.address;
						
						self.selectedAddr.oldAddr = data.jibunAddress;
						self.selectedAddr.newAddr = data.roadAddress;
						self.convertAddressToCoordinates(data.address);
					}
				}).open(()=>{});
			},
			/* 모달창 닫기 */
			cancelModal : function() {
				var self = this;
				self.modalFlg = false;
				self.changeValue = "";
				self.phoneCheckShow = false;
				self.phoneCheckFlg = false;
				self.phoneCheckText = "";
			},
			fnSubmit : function(info) {
				var self = this;
			
				 if(!self.inputAddrAs){
					alert("별칭을 입력해주세요");
					return;
				}
				if(!self.inputAddr){
					alert("주소를 입력해주세요");
					return;
				}
				if(!self.inputPhone){
					alert("연락처를 입력해주세요");
					return;
				}
				
				var addrCount = self.list.length;
				if(addrCount >= 5){
					alert("주소는 최대 5개까지만 등록할 수 있습니다.");
					return;
				}
				
				var nparmap = {
					userId : self.sessionId,
					addrAs : self.inputAddrAs,
					oldAddr : self.selectedAddr.oldAddr,
					newAddr : self.selectedAddr.newAddr,
					detail : self.inputDetail,
					phone : self.inputPhone,
					request : self.inputRequest
				};
				$.ajax({
					url : "insertAddr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("주소가 추가 되었습니다.");
							return location.href = "/food114-myPage-addr.do";
						} else {
							alert("오류가 발생하였습니다.");
						}
						self.info = data.info;
						console.log(data.info);
					}
				});
			},
			fnUpdate : function() {
				var self = this;
				/* map["userId"] = self.info.userId;
				map["userId"] = self.sessionId;
				map["addrNo"] = self.addrNo; */
				

				var nparmap = {
						userId : self.sessionId,
						addrAs : self.changeAddrAs,
						oldAddr : self.changeOldAddr,
						newAddr : self.changeNewAddr,
						detail : self.changeDetail,
						phone : self.changePhone,
						request : self.changeRequest,
						addrNo : self.changeAddrNo
					};
				
				if(!self.changeNewAddr){
					alert("주소를 입력해주세요");
					return;
				}
				if(!self.changePhone){
					alert("연락처를 입력해주세요");
					return;
				}
				
				$.ajax({
					url : "updateAddr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("정보가 수정되었습니다");
							self.cancelModal();
							self.fnList();
							location.reload();
						} else {
							alert("실패");
						}
					}
				});
			},
			selectDelAddr : function(addrNo) {
				var self = this;
				var nparmap = {
					userId : self.sessionId,
					addrNo : addrNo
				};
				$.ajax({
					url : "deleteAddr.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("주소가 삭제 되었습니다.");
							return location.href = "/food114-myPage-addr.do";
						} else {
							alert("오류가 발생하였습니다.");
						}
						self.info = data.info;
						console.log(data.info);
					}
				});
			},
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>
