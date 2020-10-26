<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style>
	form{
		display: inline;
	}
</style>
</head>
<body>
	<c:choose>
	<c:when test="${endPage >0 }">
	<table>
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>날짜</td>
		</tr>
	<c:forEach var="notice" items="${notice}">
		<tr>
			<td>${notice.nbo}</td>
			<td><a href="noticeDetail?nbo=${notice.nbo}">${notice.title}</a></td>
			<td>${notice.date}</td>
		</tr>
	</c:forEach>
	</table>
		<c:if test="${sp ne 0 }">
			<!-- <a href="notice?offset=${offset-100}&keyword=${keyword}&searchMenu=${searchMenu}"><<</a> -->
			<form action="notice">
				<input type="submit" value="<<"/>
				<input type="hidden" value="${offset-100}" name="offset"/>
				<input type="hidden" value="${keyword}" name="keyword"/>
				<input type="hidden" value="${searchMenu}" name="searchMenu"/>
			</form>
		</c:if>	
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<!-- <a href="notice?offset=${i*10}">${i+1}</a> -->
		<form action="notice">
			<input type="submit" value="${i}"/>
			<input type="hidden" value="${i*10-10}" name="offset"/>
			<input type="hidden" value="${keyword}" name="keyword"/>
			<input type="hidden" value="${searchMenu}" name="searchMenu"/>
		</form>
	</c:forEach>
		<c:if test="${ps ne sp }">
			<form action="notice">
				<!--  <a href="notice?offset=${offset+100}&keyword=${keyword}&searchMenu=${searchMenu}">>></a>-->
				<input type="submit" value=">>"/>
				<input type="hidden" value="${offset+100}" name="offset"/>
				<input type="hidden" value="${keyword}" name="keyword"/>
				<input type="hidden" value="${searchMenu}" name="searchMenu"/>
			</form>
		</c:if>
	</c:when>
	<c:otherwise>
		찾으시는 게시글이 없습니다.
	</c:otherwise>
	</c:choose>
	<br/>
	<form action="notice">
		<select name="searchMenu">
			<option value="titleAndContent">제목+내용</option>	
			<option value="title" >제목</option>		
			<option value="content">내용</option>	
			<option value="writer">작성자</option>		
		</select>
		<input type="hidden" name="offset" value="0"/>
		<input name="keyword" value="${keyword}"/>
		<input type="submit" value="조회"/>
	</form>
	<input type="button" value="공지사항 작성" onclick="location.href='qnaWrite'"/>
</body>
</html>