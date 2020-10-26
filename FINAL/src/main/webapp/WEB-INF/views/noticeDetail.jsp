<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
		<td>글번호</td>
		<td>${detail.nbo}</td>		
		</tr>
		<tr>
		<td>날짜</td>
		<td>${detail.date}</td>
		</tr>
		<tr>
		<td>제목</td>
		<td>${detail.title}</td>
		</tr>
		<tr>
		<td>내용</td>
		<td>${detail.content}</td>
		</tr>
		<tr>
	</table>
	<br/>
	
	<input type="button" value="목록" id="board" onclick="location.href='notice?offset=0'"/>
</body>
</html>