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
<link rel="stylesheet" href="../css/myPage_myInfo(grade).css">
<body>

	<div id="Container">
		<%@include file="food114_header.jsp"%>
		<section>

			<div style="width: 1420px; display: flex; margin: 0px auto;">
				<%@include file="myPage_header.jsp"%>
				<div id="app">
					<div class="content" style="width: 900px;">
						<h2>
							<a href="javascript:;" style="font-size: 25px; color: #747171;">
								<span style="color: #ff7f00; font-weight: bold;">| </span>쿠폰
							</a>
						</h2>
						<div>
							<div class="row">
								<div style="margin-top: 100px; color: #747171;">
									<h1 style="margin-left: 300px; font-size: 30px;">아직 개발
										중입니다.</h1>
									<p style="margin-left: 200px; font-size: 15px;">이 페이지는 아직
										개발 중에 있습니다. 곧 완성될 예정입니다. 양해 부탁드립니다.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<%@include file="food114_footer.jsp"%>
	</div>
</body>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			list : [],
			info : {},
			sessionId : "${sessionId}",
			newName : ''
		},
		methods : {
			fnList : function() {
				var self = this;
				var nparmap = {
					userId : self.sessionId
				};
				$.ajax({
					url : "myInfo.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.info = data.info;
						console.log(data.info);
					}
				});
			},
			fnMyInfo : function() {
				location.href = "/myInfo.do";
			},
			fnMyInfoPwd : function() {
				location.href = "/myInfoPwd.do";
			},
			myInfoAddr : function() {
				location.href = "/myInfoAddr.do";
			},
			fnMyInfoGrade : function() {
				location.href = "/myInfoGrade.do";
			},
			changeName : function() {
				location.href = "/boardNoticeList.do";
			}
		},
		created : function() {
			var self = this;
			self.fnList();
		}
	});
</script>
</html>
