<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="writeAction">
		제목 : <input type="text" name="title" value="${title}"/><br/>
		내용 : <textarea rows="10" cols="15" name="content"></textarea><br/>
		작성자 : <input type="text" name="writer" value="${MemberVo.getId()}" readonly="readonly"
		/><br/>
		<input type="hidden" name="ref" value="${board.getRef() }"/>
		<input type="hidden" name="level" value="${level }"/>
		<input type="hidden" name="step" value="${board.getStep()+1 }"/>
		<input type="hidden" name="imagename" value="${MemberVo.getImagename() }"/>
		<input type="submit" value="글작성" />
	</form>
</body>
</html>