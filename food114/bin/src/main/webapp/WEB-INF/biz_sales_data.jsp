<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"> -->
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/sideBar_biz.css">
<title>로그인</title>
</head>
<style>
table {
	margin-top: 30px;
	width: 1100px;
	border-collapse: collapse;
	border-radius: 8px;
	overflow: hidden;
}

th, td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #ddd;
}

.btn-modify {
	width: 60px;
	background-color: #ffffff; /* 버튼 배경색 (흰색) */
	border: 1px solid #2196F3; /* 버튼 테두리 (파란색) */
	color: #2196F3; /* 텍스트 색상 (파란색) */
	padding: 8px 12px; /* 내부 여백 */
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 14px;
	margin: 4px 2px;
	transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
	cursor: pointer;
	border-radius: 4px; /* 버튼에 border-radius 적용 */
}

.btn-modify:hover {
	border: 1px solid #ff7f00;
	color: #ff7f00;
}

.thin {
	margin: 15px 0 30px 0;
	width: 800px;
	border-top: 1px solid #ddd;
}
</style>
<body>
	<%@include file="main(header).html"%>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">판매통계&nbsp;</span>
				</h2>
				<div id="chart">
					<apexchart type="line" height="350" width="1100" :options="chartOptions"
						:series="series"></apexchart>
				</div>
				<div class="thin"></div>
				<strong>검색된 상품 </strong><small> 총 10건</small>
				<table>
					<tr>
						<th>카테고리</th>
						<th>등록상품ID</th>
						<th>등록 상품명</th>
						<th>판매상태</th>
						<th>판매가</th>
						<th>수정</th>
					</tr>
					<tr v-for="item in 10">
						<td>1</td>
						<td>123123123</td>
						<td>철판볶음밥</td>
						<td>판매중</td>
						<td>10,000</td>
						<td><button class="btn-modify">수정</button></td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<%@include file="main(footer).html"%>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		components : {
			apexchart : VueApexCharts,
		},
		data : {
			updateFlg : false,
			series : [ {
				name : "철판볶음밥",
				data : [ 10, 41, 35, 51, 49, 62, 69, 91, 148, 205 ]
			} ],
			chartOptions : {
				chart : {
					height : 350,
					type : 'line',
					zoom : {
						enabled : false
					}
				},
				dataLabels : {
					enabled : false
				},
				stroke : {
					curve : 'straight'
				},
				title : {
					text : '2024.03.02~2024.03.11',
					align : 'left'
				},
				grid : {
					row : {
						colors : [ '#f3f3f3', 'transparent' ], // takes an array which will be repeated on columns
						opacity : 0.5
					},
				},
				xaxis : {
					categories : ['2024.03.02', '2024.03.03', '2024.03.04', '2024.03.05', '2024.03.06', '2024.03.07', '2024.03.08','2024.03.09','2024.03.10','2024.03.11'],
				}
			},
		},
		methods : {
			fnInfoUpdate : function() {
				var self = this;
				self.updateFlg = !self.updateFlg;
			}
		},
		created : function() {
			var self = this;

		}
	});
</script>