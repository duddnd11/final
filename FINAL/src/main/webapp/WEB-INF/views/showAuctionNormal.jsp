<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<div id="container" style="width: -webkit-fill-available; margin-top:200px">
	
	<h2 style="text-align: center; font-size: 30px;">온라인 경매</h2>
	<div style="width: 300px; height: 1000px; position: fixed;">
	<c:forEach var="category" items="${category}">
		<a href="showAuctionNormal?category=${category}">${category}</a><br/>
	</c:forEach>
	카테고리 --왼쪽에
	</div>
	<div style="width: 1100px; margin: 0 auto; ">
	<ul>
	<c:forEach var="vo" items="${list }">
	<li style="margin-top: 50px;">
	<div style="margin-left: 50px; width: 200px; display: block;" >
	
	<c:if test="${vo.image ne null }">
			<a href="showDetail?pno=${vo.pno }"><img src="${vo.image }"/></a>	
		</c:if>
		<c:if test="${vo.image eq null }">
			<a href="showDetail?pno=${vo.pno }">
			<c:choose>
				<c:when test="${vo.img1 ne '(이름없음)' }">
				<img src="resources/images/${vo.img1 }"/>
				</c:when>
				<c:otherwise>
				<img src="resources/images/${vo.img2 }"/>
				</c:otherwise>
			</c:choose>
			</a> <br/>
		</c:if>
		<p><b><a href="showDetail?pno=${vo.pno }">${vo.pname }</a></b></p>
		<p>마감날: ${vo.deadlinedate }</p>
		조회수: ${vo.hitcount }<span>&nbsp</span><span>&nbsp</span><span>&nbsp</span><span>&nbsp</span><span>&nbsp</span>
		입찰수 ${vo.count }<br/></p>
	</div>
	</li>
	</c:forEach>
	</ul>
	</div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>	


