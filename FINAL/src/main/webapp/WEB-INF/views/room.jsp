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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
   var sock;
   //var nickname;
   //<![CDATA[
   var roomId = "${room.roomId}";
   //]]>
   
   $(function(){
      $("#sendBtn").click(function(){
         sendMessage();
         $("#message").val('');
      });
      $("#chatting").click(function(){
         sock= new SockJS("<c:url value="/chat"/>");
         sock.onopen = onOpen;
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
   function onOpen(){
       sock.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:$("#userId").val()}));
      }
   function sendMessage(){
      sock.send(JSON.stringify({chatRoomId : roomId, type :'CHAT', writer:$("#userId").val(), message:$("#message").val()}));
      }
   
   function onClose(evt){
      $("#data").append("연결 끊김");
   }
   // evt : websocket이 보내준 데이터
   function onMessage(evt){
      var data = evt.data;
      var sessionid = null;
      var message = null;
      $("#data").append(data+"\n");
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
<div style="margin-top: 250px; margin-bottom: 200px;">
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
<div style="margin-left: 600px;">
   <input type="text" value="${room.roomId}"/ style="position: absolute; top: 200px; left: 705px; width: 302px; height: 50px;"><br/>
   <input type="text" value="${room.name}" style="position: absolute; top: 200px; width: 100px; height: 50px;"/><br/>
   <textarea rows="10" cols="50" readonly="readonly" id="data" 
   style="width: 400px; height: 500px; z-index:1; background-color: #F2F2F2;"></textarea><br/>
   <div style="position: absolute; top: 700px; width: 400px; height: 100px; background-color: white;
   border: 1px solid #cccccc;">
   <input type="text" id="message"/ style="width: 300px; height: 70px; margin-top: 15px; margin-left: 20px;">
   <input type="button" value="보내기" id="sendBtn" 
   style="width: 60px; height: 68px; margin-left: 4px; background-color: #CECEF6; color: white; 
   font-weight: 700; font-size: 16px; border: none; border-radius: 2px 2px 2px 2px;"/>
   </div>
   <input type="button" value="채팅참여" id="chatting" 
   style="position: absolute; top: 250px; width: 100px; height: 50px;"/>
   <input type="button" value="퇴장" id="exit"
   style="position: absolute; top: 250px; left: 708px; width: 100px; height: 50px;"/>
   <input type="text" value="${member.ID}" id="userId"
   style="position: absolute; top: 250px; left: 808px; width: 200px; height: 50px; text-align: center;"/>
</div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>