<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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