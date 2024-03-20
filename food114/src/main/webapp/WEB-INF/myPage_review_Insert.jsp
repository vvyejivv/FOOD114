<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
<style>
.orderListContainer {
	margin: 10px;
	margin-left: 20px;
	width: 1000px;
}

.review_insert_table {
	width: 1000px;
	border-collapse: collapse;
}

.review_insert {
	font-size: 14px;
	background-color: #f9f9f9;
	width: 100px;
	min-width: 100px;
	border-right: 1px solid #ccc;
	max-width: 100px;
}

.review_insert_table td {
	border-bottom: 1px solid #ccc;
	padding: 15px 25px;
}

[v-cloak] {
	display: none;
}

.reviewText {
	width: 500px;
	height: 150px;
	padding: 10px;
	font-size: 15px;
	border: 2px solid #ccc;
	border-radius: 5px;
	resize: none; /* 사용자가 크기를 조정할 수 없도록 함 */
	margin-bottom: -13px;
}

.reviewText::placeholder {
	color: #999;
}

.addReview {
	background-color: #ffffff;
	border: 1px solid #ff7f00;
	color: #ff7f00;
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
	width: 70px;
	height: 35px;
}

.addReview:hover {
	background-color: #ff7f00;
	border: 1px solid #FBCEB1;
	color: #ffffff;
}

.review_button2 {
	width: 70px;
	height: 35px;
	background-color: #ffffff;
	border: 1px solid #ff7f00;
	color: #ff7f00;
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
	margin-left: 930px;
	margin-top: 5px;
}

.review_button2:hover {
	background-color: #ff7f00;
	border: 1px solid #FBCEB1;
	color: #ffffff;
}

.optionAdd {
	font-size: 17px;
	color: #ffcc00;
	width: 150px;
	height: 25px;
}
</style>
</head>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<div class="container">
		<%@include file="myPage_header.jsp"%>
		<div class="orderListContainer">
			<div id="app" v-cloak>
				<h2>
					<a href="javascript:;" style="font-size: 25px; color: #747171;">
						<span style="color: #ff7f00; font-weight: bold;">| </span> 리뷰 작성
					</a>
				</h2>
				<table class="review_insert_table"
					v-for="(review, index) in reviewList">
					<tr>
						<td style="border-top: 2px solid rgba(72, 72, 72);"
							class="review_insert">가게명</td>
						<td
							style="border-top: 2px solid rgba(72, 72, 72); overflow: hidden;">
							{{review.bizName}}</td>
					</tr>
					<tr>
						<td class="review_insert">별점</td>
						<td><select class="optionAdd" v-model="selectedRaiting">
								<option value="5">★★★★★</option>
								<option value="4">★★★★☆</option>
								<option value="3">★★★☆☆</option>
								<option value="2">★★☆☆☆</option>
								<option value="1">★☆☆☆☆</option>
						</select></td>
					</tr>
					<tr>
						<td class="review_insert">메뉴</td>
						<td>{{review.menuList}}</td>
					</tr>
					<tr>
						<td class="review_insert">리뷰 내용</td>
						<td><textarea class="reviewText" placeholder="리뷰 작성을 해주세요!"
								v-model="contents"></textarea>
							<button class="addReview" @click="addReview">저장</button></td>
					</tr>
				</table>
				<button class="review_button2" @click="goBack">이전으로</button>
			</div>
		</div>
	</div>
	<%@include file="main(footer).html"%>
</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			sessionId : "${sessionId}",
			orderNo : '${map.orderNo}',
			reviewList : [],
			selectedRaiting : '5',
			contents : "",
			savedSuccessfully : false
		},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {
					orderNo : self.orderNo,
					userId : this.sessionId
				};
				$.ajax({
					url : "myPageReViewListEdit.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.reviewList = data.listViewEdit;
					}
				});
			},
			goBack : function() {
				// 이전으로 버튼을 눌렀을 때의 동작을 정의합니다.
				$.pageChange("/myPage_reviewAdd.do", {});
			},
			addReview: function() {
			    var self = this;
			    if (!self.contents.trim()) {
			        if (alert("리뷰를 작성해주세요.")) {
			            // 사용자가 확인을 눌렀을 때만 저장 시도
			            var nparmap = {
			                orderNo: self.orderNo,
			                userId: self.sessionId,
			                raiting: self.selectedRaiting,
			                contents: self.contents
			            };
			            console.log("전송할 데이터:", nparmap);
			            $.ajax({
			                url: "myPageReviewAdd.dox",
			                dataType: "json",
			                type: "POST",
			                data: nparmap,
			                success: function(data) {
			                    self.savedSuccessfully = true; // 저장 성공 여부 표시
			                    // 저장이 완료된 후에 컨펌 창 표시
			                    alert("저장되었습니다.");
			                    // 2초 뒤에 목록으로 이동하는 것이 아니라, 사용자가 확인을 누르면 목록으로 이동하도록 함
			                    window.location.href = "food114-myPage-review.do";
			                }
			            });
			        }
			    } else {
			        // 리뷰 내용이 있을 경우에만 저장 시도
			        var nparmap = {
			            orderNo: self.orderNo,
			            userId: self.sessionId,
			            raiting: self.selectedRaiting,
			            contents: self.contents
			        };
			        console.log("전송할 데이터:", nparmap);
			        $.ajax({
			            url: "myPageReviewAdd.dox",
			            dataType: "json",
			            type: "POST",
			            data: nparmap,
			            success: function(data) {
			                self.savedSuccessfully = true; // 저장 성공 여부 표시
			                // 저장이 완료된 후에 컨펌 창 표시
			                alert("저장되었습니다.");
			                // 2초 뒤에 목록으로 이동하는 것이 아니라, 사용자가 확인을 누르면 목록으로 이동하도록 함
			                window.location.href = "food114-myPage-review.do";
			            }
			        });
			    }
			},


		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>