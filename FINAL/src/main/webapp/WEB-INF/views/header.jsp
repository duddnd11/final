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

.header {
	margin-bottom:45px;
}

#topMenu {
{
	top: 0px;
}

.main {
	height: 30px;
	width: 1600px; 
	position: relative;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none;

}

.menu_title{
	margin-top:20px;
}

.main ul {
	margin: 0px;
	padding: 0px;
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
	color: black;
	float: left;
	line-height: 30px;
	vertical-align: middle;
	text-align: center;
	-position: relative;
	padding: 0 40px 50px;
}

.menuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
	text-decoration: none;
	display: block;
	width: 150px;
	font-size: 20px;
    color: #000;
    font-weight: 700;
    font-family: "Nanum Barun Gothic", sans-serif;
	font-size: 12px;
	font-weight: bold;
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
	color: black;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
	color: blue;
	text-decoration:underline;
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
	width: 190px;
}

.contextual {
	padding-top: 20px;
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
	color: gray;
	background-color: black; /* [변경] 배경색 변경 */
	text-decoration: none;
	display: block;
	width: 150px;
	font-size: 18px;
    font-family: "Nanum Barun Gothic", sans-serif;
}

.submenu { /* 하위 메뉴 스타일 설정 */
	position: absolute;
}

.depth_1 {
	position: absolute;	
	background-color: 2d2d2d;
	height: 0px;
	overflow: hidden;
	transition: height .2s;
	width: 1600px;
	left: 38px;
	top:70px;
	background-color: black; /* [추가] 하위 메뉴 전체에 배경색 설정 */
}

.submenu li {
	display: inline-block;
	margin:10px;
	text-align:center;
}

.depth_1 li {
	margin-left: 20px;
}

.topMenuLi:hover .submenu {
	height: 55px;
}

.submenuLink:hover {
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

.logo_img {
	width:400px;
	height:80px;
	margin-top: -30px;
	margin-left:50px;
	margin-right:20px;
}

.search_img {
	width: 40px;
	height: 40px;
	margin-top: -5px;
}

.inner_wrap {
	margin-top:60px;
}

header.header .nav_wrap nav.main .main_cate> li {
	float: left;
}

.search {
	float:right;
	margin-left:40px;
}

.login {
	float:right;
}

.login:hover {
	text-decoration:underline;
}

.login a {
	color:blue;
}

.logo {
	float:left;
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
				<nav id="topMenu">
					<ul>
						<div class="logo">
							<a href="메인 페이지">
								<img class="logo_img" src="https://cdn.clien.net/web/api/file/F01/9396867/5ccb776a9703.jpg">
							</a>
						</div>
						<li class="topMenuLi"><a class="menuLink"
							href="http://unikys.tistory.com/category/Programming%20Lecture">경매</a>
							<ul class="submenu">
								<li><a href="#" class="submenuLink longLink">일반 경매</a></li>
								<li><a href="#" class="submenuLink longLink">블라인드 경매</a></li>
							</ul></li>
						<li>|</li>
						<li class="topMenuLi"><a class="menuLink"
							href="http://unikys.tistory.com/guestbook">서비스 소개</a></li>
						<li>|</li>
						<li class="topMenuLi"><a class="menuLink"
							href="http://unikys.tistory.com/tag">고객센터</a>
							<ul class="submenu">
								<li><a href="#" class="submenuLink">FAQ</a></li>
								<li><a href="#" class="submenuLink">1:1 문의</a></li>
								<li><a href="#" class="submenuLink">공지사항</a></li>
								<li><a href="#" class="submenuLink">문의 게시판</a></li>
							</ul></li>
						<div class="search">
							<a href="http://unikys.tistory.com/guestbook">
								<img class="search_img" src="https://media.istockphoto.com/vectors/basic-app-magnifier-icon-vector-id800313034?k=6&m=800313034&s=170667a&w=0&h=uvpZQHYd9nB6yyL3bnogFSF1XC_cewQ3I6kUItSVTIw=">
							</a>
						</div>
						<div class="login">
							<a href="http://unikys.tistory.com/guestbook">로그인</a>
						</div>
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