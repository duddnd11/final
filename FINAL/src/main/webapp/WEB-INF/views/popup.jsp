<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function popup(){
				var url = "login/";
				var name = "login popup";
				var option = "width = 550, height = 500, top = 100, left = 200, location = no"
				window.open(url, name, option);
			}
	</script>
	<a href=" javascript:popup()">팝업</a>
</body>
</html>