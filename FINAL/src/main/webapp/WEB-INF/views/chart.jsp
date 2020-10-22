<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
</head>
<body>
	<div style="width: 700px; height: 700px;">
	<canvas id="myChart"></canvas>
	</div>
<script>
$(document).ready(function(){
	const ctx = $('#myChart')
	//첫번째 인자는 내 태그(선택자), 두번째 인자는 옵션
	const myChart = new Chart(ctx, {
		type: 'line',
		data : {
			datasets : [{
				label : "Line Dataset", 
				backgroundColor : ['#6B66FF','#FFBB00','#6B66FF','#FFBB00'],
				borderColor : ['#FF0000'],
				data : [1000000,400000,600000,800000],
				fill : false,
			}],
				labels: ['10:00', '11:00', '12:00', '13:00'],
				
		},
		options :{
			scales :{
				yAxes: [{
					 ticks : { max: 1000000, stepSize: 200000,min:0 },	// 차트의 최대치와 최소치
				}]
			}
		}
	})
});
</script>

</body>
</html>