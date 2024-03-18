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

.orderListTable th, td {
	border-right: none;
	border-bottom: 1px solid #e4e3e3;
	padding: 10px 10px;
	color: (72, 72, 72);
	text-align: center;
}

.orderListTable td {
	font-size: 13px;
}

.pageBox {
	margin-left: 400px;
}

a {
	text-decoration: none;
	color: black;
}

[v-cloak] {
	display: none;
}
.reviewAdd {
	background-color: #ffffff; 
	border: 1px solid #ff7f00; 
	color: #ff7f00; 
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
}
.reviewAdd:hover {
	background-color: #ff7f00;
	border: 1px solid #FBCEB1;
	color: #ffffff;
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
							<span style="color: #ff7f00; font-weight: bold;">| </span> my리뷰
						</a>
					</h2>
					<div>
						<table class="orderListTable">
							<tr>
								<th
									style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									NO</th>
								<th
									style="width: 250px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									가게명</th>
								<th
									style="width: 450px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									메뉴</th>
								<th
									style="width: 200px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									주문 시간</th>
								<th
									style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									리뷰 상태</th>
								<th
									style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
									리뷰</th>
							</tr>
							<tr v-for="(item, index) in reviewList">
								<td style="font-size: 13px">{{index + 1}}</td>
								<td class="reviewFont">{{item.bizName}}</td>
								<td class="reviewFont">{{item.menuList}}</td>
								<td class="reviewFont">{{item.orderDate}}</td>
								<td class="reviewFont"><img v-if="item.reviewNo"
									width="22" height="20"
									src="https://img.icons8.com/sf-black/64/ff7f00/circled.png"
									alt="circled" /> <img v-else width="23" height="20"
									src="https://img.icons8.com/sf-black-filled/64/ff7f00/x.png"
									alt="x" /></td>
								<td class="reviewFont"><button class="reviewAdd" @click="fnHellow(item)">작성</button></td>
							</tr>
						</table>
					</div>
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
		data : {
			reviewList : [],
			sessionId : "${sessionId}"
		},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {
					userId : this.sessionId
				};
				$.ajax({
					url : "myPageReViewList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.reviewList = data.listView;
					}
				});
			},
			fnHellow : function(item) {
				$.pageChange("/myPage_review_Insert.do", {orderNo : item.orderNo});
		}
		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>