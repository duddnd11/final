<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src = "https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function popup(){
      var url = "login/";
      var name = "login popup";
      var option = "width = 550, height = 500, top = 100, left = 200, location = no"
      window.open(url, name, option);
   }
var sock;
//var nickname;
//<![CDATA[
var roomId = "${room.roomId}";
//]]>
$(function(){
	if(${member.grade !='z'}){
		   $("#chatting").click(function(){
			   alert("사용자");
		      sock= new SockJS("<c:url value="/chat"/>");
		      sock.onopen = onOpen;
		      sock.onmessage = onMessage;
		      sock.onclose = onClose;
		      //$("#data").append($("#userId").val()+"님 채팅 입장\n");
		   });
		}else{
				alert("관리자");
		      sock= new SockJS("<c:url value="/chat"/>");
		      sock.onopen = onOpen;
		      sock.onmessage = onMessage;
		      sock.onclose = onClose;
			}
   $("#sendBtn").click(function(){
	  alert("ㅇㅇ");
      sendMessage();
      $("#message").val('');
   });
   $("#message").keydown(function(key){
      if(key.keyCode==13){
         sendMessage();
         $("#message").val('');
         }
      });
   $("#exit").click(function(){
       onClose();
   });
});

//sock.onclose = onClose;
function onOpen(){
    sock.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:$("#userId").val(),grade:"${member.grade}"}));
   }
function sendMessage(){
   sock.send(JSON.stringify({chatRoomId : roomId, type :'CHAT', writer:$("#userId").val(), message:$("#message").val()}));
   }

function onClose(){
	   sock.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:$("#userId").val()}));
}
function enter(){
		sock.send("채팅입장");
	}
// evt : websocket이 보내준 데이터
function onMessage(evt){
   var data = evt.data;
   var sessionid = data.split(":")[0];
   var message = data.split(":")[1];
   var userid = $("#userId").val();
   if(sessionid == userid){
   		$("#data").append("나:"+message+"\n");
   }else{
   		$("#data").append(data+"\n");
       }
}



   /*
if(${member.grade == 'z'}){
	var sock;
	alert("관리자 입장");
	$(function(){
	       sock= new SockJS("<c:url value="/chat"/>");
	       sock.onopen = onOpen;
	       sock.onmessage = onMessage;
	       sock.onclose = onClose;
	 });
		 function onOpen(){ 
			   sock.send(JSON.stringify({type:'ENTER',writer:"${member.ID}",grade:"${member.grade}"}));
		 }
		function onMessage(evt){
			alert(evt.data);
			console.log(evt.data);
		}
}*/
</script>
<style>
* {
   box-sizing: border-box;
}
header{
   top: 0px;
   width: 100%;
}
.main {
   height: 30px;
   width: 770px;
   position: relative;
}
.menu_title{
   margin-top:20px;
   color: black;
}
.main ul {
   margin: 0px;
   padding: 0px;
}

.main ul li {
   color: white;
   float: left;
   line-height: 30px;
   vertical-align: middle;
   text-align: center;
   position: relative;
}


.menu:hover .menu_title {
   color: blue;
   text-decoration: underline;
   }
.menu_title .submenu_title {
   text-decoration: none;
   display: block;
   width: 150px;
   font-size: 12px;
   font-weight: bold;
}

.contextual {
   padding-top: 20px;
}

.depth_1 {
   position: absolute;   
   background-color: 2d2d2d;
   height: 0px;
   overflow: hidden;
   transition: height .2s;
   -webkit-transition: height .2s;
   -moz-transition: height .2s;
   -o-transition: height .2s;
   width: 770px;
   left: 0;
}

.depth_1 li {
   margin-left: 20px;
}

.menu:hover .depth_1 {
   height: 32px;
}

.submenu_title:hover {
   color: blue;
}

header.header .login {
   position: absolute;
   display: inline-block;
   right: 114px;
}

