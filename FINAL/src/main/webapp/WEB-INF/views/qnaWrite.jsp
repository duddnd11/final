<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의글 쓰기</title>
</head>
<body>
	<form action="qnaWriteAction" style="margin-left: 500px; margin-top: 150px;">
	글제목<input type="text" name="title"/><br/>
	글내용<textarea rows="30" cols="30" name="content"></textarea><br/>
	<input type="submit" value="문의글쓰기"/>
	</form>
</body>
</html>