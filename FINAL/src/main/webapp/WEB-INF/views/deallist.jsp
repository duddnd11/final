<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>거래내역</title>
</head>
<body>
	<div id="container" style="margin-top: 200px; margin-left: 40%;">
	
<h2>판매</h2><br/>
		<table id="salestable">
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>구매자</th>
				<th>가격</th>
				<th>날짜</th>
			</tr>
		<c:forEach var="sales" items="${sales }">
			<tr>
				<td>${sales.pno }</td>
				<td>${sales.pname }</td>
				<td>${sales.ID }</td>
				<td>${sales.bestmoney }</td>
				<td>${sales.buydate }</td>
			</tr>
		</c:forEach>
		</table>
<br/>
<h2>구매</h2>
<br/>
		<table id="purchasetable">
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>판매자</th>
				<th>가격</th>
				<th>날짜</th>
				<th>결과</th>
				<th>결제</th>
			</tr>
		<c:forEach var="purchase" items="${purchase }">
			<tr>
				<td>${purchase.idx }</td>
				<td>${purchase.pname }</td>
				<td>${purchase.ID }</td>
				<td>${purchase.myprice }</td>
				<td>${purchase.buydate }</td>
				<td>${purchase.buydate }</td>
				<td>
				<c:if test="${purchase.payment == 0}">
					<button style="margin: 10px;" onclick="location.href='payment?pno=${purchase.pno}'">결제</button>
				</c:if>
				<c:if test="${purchase.payment ==1 }">
					<button>결제완료</button>
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>