<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<c:choose>
		<c:when test="${MemberVo.getImagename() ne '이미지파일없음' }">
			<img src="resources/images/${MemberVo.getImagename() }"/> 님 환영합니다.<br/>
		</c:when>
		<c:when test="${MemberVo.getImagename() eq '이미지파일없음' }">
			${MemberVo.getId()} 님 환영합니다.<br/>
		</c:when>
	</c:choose>
	<input type="button" value="가입" onclick="location.href='register'"/>
	<input type="button" value="로그인" onclick ="location.href='login'"/>
	<input type="button" value="회원정보" onclick ="location.href='modify'"/>
	<input type="button" value="게시판" onclick ="location.href='board?offset=0'"/>
</body>
</html>
