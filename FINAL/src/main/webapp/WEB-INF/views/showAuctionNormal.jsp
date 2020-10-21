<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	img {
		width: 200px;
    	height: 200px;
	}
</style>
<body>
	카테고리 --왼쪽에
	<c:forEach var="vo" items="${vo }">
		상품 이름: ${vo.pname }<br/>
		마감날: ${vo.deadlinedate }<br/>
		조회수: ${vo.hitcount }<br/>
		입찰수 ${vo.count }<br/>
		<a href="showDetail?pno=${vo.pno }"><img src="${vo.image }"/></a>		<!-- image나 filenames 둘중 하나만 나오게? -->
		<a href="showDetail?pno=${vo.pno }"><img src="resources/images/${vo.filenames }"/></a> <br/>
	
	</c:forEach>
</body>
</html>


