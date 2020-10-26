<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<style>
	form{
		display: inline;
	}
	*{
		text-align: center;
	}
	table{
		margin-left: 300px;
		margin-top: 200px;
		width: 1000px;
		border-top: 1px solid black;
		
		
	}
	th{
		padding: 5px;
		border-bottom: 1px solid #cccccc;
		background-color: #cccccc;
	}
	td{
		padding: 10px;
		border-bottom: 1px solid #cccccc;
	}
	#number{
		margin-top: 40px;
	}
	.search{
		padding-bottom: 50px;
		margin-left: 120px;
	}
	select{
		font-size: 15px;
		height: 25px;
	}
	a{
		text-decoration: none;
		color: black;
	}
</style>
</head>
<body>
	<c:choose>
	<c:when test="${endPage >0 }">
	<table>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	<c:forEach var="qnaBoard" items="${qnaBoard}">
		<tr>
			<td>${qnaBoard.qbno}</td>
			<td><a href="qnaDetail?qbno=${qnaBoard.qbno}">${qnaBoard.title}</a></td>
			<td>${qnaBoard.ID}</td>
			<td>${qnaBoard.writedate}</td>
			<td>${qnaBoard.hitcount}</td>
		</tr>
	</c:forEach>
	</table>
	<div id="number">
		<c:if test="${sp ne 0 }">
			<!-- <a href="qnaBoard?offset=${offset-100}&keyword=${keyword}&searchMenu=${searchMenu}"><<</a> -->
			<form action="qnaBoard">
				<input type="submit" value="<<"/>
				<input type="hidden" value="${offset-100}" name="offset"/>
				<input type="hidden" value="${keyword}" name="keyword"/>
				<input type="hidden" value="${searchMenu}" name="searchMenu"/>
			</form>
		</c:if>	
		
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<!-- <a href="qnaBoard?offset=${i*10}">${i+1}</a> -->
		<form action="qnaBoard">
			<input type="submit" value="${i}"/>
			<input type="hidden" value="${i*10-10}" name="offset"/>
			<input type="hidden" value="${keyword}" name="keyword"/>
			<input type="hidden" value="${searchMenu}" name="searchMenu"/>
		</form>
	</c:forEach>
	
		<c:if test="${ps ne sp }">
			<form action="qnaBoard">
				<!--  <a href="qnaBoard?offset=${offset+100}&keyword=${keyword}&searchMenu=${searchMenu}">>></a>-->
				<input type="submit" value=">>"/>
				<input type="hidden" value="${offset+100}" name="offset"/>
				<input type="hidden" value="${keyword}" name="keyword"/>
				<input type="hidden" value="${searchMenu}" name="searchMenu"/>
			</form>
		</c:if>
	</div>
	</c:when>
	<c:otherwise>
		찾으시는 게시글이 없습니다.
	</c:otherwise>
	</c:choose>
	<br/>
	<form action="qnaBoard" class="search">
		<select name="searchMenu">
			<option value="titleAndContent">제목+내용</option>	
			<option value="title" >제목</option>		
			<option value="content">내용</option>	
			<option value="writer">작성자</option>		
		</select>
		<input type="hidden" name="offset" value="0"/>
		<input name="keyword" value="${keyword}"/ style="width: 300px; font-size: 15px;">
		<input type="submit" value="조회"/>
	</form>
	<input style="float: right; margin-right: 50px;" type="button" value="문의글쓰기" onclick="location.href='qnaWrite'"/>
</body>
</html>







