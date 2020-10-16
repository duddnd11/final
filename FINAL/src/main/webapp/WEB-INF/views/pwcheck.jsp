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
		<label>이름</label> <br/>
		<input type="text" name="name" id="name"><br/>
		<label>아이디</label><br/>
		<input type="text" name="email" id="email"><br/>
		<input type="submit" id="btn" value="확인">
		
	</form>
</body>
</html>