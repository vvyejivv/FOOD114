<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<meta charset="UTF-8">
<title>FOOD114 사장님 페이지</title>
<style>
button {
   cursor: pointer;
}
</style>
</head>
<body style="margin: 0px auto;">
<div style="width: 1920px; margin:0px auto;">
      <%@include file="food114_header(biz).jsp"%>
   <section>
      <div id="app" style="width: 1920px; margin: 0px auto;" v-cloak>
         <div style="width: 1420px; margin: 0px auto; overflow: hidden">
            <!-- 배너 -->
            
            
            <div style="width: 1420px; height: 400px; overflow: hidden;">

               <div class="swiper" style="width: 1420px; overflow: visible;">
                  <div class="swiper-wrapper"
                     style="width: 1420px; overflow: visible;">
                     <div class="swiper-slide" style="border-radius: 10px;">
                        <img src="../img/bizevent01.png">
                     </div>
                     <div class="swiper-slide" style="border-radius: 10px;">
                        <img src="../img/bizevent02.png">
                     </div>
                  </div>
                  <div id="slide-btn-container" style="top:170px; width:1300px; left:60px;">
                     <div class="swiper-button-prev swiper-prev"
                        style="color: #FFFFFF;"></div>
                     <div class="swiper-button-next swiper-next"
                        style="color: #FFFFFF;"></div>
                  </div>

               </div>
            </div>
            <!-- 메뉴바 / 로그인창 -->
            <div
               style="width: 1420px; height: 200px; margin-top: 30px; display: flex; justify-content: space-between;">
               <div
                  style="width: 900px; height: 200px; border: 1px solid #EDEDED; border-radius: 10px; display: flex; justify-content: center; align-items: center;">
                  <!-- 메뉴 -->
                  <div
                     style="height: 150px; display: flex; align-items: center; gap: 20px;">
                     <div @click="fnSelectMenu('/food114-biz-menu-insert.do')"
                        style="cursor: pointer; width: 100px; height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center; gap: 10px;">
                        <div style="width: 50px; height: 50px;">
                           <img width="50" height="50"
                              src="https://img.icons8.com/ios/50/4D4D4D/new-store.png"
                              alt="new-store" />
                        </div>
                        <div style="font-size: 14px; color: #5F5F5F;">상품등록</div>
                     </div>
                     <!-- 구분선  -->
                     <div style="width: 1px; height: 50px; background-color: #ccc;"></div>
                     <div @click="fnSelectMenu('/food114-biz-menu-list.do')"
                        style="cursor: pointer; width: 100px; height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center; gap: 10px;">
                        <div
                           style="width: 50px; height: 50px; border: 1px solid #EDEDED;">
                           <img width="50" height="50"
                              src="https://img.icons8.com/external-tal-revivo-light-tal-revivo/50/4D4D4D/external-brief-article-homepage-search-online-service-template-wireframe-light-tal-revivo.png"
                              alt="external-brief-article-homepage-search-online-service-template-wireframe-light-tal-revivo" />
                        </div>
                        <div style="font-size: 14px; color: #5F5F5F;">상품조회</div>
                     </div>
                     <!-- 구분선  -->
                     <div style="width: 1px; height: 50px; background-color: #ccc;"></div>
                     <div @click="fnSelectMenu('/food114-biz-review.do')"
                        style="cursor: pointer; width: 100px; height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center; gap: 10px;">
                        <div style="width: 50px; height: 50px;">
                           <img width="50" height="50"
                              src="https://img.icons8.com/ios/50/4D4D4D/favorite-window.png"
                              alt="favorite-window" />
                        </div>
                        <div style="font-size: 14px; color: #5F5F5F;">리뷰관리</div>
                     </div>
                     <!-- 구분선  -->
                     <div style="width: 1px; height: 50px; background-color: #ccc;"></div>
                     <div @click="fnSelectMenu('/food114-biz-event.do')"
                        style="cursor: pointer; width: 100px; height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center; gap: 10px;">
                        <div style="width: 50px; height: 50px;">
                           <img width="50" height="50"
                              src="https://img.icons8.com/ios/50/4D4D4D/event-accepted-tentatively.png"
                              alt="event-accepted-tentatively" />
                        </div>
                        <div style="font-size: 14px; color: #5F5F5F;">이벤트관리</div>
                     </div>
                     <!-- 구분선  -->
                     <div style="width: 1px; height: 50px; background-color: #ccc;"></div>
                     <div @click="fnSelectMenu('/food114-biz-data.do')"
                        style="cursor: pointer; width: 100px; height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center; gap: 10px;">
                        <div style="width: 50px; height: 50px;">
                           <img width="50" height="50"
                              src="https://img.icons8.com/wired/50/4D4D4D/combo-chart--v1.png"
                              alt="combo-chart--v1" />
                        </div>
                        <div style="font-size: 14px; color: #5F5F5F;">판매통계</div>
                     </div>
                     <!-- 구분선  -->
                     <div style="width: 1px; height: 50px; background-color: #ccc;"></div>
                     <div @click="fnSelectMenu('/food114-biz-info.do')"
                        style="cursor: pointer; width: 100px; height: 100px; display: flex; flex-direction: column; justify-content: center; align-items: center; gap: 10px;">
                        <div style="width: 50px; height: 50px;">
                           <img width="50" height="50"
                              src="https://img.icons8.com/forma-thin/50/4D4D4D/user-male-circle.png"
                              alt="user-male-circle" />
                        </div>
                        <div style="font-size: 14px; color: #5F5F5F;">판매자정보</div>
                     </div>
                  </div>
               </div>
               <div
                  style="width: 450px; height: 200px; border: 1px solid #EDEDED; border-radius: 10px;">
                  <div
                     style="text-align: center; padding: 40px; font-size: 16px; color: #222222;">사장님
                     반갑습니다!</div>
                  <div v-if="!sessionId"
                     style="display: flex; justify-content: center;">
                     <button
                        style="border-radius: 5px; border: 1px solid #EDEDED; cursor: pointer;  padding: 10px 150px; color: #222222; font-size: 14px;"
                        @click="fnBizLogin()">로그인</button>
                  </div>
                  <div v-else style="display: flex; justify-content: center;">
                     <button
                        style="border-radius: 5px; border: 1px solid #EDEDED; padding: 10px 144px; color: #222222; font-size: 14px;"
                        @click="fnBizLogout()">로그아웃</button>
                  </div>
                  <div v-if="sessionId==''"
                     style="display: flex; justify-content: center; margin-top: 5px;">
                     <button
                        style="border-radius: 5px; border: 1px solid #EDEDED; padding: 10px 144px; background-color: #fff; color: #5F5F5F; font-size: 14px;"
                        @click="fnBizSignup()">회원가입</button>
                  </div>
               </div>
            </div>
            <!-- 공지사항 / 고객센터 -->
            <div
               style="width: 1420px; margin-top: 30px; display: flex; justify-content: space-between;">
               <!-- 공지사항 -->
               <div style="width: 900px;">
                  <div style="padding: 10px 0px;">
                     <span style="color: #ff7f00; font-weight: bold; font-size: 16px;">|
                     </span> <span style="text-align: left; color: #222222; font-size: 16px;">공지사항&nbsp;</span>
                  </div>
                  <div>
                     <table style="margin: 0px auto; border-collapse: collapse;">
                        <tr
                           style="border-top: 2px solid #b0b0b0; border-bottom: 1px solid #EDEDED;">
                           <th
                              style="width: 50px; color: #5F5F5F; padding: 12px 8px; font-size: 14px;">NO</th>
                           <th
                              style="width: 550px; color: #5F5F5F; padding: 12px 8px; font-size: 14px;">제목</th>
                           <th
                              style="width: 100px; color: #5F5F5F; padding: 12px 8px; font-size: 14px;">작성자</th>
                           <th
                              style="width: 200px; color: #5F5F5F; padding: 12px 8px; font-size: 14px;">작성일</th>

                        </tr>
                        <tr style="text-align: center;" v-for="item in limitBoardList">
                           <td
                              style="color: #5F5F5F; font-size: 13px; padding: 12px 10px; font-size: 13px;">{{item.boardNo}}</td>
                           <td
                              style="color: #5F5F5F; font-size: 13px; padding: 12px 10px; font-size: 13px;"><a
                              style="text-decoration: none; color: #5f5f5f;"
                              href="javascript:;" @click="fnBoardView(item.boardNo)">{{item.title}}</a></td>
                           <td
                              style="color: #5F5F5F; font-size: 13px; padding: 12px 10px; font-size: 13px;">관리자</td>
                           <td
                              style="color: #5F5F5F; font-size: 13px; padding: 12px 10px; font-size: 13px;">{{item.cdateTime}}</td>
                        </tr>
                     </table>
                  </div>
               </div>
               <!-- 고객센터 -->
               <div
                  style="width: 450px; border: 1px solid #EDEDED; border-radius: 10px;">
                  <div
                     style="padding: 25px; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #EDEDED;">
                     <div style="color: #5F5F5F; font-size: 14px;">고객센터</div>
                     <div style="color: #ff7f00; font-size: 18px; font-weight: bold;">❯</div>
                  </div>
                  <div
                     style="padding: 25px; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #EDEDED;">
                     <div style="color: #5F5F5F; font-size: 14px;">사장님 입점 문의</div>
                     <div style="color: #ff7f00; font-size: 18px; font-weight: bold;">❯</div>
                  </div>
                  <div
                     style="padding: 25px; display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #EDEDED;">
                     <div style="color: #5F5F5F; font-size: 14px;">광고 배너 문의</div>
                     <div style="color: #ff7f00; font-size: 18px; font-weight: bold;">❯</div>
                  </div>
                  <div
                     style="padding: 25px; display: flex; justify-content: space-between; align-items: center;">
                     <div style="color: #5F5F5F; font-size: 14px;">1:1문의</div>
                     <div style="color: #ff7f00; font-size: 18px; font-weight: bold;">❯</div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
      <%@include file="food114_footer(biz).jsp"%>
   </div>
