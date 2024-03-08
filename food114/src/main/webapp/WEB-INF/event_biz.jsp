<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MAIN</title>
    <link rel="stylesheet" href="main.css">
    <style>

    </style>
</head>

<body>
    <header>
       <%@include file="main(header).html" %>
    </header>
    <!-- 주문하기(영수증창) -->
    <!-- <div class="receipt" style="border-radius: 10px;">
        영수증
        <div class="goOrder">
            주문하기</div>
    </div> -->


    <!-- 광고창 -->
    <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div>

    <style>
        select {
            padding: 8px;
            border-radius: 5px;
            border: 1px solid rgb(204, 204, 204);
            margin-right: 5px;
        }
        section{
            color: rgb(72,72,72);
        }
    </style>

    <section>
        <div style="text-align: center; font-size: 30px; margin-top: 35px;">우리동네</div>
        <!-- 컨테이너 -->
        <div style="width: 1200px; margin: 0px auto; padding: 25px; padding-bottom: 50px; padding-left: 100px;">            
            <!-- 상세옵션 -->
            <div style="margin-bottom: 25px;">
                <div style="font-size: 20px; font-weight: 500; margin-bottom: 10px;"><span
                        style="color: #ff7f00;font-weight: bold; margin-right: 5px;">|</span>지역설정</div>
                <div>
                    <select style="width: 200px;">
                        <option>asdf</option>
                    </select>
                    <select style="width: 200px;">
                        <option>asdf</option>
                    </select>
                    <select style="width: 200px;">
                        <option>asdf</option>
                    </select>
                </div>                
            </div>

            <!-- 현재 이벤트 중인 가게 -->
            <div style="font-size: 20px; font-weight: 500; margin-bottom: 10px;"><span
                    style="color: #ff7f00;font-weight: bold; margin-right: 5px;">|</span>현재 이벤트 중인 가게</div>    
                    <div>최근등록순 | 리뷰높은순</div>
            <div
                style="width: 1110px; margin-top: 2px;  display: grid; grid-template-columns: 1fr 1fr 1fr; row-gap: 25px; column-gap: 25px; padding-top: 25px;">
                <!-- 가게 목록 1 -->
                <div style="border: 1px solid #ccc; width: 350px; height: 150px; border-radius: 5px;">
                    <div style="overflow: hidden; margin: 10px; cursor: pointer;">
                        <!-- 가게 이미지 -->
                        <div style="width: 80px; height: 80px; border: 1px solid #ccc; float: left;">
                            img</div>
                        <!-- 가게 설명 -->
                        <div
                            style="float:left; width: 230px; height: 80px; font-size: 14px; margin-left: 10px;">
                            <div>가게이름</div>
                            <div style="color:orange">★ 4.5</div>
                            <div>매일</div>
                            <div>20시~22시</div>
                        </div>
                    </div>
                    <div style="width: 330px;margin: 10px; height: 40px; overflow: hidden;text-overflow: ellipsis; font-size: 13px; word-break: break-all; display: -webkit-box; -webkit-line-clamp: 2;
                    -webkit-box-orient: vertical">소주
                        한병공짜ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaㅁㅁaaaaaaaaaaaaa공짜
                    </div>
                </div>
                <div style="border: 1px solid #ccc; width: 350px; height: 150px; border-radius: 5px;"></div>
                <div style="border: 1px solid #ccc; width: 350px; height: 150px; border-radius: 5px;"></div>
                <div style="border: 1px solid #ccc; width: 350px; height: 150px; border-radius: 5px;"></div>
            </div>
        </div>
    </section>

    <%@include file="main(footer).html" %>
</body>

</html>
<script>

</script>