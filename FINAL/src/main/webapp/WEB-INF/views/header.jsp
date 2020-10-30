<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}

.header {
	margin-bottom:45px;
}

#topMenu {
	height: 30px;
	width: 1600px; /* [변경] 하위 메뉴와 동일하게 맞춤 */
	position: relative;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
	list-style-type: none;
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
	height: 0px;
	overflow: hidden;
	transition: height .2s;
	width: 1600px;
	left: 35px;
	top:70px;
	background-color: black; /* [추가] 하위 메뉴 전체에 배경색 설정 */
}

.submenu li {
	display: inline-block;
	margin:10px;
	text-align:center;
}

.topMenuLi:hover .submenu {
	height: 55px;
}

.submenuLink:hover {
	color: blue;
}

a {
	text-decoration: none;
}

.login a {
	font-size: 12px;
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
	margin-right: 30px;
}

.inner_wrap {
	margin-top:60px;
}

.search {
	float:right;
	margin-left:40px;
}

.login {
	float:right;
}

.logo {
	float:left;
}
</style>
</head>
<body>
	<header class="header">
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
							href="http://unikys.tistory.com/tag">고객센dsdf터</a>
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
					</ul>
				</nav>
			</div>
		</section>
	</header>
</body>
</html>