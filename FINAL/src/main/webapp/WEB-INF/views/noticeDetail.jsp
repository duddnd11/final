<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		margin-left: 300px;
		margin-top: 200px;
		width: 1000px;
		padding: 10px;
		border-bottom: 1px solid #cccccc;
	}
	th{
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		padding: 10px;
	}
	td{
		padding: 10px;
		text-align: center;
		padding-bottom: 20px;
		height: 100px;
	}
</style>
</head>
<body>
	<table>
		<tr>
		
		<th style="width: 100px;">${detail.nbo}</th>
		
		<th>${detail.title}</th>
		
		<th style="width: 200px;">${detail.date}</th>
		</tr>

		<tr>
		<td></td>
		<td style="text-align: left;">${detail.content}</td>
		<td></td>
		</tr>
		<tr>
	</table>
	<br/>
	
	<input type="button" value="목록" id="board" onclick="location.href='notice?offset=0'"
	style="float: right; margin-right: 250px;"/>
</body>
</html>