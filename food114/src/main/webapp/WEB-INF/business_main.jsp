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
<title>FOOD114 BusinessPage</title>
</head>
<body>
	<%@include file="main(header)_biz.html"%>
	<div id="app">

		<section>
			<div id="container">
				<div id="margin-top" id="margin-bottom">
					<div id="slideshow">
						<div id="slides">
							<img src="../img/slide1.jpg"> <img src="../img/slide2.jpg">
							<img src="../img/slide3.jpg">
						</div>
					</div>
					<div id="bold-notice"></div>
					<div id="content">
						<div id="border-container" class="right-margin">
							<div id="flex-row">
								<div id="flex-cell">
									<div class="icon-container">
										<img width="50" height="50"
											src="https://img.icons8.com/ios/50/4D4D4D/new-store.png"
											alt="new-store" />
										<p>상품 등록</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<img width="50" height="50"
											src="https://img.icons8.com/external-tal-revivo-light-tal-revivo/50/4D4D4D/external-brief-article-homepage-search-online-service-template-wireframe-light-tal-revivo.png"
											alt="external-brief-article-homepage-search-online-service-template-wireframe-light-tal-revivo" />
										<p>상품 조회</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<img width="50" height="50"
											src="https://img.icons8.com/ios/50/4D4D4D/favorite-window.png"
											alt="favorite-window" />
										<p>리뷰 관리</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<img width="50" height="50"
											src="https://img.icons8.com/ios/50/4D4D4D/event-accepted-tentatively.png"
											alt="event-accepted-tentatively" />
										<p>이벤트 관리</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<img width="50" height="50"
											src="https://img.icons8.com/wired/50/4D4D4D/combo-chart--v1.png"
											alt="combo-chart--v1" />
										<p>판매 통계</p>
									</div>
								</div>
								<div id="flex-cell">
									<div class="icon-container">
										<img width="50" height="50"
											src="https://img.icons8.com/forma-thin/50/4D4D4D/user-male-circle.png"
											alt="user-male-circle" />
										<p>판매자 정보</p>
									</div>
								</div>
							</div>
						</div>
						<div id="sidebar">
							<h2>사장님 반갑습니다!</h2>
							<button class="button-style wide-button">로그인</button>
							<div>
								<span><a href="javascript:;" class="loginTag">회원가입</a></span> <span><a
									href="javascript:;" class="loginTag">아이디/비밀번호 찾기</a></span>
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
								>FOOD114</span> 센터&nbsp;</span>
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
		<%@include file="main(footer)_biz.html"%>
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
	}
});
</script>