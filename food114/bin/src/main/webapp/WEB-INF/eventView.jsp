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

<body>

	<style>
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

table {
	border-collapse: collapse;
}

.borderTitle {
	font-size: 14px;
	background-color: #f9f9f9;
	width: 100px;
	min-width: 100px;
	border-right: 1px solid #ccc;
	max-width: 100px;
}

td {
	border-bottom: 1px solid #ccc;
	padding: 15px 25px;
}

.listButton {
	background-color: #ff7f00;
	color: white;
	border: none;
	border-radius: 4px;
	width: 80px;
	height: 40px;
	margin: 5px;
	cursor: pointer;
}
</style>
	<%@include file="main(header).html"%>
	<section>
		<div style="width: 1200px; margin: 0px auto;">
			<%@include file="event_header.jsp"%>
			<div id="app">
				<div
					style="width: 1200px; color: rgb(72, 72, 72); margin-top: 35px; padding: 0px;">
					<div style="width: 1100px; margin: 0px auto;">
						<table style="width: 1100px;">
							<tr>
								<td style="border-top: 2px solid rgba(72, 72, 72);"
									class="borderTitle">제목</td>
								<td
									style="border-top: 2px solid rgba(72, 72, 72); overflow: hidden;"><div
										style="white-space: nowrap; text-overflow: ellipsis; max-width: 900px; overflow: hidden">{{board.title}}</div></td>
							</tr>
							<tr>
								<td class="borderTitle">작성자</td>
								<td>{{board.userId}}</td>
							</tr>
							<tr>
								<td class="borderTitle">작성일</td>
								<td colspan="3">{{board.cdateTime}}</td>
							</tr>
							<tr>
								<td colspan="4" style="border-bottom: 1px solid #ccc; padding: 35px 0px;"
									v-html="board.contents"></td>
							</tr>
						</table>
						<div style="text-align: right">
							<button
								style="margin: 10px; margin-bottom: 35px; background-color: #ccc" class="listButton"
								@click="fnGoList(endYn)">목록</button>
						</div>
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
					var self = this;
					$.pageChange("/event-web-list.do", {
						endYn : type
					});
				}
			},
			created : function() {
				var self = this;
				self.fnView();
			}
		});
	</script>