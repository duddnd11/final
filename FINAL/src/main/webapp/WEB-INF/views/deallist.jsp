<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>거래내역</title>
</head>
<body>
	<div id="container" style="margin-top: 200px; margin-left: 40%;">
	<button onclick="location.href='myPage'">뒤로가기</button>
<h2>판매</h2><br/>
		<table id="salestable">
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>입찰자</th>
				<th>기준가</th>
				<th>마감</th>
				<th>승인여부</th>
			</tr>
		<c:forEach var="sales" items="${sales }">
			<tr>
				<td>${sales.pno }</td>
				<td>${sales.pname }</td>
				<td>
				<c:choose>
				<c:when test="${sales.admin == 1 }">
					<c:if test="${sales.deal == 1 }">
						경매 진행중
					</c:if>
					<c:if test="${sales.deal == 2 }">
						${sales.getcustomer }
					</c:if>
				</c:when>
				<c:when test="${sales.admin ==2 }">
					-
				</c:when>
				<c:otherwise>
					-
				</c:otherwise>
				</c:choose>
				</td>
				<td>${sales.price }</td>
				<td>
				<c:set var="dead" value="${sales.deadlinedate }"/>
					 ${fn:substring(dead,0,10) }</td>
				<td>
				<c:choose>
				<c:when test="${sales.admin == 1 }">
					<c:if test="${sales.deal == 1 }">
						<button>판매중</button>
					</c:if>
					<c:if test="${sales.deal == 2 }">
						<button>마감됨</button>
					</c:if>
				</c:when>
				<c:when test="${sales.admin ==2 }">
					<button>거부됨</button>
				</c:when>
				<c:otherwise>
					<button>승인중</button>
				</c:otherwise>
				</c:choose>
				</td>
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
				<th>내 가격</th>
				<th>날짜</th>
				<th>경매결과</th>
				<th>결제</th>
			</tr>
		<c:forEach var="purchase" items="${purchase }">
			<tr>
				<td>${purchase.idx }</td>
				<td>${purchase.pname }</td>
				<td>${purchase.ID }</td>
				<td>${purchase.myprice }</td>
				<td>${purchase.buydate }</td>
				<td>
				<c:if test="${purchase.deal == 2 }">
				<c:choose>
					<c:when test="${purchase.getcustomer eq id }">
						<b>WINNER</b>
					</c:when>
					<c:otherwise>
						<b>LOSER</b>
					</c:otherwise>
				</c:choose>
				</c:if>
				<c:if test="${purchase.deal == 1 }">
					<b>경매 진행중</b>
				</c:if>
				</td>
				<td>
				<c:if test="${purchase.deal == 2 }">
				<c:choose>
				<c:when test="${purchase.payment == 0 && purchase.getcustomer eq id }">
					<button style="margin: 10px;" onclick="location.href='payment?pno=${purchase.pno}'">결제</button>
				</c:when>
				<c:when test="${purchase.payment == 0 && purchase.getcustomer ne id }">
					<button>낙찰 실패</button>
				</c:when>
				<c:when test="${purchase.payment ==1 }">
					<button>결제완료</button>
				</c:when>
				</c:choose>
				</c:if>
				<c:if test="${purchase.deal == 1 }">
					-
				</c:if>
				</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>