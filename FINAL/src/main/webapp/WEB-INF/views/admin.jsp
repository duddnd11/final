<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	#btn{
		float: right;
	}
</style>
</head>
<body>
	<div id="container">
		<div style="height: 100px; margin-right: 20px;">


			<a href="http://localhost:9090/final/main"><button id="btn" style="height: 50px;">메인화면</button></a>

		</div>	
			<div style="display: flex; margin-top: 200px; margin-left: 250px;">
				<div style="width: 200px; height: 200px; ">
					<h2 style="font-size: 35px;">고객관리</h2>
					<a href="admin/customer"><button style=" width: 70px; height: 40px; font-size: 18px;
					font-weight: 900; margin-left: 35px; margin-top: 50px;">이동</button></a>
				</div>
				<div style="width: 200px; height: 200px; margin-left: 250px;">
					<h2 style="font-size: 35px;">상품관리</h2>
					<a href="admin/item?offset=0&admin=-1&deal=-1"><button style=" width: 70px; height: 40px; font-size: 18px;
					font-weight: 900; margin-left: 35px; margin-top: 50px;">이동</button></a>
				</div>
				<div style="width: 200px; height: 200px; margin-left: 250px;">
					<h2 style="font-size: 35px;">1대1 문의</h2>
					<a href="#"><button style=" width: 70px; height: 40px; font-size: 18px;
					font-weight: 900; margin-left: 35px; margin-top: 50px;">이동</button></a>
				</div>
		    </div>
	</div>
</body>
</html>