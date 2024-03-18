<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/food114.css">
<title>로그인</title>
</head>
<style>
.inputBox {
	width: 1000px;
	height: 150px;
	margin-top: 13px;
	border: 1px solid #ddd;
	border-radius: 2px;
	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
}

input:focus {
	outline: none; /* 포커스시 생기는 기본적인 아웃라인을 제거합니다. */
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

.inputBox .inputDiv {
	margin: 15px 0 15px 20px;
	font-weight: bold;
}

.menu_input {
	width: 700px;
	height: 30px;
	margin-top: 5px;
	margin-left: 20px;
	border: 1px solid #ddd;
	border-radius: 2px;
}

.menu_input::placeholder {
	padding-left: 10px;
	font-size: 12px;
	color: #ccc;
}

.type_limit {
	display: inline-block;
	width: 65px;
	background-color: #ddd;
	height: 32px;
	border: 1px solid #ddd;
	border-radius: 2px;
	font-size: 12px;
	text-align: center;
	line-height: 34px;
	color: #aaa;
	margin-left: -7px;
}

.nameInfo {
	font-size: 12px;
	color: #aaa;
	margin-top: 5px;
	margin-left: 20px;
}

.cateBtn {
	border: 1px solid #ddd;
	border-radius: 2px;
	margin-top: 5px;
	margin-left: 20px;
	margin-bottom: 10px;
	background-color: #ffffff; /* 버튼 배경색 (흰색) */
	border: 1px solid #2196F3; /* 버튼 테두리 (파란색) */
	color: #2196F3; /* 텍스트 색상 (파란색) */
	padding: 2px 4px; /* 내부 여백 */
}

.subCateBtn {
	border: 1px solid #ddd;
	border-radius: 2px;
	margin-top: 5px;
	background-color: #fff;
	padding: 2px 4px;
	margin-left: -3px;
}

.cate_input {
	width: 735px;
	height: 30px;
	margin-top: 5px;
	margin-left: -5px;
	border: 1px solid #ddd;
	border-left: none;
	border-top-right-radius: 2px;
	border-bottom-right-radius: 2px;
}

.cate_input::placeholder {
	padding-left: 3px;
	font-size: 12px;
	color: #ccc;
}

button img {
	width: 13px;
	height: 13px;
	margin-left: 5px;
}

.searchIcon {
	height: 34px;
	border: 1px solid #ddd;
	border-right: none;
	border-top-left-radius: 2px;
	border-bottom-left-radius: 2px;
	background-color: #fff;
	margin-left: 20px;
}

.mod_input {
	width: 765px;
	height: 30px;
	margin-top: 30px;
	margin-left: 20px;
	border: 1px solid #ddd;
	border-radius: 2px;
}

.mod_input::placeholder {
	padding-left: 10px;
	font-size: 12px;
	color: #ccc;
}

.file_input {
	width: 629px;
	height: 30px;
	margin-top: 30px;
	margin-left: 20px;
	border: 1px solid #ddd;
	border-radius: 2px;
}

.file_input::placeholder {
	padding-left: 10px;
	font-size: 12px;
	color: #ccc;
}

.menuTempImg {
	width: 120px;
	margin-left: 20px;
	heigth:30px;
	margin-right:13px;
}

.menuImg {
	width: 120px;
	height: 80px;
	margin-left: 20px;
	object-fit:contain;
}
</style>
<body>
	<div id="Container">
	<%@include file="food114_header.jsp"%>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
    <section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">상품수정&nbsp;</span>
				</h2>
				<div class="inputBox">
					<div class="inputDiv">
						메뉴 이름<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<input type="text" v-model="menuView.menu" class="menu_input"
						placeholder="상품명을 입력해 주세요">
					<div v-if="menuView.menu" class="type_limit">{{menuView.menu.length}}/100</div>
					<div class="nameInfo">판매 상품과 직접 관련이 없는 상품명은 관리자에 의해 변경될 수
						있습니다.</div>
				</div>
				<div class="inputBox">
					<div class="inputDiv">
						가격<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<input type="text" v-model="menuView.price" class="mod_input"
						placeholder="가격 입력">
				</div>
				<div class="inputBox">
					<div class="inputDiv">
						메뉴 설명(소개)<small><small style="color: #ff7f00;"> ＊
						</small></small>
					</div>
					<input type="text" v-model="menuView.menuInfo" class="mod_input"
						placeholder="메뉴 설명(소개) 입력">
				</div>
				<div class="inputBox" hidden>
					<div class="inputDiv">
						원산지<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<input type="text" class="mod_input" placeholder="원산지 입력" disabled>
				</div>
				<div class="inputBox" hidden>
					<div class="inputDiv">
						메뉴 옵션<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<input type="text" class="mod_input" placeholder="메뉴 옵션 입력"
						disabled>
				</div>
				<div class="inputBox">
					<div class="inputDiv">
						판매 상태<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<select v-model="menuView.status" class="mod_input">
						<option value="0">판매중</option>
						<option value="1">판매종료</option>
						<option value="3">품절</option>
					</select>
				</div>
				<div class="inputBox">
					<div class="inputDiv">
						메뉴 사진<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<div :style="{display : !src ? 'block' : 'flex'}">
					<img
						:src="src" :class="!src ? 'menuTempImg' : 'menuImg'"
						alt="이미지 미등록"> <input @change="fnBizFileView" type="file" class="file_input"
						id="file1" name="file1" accept=".jpg, .png, .gif"
						style="color: #ccc; font-size: 12px; line-height: 30px;">
					</div>
				</div>
				<button class="btn-modify" @click="fnMenuUpdate()">정보 변경</button>
			</div>
		</div>
		</section>
	<%@include file="food114_footer.jsp"%>
	</div>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionBizId}",
			menuNo : ${map.menuNo},
			menuView : {},
			src : ""
		},
		methods : {
			fnBizFileView : function(event) {
				var self = this;
				console.log(event);
				var file = event.target.files[0];
				var reader = new FileReader();

				reader.onload = function(e) {
					self.src = e.target.result;
				};
				reader.readAsDataURL(file);
			},
			fnMenuView : function() {
				var self = this;
				var nparmap = {
					menuNo : self.menuNo						
				};
				$.ajax({
					url : "/menuView.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.menuView = data.menuView;
						self.src = data.menuView.filePath + data.menuView.fileName;
					}
				});
			},
			fnMenuUpdate : function(){
				var self = this;
				if(!self.menuView.menu){
	       			alert("메뉴이름을 작성해주세요.");
	       			return;
	       		} else if(!self.menuView.price){
	       			alert("가격을 작성해주세요.");
	       			return;
	       		} else if(!self.menuView.menuInfo){
	       			alert("메뉴설명을 작성해주세요.");
	       			return;
	       		}
				var form = new FormData();
				var fileInput = document.getElementById('file1');
			    if (fileInput.files.length > 0) {
			        // 파일이 선택된 경우에만 FormData에 파일 추가
			        form.append( "file1",  fileInput.files[0] );
			    }
	   	     	form.append( "bizId",  self.sessionId);
	   	     	form.append( "menu",  self.menuView.menu);
	   	     	form.append( "price",  self.menuView.price);
	   	     	form.append( "menuInfo",  self.menuView.menuInfo);
	   	     	form.append( "menuNo",  self.menuNo);
	   	     	form.append( "status",  self.menuView.status);
	   	     	
	   	  		// 파일이 선택되었을 때만 업로드 실행
	   	     	if (fileInput.files.length > 0) {
	   	         	self.upload(form);
	   	         	$.pageChange("/biz-menu-update.do", {});
	   	     	} else {
	   	         	// 파일이 선택되지 않았을 때 다른 동작 수행
	   	         	self.fnSubMenuUpdate();
	   	     	}
	        }
			// 파일 업로드
		    , upload : function(form){
		    	var self = this;
		         $.ajax({
		             url : "/menuUpdate.dox"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { 
		        	   
		           }	           
		       });
			},
			fnSubMenuUpdate : function() {
				var self = this;
				var nparmap = {
					menuNo : self.menuNo,
					bizId : self.sessionId,
					price : self.menuView.price,
					menuInfo : self.menuView.menuInfo,
					menu : self.menuView.menu,
					status : self.menuView.status
				};
				$.ajax({
					url : "/menuUpdateNoFile.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						$.pageChange("/biz-menu-update.do", {});
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnMenuView();
		}
	});
</script>