<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
<link rel="stylesheet" href="../css/event_info_biz.css">
</head>
<body>
	<header>
		<%@include file="main(header)_biz.html"%>
	</header>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">이벤트&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<table class="event_info_table">
					<tr>
						<th>이벤트 종류</th>
						<td>우리동네</td>
					</tr>
					<tr>
						<th>이벤트 첨부 사진</th>
						<td><img alt="" src="../img/메가커피_이벤트.jpg"></td>
					</tr>
					<tr>
						<th>이벤트 내용</th>
						<td>우리동네 돌발 이벤트!</td>
					</tr>
					<tr>
						<th>이벤트 상태</th>
						<td>진행중</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>2024.03.01</td>
					</tr>
				</table>
				<div>
					<button class="button-detail">수정</button>
					<button class="button-detail">삭제</button>
				</div>
			</div>
		</div>
	</section>

	<%@include file="main(footer)_biz.html"%>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "test.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>
