<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<meta charset="UTF-8">
	<title>첫번째 페이지</title>
</head>
<body>
	<div id="app">
	main
	</div>
</body>
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
    	self.list();
	}
});
</script>