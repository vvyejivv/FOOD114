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
<link rel="stylesheet" href="../css/review_info_biz.css">
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
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">리뷰&nbsp;</span>
					<span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<table class="review_info_table">
					<tr>
						<td style="border-top: 2px solid rgba(72, 72, 72);"
							class="event_title">메뉴</td>
						<td
							style="border-top: 2px solid rgba(72, 72, 72); overflow: hidden;">
							<div
								style="white-space: nowrap; text-overflow: ellipsis; max-width: 900px; overflow: hidden">{{reviewInfo.menuList}}</div>
						</td>
					</tr>
					<tr>
						<td class="event_title">별점</td>
						<td style="color: #ffcc00;"><span v-for="i in 5" :key="i">
								<span v-if="i <= reviewInfo.raiting">★</span> <span v-else>☆</span>
						</span></td>
					</tr>
					<tr>
						<td class="event_title">리뷰 사진</td>
						<td><img :src="reviewInfo.filePath"></td>
					</tr>
					<tr>
						<td class="event_title">리뷰 내용</td>
						<td>{{reviewInfo.contents}}</td>
					</tr>
					<tr>
						<td class="event_title">작성자</td>
						<td>{{reviewInfo.userId}}</td>
					</tr>
					<tr>
						<td class="event_title">작성일</td>
						<td>{{reviewInfo.orderDate}}</td>
					</tr>
					<tr>
						<td class="event_title">리뷰 답글</td>
						<td v-if="reviewInfo.pContents">
							<textarea class="reviewText" placeholder="리뷰 작성을 해주세요!" v-model="contents">{{reviewInfo.pContents}}</textarea>
							<button class="addReview" @click="fnBizUpdate()">수정</button>
						</td>
						<td v-if="!reviewInfo.pContents">
							<textarea class="reviewText" placeholder="리뷰 작성을 해주세요!" v-model="contents"></textarea>
							<button class="addReview" @click="fnBizAdd()">저장</button>
						</td>
					</tr>
				</table>
				<button class="review_button2" @click="goBack">이전으로</button>
			</div>
		</div>
	</section>

		<%@include file="food114_footer(biz).jsp"%>
	</div>
</body>
</html>

<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			reviewNo : '${map.reviewNo}',
			reviewInfo : {},
			sessionId : "${sessionBizId}",
			contents : ""
		},
		methods : {
			bizInfo : function() {
				var self = this;
				console.log(self.reviewNo);
				var nparmap = {
					reviewNo : self.reviewNo
				};
				$.ajax({
					url : "reviewBizInfo.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.reviewInfo = data.reviewBizInfo;
					}
				});
			},
			goBack : function() {
				// 이전으로 버튼을 눌렀을 때의 동작을 정의합니다.
				$.pageChange("/food114-biz-review.do", {});
			},
			fnBizAdd : function() {
				var self = this;
				console.log(self.reviewNo);
				if(!self.contents){
					return;
				}
				var nparmap = {
					reviewNo : self.reviewNo,
					bizId : self.sessionId,
					orderNo : self.reviewInfo.orderNo,
					contents : self.contents
				};
				$.ajax({
					url : "reviewBizComment.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						location.reload(true);
					}
				});
			},
			fnBizUpdate : function() {
				var self = this;
				if(!self.contents){
					return;
				}
				var nparmap = {
					reviewNo : self.reviewInfo.pNo,
					contents : self.contents
				};
				$.ajax({
					url : "reviewBizCommentUpdate.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						location.reload(true);
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.bizInfo();
		}
	});
</script>
