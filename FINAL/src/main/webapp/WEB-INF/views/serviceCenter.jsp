<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<html>
<head>
	<title>ServiceCenter</title>
</head>
<body>
<input type="button" value="채팅" onclick="location.href='chatting'"/>
<input type="button" value="문의게시판" onclick="location.href='qnaBoard?offset=0'"/>
<input type="button" value="공지사항" onclick="location.href='notice?offset=0'"/>
</body>
<%@ include file="footer.jsp" %>
</html>