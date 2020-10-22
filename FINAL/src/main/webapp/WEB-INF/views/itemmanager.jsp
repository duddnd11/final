<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	th{
		border: 1px solid #cccccc;
		
	}
	td{
		border: 1px solid #cccccc;
	}
	table{
		width: 1200px;
		margin-top: 150px;
		margin-left: 200px;
		font-size: 18px;
		text-align: center;
	}
	#searchtable{
		width: 200px;
		margin-top: -100px;;
		float: right;
		
	}
</style>
</head>
<body>
	<div id="container">
	
		<form>
		
			<div>
			<table id="searchtable">
			<tr>
				<td>
					<label><input type="radio" name="a" value="승인">승인</label>
					<label><input type="radio" name="a" value="거부">거부</label>
					<input type="submit" value="검색">
				</td>
			</tr>
			</table>
			</div>
			
		</form>
	
		<table>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이미지</th>
				<th>등급</th>
				<th>가격</th>
				<th>승인여부</th>
			</tr>
			<tr>
				<td>1</td>
				<td>aaaa</td>
				<td>aaaa</td>
				<td></td>
				<td>f</td>
				<td>10,000</td>	
				<td>
				<button>승인</button>
				<button>거부</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>