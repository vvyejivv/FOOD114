<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/login.css">
    <title>로그인</title>
</head>

<body>
    <header>
        <div id="container" style="height: 50px;">
            <div id="logo"><img src="../img/logo.png" class="logo"></div>
            <div id="status">
                <a class="buttonBox">로그인 </a>
                <a class="join"> 회원가입 </a>
                <a class="join"> 사장님사이트 </a>
            </div>
        </div>
        <!-- menuBar -->
        <div id="menuBar">
            <div id="container" class="menuBar">
                <a class="menu">메뉴 </a>
                <a class="menu">지도로 찾기</a>
                <a class="menu">우리동네</a>
                <a class="menu">이벤트</a>
                <a class="menu">고객지원</a>
            </div>
        </div>
    </header>
    <!-- 광고창 -->
    <!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
    <section>
        <div class="login_Container">
            <div class="login_Box">
                <p id="login_font">로그인</p>
                <form id="login_Form">
                    <input type="text" placeholder="아이디" class="idPwd_input">
                    <input type="password" placeholder="비밀번호" class="idPwd_input">
                    <span id="login_checkBox"><input type="checkbox">로그인 상태 유지</span>
                    <button class="login_button">로그인</button>
                    <button class="join_button">회원가입</button>
                </form>
                <ul class="login_find">
                    <li><a href="javascript:;"> 아이디 찾기</a></li>
                    <li><span> | </span></li>
                    <li><a href="javascript:;"> 비밀번호 찾기</a></li>
                </ul>
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
            <div>대표이사 : 박경빈 <span class="partition"> | </span>사업자등록번호 : 010-6382-4246</div>

            <div>제휴문의 : djl01@naver.com <span class="partition"> | </span>고객만족센터 : 1588-**** </div> 안심센터 FOOD114 클린리뷰
            고객만족센터
            1588-****(유료) 24시간, 연중무휴
            <div>호스팅 제공자 : 더조은 FOOD114 </div>
        </div>
    </footer>
</body>

</html>