<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding = "utf-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<form action = "memberupdate">
		<p>${member.name }님 환영 합니다.</p>
		<input type = "submit" value = "회원정보 수정" />
	</form>
</body>
</html>
