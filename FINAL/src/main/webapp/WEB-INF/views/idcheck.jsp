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
	body{
		background-color: #F7F1E9;
	}
</style>
</head>
<body>
	<form style="margin-left: 500px; margin-top: 150px;">
	<h1 style="margin-left: 150px; margin-top: 100px;">아이디 찾기</h1>
	<div style="margin-top: 20px;">
		<label style="margin-left: 150px;">이름</label> <br/>
		<input type="text" name="name" id="name" style="margin-left: 150px; width: 250px; height: 20px;"><br/>
		<label style="margin-left: 150px;">이메일</label><br/>
		<input type="text" name="email" id="email" style="margin-left: 150px; width: 250px; height: 20px;"><br/>
		<input type="submit" id="btn" value="확인" style="margin-left: 150px; width: 250px; height: 60px;
		background-color: #FFAC04;">
	</div>	
	</form>
</body>
</html>