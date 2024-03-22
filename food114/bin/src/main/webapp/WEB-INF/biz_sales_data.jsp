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
<link rel="stylesheet" href="../css/food114.css">
<title>FOOD114::매출관리</title>
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


::-webkit-scrollbar-thumb {
    border-radius: 10px; /* 스크롤바 둥근 테두리 */
    background: #ccc; /* 스크롤바 색상 */
}

::-webkit-scrollbar-track {
    background: white;  /*스크롤바 뒷 배경 색상*/
}

::-webkit-scrollbar {
    width: 10px;  
}
</style>
<body>
	<div id="Container">
		<%@include file="food114_header(biz).jsp"%>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app" v-cloak>
			<div class="mold">
				<h2>
					<span style="color: #ff7f00; font-weight: bold; font-size : 16px;">| </span><span
						style="text-align: left; color: #222222; font-size : 16px;">판매통계&nbsp;</span>
				</h2>
				<strong v-html="title1" style="font-size: 14px; color:#5F5F5F"></strong>
				<div id="chart">
					<apexchart type="line" height="350" width="1100" :options="chartOptions"
						:series="series"></apexchart>
				</div>
				<div class="thin"></div>
				<h2>
					<span style="color: #ff7f00; font-weight: bold; font-size : 16px;">| </span><span
						style="text-align: left; color: #222222; font-size : 16px;">판매이력&nbsp;</span>
				</h2><small> 총 {{orderCnt.cnt}}건</small>
				<div>
					<table class="order">
						<tr style="color: #222222; font-size : 14px;">
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
						<tr v-for="(item,index) in orderList"  style="font-size : 14px;">
							<td>{{item.orderNo}}</td>
							<td>{{item.menuList}}</td>
							<td>{{parseInt(item.totalAmount).toLocaleString()}}원</td>
							<td>{{item.userId}}</td>
							<td>{{item.orderDate}}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</section>
		<%@include file="food114_footer(biz).jsp"%>
	</div>
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
			orderList : [],
			sessionId : "${sessionBizId}",
			orderCnt : "",
			daySellList : [],
			title1 : "",
			
			series : [ {
				name : "일매출",
				data : []
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
					text : '',
					align : 'left'
				},
				grid : {
					row : {
						colors : [ '#f3f3f3', 'transparent' ], // takes an array which will be repeated on columns
						opacity : 0.5
					},
				},
				xaxis : {
					categories : [1],
				}
			},
		},
		methods : {
			fnInfoUpdate : function() {
				var self = this;
				self.updateFlg = !self.updateFlg;
			},
			fnOrderList : function() {
				var self = this;
				var nparmap = {
					bizId : self.sessionId
				};
				$.ajax({
					url : "/orderList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.orderList = data.orderList;
						self.orderCnt = data.cnt;
					}
				});
			},
			fnDaySellList : function() {
				var self = this;
				var nparmap = {
					bizId : self.sessionId
				};
				$.ajax({
					url : "/selectDaySellList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.daySellList = data.daySellList;
						self.chartOptions.title.text="22";
						console.log(data);
						data.daySellList.forEach((item, index) => {
						    self.chartOptions.xaxis.categories[index] = item.day;
						});
						self.series = [{
                            name: "일매출",
                            data: data.daySellList.map(item => item.sum)
                        }];
						console.log(data.daySellList[0].day);
						self.title1 = data.daySellList[0].day + " ~ " + data.daySellList[data.daySellList.length - 1].day;
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.fnOrderList();
		},
		mounted: function() {
			this.fnDaySellList();
		}
	});
</script>