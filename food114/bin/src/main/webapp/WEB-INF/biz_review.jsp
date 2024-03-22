<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>FOOD114::리뷰관리</title>
<link rel="stylesheet" href="../css/food114.css">
<link rel="stylesheet" href="../css/review_biz.css">
</head>
<style>
[v-cloak] { display: none; }
</style>
<body>
	<div id="Container">
		<%@include file="food114_header(biz).jsp"%>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app" v-cloak>
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold; font-size : 16px;">| </span><span
						style="text-align: left; color: #222222; font-size : 16px;">리뷰&nbsp;</span>
					<span style="font-size: 13px; color:#5F5F5F">여기서 한번에 관리 하세요!</span>
				</h2>
				<div>
					<table class="review">
						<tr style="color: #222222; font-size : 14px;">
							<th
								style="width: 30px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								번호</th>
							<th
								style="width: 110px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								메뉴</th>
							<th
								style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								별점</th>
							<th
								style="width: 180px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								리뷰 내용</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성자</th>
							<th
								style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								작성일</th>
							<th
								style="width: 30px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								답글</th>
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								관리</th>
						</tr>
						<tr v-for="(review, index) in reviews" :key="index" style="font-size : 14px;">
							<td style="font-size: 13px">{{ index + 1 }}</td>
							<td class="reviewFont">{{ review.menuList }}</td>
							<td style="font-size: 12px"><span v-if="review.raiting >= 1">★</span>
								<span v-else>☆</span> <span v-if="review.raiting >= 2">★</span>
								<span v-else>☆</span> <span v-if="review.raiting >= 3">★</span>
								<span v-else>☆</span> <span v-if="review.raiting >= 4">★</span>
								<span v-else>☆</span> <span v-if="review.raiting >= 5">★</span>
								<span v-else>☆</span></td>
							<td class="reviewFont">{{ review.contents }}</td>
							<td class="reviewFont">{{ review.userId }}</td>
							<td class="reviewFont">{{ review.orderDate }}</td>
							<td>
    							<img v-if="review.pContents" width="22" height="20" src="https://img.icons8.com/sf-black/64/ff7f00/circled.png" alt="circled" />
    							<img v-else width="23" height="20" src="https://img.icons8.com/sf-black-filled/64/ff7f00/x.png" alt="x" />
							</td>
							<td><button class="review-detail" @click="fnInfo(review)">자세히</button></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>

		<%@include file="food114_footer(biz).jsp"%>
	</div>

</body>
</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
			reviews : [],
			sessionId : "${sessionBizId}"
		// 받은 데이터를 저장할 배열
		},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {
						bizId : self.sessionId
				};
				$.ajax({
					url : "reviewBizList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.reviews = data.reviewBizList; // 받은 데이터를 배열에 할당
					}
				});
			},
			fnInfo : function(review) {
					$.pageChange("/food114-biz-review-view.do", {reviewNo : review.reviewNo});
			}
		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>