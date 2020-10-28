<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의글 쓰기</title>
</head>
<body>
	<form action="qnaWriteAction" style="margin-left: 500px; margin-top: 150px; font-size: 20px">
	제목<br/>
	<input type="text" name="title" placeholder="제목을 입력하세요"/ style="width: 500px; font-size: 20px"><br/>
	내용<br/>
	<textarea rows="30" cols="30" name="content" placeholder="내용을 입력하세요" style="width: 500px;
	height: 300px; font-size: 20px;"></textarea><br/>
	<input type="submit" value="문의글쓰기"/>
	</form>
</body>
<%@ include file="footer.jsp" %>
</html>