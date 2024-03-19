<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<title>사장님 페이지</title>
<link rel="stylesheet" href="../css/view_biz.css">
</head>
<body>
	<header>
	<%@include file="food114_header(biz).jsp"%>
	</header>
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				sdgsdgsg
			</div>
		</div>
	</section>

		<%@include file="food114_footer(biz).jsp"%>

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