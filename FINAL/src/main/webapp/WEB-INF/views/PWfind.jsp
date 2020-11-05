<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<form action = "newPWaction">
	<section id="container">
		<div class="form-group has-feedback">
			<label class="control-label" for="pw">패스워드</label> <input
				class="form-control" type="password" id="pw" name="pw" />
		</div>
		<div class="form-group has-feedback">
			<button class="btn btn-success" type="submit" id="submit">확인</button>
		</div>
	</section>
</form>
</body>
</html>