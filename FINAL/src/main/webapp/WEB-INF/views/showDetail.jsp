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
	<img src="${vo.image }"/>
	상품 가격: ${vo.price }
	${vo.timeout }
	${vo.ID }
	${vo.uploaddate }
	${vo.deadlinedate }
	시작가: ${vo.startmoney }
	가능한 최고 입찰가?응찰가?: ${vo.lastmoney }
	입찰 단위: ${vo.moneyup }
</body>
</html>


