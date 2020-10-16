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
		<tr>
			<td>글번호</td>
			<td>${detail.getIdx()}</td>		
		</tr>
		<tr>
			<td>글제목</td>
			<td>${detail.getTitle()}</td>		
		</tr>	
		<tr>
			<td>글내용</td>
			<td>${detail.getContent()}</td>		
		</tr>
		<tr>
			<td>작성자</td>
			<c:choose>
				<c:when test="${detail.getImagename() ne '이미지파일없음' }">
					<td><img src="resources/images/${detail.getImagename()}"/></td>
				</c:when>
				<c:when test="${detail.getImagename() eq '이미지파일없음' }">
					<td>${detail.getWriter()}</td>
				</c:when>
			</c:choose>
		</tr>
	</table>
	<input type="button" value="답글" onclick="location.href='reply?idx=${detail.getIdx()}'"/>
</body>
</html>