</body>
</html>
<script type="text/javascript">
   var app = new Vue({
      el : '#app',
      data : {
         sessionId : "${sessionBizId}",
         limitBoardList : []
      },
      methods : {
         fnBoardListLimit : function() {
            var self = this;
            var nparmap = {};
            $.ajax({
               url : "searchBoardListLimit.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {
                  self.limitBoardList = data.limitBoardList;
               }
            });
         },
         fnBizLogin : function() {
            location.assign("/food114-biz-login.do");
         },
         fnBizLogout : function() {
            var self = this;
            if (!confirm("정말 로그아웃 하시겠습니까?")) {
               return;
            }
            var nparmap = {};
            $.ajax({
               url : "logout.dox",
               dataType : "json",
               type : "POST",
               data : nparmap,
               success : function(data) {
                  $.pageChange("/food114-biz.do", {});
               }
            });
         },
         fnBizSignup : function() {
            location.assign("/food114-biz-join.do");
         },
         fnSelectMenu : function(addr) {
            location.assign(addr);
         },
         fnBoardView : function(boardNo) {
            $.pageChange("/food114-biz-notice-view.do", {
               boardNo : boardNo
            });
         }
      },
      created : function() {
         var self = this;
         self.fnBoardListLimit();
      },
      mounted() {
         new Swiper('.swiper', {
            autoplay : {
               delay : 4000, // 4초마다 재생
               disableOnInteraction: false, // 화살표 클릭 이후에도 자동 재생 유지
            },
            loop : true, // 자동 무한 슬라이드
            slidesPerView : 1, // 보이는 슬라이드 개수
            spaceBetween : 50, // 슬라이드 사이 gap
            centeredSlides : true,
            navigation : {
               prevEl : '.swiper-prev',
               nextEl : '.swiper-next',
            },
         });
         }
   });
</script>