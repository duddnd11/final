<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="chatRooms">
		<c:forEach items="${rooms}" var="rooms">
			방제목 : ${rooms.name}<br/>
			방번호(id) :${rooms.roomId}<br/>
			고객명 : ${rooms.user }<br/>
			고객아이디 : ${rooms.userId }<br/>
			<input type="button" onclick="location.href='room?id=${rooms.roomId}'" value="방입장"/><br/><br/>
		</c:forEach>
	</div>
</body>
</html>