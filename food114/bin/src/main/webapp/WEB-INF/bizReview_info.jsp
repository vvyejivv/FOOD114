<<<<<<< HEAD
Unexpected error.  File contents could not be restored from local history during undo/redo.
=======
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
						<td style="border-top: 2px solid rgba(72, 72, 72);"
							class="event_title">메뉴</td>
						<td
							style="border-top: 2px solid rgba(72, 72, 72); overflow: hidden;"><div
								style="white-space: nowrap; text-overflow: ellipsis; max-width: 900px; overflow: hidden">오아저씨세트</div></td>
					</tr>
					<tr>
						<td class="event_title">별점</td>
						<td style="color: #ffcc00;">★★★☆☆</td>
					</tr>
					<tr>
						<td class="event_title">리뷰 사진</td>
						<td><img src="../img/pizza.JPG"></td>
					</tr>
					<tr>
						<td class="event_title">리뷰 내용</td>
						<td>리뷰 남겨요 존맛탱이네요.</td>
					</tr>
					<tr>
						<td class="event_title">작성자</td>
						<td>아무개</td>
					</tr>
					<tr>
						<td class="event_title">작성일</td>
						<td>2024.03.01</td>
					</tr>
					<tr>
						<td class="event_title">리뷰 답글</td>
						<td>리뷰 답글을 작성해주세요!</td>
					</tr>
				</table>
				<button class="review_button">답글 달기</button>
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
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