header.header .nav_wrap nav.main .main_cate>li.menu>.menu_title {
   position: relative;
   display: inline-block;
   padding: 0 49px 55px;
   font-size: 25px;
   color: #000;
   font-weight: 700;
   font-family: "Nanum Barun Gothic", sans-serif;
}

a {
   text-decoration: none;
   color: black;
}

.login a {
   font-size: 12px;
}

ul, li {
   list-style: none;
}

.logo {
   width: 20%;
   height: 20%;
}

.search_img {
   width: 40px;
   height: 40px;
   margin-top: -5px;
   margin-right: 30px;
}

header.header .nav_wrap nav.main .main_cate>li {
   float: left;
}

header.header .nav_wrap nav.main {
   display: inline-block;
   vertical-align: top;
   margin-top: 30px;
}
.login a {
   font-size: 12px;
}

ul, li {
   list-style: none;
}

.logo {
   width: 20%;
   height: 20%;
}

.search_img {
   width: 40px;
   height: 40px;
   margin-top: -5px;
   margin-right: 30px;
}

header.header .nav_wrap nav.main .main_cate>li {
   float: left;
}

.inner_wrap div {
   float: right;
   margin-top: 45px;
}
</style>

</head>
<body>
   <header class="header" style="position: fixed; z-index: 2; background-color: white;">
      <section class="nav_wrap">
         <div class="inner_wrap">
            <a href="main"><img class="logo"
               src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile6.uf.tistory.com%2Fimage%2F277027375874594F095C54"></a>
            <nav class="main">
               <ul class="main_cate">
                  <li id="main_auction" class="menu"><a class="menu_title"
                     href="showAuctionNormal">경매</a>
                     <div class="contextual">
                        <ul class="depth_1">
                           <li class="selected" style="margin: 0;"><a class="submenu_title"
                              href="showAuctionNormal">온라인 경매</a>
                              
                           <li class="selected"><a class="submenu_title"
                              href="showAuctionBlind">블라인드 경매</a>
                           </li>
                        </ul>
                     </div></li>
                  <li id="main_service" class="menu"><a class="menu_title"
                     href="서비스소개페이지">서비스 소개</a>
                     <div class="contextual">
                        
                     </div></li>
                  <li id="main_customer" class="menu"><a class="menu_title"
                     href="http://localhost:9090/final/notice?offset=0">고객센터</a>
                     <div class="contextual">
                        <ul class="depth_1">               
                           <li class="selected"><a class="submenu_title" href="http://localhost:9090/final/notice?offset=0"
                           >공지사항</a>
                           <li class="selected"><a class="submenu_title" href="http://localhost:9090/final/qnaBoard?offset=0"
                           >문의게시판</a>
                           </li>
                           </li>
                           <li class="selected"><a href="http://localhost:9090/final/new?userId=${member.ID}&user=${member.name}&name=${member.ID}의 채팅방" class="link">채팅</a>
                           </li>
                        </ul>
                     </div></li>
               </ul>
            </nav>
            <div class="search">
               <a href="검색"><img class="search_img"
                  src="https://media.istockphoto.com/vectors/basic-app-magnifier-icon-vector-id800313034?k=6&m=800313034&s=170667a&w=0&h=uvpZQHYd9nB6yyL3bnogFSF1XC_cewQ3I6kUItSVTIw="></a>
            </div>
            <div class="login">
            <c:choose>
                  <c:when test="${member.grade eq null }">
                        <a href="javascript:popup()">로그인</a>
                  </c:when>
                  <c:when test="${member.grade eq 'z' }">
                        <a href="logout">로그아웃</a>
                        <a href="admin" style="margin-left: 20px;">관리자 페이지</a>
                  </c:when>
                  <c:otherwise>
                        <a href="logout">로그아웃</a>
                        <a href="myPage" style="margin-left: 20px;">마이페이지</a>
                  </c:otherwise>
            </c:choose>
            </div>
         </div>
      </section>
   </header>
</body>
</html>