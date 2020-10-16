<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<c:forEach var="board" items="${boardList}">
		<tr>
			<td>${board.getIdx() }</td>
			<td><a href="detail?idx=${board.getIdx()}">${board.getTitle()}</a></td>
			<c:choose>
				<c:when test="${board.getImagename() ne '이미지파일없음' }">
					<td><img src="resources/images/${board.getImagename()}"/></td>
				</c:when>
				<c:when test="${board.getImagename() eq '이미지파일없음' }">
					<td>${board.getWriter()}</td>
				</c:when>
			</c:choose>
		</tr>
	</c:forEach>
	</table>
	
	<c:forEach var="i" begin="0" end="${page}">	
		<a href="board?offset=${i*10}">${i+1}</a>
	</c:forEach>
	<br/>
	<input type="button" value="글쓰기" onclick="location.href='write'"/>
</body>
</html>