<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
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
<div id="container" style="width: 1500px;">
	<div style="width: 300px; height: 1000px; position: fixed;">
	<c:forEach var="category" items="${category}">
		<a href="showAuctionNormal?category=${category}">${category}</a><br/>
	</c:forEach>
	카테고리 --왼쪽에
	</div>
	<div style="width: 1100px; height: 400px; display: flex; margin-left: 300px; ">
	<c:forEach var="vo" items="${list }">
	<div style="margin-left: 50px; width: 200px; display: block;">
	<c:if test="${vo.image ne null }">
			<a href="showDetail?pno=${vo.pno }"><img src="${vo.image }"/></a>	
		</c:if>
		<c:if test="${vo.image eq null }">
			<a href="showDetail?pno=${vo.pno }"><img src="resources/images/${vo.img1 }"/></a> <br/>
		</c:if>
		<p>상품 이름: <a href="showDetail?pno=${vo.pno }">${vo.pname }</a><br/>
		마감날: ${vo.deadlinedate }<br/>
		조회수: ${vo.hitcount }<br/>
		입찰수 ${vo.count }<br/></p>
	</div>
	</c:forEach>
	</div>
</div>
</body>
</html>
	<%@ include file="footer.jsp" %>


