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
	<a href="qnaBoard?offset=${offset-100}&keyword=${keyword}"><<</a>
	
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<a href="qnaBoard?offset=${i*10}">${i+1}</a>
	</c:forEach>
		<c:if test="${(pageSize/10-pageSize%10) ne (startPage/10-startPage%10) }">
			<a href="qnaBoard?offset=${offset+100}&keyword=${keyword}">>></a>
		</c:if>
	<br/>
	
	<form action="qnaBoard">
		<select>
			<option value="title">제목</option>		
			<option value="content">내용</option>		
			<option value="writer">작성자</option>		
		</select>
		<input type="hidden" name="offset" value="0"/>
		<input name="keyword" value="${keyword}"/>
		<input type="submit" value="조회"/>
	</form>
	<input type="button" value="문의글쓰기" onclick="location.href='qnaWrite'"/>
</body>
</html>







