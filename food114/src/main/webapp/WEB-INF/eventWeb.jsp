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
<style>
</style>
</head>

<body>
	<header>
		<%@include file="main(header).html"%>
	</header>

	<style>
section {
	color: rgb(72, 72, 72);
}

.container {
	width: 1300px;
	margin: 0px auto;
	margin-top: 35px;
}

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

.eventContainer {
	margin-top: 25px;
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	width: 1300px;
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

a {
	text-decoration: none;
	color: rgb(72, 72, 72);
}
</style>
	<section>
		<div id="app">
			<div class="container">
				<div class="menuTitle">이벤트</div>
				<div class="eventSelect">
					<div class="eventSelectType">
						<div class="nowWatchType" v-if="endYn=='N'"></div>
						<a href="javascript:;" @click="fnList('N')">진행중인 이벤트</a>
					</div>

					<div class="eventSelectType"
						style="border-bottom: 1px solid #ccc; margin-left: -1px;">
						<div class="nowWatchType" v-if="endYn=='Y'"></div>
						<a href="javascript:;" @click="fnList('Y')">종료된 이벤트</a>
					</div>
				</div>
				<div v-if="list.length==0"
					style="margin-top: 50px; width: 1300px; margin-bottom: 50px; text-align: center; height: 230px">현재 진행중인 이벤트가 없습니다.</div>
				<div class="eventContainer">
					<!-- 이벤트 게시물 1개 -->
					<!-- <div class="eventBox">
						<div class="previewBox">
							<div class="imgBox">event img</div>
							<div class="titleBox">event title</div>
						</div>
						<div class="periodBox">event Start date ~ End date</div>
					</div> -->

					<template v-for="item in list" v-if="list.length!=0">
						<div class="eventBox">
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
			endYn : "N"
		},
		methods : {
			fnList : function(str) {
				var self = this;
				self.endYn = str;
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
			}
		},
		created : function() {
			var self = this;
			self.fnList("N");
		}
	});
</script>