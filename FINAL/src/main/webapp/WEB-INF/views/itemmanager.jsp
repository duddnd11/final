<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
<script>
function ajax() {
	var data = {
		admin: 0
		deal: 0
		}
	$.ajax({
		url: 'http://localhost:9090/FINAL/rest/admin/item',
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
				str += "<td>" +list[i].ID +"</td>";
				str += "<td>" +list[i].grade +"</td>";
				str += "<td>" +list[i].uploaddate +"</td>";
				str += "<td>" +list[i].uploaddate +"</td>";
				str += "</tr>";
				$("#theTable").append(str);
				}
			num_page++;
			},
		error: function() {
			alert("에러!");
			}
		})
	}

$(document).ready(function() {
	$("#btn1").click(function() {
		ajax();
			
		})
	
	});

</script>
</head>
<body>
	<div id="container">
		<table>
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>아이디</th>
				<th>등급</th>
				<th>업로드 날짜</th>
				<th>승인여부</th>
			</tr>
		</table>
		
		<button id="btn1">승인요청</button>
		<button>승인</button>
		<button>거부</button>
<br/>
		<button>경매중</button>
		<button>마감</button>
	</div>
</body>
</html>