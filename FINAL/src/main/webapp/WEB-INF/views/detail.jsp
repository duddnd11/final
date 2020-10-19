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
<script>
	function ajax_write(){
		var commentData={
				qbno : $("#qbno").val(),
				comment : $("#comment").val()
		};
		
		$.ajax({
			url:'http://localhost:8066/chat/rest/writecomment',
			type:'post',
			data :JSON.stringify(commentData),
			//dataType:'json', 200에러일때 빼야함.. 400에러 url 405에러 post/get 415에러 contentType 필수속성
			contentType :'application/json',
			success : function(response){
				//alert("성공");
				//comment = response;
				var str="";
				str+="<tr>";
				str+="<td>"+response.comment+"</td>";
				str+="</tr>";
				$("#commentTable").append(str);
			},
			error :function(xhr, status, error) {
                alert("에러!");
                alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
            }
		});
	}

	$(document).ready(function(){
		
		$('#commentBtn').click(function(){
			//alert(commentData["qbno"]);
			//alert($("#qbno").val()+","+$("#comment").val());//잘뜬다....
			ajax_write();
		})
	});
</script>
</head>
<body>
	<table>
		<tr>
		<td>${detail.qbno}</td>		
		</tr>
		<tr>
		<td>${detail.title}</td>
		</tr>
		<tr>
		<td>${detail.content}</td>
		</tr>
	</table>
	<br/>
	<table id="commentTable">
		<c:forEach items="${comment}" var="comment">
		<tr>
		<td>${comment.comment}</td>
		</tr>
		</c:forEach>
	</table>
	<textarea rows="5" cols="50" id="comment"></textarea>
	<input type="button" value="등록" id="commentBtn"/>
	<input type="hidden" value="${detail.qbno}" id="qbno"/>
</body>
</html>