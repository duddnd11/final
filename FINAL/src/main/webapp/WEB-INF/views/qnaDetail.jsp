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
			url:'http://localhost:9091/final/rest/writecomment',
			type:'post',
			data :JSON.stringify(commentData),
			//dataType:'json', 200에러일때 빼야함.. 400에러 url 405에러 post/get 415에러 contentType 필수속성
			contentType :'application/json',
			success : function(response){
				//alert("성공");
				//comment = response;
				if(response.level==0){
					var str="<li class='topLi>'";
					str+="<div class='commentDiv'>"+response.comment+" "+response.date+"</div>";
					str+="<div class='reCommentWrite'><span id='more' class='more'>답글작성</span></div>";
					str+="<div class='openReComment'>";
					str+="<div class='reCommentMenu'></div>";
					str+="<textarea rows='5' cols='50' id='comment' class='comment'></textarea>";
					str+="<input type='button' value='등록' id='commentBtn' class='commentBtn'/>";
					str+="<input type='hidden' value='"+response.ref+"' id='ref'/>";
					str+="<input type='hidden' value='"+(response.level+1)+"' id='level'/>";
					str+="<input type='hidden' value='1' id='step'/>";
					str+="</div>";
					str+="</li>";
					$(".topUl").append(str);
				}else if(response.level==1){
					var	str="<div class='reComment'>→"+response.comment+" "+response.date+"</div>";
					$(".reCommentMenu").append(str);
				}
			},
			error :function(xhr, status, error) {
                alert("에러!");
                alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
            }
		});
	}
	
	$(document).ready(function(){
		/*$('.commentBtn').click(function(){
			//alert(commentData["qbno"]);
			//alert($("#qbno").val()+","+$("#comment").val());//잘뜬다....
			var ref= $(this).parent().find("input#ref").val();
			var	level =$(this).parent().find("input#level").val();
			var	step= $(this).parent().find("input#step").val();
			var comment = $(this).parent().find("textarea#comment").val();
			ajax_write(ref,level,step,comment);
		});*/
/* 		$(".more").click(function(){
			//$("#reCommentTable").toggle();
			//alert($(this).parent().parent().attr("class"));
			$(this).parent().parent().find("div.openReComment").toggle();
		});
		 */
		 /*
		$(".comment").keydown(function(key) {
	        //키의 코드가 13번일 경우 (13번은 엔터키)
	        if (key.keyCode == 13) {
	          var ref= $(this).parent().find("input#ref").val();
				var ref= $(this).parent().find("input#ref").val();
				var	level =$(this).parent().find("input#level").val();
				var	step= $(this).parent().find("input#step").val();
				var comment = $(this).parent().find("textarea#comment").val();
				ajax_write(ref,level,step,comment);
	        }
	    });
	    */
	});

	
 	$(document).on("click","span.more",function(){
 	 	$(this).parent().parent().find("div.openReComment").toggle();
	});
 	$(document).on("click","input[class='commentBtn']",function(){
			var ref= $(this).parent().find("input#ref").val();
			var	level =$(this).parent().find("input#level").val();
			var	step= $(this).parent().find("input#step").val();
			var comment = $(this).parent().find("textarea#comment").val();
			ajax_write(ref,level,step,comment);
	});
 	$(document).on("keydown","textarea.comment",function(key){
 		if (key.keyCode == 13) {
	          var ref= $(this).parent().find("input#ref").val();
				var ref= $(this).parent().find("input#ref").val();
				var	level =$(this).parent().find("input#level").val();
				var	step= $(this).parent().find("input#step").val();
				var comment = $(this).parent().find("textarea#comment").val();
				ajax_write(ref,level,step,comment);
	        }
 	 });
</script>
<style>
	#submenu{
		/*visibility: hidden;*/
	}
	#opensubmenu >td{
	}
	#reComment{
		display: none;
	}
	#more > a{
		text-decoration: none;
		
	}
	ul{
		list-style: none;
	}
	.openReComment{
		display : none;
	}
	
	
</style>
</head>
<body>
	<table>
		<tr>
		<td>글번호</td>
		<td>${detail.qbno}</td>		
		</tr>
		<tr>
		<td>날짜</td>
		<td>${detail.writedate}</td>
		</tr>
		<tr>
		<td>제목</td>
		<td>${detail.title}</td>
		</tr>
		<tr>
		<td>내용</td>
		<td>${detail.content}</td>
		</tr>
		<tr>
		<td>조회수</td>
		<td>${detail.hitcount}</td>
		</tr>
	</table>
	<br/>
	
	
	<ul class="topUl">
		<c:forEach items="${comment}" var="comment">
			<li class="topLi">
				<c:if test="${comment.level eq 0 }">
					<div class="commentDiv">${comment.comment}
					${comment.date }</div>
					<div class="reCommentWrite"><span id="more" class="more">답글작성</span></div>
					
				
					<div class="openReComment">
					<div class="reCommentMenu">
						<c:forEach items="${reComment}" var="reComment">
							<c:if test="${comment.cno eq reComment.ref}">
								<div class="reComment">→${reComment.comment}
								${reComment.date}
								</div>
							</c:if>
						</c:forEach>
					</div>
						<textarea rows="5" cols="50" id="comment" class="comment"></textarea>
						<input type="button" value="등록" id="commentBtn" class="commentBtn"/>
						<input type="hidden" value="${comment.cno}" id="ref"/>
						<input type="hidden" value="${comment.level+1}" id="level"/>
						<input type="hidden" value="1" id="step"/>
					</div>
				</c:if>
			</li>
		</c:forEach>
	</ul>
	
	<div class='dd'>
		<textarea rows="5" cols="50" id="comment" class="comment"></textarea>
		<input type="button" value="등록" id="commentBtn" class="commentBtn"/>	<!-- level=0 -->
		<input type="hidden" value="0" id="ref"/>
		<input type="hidden" value="0" id="level"/>
		<input type="hidden" value="0" id="step"/>
	</div>
		<input type="button" value="목록" id="board" onclick="location.href='qnaBoard?offset=0'"/>
		<input type="hidden" value="${detail.qbno}" id="qbno"/>
</body>
</html>