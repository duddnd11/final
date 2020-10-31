<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	li{
		display: inline-block;
		list-style: none;
	}
</style>
<body>
<div id="container" style="width: -webkit-fill-available; margin-top: 200px;">
	<h2 style="text-align: center; margin-left: -200px; font-size: 30px;">블라인드 경매</h2>
	<div style="width: 300px; height: 1000px; position: fixed;">
	<c:forEach var="category" items="${category}">
		<a href="showAuctionBlind?category=${category}">${category}</a><br/>
	</c:forEach>
	카테고리 --왼쪽에
	</div>
	
	
	<c:set var="dead" value="${vo.deadlinedate }"/>
	<div style="width: 1100px;display: flex; margin-left: 200px; ">
	<ul>
	<c:forEach var="vo" items="${voListShowBlind }">
	<li style="margin-top: 50px;">
	<div style="margin-left: 50px; width: 200px; display: block;" >
		<c:if test="${vo.image ne null }">
			<a href="showDetail?pno=${vo.pno }"><img src="${vo.image }"/></a>		
		</c:if>
		<c:if test="${vo.image eq null }">
			<a href="showDetail?pno=${vo.pno }"><img src="resources/images/${vo.img1 }"/></a> <br/>
		</c:if>
		<p><b><a href="showDetail?pno=${vo.pno }">${vo.pname }</a></b></p>
		<p>마감날: ${fn:substring(dead,0,10) }</p>
		조회수: ${vo.hitcount }<span>&nbsp</span><span>&nbsp</span><span>&nbsp</span><span>&nbsp</span><span>&nbsp</span>
		입찰수 ${vo.count }<br/>
	</div>
	</li>
	</c:forEach>
	</ul>
	</div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>

