<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action ="modifyAction" enctype="multipart/form-data" method="POST">
		아이디 : ${MemberVo.getId() } <input type="hidden" name="id" value="${MemberVo.getId()}"/><br/>
		비밀번호 : <input type="text" name="pw"/><br/>
		이름 : <input type="text" name="name"/><br/>
		이미지파일 : <input type="file" name="multipart"/><br/>
		<input type="submit" value="회원정보 수정"/>
	</form>
</body>
</html>