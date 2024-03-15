<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/sideBar_biz.css">
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
	border: 1px solid #ff7f00; /* 버튼 테두리 (파란색) */
	color: #ff7f00; /* 텍스트 색상 (파란색) */
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
	background-color: #ff7f00;
	border: 1px solid #FBCEB1;
	color: #ffffff;
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
	display:inline-block;
	width:65px;
	background-color:#ddd;
	height:32px;
	border: 1px solid #ddd;
	border-radius: 2px;
	font-size: 12px;
	text-align:center;
	line-height:34px;
	color:#aaa;
	margin-left:-7px;
}

.nameInfo {
	font-size: 12px;
	color:#aaa;
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
	background-color:#fff;
	padding: 2px 4px;
	margin-left:-3px;
}

.cate_input {
	width: 735px;
	height: 30px;
	margin-top: 5px;
	margin-left: -5px;
	border: 1px solid #ddd;
	border-left:none;
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
	margin-left:5px;
}

.searchIcon {
	height:34px;
	border: 1px solid #ddd;
	border-right:none;
	border-top-left-radius: 2px;
	border-bottom-left-radius: 2px;
	background-color:#fff;
	margin-left: 20px;
}

.mod_input{
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
[v-cloak] { display: none; }
</style>
<body>
	<%@include file="main(header)_biz.html"%>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section style="height: 850px">
		<%@include file="sideBar_biz.html"%>
		<div id="app" v-cloak>
			<div class="mold" style="width:1050px">
				<h2>
               	<span style="color: #ff7f00; font-weight: bold;">| </span><span
                  style="text-align: left; color: rgba(72, 72, 72);">상품등록&nbsp;</span>
            	</h2>
				<div class="inputBox">
					<div class="inputDiv">
						메뉴 이름<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<input v-model="menu" type="text" class="menu_input" placeholder="상품명을 입력해 주세요">
					<div class="type_limit">{{menu.length}}/100</div>
					<div class="nameInfo">판매 상품과 직접 관련이 없는 상품명은 관리자에 의해 변경될 수 있습니다.</div>
				</div>
				<div class="inputBox" hidden>
					<div class="inputDiv">
						카테고리<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<button class="cateBtn">카테고리 검색</button>
					<button class="subCateBtn">카테고리 선택</button>
					<div>
						<button class="searchIcon">
							<img src="../img/magnifying-glass-gray-solid.png">
						</button>
					<input type="text" class="cate_input" placeholder="카테고리명 입력" disabled>
					</div>
				</div>
				<div class="inputBox">
					<div class="inputDiv">
						가격<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<input v-model="price" type="text" class="mod_input" placeholder="가격 입력">
				</div>
				<div class="inputBox">
					<div class="inputDiv">
						메뉴 설명(소개)<small><small style="color: #ff7f00;"> ＊
						</small></small>
					</div>
					<input v-model="menuInfo" type="text" class="mod_input" placeholder="메뉴 설명(소개) 입력">
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
					<input type="text" class="mod_input" placeholder="메뉴 옵션 입력" disabled>
				</div>
				<div class="inputBox">
					<div class="inputDiv">
						메뉴 사진<small><small style="color: #ff7f00;"> ＊ </small></small>
					</div>
					<input type="file" class="mod_input" id="file1" name="file1" accept=".jpg, .png, .gif" style="color: #ccc; font-size:12px; line-height:30px;">
				</div>
				<button class="btn-modify" @click="fnMenuUpload()">메뉴 등록</button>
			</div>
		</div>
	</section>
	<%@include file="main(footer)_biz.html"%>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionBizId}",
			menu : "",
			price : "",
			menuInfo : ""
		},
		methods : {
			fnMenuUpload : function(){
	       		var self = this;
				var form = new FormData();
				var fileInput = document.getElementById('file1');
			    if (fileInput.files.length > 0) {
			        // 파일이 선택된 경우에만 FormData에 파일 추가
			        form.append( "file1",  fileInput.files[0] );
			    }
			    form.append( "bizId",  self.sessionId);
	   	     	form.append( "menu",  self.menu);
	   	     	form.append( "price",  self.price);
	   	     	form.append( "menuInfo",  self.menuInfo);
	   	     	
	   	  		// 파일이 선택되었을 때만 업로드 실행
	   	     	if (fileInput.files.length > 0) {
	   	         	self.upload(form);
	   	         	$.pageChange("/biz-menu-update.do", {});
	   	     	} else {
	   	         	// 파일이 선택되지 않았을 때 다른 동작 수행
	   	         	self.fnSubMenuUpload();
	   	     	}
	        }
			// 파일 업로드
		    , upload : function(form){
		    	var self = this;
		         $.ajax({
		             url : "/menuUpload.dox"
		           , type : "POST"
		           , processData : false
		           , contentType : false
		           , data : form
		           , success:function(response) { 
		        	   
		           }	           
		       });
			},
			fnSubMenuUpload : function() {
				var self = this;
				var nparmap = {
					bizId : self.sessionId,
					price : self.price,
					menuInfo : self.menuInfo,
					menu : self.menu
				};
				$.ajax({
					url : "/menuUploadNoFile.dox",
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

		}
	});
</script>