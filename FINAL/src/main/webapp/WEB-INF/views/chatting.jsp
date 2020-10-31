<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var sock = null;
	$(function(){
		$("#sendBtn").click(function(){
			sendMessage();
			$("#message").val('');
		});
		$("#chatting").click(function(){
			sock= new SockJS("<c:url value="/echo"/>");
			sock.onmessage = onMessage;
			$("#data").append($("#userId").val()+"님 채팅 입장\n");
		});
		$("#message").keydown(function(key){
			if(key.keyCode==13){
				sendMessage();
				$("#message").val('');
				}
			});
		$("#exit").click(function(){
			sock.onclose = onClose;
		});
	});
	
	//sock.onclose = onClose;
	
	function sendMessage(){
		sock.send($("#userId").val()+" : "+$("#message").val());
	}
	
	function onClose(evt){
		$("#data").append("연결 끊김");
	}
	// evt : websocket이 보내준 데이터
	function onMessage(evt){
		var data = evt.data;
		var sessionid = null;
		var message = null;
		var current_session = $("#userId").val();
		//$("#data").append(data);
		var arr = data.split(" : ");
		sessionid= arr[0];
		message = arr[1];
		console.log(data);
		if(sessionid == current_session){
			var str = "나 : "+message;
			$("#data").append(str);
		}else{
			var str =sessionid+" : "+message;
			$("#data").append(str);
		}
		/*
		var strArray = data.split('|');

		for(var i=0 ; i<strArray.length; i++){
			console.log('str['+i+']:'+strArray[i]);
		}
		var currnetuser_session = $('#sessionuserid').val();
		*/
	}

</script>
<style>

		.wrapper-customer .wrap-aside {
    margin-top: 60px;
}
.wrap-aside .aside {
    float: left;
}

.aside-customer {
    width: 158px;
}
.aside-customer .title {
    padding: 10px 20px 0;
    font-size: 23px;
    color: #fff;
    line-height: 90px;
    background-color: #222;
    font-family: 'ssgBan', sans-serif;
}
.aside{
	margin-left: 40px;
}
.aside-customer .wrap-link {
    padding: 0 10px;
    border: 1px solid #ddd;
}
.aside-customer .wrap-link .link:first-of-type {
    border-top: 0;
}
.aside-customer .wrap-link .link {
    display: block;
    padding: 0 5px;
    border-top: 1px solid #ddd;
    line-height: 50px;
}
</style>
</head>
<body>
<div style="margin-top: 200px;">
<div class="wrap-aside" style="position: fixed;">
			<div class="aside aside-customer">
				<p class="title">고객센터</p>
				<div class="wrap-link">
				<a href="http://localhost:9090/final/notice?offset=0" class="link">공지사항</a>
				<a href="http://localhost:9090/final/qnaBoard?offset=0" class="link">문의게시판</a>
				<a href="http://localhost:9090/final/chatting" class="link">채팅</a>
				</div>
			</div>
		</div>
<div style="margin-left: 400px;">
	<textarea rows="10" cols="50" readonly="readonly" id="data"></textarea><br/>
	<input type="text" id="message"/><input type="button" value="보내기" id="sendBtn"/>
	<input type="button" value="채팅참여" id="chatting"/>
	<input type="button" value="퇴장" id="exit"/>
	<input type="text" value="${member.ID}" id="userId"/>
</div>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>