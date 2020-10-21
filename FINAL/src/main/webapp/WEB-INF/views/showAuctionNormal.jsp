<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	img {
		width: 200px;
    	height: 200px;
	}
</style>
<body>
	카테고리 --왼쪽에
	
	상품 이름: ${vo.pname }
	가격: ${vo.price }
	마감날: ${vo.deadlinedate }
	조회수: ${vo.hitcount }
	입찰수 ${vo.count }
	<a href="showDetail?pno=${vo.pno }"><img src="${vo.image }"/></a>
	<a href="showDetail?pno=${vo.pno }"><img src="resources/images/${vo.filenames }"/></a>
</body>
</html>


