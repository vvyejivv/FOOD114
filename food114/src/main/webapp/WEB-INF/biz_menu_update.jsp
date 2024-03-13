<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/sideBar_biz.css">
<title>로그인</title>
</head>
<style>
	.box{
		display:inline-block;
		width:100px;
		height:80px;
		border:1px solid #bbb;
		margin-top:15px;
		margin-right:3px;
		border-radius: 5px;
    	box-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
	}
	.box-text{
		margin:8px 0 8px 12px;
	}
	
	table {
			margin-top:30px;
            width: 1100px;
            border-collapse: collapse;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        input[type="checkbox"],
        .btn-modify {
            cursor: pointer;
        }
		
		
        .btn-modify {
        	width:60px;
            background-color: #ffffff; /* 버튼 배경색 (흰색) */
            border: 1px solid #2196F3; /* 버튼 테두리 (파란색) */
            color: #2196F3; /* 텍스트 색상 (파란색) */
            padding: 8px 12px; /* 내부 여백 */
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            transition-duration: 0.4s; /* 트랜지션 효과 지속 시간 */
            cursor: pointer;
            border-radius: 4px; /* 버튼에 border-radius 적용 */
        }

        .btn-modify:hover {
        	border: 1px solid #ff7f00;
        	color: #ff7f00;
        }
        
</style>
<body>
	<%@include file="main(header)_biz.html"%>
	<!-- 광고창 -->
	<!-- <div class="ad">
        광고창
        <button class="adClose">x</button>
    </div> -->
	<section>
		<%@include file="sideBar_biz.html"%>
		<div id="app">
			<div class="mold">
				<h2>
               	<span style="color: #ff7f00; font-weight: bold;">| </span><span
                  style="text-align: left; color: rgba(72, 72, 72);">상품조회/수정&nbsp;</span>
            	</h2>
				<div>
					<div class="box">
						<div class="box-text">전체</div>
						<div class="box-text"><span style="font-weight:bold;">{{menuCnt.cnt}}</span>건</div>
					</div>
					<div class="box">
						<div class="box-text">판매중</div>
						<div class="box-text"><span style="font-weight:bold;">{{menuCnt.ing}}</span>건</div>
					</div>
					<div class="box">
						<div class="box-text">판매대기</div>
						<div class="box-text"><span style="font-weight:bold;">0</span>건</div>
					</div>
					<div class="box">
						<div class="box-text">판매중지</div>
						<div class="box-text"><span style="font-weight:bold;">{{menuCnt.soldOut}}</span>건</div>
					</div>
					<div class="box">
						<div class="box-text">판매종료</div>
						<div class="box-text"><span style="font-weight:bold;">{{menuCnt.end}}</span>건</div>
					</div>
				</div>
				<div style="margin-top:30px;">상품목록<small>(총 {{menuCnt.cnt}}개)</small></div>
				<table>
					<tr>
						<th>카테고리</th>
						<th>등록상품ID</th>
						<th>등록 상품명</th>
						<th>판매상태</th>
						<th>판매가</th>
						<th>수정</th>
					</tr>
					<tr v-for="(item,index) in menuList">
						<td>식음료</td>
						<td>{{item.menuNo}}</td>
						<td>{{item.menu}}</td>
						<td>{{item.sta}}</td>
						<td>{{item.price}}</td>
						<td><button class="btn-modify" @click="fnUpdateView(item.menuNo)">수정</button></td>
					</tr>
				</table>
			</div>
		</div>
	</section>
	<%@include file="main(footer)_biz.html"%>
</body>

</html>
<script>
	var app = new Vue({
		el : '#app',
		data : {
		    sessionId : "${sessionId}",
			menuList : [],
			menuCnt : ""
		},
		methods : {
			fnMenuList : function() {
				var self = this;
				var nparmap = {
					bizId : self.sessionId						
				};
				$.ajax({
					url : "menuList.dox",
					dataType : "json",
					type : "POST",
					data : nparmap,
					success : function(data) {
						self.menuList = data.menuList;
						self.menuCnt = data.menuCnt;
						console.log(data.menuList);
						console.log(data.menuCnt);
					}
				});
			},
			fnUpdateView : function(menuNo) {
				$.pageChange("/biz-menu-update-view.do",{
	        		menuNo : menuNo
	        	});
			}
		},
		created : function() {
			var self = this;
			self.fnMenuList();
		}
	});
</script>