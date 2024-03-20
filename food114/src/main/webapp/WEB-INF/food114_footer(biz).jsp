<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <script src="js/jquery.js"></script>
        <link rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
        <script
            src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
        <meta charset="UTF-8">
        <meta name="viewport"
            content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <link rel="stylesheet" href="../css/food114_biz.css">
        <title>Document</title>
    </head>
    <style>
       
    </style>

    <body>

        <!-- 푸터 -->
        <div id="footer-container">
            <div id="footer-contents-left">
                <div id="footer-logo">FOOD114</div>
                <div id="footer-text">
                    <span>더조은아카데미</span>
                    <span>|</span>
                    <span>인천광역시 부평구 부평동</span>
                    <span>|</span>
                    <span>인천광역시 부평구 부평동</span>
                </div>
                <div style="margin-top: 15px;">010-6382-4246</div>
            </div>
            <div id="footer-contents-right">
                <div
                    style="overflow: hidden;">
                    <div id="footer-sns"><img
                            src="../img/instagram.png">
                        <img src="../img/github.png" @click="fnLink('https://github.com/dlehdwo01/TeamProject1-FOOD114')" style="cursor: pointer;"></div>
                </div>
                <div id="footer-link">
                    <span>이용약관</span>
                    <span>|</span>
                    <span>이용안내</span>
                    <span>|</span>
                    <span>개인정보처리방침</span>
                    <span>|</span>
                    <span>사이트맵</span>
                </div>
            </div>
        </div>
    </body>
</html>
<script>
	var footerContainer = new Vue({
		el : '#footer-container',
		data : {

		},
		methods : {
			fnLink : function(link) {
				var self=this;
				location.href=link;
				
			}

		},
		created : function() {
			var self = this;
		}
	});
</script>
