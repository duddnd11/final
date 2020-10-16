<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#name{
		margin-top: 8px;
		width: 200px;
		margin-bottom: 8px;
	}
	#email{
		margin-top: 8px;
		width: 200px;
	}
	#btn{
		margin-top: 20px;
		width: 70px;
		margin-left: 50px; 
	}
	
</style>
</head>
<body>
	<form style="border: 1px solid #cccccc">
		<label style="margin-left: 150px;">이름</label> <br/>
		<input type="text" name="name" id="name" style="margin-left: 150px;"><br/>
		<label style="margin-left: 150px;">이메일</label><br/>
		<input type="text" name="email" id="email" style="margin-left: 150px;"><br/>
		<input type="submit" id="btn" value="확인" style="margin-left: 150px;">
		
	</form>
</body>
</html>