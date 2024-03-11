<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet" href="../css/business-main.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<title>Document</title>
</head>
<body>
	<div id="app">
		<header>
			<div id="container" style="height: 50px;">
				<div id="logo">
					<img src="../img/logo.png" class="logo">
				</div>
				<div id="status">
					<a class="buttonBox">로그인 </a> <a class="join"> 회원가입 </a> <a
						class="join"> 사장님사이트 </a>
				</div>
			</div>
			<!-- menuBar -->
			<div id="menuBar">
				<div id="container" class="menuBar">
					<a class="menu">메뉴 </a> <a class="menu">지도로 찾기</a> <a class="menu">우리동네</a>
					<a class="menu">이벤트</a> <a class="menu">고객지원</a>
				</div>
			</div>
		</header>

		<section>
			<div id="container">
				<div id="margin-top" id="margin-bottom">
					<div id="slideshow">
						<div id="slides">
							<img src="../img/pizza.JPG"> <img src="../img/pizza.JPG">
							<img src="../img/pizza.JPG">
						</div>
					</div>
					<div id="bold-notice"></div>
					<div id="content">
						<div id="border-container" class="right-margin">
							<div id="flex-row">
								<div id="flex-cell">
									<div class="icon-container">
										<a href="javascript:;" class="iconTag"><i
											class="fas fa-pizza-slice"></i></a>
										<p>피자</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<a href="javascript:;" class="iconTag"><i
											class="fas fa-hamburger"></i></a>
										<p>햄버거</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<a href="javascript:;" class="iconTag"><i
											class="fas fa-ice-cream"></i></a>
										<p>아이스크림</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<a href="javascript:;" class="iconTag"><i
											class="fas fa-coffee"></i></a>
										<p>커피</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<a href="javascript:;" class="iconTag"><i
											class="fas fa-cookie"></i></a>
										<p>쿠키</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<a href="javascript:;" class="iconTag"><i
											class="fas fa-birthday-cake"></i></a>
										<p>케이크</p>
									</div>
								</div>
							</div>
						</div>
						<div id="sidebar">
							<h2>사장님 반갑습니다!</h2>
							<button class="button-style wide-button">로그인</button>
							<div>
								<span><a href="javascript:;" class="loginTag">회원가입</a></span>
								<span><a href="javascript:;" class="loginTag">아이디/비밀번호 찾기</a></span>
							</div>
						</div>
					</div>
				</div>
				<div id="board">
					<div id="bold-notice">
						<h2>
							<span style="color: #ff7f00; font-weight: bold;">| </span> <span
								style="text-align: left; color: rgba(72, 72, 72);">공지사항&nbsp;</span>
						</h2>
					</div>
					<div id="bold-notice" style="margin-left: 720px">
						<h2>
							<span style="color: #ff7f00; font-weight: bold;">| </span> <span
								style="text-align: left; color: rgba(72, 72, 72);"><span
								style="color: #ff7f00">FOOD114</span> 센터&nbsp;</span>
						</h2>
					</div>
					<div id="side-bar-container">
						<div id="notice-table-container">
							<table id="notice-table">
								<tr>
									<th
										style="width: 20px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										번호</th>
									<th
										style="width: 300px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										제목</th>
									<th
										style="width: 50px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										작성자</th>
									<th
										style="width: 100px; border-top: 2px solid rgba(72, 72, 72); border-bottom: 1px solid #979797;">
										작성일</th>
								</tr>
								<tr>
									<td style="text-align: center;">1</td>
									<td><a href="javascript:;" class="aTag">[공지] 앱푸시 알림센터
											서비스 오픈(2024.02.01)</a></td>
									<td style="text-align: center;">홍길동</td>
									<td style="text-align: center;">2024.03.01</td>
								</tr>
								<tr>
									<td style="text-align: center;">2</td>
									<td><a href="javascript:;" class="aTag">[문의] 문의합니다.</a></td>
									<td style="text-align: center;">홍길동</td>
									<td style="text-align: center;">2024.03.01</td>
								</tr>
								<tr>
									<td style="text-align: center;">3</td>
									<td><a href="javascript:;" class="aTag">[안내] 안녕하세요!</a></td>
									<td style="text-align: center;">홍길동</td>
									<td style="text-align: center;">2024.03.01</td>
								</tr>
								<tr>
									<td style="text-align: center;">4</td>
									<td><a href="javascript:;" class="aTag">[이벤트] 참여하려고
											하는데요..</a></td>
									<td style="text-align: center;">홍길동</td>
									<td style="text-align: center;">2024.03.01</td>
								</tr>
							</table>
						</div>
						<div id="sideBar2">
							<ul class="side">
								<li class="sideLi"><a href="javascript:;">고객센터</a> <a
									href="javascript:;" style="font-size: 17px; color: #ff7f00;"><span
										style="margin-left: 200px;">❯</span></a></li>
								<li class="sideLi"><a href="javascript:;">사장님 입점 문의</a> <a
									href="javascript:;" style="font-size: 17px; color: #ff7f00;"><span
										style="margin-left: 153px;">❯</span></a></li>
								<li class="sideLi"><a href="javascript:;">광고 배너 문의</a> <a
									href="javascript:;" style="font-size: 17px; color: #ff7f00;"><span
										style="margin-left: 167px;">❯</span></a></li>		
								<li class="sideLi"><a href="javascript:;">1:1 문의</a> <a
									href="javascript:;" style="font-size: 17px; color: #ff7f00;"><span
										style="margin-left: 204px;">❯</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

		<footer>
			<div class="footerImg">
				<img src="../img/logo_gray.png">
			</div>
			<div style="float: right; padding-right: 50px;">가맹점 문의</div>
			<div style="clear: both; font-size: 12px;">
				<div>주소 : 인천광역시 부평구 경원대로 1366(부평동. 스테이션타워 7F)</div>
				<div>
					대표이사 : 박경빈 <span class="partition"> | </span>사업자등록번호 :
					010-6382-4246
				</div>

				<div>
					제휴문의 : djl01@naver.com <span class="partition"> | </span>고객만족센터 :
					1588-****
				</div>
				안심센터 FOOD114 클린리뷰 고객만족센터 1588-****(유료) 24시간, 연중무휴
				<div>호스팅 제공자 : 더조은 FOOD114</div>
			</div>
		</footer>
	</div>
</body>
<script>
window.onload = function() {
    var slideIndex = 0;
    showSlides();

    function showSlides() {
        var slides = document.querySelector('#slides');
        var firstImage = slides.children[0].cloneNode(true);
        slides.appendChild(firstImage);
        setInterval(() => {
            slideIndex++;
            slides.style.transition = 'transform 3s ease';
            slides.style.transform = 'translateX(' + (-slideIndex * 100) + '%)';
            if (slideIndex === slides.children.length - 1) {
                setTimeout(() => {
                    slides.style.transition = 'none';
                    slideIndex = 0;
                    slides.style.transform = 'translateX(0)';
                }, 3000);
            }
        }, 5000);
    }
}

    </script>
</html>

<script type="text/javascript">
var app = new Vue({ 
    el: '#app',
    data: {
    }   
    , methods: {
    	list : function(){    		
            var self = this;
            var nparmap = {};
            $.ajax({
                url:"test.dox",
                dataType:"json",	
                type : "POST", 
                data : nparmap,
                success : function(data) { 
                }
            }); 
        } 
    }   
    , created: function () {
    	var self = this;    	
    	self.list();
	}
});
</script>