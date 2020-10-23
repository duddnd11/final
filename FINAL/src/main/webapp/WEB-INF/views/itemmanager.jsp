<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
	th{
		border: 1px solid #cccccc;
		
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
	#searchtable{
		width: 200px;
		margin-top: -100px;;
		float: right;
		
	}
</style>
<script>
function ajax_admin(admin,offset) {
	var data = {
		admin: admin,
		offset : offset
		}
	$.ajax({
		url: 'http://localhost:9090/final/rest/admin/itemadmin',
		type: 'post',
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: 'application/json',
		success: function(response){
			list = response;
			for(var i=0; i<=list.length-1; i++){
				var str="";
				str += "<tr>";
				str += "<td>" +list[i].pno + "</td>";
				str += "<td><a href='../showDetail?pno="+ list[i].pno +"'>"  +list[i].pname +"</a></td>";
				str += "<td>" +list[i].id +"</td>";
				str += "<td>" +list[i].grade +"</td>";
				str += "<td>" +list[i].uploaddate +"</td>";
				str += "<td>" +list[i].admin +"</td>";
				str += "<td>" +list[i].deal +"</td>";
				str += "</tr>";
				$("#theTable").append(str);
				}
			},
		error: function() {
			alert("에러!admin");
			}
		})
	}
function ajax(admin, deal) {
	var data = {
		admin: admin,
		deal: deal
		}
	$.ajax({
		url: 'http://localhost:9090/final/rest/admin/itemmanager',
		type: 'post',
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: 'application/json',
		success: function(response){
			list = response;
			
			for(var i=0; i<=list.length-1; i++){

				var str="";
				str += "<tr>";
				str += "<td>" +list[i].pno + "</td>";
				str += "<td><a href='../showDetail?pno="+ list[i].pno +"'>" +list[i].pname +"</a></td>";
				str += "<td>" +list[i].id +"</td>";
				str += "<td>" +list[i].grade +"</td>";
				str += "<td>" +list[i].uploaddate +"</td>";
				str += "<td>" +list[i].admin +"</td>";
				str += "<td>" +list[i].deal +"</td>";
				str += "</tr>";
				$("#theTable").append(str);
			}
		},
		error: function() {
			alert("에러!");
			}
		})
	}

function ajax_page(admin,offset){
	var data = {
			admin: admin,
			offset : offset
			}
	$.ajax({
		url: 'http://localhost:9090/final/rest/admin/page',
		type: 'post',
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: 'application/json',
		success:function(response){
			var sp = response["startPage"];
			var ep = response["endPage"];
			var str="";
			str+="<c:forEach var="i" begin="${startPage}" end="${endPage}">";"
			str+="<form action=item>";
			str+="<input type=submit value="${i}"/>";
			str+="<input type=hidden value="${i*10-10}" name="offset" class="offset"/>";
			str+="</form>";
			str+="</c:forEach>";
		error : function(){
			alert("페이지에러!");
			}
		})
}
$(document).ready(function() {
	$("#btn1").click(function() {
		$("#trr").nextAll().remove();
		ajax_admin(0,0);
		ajax_page(0,0);
		})
	$("#btn2").click(function() {
		$("#trr").nextAll().remove();
		ajax_admin(1);
		})
	$("#btn3").click(function() {
		$("#trr").nextAll().remove();
		ajax_admin(2);
		})
	$("#btn4").click(function() {
		$("#trr").nextAll().remove();
		ajax(1,1);
		})
	$("#btn5").click(function() {
		$("#trr").nextAll().remove();
		ajax(1,2);
		})
});


</script>
<style>
	form{
		display: inline;
	}
</style>
</head>
<body>
		
		<button id="btn1">승인요청</button>	<!-- => 옵션으루  0.0 -->
		<button id="btn2">승인</button>		<!-- 1.0 -->
		<button id="btn3">거부</button>	<!-- 2.0 -->
<br/>
		<button id="btn4">경매중</button>	<!-- 1.1 -->
		<button id="btn5">마감</button>	<!-- 1.2 -->
		
	<div id="container">
		<table id="theTable">
			<tr id="trr">
				<th>번호</th>
				<th>상품이름</th>
				<th>아이디</th>
				<th>등급</th>
				<th>업로드 날짜</th>
				<th>승인여부</th>
				<th>승인여부2</th>
			</tr>
			<c:forEach var="list" items="${list }">
				<tr id="del">
					<td>${list.pno }</td>
					<td><a href="../showDetail?pno=${list.pno }">${list.pname }</a></td>
					<td>${list.ID }</td>
					<td>${list.grade }</td>
					<td>${list.uploaddate }</td>
					<td>${list.admin }</td>
					<td>${list.deal }</td>
				</tr>
			</c:forEach>
		</table>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<form action="item">
				<input type="submit" value="${i}"/>
				<input type="hidden" value="${i*10-10}" name="offset" class="offset"/>
			</form>
			</c:forEach>
	</div>
</body>
</html>