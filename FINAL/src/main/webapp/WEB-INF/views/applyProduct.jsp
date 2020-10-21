<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="applyProductAction" method="post" enctype="multipart/form-data">
		이름: <input type="text"	name="pname"/><br/>
		사진: <input type="file" name="multiparts"/>
		     <input type="file" name="multiparts"/><br/>
		가격: <input type="text" name="price"/><br/>		
		작성자: <input type="text" name="ID"/> <br/>
		경매 종류: <input type="text" name="auctionmenu"/> <br/>	<!-- 일반/블라인드 만 선택 가능하게  -->
		응찰 단위: <input type="text" name="moneyup"/> <br/>	<!-- 플러그인 같은 걸로 가격 조정 -->
		마감날: <input type="text" name="deadlinedate"/> <br/>	<!-- 달력 -->
		카테고리: <input type="text" name="category"/> <br/>
		<input type="submit" value="승인 요청"/>
		
		
	</form>
</body>
</html>