<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- 지도  -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/shopInfo.css">
<title>가게이벤트</title>
</head>
<style>
</style>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<%@include file="shopInfo_header.jsp"%>
	<div id="app">
		<section>
			<div id="menuContainer">
				<div id="eventBox">
					<div class="eventInfo" >
						<div>!이벤트!</div>
						<div>이벤트 기간</div>
						<div>이벤트 내용</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<%@include file="main(footer).html"%>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			selectTab : '${map.selectTab}', /* 선택한 탭 */
			bizId : '${map.bizId}', /* 가게정보 - 아이디  */
		},
		methods : {
			fnView : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "reviewList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {

					}
				});
			},
		},
		created : function() {
			var self = this;

		}
	});
</script>