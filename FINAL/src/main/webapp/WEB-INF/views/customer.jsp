<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{
		border: 1px solid #cccccc;
		background-color: #F9E198;
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
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<div id="container">
		<table>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>등급</th>
			</tr>
			<tr>
				<td>1</td>
				<td><a href="/info?id=" style="color: black;">aaaa</a></td>
				<td>12345</td>
				<td>aaaaa</td>
				<td>서울 동작구 상도로</td>
				<td>010-1111-1111</td>
				<td>aaaa@naver.com</td>
				<td>991122</td>
				<td>f</td>
			</tr>
		</table>
	</div>
</body>
</html>