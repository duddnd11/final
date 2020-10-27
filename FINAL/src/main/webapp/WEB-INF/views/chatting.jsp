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
			$("#data").append($("#userId").val()+"님 채팅 입장");
		});
		$("#message").keydown(function(key){
			if(key.keyCode==13){
				sendMessage();
				$("#message").val('');
				}
			});
		/*
		$("#exit").click(function(){
			sock.onclose = onClose;
		});*/
	});
	
	sock.onclose = onClose;
	
	function sendMessage(){
		sock.send($("#message").val());
	}
	
	function onClose(evt){
		$("#data").append("연결 끊김");
	}
	// evt : websocket이 보내준 데이터
	function onMessage(evt){
		var data = evt.data;
		var sessionid = null;
		var message = null;
		$("#data").append(data);
		console.log(data);
		
		/*
		var strArray = data.split('|');

		for(var i=0 ; i<strArray.length; i++){
			console.log('str['+i+']:'+strArray[i]);
		}
		var currnetuser_session = $('#sessionuserid').val();
		*/
	}

</script>
</head>
<body>
<textarea rows="10" cols="50" readonly="readonly" id="data"></textarea><br/>
<input type="text" id="message"/><input type="button" value="보내기" id="sendBtn"/>
<input type="button" value="채팅참여" id="chatting"/>
<input type="button" value="퇴장" id="exit"/>
<input type="hidden" value="${userId}" id="userId"/>
</body>
<%@ include file="footer.jsp" %>
</html>