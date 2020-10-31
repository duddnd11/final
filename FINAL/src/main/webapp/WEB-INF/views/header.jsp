<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function popup(){
		var url = "login/";
		var name = "login popup";
		var option = "width = 550, height = 500, top = 100, left = 200, location = no"
		window.open(url, name, option);
	}
</script>
<style>
* {
	box-sizing: border-box;
}
header{
	top: 0px;
}
.main {
	height: 30px;
	width: 770px;
	position: relative;
}
.menu_title{
	margin-top:20px;
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

.menu_title .submenu_title {
	text-decoration: none;
	display: block;
	width: 150px;
	font-size: 12px;
	font-weight: bold;
	
}

.menu_title {
	color: black;
}

.menu:hover .menu_title {
	color: blue;
	text-decoration: underline;
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

.login a {
	font-size: 12px;
}
a {
	text-decoration: none;
	color: black;
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

header.header .nav_wrap nav.main .main_cate> li {
	float: left;
}

header.header .nav_wrap nav.main {
	display: inline-block;
	vertical-align: top;
	margin-top: 30px;
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
									<li class="selected"><a class="submenu_title" href="http://localhost:9090/final/chatting"
									>채팅</a>
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
								<a href="#">로그아웃</a>
								<a href="admin">관리자 페이지</a>
						</c:when>
						<c:otherwise>
								<a href="logout">로그아웃</a>
								<a href="myPage">마이페이지</a>
						</c:otherwise>
				</c:choose>
				</div>
			</div>
		</section>
	</header>
</body>
</html>