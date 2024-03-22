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
<link rel="stylesheet" href="../css/event_biz.css">
</head>
<body>
	<div id="Container">
		<%@include file="food114_header(biz).jsp"%>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;  font-size : 16px;">| </span><span
						style="text-align: left; color: #222222; font-size : 16px;">이벤트&nbsp;</span>
					<span style="font-size: 13px; color:#5F5F5F">여기서 한번에 관리 하세요!</span>
				</h2>
				<table class="event">
					<tr style="color: #222222; font-size : 14px;">
						<th
							style="width: 40px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							번호</th>
						<th
							style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							이벤트 종류</th>
						<th
							style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							이벤트 제목</th>
						<th
							style="width: 180px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							이벤트 내용</th>
						<th
							style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							이벤트 기간</th>
						<th
							style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							종료 여부</th>	
						<th
							style="width: 60px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
							관리</th>
					</tr>
					<tr v-for="(event, index) in events" :key="index" style="font-size : 14px;">
						<td>{{ index + 1 }}</td>
						<td>{{ event.type === 'SHORT' ? '우리동네' : (event.type === 'REGULAR' ? '리뷰 이벤트' : '') }}</td>
						<td>{{event.title}}</td>
						<td>{{event.contents}}</td>
						<td>{{event.eventTime}}</td>
						<td>{{ event.endYn === 'Y' ? '종료' : (event.endYn === 'N' ? '진행중' : '') }}</td>
						<td><button class="event-detail" @click="fnDetail(event.boardNo)">자세히</button></td>
					</tr>
				</table>
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
			events : [],
			sessionId : "${sessionBizId}"
		},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {
						bizId : self.sessionId
				};
				$.ajax({
					url : "listBizEvent.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.events = data.listBizEvent;
					}
				});
			},
			fnDetail : function(boardNo) {
					$.pageChange("/bizEvent_info.do", {boardNo : boardNo});
			}
		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>