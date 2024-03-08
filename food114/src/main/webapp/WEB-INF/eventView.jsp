<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
</style>
</head>
<link rel="stylesheet" href="../css/boardNotice.css">
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<style>
.menuTitle {
	font-size: 30px;
	text-align: center;
}

.eventSelect {
	width: 500px;
	height: 54px;
	overflow: hidden;
	margin: 0px auto;
	margin-top: 25px;
}

.eventSelectType {
	float: left;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid #ccc;
	border-bottom: 1px solid white;
	width: 248px;
	height: 48px;
	position: relative;
}

.nowWatchType {
	border: 2px solid #ff7f00;
	position: absolute;
	width: 246px;
	top: -1px;
}
</style>

	<section>
		<div id="app">
			<div class="container"
				style="width: 1300px; color: rgb(72, 72, 72); margin-top: 35px; padding: 0px;">

				<div class="menuTitle" style="margin-bottom: 35px;">이벤트</div>
				<div class="eventSelect" style="margin-bottom: 35px;">
					<div class="eventSelectType">
						<div class="nowWatchType" v-if="endYn=='N'"></div>
						<a href="javascript:;" @click="fnGoList('N')">진행중인 이벤트</a>
					</div>

					<div class="eventSelectType"
						style="border-bottom: 1px solid #ccc; margin-left: -1px;">
						<div class="nowWatchType" v-if="endYn=='Y'"></div>
						<a href="javascript:;" @click="fnGoList('Y')">종료된 이벤트</a>
					</div>
				</div>
				<!-- <div style="overflow: hidden">
					<div style="float: right;">
						<button
							style="font-size: 13px; margin-right: 60px;padding: 10px 20px; background-color: #ccc;" @click="">목록</button>
					</div>
				</div> -->

				<div style="width: 1200px; margin: 0px auto;">
					<table border="1" style="width: 1200px;">
						<tr>
							<td
								style="background-color: #f9f9f9; border-top: 2px solid rgba(72, 72, 72); width: 200px; min-width: 200px;">제목</td>
							<td
								style="border-top: 2px solid rgba(72, 72, 72); width: 800px; overflow: hidden;"><div
									style="white-space: nowrap; text-overflow: ellipsis; max-width: 900px; overflow: hidden">{{board.title}}</div></td>
						</tr>
						<tr>
							<td style="background-color: #f9f9f9;">작성자</td>
							<td>{{board.userId}}</td>
						</tr>
						<tr>
							<td style="background-color: #f9f9f9;">작성일</td>
							<td colspan="3">{{board.cdateTime}}</td>
						</tr>
						<tr>
							<td colspan="4" style="border-bottom: #333; padding: 35px 0px;"
								v-html="board.contents"></td>
						</tr>
					</table>
					<div style="text-align: right">
						<button
							style="margin: 10px; margin-bottom: 35px; background-color: #ccc"
							@click="fnGoList(endYn)">목록</button>
					</div>
				</div>
			</div>
		</div>

	</section>

	<%@include file="main(footer).html"%>

	<script>
		var app = new Vue({
			el : '#app',
			data : {
				boardNo : "${boardNo}",
				endYn : "${endYn}",
				board : {}

			},
			methods : {
				fnView : function() {
					var self = this;
					var nparmap = {
						boardNo : self.boardNo
					};
					console.log(self.endYn);
					$.ajax({
						url : "event-view.dox",
						dataType : "json",
						type : "POST",
						data : nparmap,
						success : function(data) {
							self.board = data.board;
						}
					});
				},
				fnGoList : function(type) {
					var self=this;
					$.pageChange("/event-web-list.do", {						
						endYn : self.endYn
					});
				}
			},
			created : function() {
				var self = this;
				self.fnView();
			}
		});
	</script>