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
					<label><input type="radio" name="a" value="����">����</label>
					<label><input type="radio" name="a" value="�ź�">�ź�</label>
					<input type="submit" value="�˻�">
				</td>
			</tr>
			</table>
			</div>
			
		</form>
	
		<table>
			<tr>
				<th>��ȣ</th>
				<th>���̵�</th>
				<th>�̸�</th>
				<th>�̹���</th>
				<th>���</th>
				<th>����</th>
				<th>���ο���</th>
			</tr>
			<tr>
				<td>1</td>
				<td>aaaa</td>
				<td>aaaa</td>
				<td></td>
				<td>f</td>
				<td>10,000</td>	
				<td>
				<button>����</button>
				<button>�ź�</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>