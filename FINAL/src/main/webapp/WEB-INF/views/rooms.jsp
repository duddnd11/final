<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<<<<<<< HEAD
<title>>채팅방</title>
<style>
   th{
      border-bottom: 1px solid #cccccc;
      padding: 10px;
   }
   td{
      padding: 10px;
   }
   table{
      text-align: center;
      
   }
=======
<title>채팅방</title>
<style>
	th{
		border-bottom: 1px solid #cccccc;
		padding: 10px;
	}
	td{
		padding: 10px;
	}
	table{
		text-align: center;
		
	}
>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
</style>
</head>
<body>
<<<<<<< HEAD
   <div id="chatRooms" style="margin-left: 400px; margin-top: 200px;">
   <table style="width: 700px;">
         <tr>
            <th style="width: 150px;">방제목</th>
            <th>방번호</th>
            <th style="width: 60px;">방입장</th>
         </tr>
      <c:forEach items="${rooms}" var="rooms">
         <tr>
         <td>${rooms.name}</td>
         <td>${rooms.roomId}</td>
         <td><input type="button" onclick="location.href='room?id=${rooms.roomId}'" value="방입장"/></td>
         </tr>
      </c:forEach>
      </table>
   </div>
=======
	<div id="chatRooms" style="margin-left: 400px; margin-top: 200px;">
	<table style="width: 700px;">
			<tr>
				<th style="width: 150px;">방제목</th>
				<th>방번호</th>
				<th style="width: 60px;">방입장</th>
			</tr>
		<c:forEach items="${rooms}" var="rooms">
			<tr>
			<td>${rooms.name}</td>
			<td>${rooms.roomId}</td>
			<td><input type="button" onclick="location.href='room?id=${rooms.roomId}'" value="방입장"/></td>
			</tr>
		</c:forEach>
		</table>
	</div>
>>>>>>> branch 'main' of https://github.com/duddnd11/final.git
</body>
</html>