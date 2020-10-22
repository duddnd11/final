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
	#searchtable{
		width: 200px;
		margin-top: -100px;;
		float: right;
		
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
			alert("ì—ëŸ¬!");
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
				<th>ë²ˆí˜¸</th>
				<th>ìƒí’ˆì´ë¦„</th>
				<th>ì•„ì´ë””</th>
				<th>ë“±ê¸‰</th>
				<th>ì—…ë¡œë“œ ë‚ ì§œ</th>
				<th>ìŠ¹ì¸ì—¬ë¶€</th>
>>>>>>> refs/remotes/origin/main
			</tr>
		</table>
		
		<button id="btn1">ìŠ¹ì¸ìš”ì²­</button>
		<button>ìŠ¹ì¸</button>
		<button>ê±°ë¶€</button>
<br/>
		<button>ê²½ë§¤ì¤‘</button>
		<button>ë§ˆê°</button>
	</div>
</body>
</html>