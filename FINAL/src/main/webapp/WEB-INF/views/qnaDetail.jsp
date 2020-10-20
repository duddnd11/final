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
	function ajax_write(ref,level,step,comment){
		var commentData={
				qbno : $("#qbno").val(),
				comment : comment,
				/*ref : $("#ref").val(),*/
				ref : ref,
				level :level,
				step: step
		};
		
		$.ajax({
			url:'http://localhost:8066/final/rest/writecomment',
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
		$('.commentBtn').click(function(){
			//alert(commentData["qbno"]);
			//alert($("#qbno").val()+","+$("#comment").val());//잘뜬다....
			//alert($(this).parent().find("input#ref").val());
			var ref= $(this).parent().find("input#ref").val();
			var	level =$(this).parent().find("input#level").val();
			var	step= $(this).parent().find("input#step").val();
			var comment = $(this).parent().find("textarea#comment").val();
			ajax_write(ref,level,step,comment);
		})

	});
</script>

<style>
	#submenu{
		/*visibility: hidden;*/
	}
	#opensubmenu >td{
	}
</style>
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
		<td id="opensubmenu"><a href="#">답글작성</a>
			<table id="reCommentTable">
				<tr><td>ddd</td></tr>
				<tr>
				<td id="submenu">
					<textarea rows="5" cols="50" id="comment"></textarea>
					<input type="button" value="등록" id="commentBtn" class="commentBtn"/>
					<input type="hidden" value="${comment.ref}" id="ref"/>
					<input type="hidden" value="${comment.level+1}" id="level"/>
					<input type="hidden" value="1" id="step"/>
				</td></tr>
			</table>
		</td>
		</tr>
		</c:forEach>
	</table>
	<div id='dd'>
		<textarea rows="5" cols="50" id="comment"></textarea>
		<input type="button" value="등록" id="commentBtn" class="commentBtn"/>	<!-- level=0 -->
		<input type="hidden" value="0" id="ref"/>
		<input type="hidden" value="0" id="level"/>
		<input type="hidden" value="0" id="step"/>
	</div>
		<input type="hidden" value="${detail.qbno}" id="qbno"/>
</body>
</html>