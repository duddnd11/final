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
<script src="resources/js/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>

</head>
<style>
	img {
		width: 400px;
		height: 400px;
	}
	table{
		font-size: 20px;
	}
	td{
		padding: 5px;
		padding-left: 20px;
	}
</style>
<body>
<div style="margin-left: 300px;">
	<span style="font-size: 20px;"><b>${vo.pno }</b></span>
	<span style="margin-left: 30px; font-size: 20px;">${vo.pname }</span>
	<div style="margin-top: 10px;">
	<c:if test="${vo.image ne null }">
		<img src="${vo.image }"/>		
	</c:if>	
	<c:if test="${vo.image eq null }">
		<img src="resources/images/${vo.img1 }"/>
		<img src="resources/images/${vo.img2 }"/> <br/>
	</c:if>
	<br/>
	</div>
	
	<table style="margin-left: 500px; margin-top: -330px;">
		<tr>
			<th>D-day </th> <td>${vo.timeout }</td>
		</tr>
		<tr>
			<th>판매자</th> <td>${vo.ID }</td>
		</tr>
		<tr>
			<th>날짜</th> <td>${vo.uploaddate } ~ ${vo.deadlinedate }</td>
		</tr>
		<tr>
			<th>입찰 수</th> <td>${vo.count }</td>
		</tr>
	<c:if test="${vo.auctionmenu eq '일반' }">
		<tr>
			<th>시작가</th> <td>${vo.startmoney }</td>
		</tr>
		<tr>
			<th>상한가</th> <td>${vo.lastmoney }</td>
		</tr>
		<tr>
			<th>입찰 단위</th> <td>${vo.moneyup }</td>
		</tr>
	</c:if>
	</table>
	<button id="btn" onclick="alertMsg()">입찰</button>
	
	<c:if test="${ID.ID eq 'admin' }">
		<div style="width: 1000px; height: 1000px; margin-top: 200px; margin-left: -20px;">
		<canvas id="myChart"></canvas>
		</div>
	</c:if>
</div>
<script>
<c:if test="${result eq 2 }">
	alert("입찰됨!!!");
</c:if>

function alertMsg(){
	alert("입찰하겠?");
	location.href='insertAuction?pno=${vo.pno}&myprice=${vo.startmoney }';
}

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
					 ticks : { max: 15000000, stepSize: 1000000, min:0 },	// 차트의 최대치와 최소치
				}]
			}
		}
	})
});
</script>
</body>
</html>
	<%@ include file="footer.jsp" %>


