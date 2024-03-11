<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>첫번째 페이지</title>
<link rel="stylesheet" href="../css/event_biz.css">
</head>
<body>
	<header>
		<%@include file="main(header).html"%>
	</header>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2 style="margin-bottom: 15px;">
					<span style="color: #ff7f00; font-weight: bold;">| </span><span
						style="text-align: left; color: rgba(72, 72, 72);"> 이벤트
						등록/관리&nbsp;</span> <span style="font-size: 18px;">여기서 한번에 관리 하세요!</span>
				</h2>
				<div class="event_top">
					<div class="topDiv">
						이벤트 등록<small><small style="color: #ff7f00;"> ＊ </small></small><small><small
							style="color: #0066cc;"> 예시</small></small>
					</div>
					<input type="text" class="event_input"
						placeholder="＊우리동네 이벤트/금요일 사이드메뉴 테이블당 서비스!">
					<div class="eventInfo">이벤트와 관련 없는 내용은 관리자에 의해 삭제될 수 있습니다.</div>
				</div>
				<div class="event_mid">
					
				</div>
				<div class="event_bottom">
					
				</div>
				<div class="event_jungle">
					
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
		data : {},
		methods : {
			list : function() {
				var self = this;
				var nparmap = {};
				$.ajax({
					url : "test.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
					}
				});
			}
		},
		created : function() {
			var self = this;
			self.list();
		}
	});
</script>