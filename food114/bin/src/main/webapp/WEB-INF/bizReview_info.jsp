<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
<link rel="stylesheet" href="../css/review_info_biz.css">
</head>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">리뷰&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<table class="review_info_table">
					<tr>
						<th>메뉴</th>
						<td>오아저씨세트</td>
					</tr>
					<tr>
						<th>별점</th>
						<td>★★★☆☆</td>
					</tr>
					<tr>
						<th>리뷰 내용</th>
						<td>리뷰 남겨요 존맛탱이네요.</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>아무개</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>2024.03.01</td>
					</tr>
					<tr>
						<th>답글</th>
						<td>감사합니다!</td>
					</tr>
				</table>
			</div>
		</div>
	</section>

	<%@include file="main(footer).html"%>

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
