<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<title>Insert title here</title>
</head>
<style>
	img {
		width: 200px;
		height: 200px;
	}
</style>
<body>
	경매번호: ${vo.pno }	<br/>
	상품: ${vo.pname }<br/>
	<c:if test="${vo.image ne null }">
		<img src="${vo.image }"/>		
	</c:if>
	<c:if test="${vo.image eq null }">
		<a href="showDetail?pno=${vo.pno }"><img src="resources/images/${vo.img1 }"/></a> 
		<a href="showDetail?pno=${vo.pno }"><img src="resources/images/${vo.img2 }"/></a> <br/>
	</c:if>
	<br/>
	상품 가격: ${vo.price }<br/>
	D-day: ${vo.timeout }<br/>
	판매자: ${vo.ID }<br/>
	날짜: ${vo.uploaddate } ~ ${vo.deadlinedate }<br/>
	
	<c:if test="${vo.auctionmenu eq '일반' }">
		시작가: ${vo.startmoney }<br/>
		가능한 최고 입찰가?응찰가?: ${vo.lastmoney }<br/>
		입찰 단위: ${vo.moneyup }<br/>
	</c:if>
	
	
	<c:if test="${ID.ID eq 'admin' }">
		<div style="width: 700px; height: 700px;">
		<canvas id="myChart"></canvas>
		</div>
	</c:if>
<script>
	var data1 = new Array();
	var labels1 = new Array();
	var backColor = new Array();
<c:forEach var="list" items="${list}">
	data1.push(${list.getMyprice()});
	labels1.push('${list.getBuydate()}');
	backColor.push('#6B66FF');
</c:forEach>

	
$(document).ready(function(){
	const ctx = $('#myChart');
	//첫번째 인자는 내 태그(선택자), 두번째 인자는 옵션
	const myChart = new Chart(ctx, {
		type: 'line',
		data : {
			datasets : [{
				label : "날짜별 응찰 가격", 
				backgroundColor : backColor,	
				borderColor : ['#FF0000'],
				data : data1,
				fill : false,
			}],
			labels: labels1
		},
		options :{
			scales :{
				yAxes: [{
					 ticks : { max: 10000000, stepSize: 500000, min:0 },	// 차트의 최대치와 최소치
				}]
			}
		}
	})
});
</script>
</body>
</html>
	<%@ include file="footer.jsp" %>


