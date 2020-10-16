<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="registerAction" enctype="multipart/form-data" method="POST">
		아이디 : <input type="text" name="id"/><br/>
		비밀번호 : <input type="text" name="pw"/><br/>
		이름 : <input type="text" name="name"/><br/>
		이미지 파일 : <input type="file" name="multipart"/><br/>
		<input type="submit" value="회원가입"/>
	</form>

</body>
</html>