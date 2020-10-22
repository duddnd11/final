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
	경매번호: ${vo.pno }
	상품: ${vo.pname }
	<c:if test="${vo.image ne null }">
		<img src="${vo.image }"/>		
	</c:if>
	<c:if test="${vo.image eq null }">
		<a href="showDetail?pno=${vo.pno }"><img src="resources/images/${vo.img1 }"/></a> 
		<a href="showDetail?pno=${vo.pno }"><img src="resources/images/${vo.img2 }"/></a> <br/>
	</c:if>
	상품 가격: ${vo.price }
	D-day: ${vo.timeout }
	판매자: ${vo.ID }
	날짜: ${vo.uploaddate } ~ ${vo.deadlinedate }
	시작가: ${vo.startmoney }
	가능한 최고 입찰가?응찰가?: ${vo.lastmoney }
	입찰 단위: ${vo.moneyup }
</body>
</html>


