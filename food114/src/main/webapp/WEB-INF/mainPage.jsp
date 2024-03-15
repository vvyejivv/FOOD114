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
	margin-left: 500px;
	/* border: 1px solid black; */ height : 300px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	height: 300px
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
	cursor: pointer;
}

#slider {
	transition: transform 0.5s ease-in-out;
	height: 370px;
}

.slider {
	white-space: nowrap;
	display: flex;
}

.main-font {
	font-size: 18px;
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
					<img :src="item.filePath+item.fileName" class="slide"
						v-for="item in eventList"
						@click="fnLink({boardNo:item.boardNo, endYn:'N'},'event-web-view.do')">
				</div>

				<div
					style="position: absolute; top: 150px; left: 50px; font-size: 50px; color: white;">
					<a href="javascript:;" style="color: white;" @click="fnPrevEvent"><img
						width="64" height="64"
						src="https://img.icons8.com/hatch/64/FFFFFF/double-left.png"
						alt="double-left" /></a>
				</div>
				<div
					style="position: absolute; top: 150px; right: 50px; font-size: 50px;">
					<a href="javascript:;" style="color: white;" @click="fnNextEvent"><img
						width="64" height="64"
						src="https://img.icons8.com/hatch/64/FFFFFF/double-right.png"
						alt="double-right" /></a>
				</div>
			</div>
			<div class="clickBoxList">
				<div class="clickBox">
					<div style="cursor: pointer" @click="fnLink({},'mapTest2.do')">
						<div
							style="color: #ff7f00; font-size: 35px; height: 100px; display: flex; align-items: center; gap: 10px;">
							지도로검색 <a><img width="32" height="32"
								src="https://img.icons8.com/windows/50/ffcc00/map-marker--v1.png"
								alt="map-marker--v1" /></a>
						</div>
						<div class="main-font">지도로 한번에</div>
					</div>
				</div>
				<div class="clickBox">
					<div style="cursor: pointer"
						@click="fnLink({},'food114_foodfind.do')">
						<div
							style="color: #ffcc00; font-size: 35px; height: 100px; display: flex; align-items: center; gap: 10px;">
							배달시키기 <a><img width="32" height="32"
								src="https://img.icons8.com/windows/50/ff7f00/delivery-scooter.png"
								alt="delivery-scooter" /></a>
						</div>
						<div class="main-font">주문 바로 하기</div>
					</div>
				</div>
				<div class="clickBox">
					<div style="cursor: pointer"
						@click="fnLink({},'event-biz-list.do')">
						<div
							style="color: #ff7f00; font-size: 35px; height: 100px; display: flex; align-items: center; gap: 10px;">
							우리동네 <a><img width="32" height="32"
								src="https://img.icons8.com/ios/50/ffcc00/neighborhood.png"
								alt="neighborhood" /></a>
						</div>
						<div class="main-font">이벤트 보러가기</div>
					</div>
				</div>
				<div class="clickBox">
					<div style="cursor: pointer"
						@click="fnLink({},'event-web-list.do')">
						<div
							style="color: #ffcc00; font-size: 35px; height: 100px; display: flex; align-items: center; gap: 10px;">
							FOOD114<a><img width="25" height="25"
								src="https://img.icons8.com/ios/25/ff7f00/event-accepted.png"
								alt="event-accepted" /></a>
						</div>
						<div class="main-font">모아보기</div>
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
        slides : 0,
        speedTime : 4000,
        currentIdx : 0,
        interval : "",
        eventList : []
    },   
    methods: {
    	/* 웹 주관 이벤트 목록 호출 */
    	fnEventList:function(){
    		var self=this;
    		var nparmap = {
					endYn:"N"
				};
				$.ajax({
					url : "event-list.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {		
						self.eventList=data.list;
						self.currentIdx=data.list.length;						
						self.slides=data.list.length;							
						self.showSliding();
					}
				});
    		
    	},    	
    	/* 페이지 이동 */
    	fnLink : function(map,link){
    		var self=this;
    		$.pageChange(link, map);
    		
    	},
    	/* 슬라이드 이동 함수 */
        move: function(direction) {    		
            var self = this;
            self.translate += direction * self.slideWidth;            
            $("#slider").css({
                "transform": "translateX(" + self.translate + "px)"
            });
            self.currentIdx += direction; 
        },
        /* 슬라이드 함수 */
        sliding: function() {
            var self = this;
            if (self.currentIdx == 1){
                self.move(self.slides - 1);
                setTimeout(() => {                    
                    self.currentIdx = self.slides;
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
            /* self.slideWidth=self.slides[0].offsetWidth; */
            self.slideWidth=2000;
            
            self.interval=setInterval(function() {
                self.sliding();
            }, self.speedTime);
        },
        /* 이벤트 슬라이드 이전으로 */
        fnPrevEvent : function(){
        	var self=this;
        	if(self.currentIdx!=self.slides){
        	self.fnMoveClick(1);
        	} else{
        		self.fnMoveClick(-self.slides+1);
        	}
        },
        /* 이벤트 슬라이드 다음으로 */
        fnNextEvent : function(){
        	var self=this;
        	if(self.currentIdx!=1){
            	self.fnMoveClick(-1);
            	} else{
            		self.fnMoveClick(self.slides-1);
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
        self.fnEventList();
        
        
    }
});

</script>