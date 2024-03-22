<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FOOD114::1:1문의</title>
<!-- <link rel="stylesheet" href="main.css"> -->
<style>
body {
	margin: 0px;
}

table {
	border-left: none;
	border-top: 1px solid #c0c0c0;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #c0c0c0;
	border-left: none;
	padding: 15px 25px;
	height: 30px;
	color: (72, 72, 72);
}

th:first-child, td:first-child {
	border-left: none;
}

.container {
	width: 800px;
	margin: 0 auto;
	padding: 10px;
}

.container table th {
	background-color: #f9f9f9;
	color: #555353;
}

.container thead {
	float: left;
}

.container thead tr, th {
	display: block;
}

.container table tbody {
	display: block;
	overflow: hidden;
	white-space: nowrap;
}

.container table tbody tr, td {
	display: block;
}

header {
	height: 100px;
	padding: 10px;
}

#logo {
	float: left;
	margin-top: 20px;
}

.logo {
	width: 200px;
}

#status {
	float: right;
	width: 500px;
	height: 50px;
	margin-top: 25px;
}

footer {
	background-color: antiquewhite;
	padding-top: 15px;
	display: flex;
	align-items: center;
}

.partition {
	color: #ccc;
	font-size: 20px;
}

.sidebar {
	margin: 10px;
	width: 200px;
	height: 800px;
	padding: 10px;
}

a {
	font-size: 15px;
	text-decoration: none;
	color: #333;
}

.content {
	margin: 10px;
	padding: 5px;
	width: 800px;
	/* border: 1px solid black; */
}

input[type="text"] {
	border: none;
	border-bottom: 1px solid #ccc;
	padding: 5px;
}

input[type='text']:focus {
	outline: none;
}

textarea:focus {
	outline: none;
}

textarea {
	border: none;
	resize: none;
	/* border-left: 1px solid #ccc; */
}

select {
	width: 100px;
}

button {
	background-color: #ff7f00;
	color: white;
	border: none;
	border-radius: 4px;
	width: 70px;
	height: 40px;
	margin: 5px;
	cursor: pointer;
}

input[type="file"] {
	display: none;
}

/* 사용자 정의된 파일 업로드 버튼의 스타일 */
.custom-file-upload {
	background-color: #ff7f00;
	color: white;
	border: none;
	border-radius: 4px;
	width: 70px;
	height: 40px;
	line-height: 40px;
	/* 버튼 텍스트를 가운데 정렬 */
	text-align: center;
	cursor: pointer;
	display: inline-block;
	font-size: 14px;
	text-align: center;
}

/* 파일 업로드 버튼을 감싸는 라벨 스타일 */
.custom-file-upload-label {
	border-radius: 4px;
	display: inline-block;
	cursor: pointer;
}

select {
	border: none;
	border-bottom: 1px solid #ccc;
	cursor: pointer;
	padding: 4px;
	width: 130px;
}

.span {
	font-size: 14px;
	color: #979696c9;
}
</style>
</head>

<body>
	<div id="Container">
		<%@include file="food114_header(biz).jsp"%>

		<!-- 광고창 -->
		<!--
        <div class="ad">
            광고창
            <button class="adClose">x</button>
        </div>
    -->
		<section>
			<div id="app">
				<div class="container">
					<div class="content">
						<br>
						<h2>
							<span style="color: rgb(95,95,95); font-weight: bold;">| </span><span
								style="text-align: left; color: rgba(72, 72, 72);">고객정보 및
								문의사항 <span class="span">도움이 필요하신가요. 자유롭게 문의해주세요.</span>
							</span>
						</h2>
						<div>
							<table>
								<thead>
									<tr>
										<th>문의분류</th>
										<th>이름</th>
										<th>이메일</th>
										<th>연락처</th>
										<th>답변요청</th>
										<th>제목</th>
										<th style="height: 300px;">문의사항</th>
										<th>파일선택</th>
									</tr>
								<thead>
									<tr>
										<td><select v-model="selectFirst" @change="updateSecond">
												<option value="선택하세요.">선택하세요.</option>
												<option value="상품문의">상품문의</option>
												<option value="배달/포장 문의">배달/포장 문의</option>
												<option value="환불/취소 문의">환불/취소 문의</option>
										</select> &nbsp;&nbsp; <select v-model="selectedSecond">
												<option v-for="category in second" :value="category">{{category}}</option>
										</select></td>



										<td><input type="text" size="20"></td>
										<td><input type="text" size="20"> @ <input
											type="text" v-model="emailAddr"> <select
											v-model="emailAddr"> &nbsp;
												<option value="">선택하세요</option>
												<option value="naver.com">naver.com</option>
												<option>google.com</option>
												<option>hanmail.net</option>
												<option>nate.com</option>
												<option>kakao.com</option>
												<option>man.com</option>
												<option value="">직접입력</option>
										</select></td>
										<td><select>
												<option>010</option>
												<option>011</option>
												<option>02</option>
												<option>031</option>
										</select>&nbsp; - &nbsp;<input type="text" size="5">&nbsp; -
											&nbsp;<input type="text" size="5"></td>
										<td><input type="radio" checked> 이메일 <input
											type="radio"> 전화</td>
										<td><input type="text" size="80" v-model="title">
										</td>
										<td style="height: 300px;"><vue-editor v-model="contents"></vue-editor>
											<textarea rows="15" cols="85" placeholder="내용을 입력하세요."></textarea>
										</td>
									</tr>
									<tr>
										<td><label class="custom-file-upload-label" for="file1">

												<input type="file" id="file1" name="file1"
												accept=".jpg,.png,.gif"> <span
												class="custom-file-upload"
												style="margin-top: -5px; background-color: #f9f9f9; color: rgb(72, 72, 72); border: 1px solid #ccc;">업로드</span>

										</label></td>
										<!-- <td width="80%"><input type="file" id="file1" name="file1" accept=".jpg , .png, .gif"></td> -->
									</tr>
							</table>

							<div style="text-align: center; margin-top: 5px;">
								<button @click="fnInsert">문의하기</button>
								<button @click="fnRemove"
									style="background-color: #f9f9f9; color: rgb(72, 72, 72); border: 1px solid #ccc;">취소</button>
							</div>
						</div>
					</div>
				</div>
		</section>

		<%@include file="food114_footer(biz).jsp"%>
	</div>
</body>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			userId : "${userId}",
			kind : "${map.kind}",
			title : "",
			contents : "",
			emailAddr : "",
			selectFirst : '',
			selectSecond : '',
			second : []
		},
		methods : {
			fnInsert : function() {
				var self = this;
				var nparmap = {
					userId : self.userId,
					title : self.title,
					contents : self.contents,
					kind : self.kind
				};
				$.ajax({
					url : "boardInsert.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						if (data.result == "success") {
							alert("작성되었음");
						} else {
							alert("오류 발생");
						}
					}
				});
			},
			upload : function(form) {
				var self = this;
				console.log(form);
				$.ajax({
					url : "/fileUpload.dox",
					type : "POST",
					processData : false,
					contentType : false,
					data : form,
					success : function(response) {

					}
				});
			},
			fnRemove : function() {
				location.href = "/food114-biz-notice.do";
			},
			updateSecond : function() {
				switch (this.selectedFirst) {
				case '상품문의':
					this.second = [ '상품' ];
					break;
				case '배달/포장문의':
					this.second = [ '배달/포장' ];
					break;
				case '환불/취소문의':
					this.second = [ '환불/취소' ];
					break;
				default:
					this.second = [];
					break;
				}
			}

		},
		created : function() {
			var self = this;
		}
	});
</script>