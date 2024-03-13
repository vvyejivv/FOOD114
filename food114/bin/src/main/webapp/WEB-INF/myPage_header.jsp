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
<link rel="stylesheet" href="../css/myPage_myInfo(main).css">
<body>

	<section>
		<div id="myPageHeader">
			<div class="sidebar" id="sidebar">
				<ul>
					<li>나의정보<span style="color: #b1b0b0;">───────────</span>
						<ul>
							<li><a href="javascript:;" @click="fnMyInfo">MY정보 확인/변경</a></li>
							<li><a href="javascript:;" @click="fnMyInfoPwd">비밀번호 변경</a></li>
							<li><a href="javascript:;" @click="myInfoAddr">MY주소지 관리</a></li>
							<li><a href="javascript:;" @click="fnMyInfoGrade">등급</a></li>
						</ul>
					</li>
					<br>
					<li>결제/주문/리뷰<span style="color: #b1b0b0;">───────────</span>
						<ul>
							<li><a href="javascript:;">결제수단 관리</a></li>
							<li><a href="javascript:;">주문내역</a></li>
							<li><a href="javascript:;">MY리뷰목록</a></li>
						</ul>
					</li>
					<br>
					<li>이벤트<span style="color: #b1b0b0;">───────────</span>
						<ul>
							<li><a href="javascript:;">쿠폰</a></li>
							<li><a href="javascript:;">포인트</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</section>

</body>

<script type="text/javascript">
	var myPageHeader = new Vue({
		el : '#myPageHeader',
		data : {},
		methods : {
			fnMyInfo : function() {
				location.href = "/myInfo.do";
			},
			fnMyInfoPwd : function() {
				location.href = "/myInfoPwd.do";
			},
			myInfoAddr : function(){
				location.href="/myInfoAddr.do";
			},
			fnMyInfoGrade : function() {
				location.href = "/myInfoGrade.do";
			}
		},
		created : function() {
			var self = this;
		}
	});
</script>
</html>