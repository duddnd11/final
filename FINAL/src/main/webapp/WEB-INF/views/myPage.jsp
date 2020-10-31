<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
</head>
<body style="margin-top:200px">
	<input type="button" value="회원정보수정"/>
	<input type="button" value="거래내역"/>
	<input type="button" value="문의내역"/>
	<input type="button" value="관심상품"/>
	<input type="button" onclick="location.href='applyProduct'" value="상품등록"/>
</body>
</html>
<%@ include file="footer.jsp" %>