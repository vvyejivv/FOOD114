<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
</head>
<link rel="stylesheet" href="../css/myPage_myInfo(main).css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

.notosanskr * {
	font-family: 'Noto Sans KR', sans-serif;
}

* {
	font-family: 'Noto Sans KR';
}

.orderListContainer {
	margin: 10px;
	margin-left: 20px;
	width: 1000px;
}

.orderListTable {
	border-left: none;
	border-right: none;
	width: 1000px;
	border-top: 1px solid #c0c0c0;
	border-collapse: collapse;
}

.review_info_table {
	width: 1000px;
	border-collapse: collapse;
}

.event_title {
	font-size: 14px;
	width: 100px;
	min-width: 100px;
	border-right: 1px solid #ccc;
	max-width: 100px;
}

.review_info_table td {
	border-bottom: 1px solid #ccc;
	padding: 15px 25px;
}

[v-cloak] {
	display: none;
}
</style>
<body>

	<header>
		<%@include file="main(header).html"%>
	</header>

	<section>
		<div class="container">
			<%@include file="myPage_header.jsp"%>
			<div class="orderListContainer">
				<div id="app" v-cloak>
					<h2>
						<a href="javascript:;" style="font-size: 25px; color: #747171;">
							<span style="color: #ff7f00; font-weight: bold;">| </span> 리뷰 작성
						</a>
					</h2>
					<table class="review_info_table">
						<tr>
							<td style="border-top: 2px solid rgba(72, 72, 72);"
								class="event_title">메뉴</td>
							<td
								style="border-top: 2px solid rgba(72, 72, 72); overflow: hidden;">
								<div
									style="white-space: nowrap; text-overflow: ellipsis; max-width: 900px; overflow: hidden"></div>
							</td>
						</tr>
						<tr>
							<td class="event_title">별점</td>
							<td style="color: #ffcc00;"><span><!--  v-for="i in 5" :key="i" -->
									<span>★</span> <span> <!-- v-else -->☆</span>
							</span></td>
						</tr>
						<tr>
							<td class="event_title">리뷰 사진</td>
							<td></td>
						</tr>
						<tr>
							<td class="event_title">리뷰 내용</td>
							<td></td>
						</tr>
						<tr>
							<td class="event_title">작성자</td>
							<td></td>
						</tr>
						<tr>
							<td class="event_title">작성일</td>
							<td></td>
						</tr>
						<tr>
							<!-- <td class="event_title">리뷰 답글</td>
							<td v-if="reviewInfo.pContents"><textarea class="reviewText"
									placeholder="리뷰 작성을 해주세요!" v-model="contents"></textarea>
								<button class="addReview">수정</button></td>
							<td v-if="!reviewInfo.pContents"><textarea
									class="reviewText" placeholder="리뷰 작성을 해주세요!"
									v-model="contents"></textarea>
								<button class="addReview">저장</button></td> -->
						</tr>
					</table>
					<button>이전으로</button>
				</div>
			</div>
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