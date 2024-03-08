<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MAIN</title>
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
</style>
</head>
<link rel="stylesheet" href="../css/boardNotice.css">
<body>

	<header>
		<%@include file="main(header).html"%>
	</header>

	<!-- 광고창 -->
	<!--
        <div class="ad">
            광고창
            <button class="adClose">x</button>
        </div>
    -->
	<section>
		<div id="app">
			<div class="container">
				<div class="content">
					<br>
					<h2>
						<span style="color: #ff7f00; font-weight: bold;">| </span><span
							style="text-align: left; color: rgba(72, 72, 72);">공지사항&nbsp;</span>
						<span class="span">새로운 소식과 유용한 정보를 한 곳에서 확인하세요.</span>
					</h2>
					<div>
						<table border="1">
							<tr>
								<td colspan="1"
									style="background-color: #f9f9f9; border-top: 2px solid rgba(72, 72, 72); max-width :200px">제목</td>
								<td style="border-top: 2px solid rgba(72, 72, 72);">{{info.title}}</td>
							</tr>
							<tr>
								<td colspan="1" style="background-color: #f9f9f9;">작성자</td>
								<td>{{info.userId}}</td>
							</tr>
							<tr>
								<td style="background-color: #f9f9f9;">작성일</td>
								<td colspan="1">{{formatDate(info.cdateTime)}}</td>
							</tr>
							<tr>
								<td colspan="4" style="height: 600px; border-bottom: #333;">
									{{info.contents}}</td>
							</tr>
						</table>
						<div>
							<button @click="fnClickNoticeList"
								style="width: 150px; font-size: 15px; margin-top: 15px; margin-left: 350px; margin-bottom: 100px;">목록</button>
						</div>
					</div>
	</section>

	<%@include file="main(footer).html"%>

	<script type="text/javascript">
		var app = new Vue({ 
		    el: '#app',
		    data: {
		    	boardNo : "${map.boardNo}",
		    	list : [],
		    	info : {},
		    	boardList : ""
		    },   
		     methods : {
		    	fnList : function(){
		            var self = this;
		            console.log(self.boardNo);
		            return;
		            var nparmap = {
		            		boardNo : self.boardNo
		            };
		            $.ajax({
		                url:"boardNoticeVeiw.dox",
		                dataType:"json",	
		                type : "POST", 
		                data : nparmap,
		                success : function(data) {
		                	self.info = data.info;
		                	console.log(data);
		                }
		            }); 
		    } ,
		    fnClickNoticeList : function(userId){
				location.href= "/boardNoticeList.do";
		    	},
		    	formatDate : function(dateString) {
					if (dateString) {
						return dateString.split(' ')[0];
					}
				}
		     },
		     computed : {
					paginatedList : function() {
						var self = this;
						var startIndex = (this.nowPage - 1) * self.searchCnt;
						var endIndex = startIndex + self.searchCnt;
						return this.list.slice(startIndex, endIndex);
					}
				}
		    , created: function () {
		    	var self = this;
		    	self.fnList();
			}
		});
</script>