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
function ajax_admin(admin) {
	var data = {
		admin: admin
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
				str += "<td>" +list[i].pname +"</td>";
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
			alert("ì—ëŸ¬!admin");
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
				str += "<td>" +list[i].pname +"</td>";
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
			alert("ì—ëŸ¬!");
			}
		})
	}

$(document).ready(function() {
	$("#btn1").click(function() {
		$("#trr").nextAll().remove();
		ajax_admin(0);
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
</head>
<body>
		
		<button id="btn1">ìŠ¹ì¸ìš”ì²­</button>	<!-- => ì˜µì…˜ìœ¼ë£¨  0.0 -->
		<button id="btn2">ìŠ¹ì¸</button>		<!-- 1.0 -->
		<button id="btn3">ê±°ë¶€</button>	<!-- 2.0 -->
<br/>
		<button id="btn4">ê²½ë§¤ì¤‘</button>	<!-- 1.1 -->
		<button id="btn5">ë§ˆê°</button>	<!-- 1.2 -->
	<div id="container">
<<<<<<< HEAD
		<table id="theTable">
			<tr id="trr">
=======
	
		<form>
		
			<div>
			<table id="searchtable">
			<tr>
				<td>
					<label><input type="radio" name="a" value="½ÂÀÎ">½ÂÀÎ</label>
					<label><input type="radio" name="a" value="°ÅºÎ">°ÅºÎ</label>
					<input type="submit" value="°Ë»ö">
				</td>
			</tr>
			</table>
			</div>
			
		</form>
	
		<table>
			<tr>
<<<<<<< HEAD
				<th>¹øÈ£</th>
				<th>¾ÆÀÌµğ</th>
				<th>ÀÌ¸§</th>
				<th>ÀÌ¹ÌÁö</th>
				<th>µî±Ş</th>
				<th>°¡°İ</th>
				<th>½ÂÀÎ¿©ºÎ</th>
			</tr>
			<tr>
				<td>1</td>
				<td>aaaa</td>
				<td>aaaa</td>
				<td></td>
				<td>f</td>
				<td>10,000</td>	
				<td>
				<button>½ÂÀÎ</button>
				<button>°ÅºÎ</button>
				</td>
=======
>>>>>>> refs/remotes/origin/main
				<th>ë²ˆí˜¸</th>
				<th>ìƒí’ˆì´ë¦„</th>
				<th>ì•„ì´ë””</th>
				<th>ë“±ê¸‰</th>
				<th>ì—…ë¡œë“œ ë‚ ì§œ</th>
				<th>ìŠ¹ì¸ì—¬ë¶€</th>
<<<<<<< HEAD
				<th>ìŠ¹ì¸ì—¬ë¶€2</th>
=======
>>>>>>> refs/remotes/origin/main
>>>>>>> refs/remotes/origin/main
			</tr>
			<c:forEach var="list" items="${list }">
				<tr id="del">
					<td>${list.pno }</td>
					<td>${list.pname }</td>
					<td>${list.ID }</td>
					<td>${list.grade }</td>
					<td>${list.uploaddate }</td>
					<td>${list.admin }</td>
					<td>${list.deal }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>