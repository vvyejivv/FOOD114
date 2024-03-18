<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<!-- 지도  -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=753d2e1bb03d5938bad9908725e5ad41&libraries=services"></script>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/shopInfo.css">
<title>가게리뷰</title>
</head>
<style>
</style>
<body style="margin: 0px;">
	<header>
		<%@include file="food114_header.jsp"%>
	</header>
	<%@include file="shopInfo_header.jsp"%>
	<div id="app" v-cloak style="width: 1920px; margin: 0px auto;">
		<section>
		<!-- 리뷰 -->
        <div style="width: 1420px; margin: 0px auto;">
            <!-- 고객 리뷰  -->
            <div style="width: 1420px; display: flex;" v-for="item in review">
                <!-- 고객프로필 사진 -->
                <div style="width: 92px; height: 92px; border-radius: 999px; margin : 20px 20px;">
                    <img src="../img/기본_프로필.jpg" style="width: 92px; height: 92px; border-radius: 999px;">
                </div>
                <!-- 고객 리뷰 내용 -->
                <div style="width: 1268px; margin : 20px 0px 20px 0px;" >
                    <div style="width: 1268px;">
                        <div style="width: 1268px; height: 50px; margin-bottom: 20px;">
                            <!-- 날짜 -->
                            <div style="font-size: 14px; line-height: 14px; color: #9E9E9E; float: right; right: 0px; bottom: 0px;">{{item.userReviewDate}}</div>
                            <!-- 고객이름 / 별점-->
                            <div style="width: fit-content; height: 17px; display: flex; margin-bottom: 15px;">
                                <div style="width: fit-content; margin-right: 15px; line-height: 17px; color: #000000; font-size: 17px;">{{item.userId}}님</div>
                                <div style="width: 78.83; height: 13.47px; margin-right: 2px;"><img src="../img/star.png"></div>
                                <div style="width: 78.83; height: 13.47px; margin-right: 2px;"><img src="../img/star.png"></div>
                                <div style="width: 78.83; height: 13.47px; margin-right: 2px;"><img src="../img/star.png"></div>
                                <div style="width: 78.83; height: 13.47px; margin-right: 2px;"><img src="../img/star.png"></div>
                                <div style="width: 78.83; height: 13.47px; margin-right: 2px;"><img src="../img/star_gray.png"></div>
                            </div>
                            <!-- 메뉴 -->
                            <div style="width: fit-content;; height:14px; line-height: 14px; font-size: 14px; color: #9E9E9E;">{{item.menuList}}</div>
                        </div>
                        <!-- 리뷰 내용 -->
                        <div style="width: 1268px; border: 1px solid #EDEDED; border-radius: 10px; margin-bottom: 20px;">
                            <!-- 리뷰사진 -->
                            <div style="width: 300px; height: 300px; margin: 20px 20px;"><img src="../img/메가커피_리뷰사진.jpg" style="width: 300px; height: 300px;"></div>
                            <!-- 리뷰 글 -->
                            <div style="width: fit-content; line-height: 14px; font-size: 14px; color: #5F5F5F; margin: 0px 0px 20px 20px;">{{item.userReview}}</div>
                        </div>
                        <!-- 사장님 답글 -->
                        <div style="width: 1228px; border: 1px solid #EDEDED; border-radius: 10px; padding: 20px 20px;" v-if="item.shopCmt">
                            <div style="width: 1228px; height: 24px; display: flex; margin-bottom: 15px; justify-content: space-between;">
                                <div style="width: fit-content; display: flex;">
                                    <div style="width: 24px; height: 24px;"><img src="../img/리뷰답글아이콘.png" style="width: 24px; height: 24px;"></div>
                                    <div style="width: fit-content; line-height: 17px; color: #000000; font-size: 17px; margin: 3.5px 0px 3.5px 10px;">{{item.bizId}}</div>
                                </div>
                                <!-- 날짜 -->
                                <div style="font-size: 14px; line-height: 14px; color: #9E9E9E;">{{item.shopCmtDate}}</div>
                            </div>
                            <div style="width: 893px; padding-left: 34px;">
                                <div style="color:#5F5F5F; width: fit-content; line-height: 20px;">{{item.shopCmt}}</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


         
   
        </div>
		</section>
	</div>

<%@include file="main(footer).html"%>

</body>
</html>
<script type="text/javascript">
	var app = new Vue({
		el : '#app',
		data : {
			selectTab : '${map.selectTab}', /* 선택한 탭 */
			bizId : '${map.bizId}',
			reviewList : {},
			review : {}
		},
		methods : {
			fnView : function() {
				var self = this;
				console.log(self.bizId);
				var nparmap = {
					bizId : self.bizId
				};
				$.ajax({
					url : "reviewList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.reviewList = data.reviewList;
						self.review = data.review;
						console.log(data.review);
					}
				});
			},
		},
		created : function() {
			var self = this;
			self.fnView();
		}
	});
</script>