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
	border-left: none;
	border-right: none;
	width: 1000px;
	border-top: 1px solid #c0c0c0;
	border-collapse: collapse;
}

table th, td {
	border-right: none;
	border-bottom: 1px solid #e4e3e3;
	padding: 15px 25px;
	color: (72, 72, 72);
	text-align: center;
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
				<h2>
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);">판매이력&nbsp;</span>
				</h2><small> 총 10건</small>
				<div>
					<table class="order">
						<tr>
							<th
								style="width: 30px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								번호</th>
							<th
								style="width: 150px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								메뉴</th>
							<th
								style="width: 80px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								주문 금액</th>	
							<th
								style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								주문자</th>
							<th
								style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
								주문일</th>
						</tr>
						<tr v-for="(item,index) in 10">
							<td>{{index+1}}</td>
							<td>오아저씨세트</td>
							<td>10,000원</td>
							<td>아무개</td>
							<td>2024.03.01</td>
						</tr>
					</table>
				</div>
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