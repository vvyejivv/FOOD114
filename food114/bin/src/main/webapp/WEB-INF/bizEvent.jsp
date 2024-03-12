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
<link rel="stylesheet" href="../css/event_biz.css">
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
						style="text-align: left; color: rgba(72, 72, 72);">이벤트&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<table class="event">
					<tr>
						<th
							style="width: 40px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							번호</th>
						<th
							style="width: 110px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							이벤트 종류</th>
						<th
							style="width: 180px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							이벤트 내용</th>
						<th
							style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							이벤트 상태</th>	
						<th
							style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							작성일</th>
						<th
							style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							관리</th>
					</tr>
					<tr>
						<td>1</td>
						<td>우리동네</td>
						<td>우리동네 첫 오픈 이벤트!</td>
						<td>종료</td>
						<td>2024.03.01</td>
						<td><button class="event-detail">자세히</button></td>
					</tr>
					<tr>
						<td>2</td>
						<td>리뷰 이벤트</td>
						<td>리뷰 작성 약속시 서비스!</td>
						<td>종료</td>
						<td>2024.03.01</td>
						<td><button class="event-detail">자세히</button></td>
					</tr>
					<tr>
						<td>3</td>
						<td>우리동네</td>
						<td>우리동네 돌발 이벤트!</td>
						<td>진행중</td>
						<td>2024.03.01</td>
						<td><button class="event-detail">자세히</button></td>
					</tr>
					<tr>
						<td>4</td>
						<td>리뷰 이벤트</td>
						<td>찜, 리뷰, 사진 작성시 서비스!</td>
						<td>상시 이벤트</td>
						<td>2024.03.01</td>
						<td><button class="event-detail">자세히</button></td>
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
>>>>>>> branch 'YEJI' of https://github.com/dlehdwo01/TeamProject1-FOOD114.git
