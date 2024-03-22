<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>사장님 페이지</title>
<link rel="stylesheet" href="../css/food114.css">
<link rel="stylesheet" href="../css/order_biz.css">
</head>
<body>
	<div id="Container">
		<%@include file="food114_header(biz).jsp"%>
	<section>
	
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">주문 관리/현황&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<div>
					<table class="order">
						<tr>
							<th
								style="width: 30px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								번호</th>
							<th
								style="width: 150px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								메뉴</th>
							<th
								style="width: 80px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								주문 상태</th>	
							<th
								style="width: 300px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								리뷰 내용</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성자</th>
							<th
								style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성일</th>
						</tr>
						<tr>
							<td>1</td>
							<td>오아저씨세트</td>
							<td>준비중</td>
							<td>리뷰 남겨요 존맛탱이네요.</td>
							<td>아무개</td>
							<td>2024.03.01</td>
						</tr>
						<tr>
							<td>1</td>
							<td>오아저씨세트</td>
							<td>배달중</td>
							<td>리뷰 남겨요 존맛탱이네요.</td>
							<td>아무개</td>
							<td>2024.03.01</td>
						</tr>
						<tr>
							<td>1</td>
							<td>오아저씨세트</td>
							<td>준비중</td>
							<td>리뷰 남겨요 존맛탱이네요.</td>
							<td>아무개</td>
							<td>2024.03.01</td>
						</tr>
						<tr>
							<td>1</td>
							<td>오아저씨세트</td>
							<td>배달 완료</td>
							<td>리뷰 남겨요 존맛탱이네요.</td>
							<td>아무개</td>
							<td>2024.03.01</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
	</section>

		<%@include file="food114_header(biz).jsp"%>
	</div>

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