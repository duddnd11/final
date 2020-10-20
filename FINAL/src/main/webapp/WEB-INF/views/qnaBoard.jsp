<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
</head>
<body>
	<table>
	<c:forEach var="qnaBoard" items="${qnaBoard}">
		<tr>
			<td>${qnaBoard.qbno}</td>
			<td><a href="qnaDetail?qbno=${qnaBoard.qbno}">${qnaBoard.title}</a></td>
			<td>${qnaBoard.ID}</td>
		</tr>
	</c:forEach>
	</table>
	<a href="qnaBoard?offset=${offset-100}"><<</a>
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="qnaBoard?offset=${i*10}">${i+1}</a>
	</c:forEach>
	<a href="qnaBoard?offset=${offset+100}">>></a>
	<br/>
	<input type="button" value="문의글쓰기" onclick="location.href='qnaWrite'"/>
</body>
</html>