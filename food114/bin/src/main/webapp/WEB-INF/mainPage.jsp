<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
<title>MAIN</title>

</head>
<style>
.clickBoxList {
	width: 1000px;
	margin: 0px auto;
	/* border: 1px solid black; */
	height: 300px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.clickBox {
	width: 250px;
	height: 250px;
	float: left;
	margin: 10px;
	box-sizing: border-box;
	padding-top: 20px;
}

.eventSlide {
	margin: 20px auto;
	width: 100%;
	background-color: aliceblue;
	box-sizing: border-box;
	text-align: center;
	margin-bottom: 0px;
	margin-top: 0px;
	height: 370px;
	overflow: hidden;
}

.slide {
	width: 2000px;
	height: 370px;
}

#slider {
	transition: transform 0.5s ease-in-out;
}

.slider {
	white-space: nowrap;
	display: flex;
}
</style>
<body>

	<%@include file="main(header).html"%>

	<section>
		<div id="main">
			<div
				style="margin: 0px auto; width: 1900px; overflow: hidden; position: relative;">
				<div class="slider" id="slider"
					style="background: white; margin-top: 2px;">
					<!-- <h1>이벤트 슬라이드</h1> -->
					<img src="../img/main_event1.jpg" class="slide">
					<img src="../img/main_event2.jpg" class="slide">
					<img src="../img/main_event3.jpg" class="slide">
					<img src="../img/main_event4.jpg" class="slide">
					<img src="../img/main_event5.jpg" class="slide">
				</div>
				<div
					style="position: absolute; top: 150px; left: 50px; font-size: 50px; color: white;">
					<a href="javascript:;" style="color: white;" @click="fnPrevEvent">❮</a>
				</div>
				<div
					style="position: absolute; top: 150px; right: 50px; font-size: 50px;">
					<a href="javascript:;" style="color: white;" @click="fnNextEvent">❯</a>
				</div>
			</div>
			<div class="clickBoxList">
				<div class="clickBox">
					<div style="cursor: pointer">
						<div
							style="color: green; font-size: 40px; height: 100px; display: flex; align-items: center; gap: 10px;">
							지도로검색 <a
								style="background-color: green; color: white; display: inline-block; width: 30px; height: 30px; font-size: 20px; border-radius: 50%; text-align: center;">❯</a>
						</div>
						<div>내 주변 이벤트들을 한눈에</div>
					</div>
				</div>
				<div class="clickBox">
					<div style="cursor: pointer">
						<div
							style="color: orange; font-size: 32px; height: 100px; display: flex; align-items: center; gap: 10px;">
							배달시키기 <a
								style="background-color: orange; color: white; display: inline-block; width: 30px; height: 30px; font-size: 20px; border-radius: 50%; text-align: center;">❯</a>
						</div>
						<div>배달시키러가기</div>
					</div>
				</div>
				<div class="clickBox">
					<div style="cursor: pointer">
						<div
							style="color: #ff7f00; font-size: 32px; height: 100px; display: flex; align-items: center; gap: 10px;">
							우리동네이벤트 <a
								style="background-color: #ff7f00; color: white; display: inline-block; width: 30px; height: 30px; font-size: 20px; border-radius: 50%; text-align: center;">❯</a>
						</div>
						<div>매장 이벤트 전체 보기</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<%@include file="main(footer).html"%>

</body>

</html>
<script>
var main = new Vue({ 
    el: '#main',
    data: {
        translate : 0,
        slideWidth : 0,
        slides : document.querySelectorAll('.slide'),
        speedTime : 4000,
        currentIdx : 5,
        interval : ""
    },   
    methods: {
    	/* 슬라이드 이동 함수 */
        move: function(direction) {    		
            var self = this;
            self.translate += direction * self.slideWidth;
            console.log(self.currentIdx);
            $("#slider").css({
                "transform": "translateX(" + self.translate + "px)"
            });
            self.currentIdx += direction; 
        },
        /* 슬라이드 함수 */
        sliding: function() {
            var self = this;
            if (self.currentIdx == 1){
                self.move(self.slides.length - 1);
                setTimeout(() => {                    
                    self.currentIdx = self.slides.length;
                    self.translate = 0;
                    $("#slider").css({                	
                        "transform": "translateX(" + self.translate + "px)"
                    });
                }, self.speedTime);
            } else {
                self.move(-1); 
            }
        },
        /* 슬라이드 실행 */
        showSliding: function() {
            var self = this;            
            self.slideWidth=self.slides[0].offsetWidth;
            self.interval=setInterval(function() {
                self.sliding();
            }, self.speedTime);
        },
        /* 이벤트 슬라이드 이전으로 */
        fnPrevEvent : function(){
        	var self=this;
        	if(self.currentIdx!=5){
        	self.fnMoveClick(1);
        	} else{
        		self.fnMoveClick(-4);
        	}
        },
        /* 이벤트 슬라이드 다음으로 */
        fnNextEvent : function(){
        	var self=this;
        	if(self.currentIdx!=1){
            	self.fnMoveClick(-1);
            	} else{
            		self.fnMoveClick(4);
            	}    	
        },
        /* 이벤트 슬라이드 화살표 클릭시 함수 정리 */
        fnMoveClick : function(num){
        	var self=this;
        	clearInterval(self.interval);
        	self.move(num);          	
        	setTimeout(() => {        		
        	}, self.speedTime);   
        	self.interval=setInterval(function() {
                self.sliding();
            }, self.speedTime);
        }
    },   
    created: function() {
        var self = this;
        self.showSliding();
    }
});

</script>