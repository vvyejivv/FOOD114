<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>웹 이벤트</title>

</head>

<style>
.eventContainer {
	margin-top: 25px;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	width: 1000px;
	margin-bottom: 50px;
}

.eventBox {
	width: 380px;
	height: 340px;
	border: 1px solid #ccc;
	padding: 10px;
	margin: 10px;
	cursor: pointer;
}

.previewBox {
	width: 380px;
	height: 300px;
	border-bottom: 1px solid #ccc;
	margin-bottom: 10px;
	font-weight: 500;
	font-size: 17px;
}

.imgBox {
	width: 100%;
	height: 225px;
	border: 1px solid #ccc;
	overflow: hidden;
}

.imgBox img {
	object-fit: cover;
	height: 225px;
	width: 382px;
}

.titleBox {
	width: 100%;
	height: 72px;
	display: flex;
	align-items: center;
	justify-content: center;
	/* border: 1px solid #ccc; */
}

.periodBox {
	width: 380px;
	height: 30px;
	/* border: 1px solid #ccc; */
	text-align: center;
}
</style>


<body>
	<header>
		<%@include file="main(header).html"%>
	</header>

	<section>
		<div style="width:1200px; margin: 0px auto">
			<%@include file="event_header.jsp"%>
			<div id="app">
				<div style="width: 1200px; color: rgb(72, 72, 72); margin-top: 35px; padding: 0px;">
					<div v-if="list.length==0"
						style="margin-top: 50px; width: 1000px; margin-bottom: 50px; text-align: center; height: 230px">현재
						진행중인 이벤트가 없습니다.</div>
					<div class="eventContainer">
						<template v-for="item in list" v-if="list.length!=0">
							<div class="eventBox" @click="fnBoardView(item.boardNo)">
								<div class="previewBox">
									<div class="imgBox">
										<img :src=item.filePath+item.fileName+item.fileEtc>
									</div>
									<div class="titleBox">{{item.title}}</div>
								</div>
								<div class="periodBox">{{item.beginTime2}} ~
									{{item.endTime2}}</div>
							</div>
						</template>
					</div>
				</div>

			</div>
		</div>
	</section>

	<!-- footer -->
	<%@ include file="main(footer).html"%>

</body>

</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			endYn : "${endYn}"
		},
		methods : {
			fnList : function(str) {
				var self = this;
				self.endYn = str;
				if (self.endYn == "N") {
					$("#ingEventLine").prop("hidden", false);
					$("#endEventLine").prop("hidden", true);
				} else {
					$("#ingEventLine").prop("hidden", true);
					$("#endEventLine").prop("hidden", false);
				}
				var nparmap = {
					endYn : str
				};
				$.ajax({
					url : "event-list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.list = data.list;
					}
				});
			},
			fnBoardView : function(boardNo) {
				var self = this;
				$.pageChange("/event-web-view.do", {
					boardNo : boardNo,
					endYn : self.endYn
				});
			}
		},
		created : function() {
			var self = this;
			self.fnList(self.endYn);
		}
	});
</script>