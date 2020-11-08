<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<script>
</script>

<body>
<p>
</p>
	<h>결제완료<h><br/>
	
	<td><img src="${vo.image}"/></td>
	
	가격:${map.amount}<br/>
	결제코드:${map.apply_num}<br/>
	이메일:${map.buyer_email}<br/>
	이름:	${map.buyer_name}<br/>
	우편번호:${map.buyer_postcode}<br/>
	주소:${map.buyer_addr}<br/>
	전화번호:${map.buyer_tel}<br/>
	카드:${map.card_name}<br/>
	${map.card_number}<br/>
</body>
</html>