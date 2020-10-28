<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<c:if test="${member != null }">
		<div>
			<p>${member.ID }님 환영합니다.</p>
			<button id="memberUpdateBtn" type="button">회원정보수정</button>
			<input type = "submit" value = "게시글 작성"/>
		</div>
	</c:if>
</body>
</html>