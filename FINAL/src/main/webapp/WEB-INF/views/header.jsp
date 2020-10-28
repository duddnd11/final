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

.main {
	height: 30px;
	width: 770px;
	position: relative;
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

.submenu_title {
	color: #2d2d2d;
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
	display: inline-block;
}

.menu:hover .depth_1 {
	height: 32px;
}

.submenu_title:hover {
	color: blue;
	background: ddd;
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

.inner_wrap div {
	float: right;
	margin-top: 45px;
}
</style>
<script>
		function popup(){
				var url = "login/";
				var name = "login popup";
				var option = "width = 550, height = 500, top = 100, left = 200, location = no"
				window.open(url, name, option);
			}
	</script>
</head>
<body>
	<header class="header">
		<section class="nav_wrap">
			<div class="inner_wrap">
				<a href="메인 페이지"><img class="logo"
					src="https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile6.uf.tistory.com%2Fimage%2F277027375874594F095C54"></a>
				<nav class="main">
					<ul class="main_cate">
						<li id="main_auction" class="menu"><a class="menu_title"
							href="경매페이지">경매</a>
							<div class="contextual">
								<ul class="depth_1">
									<li class="selected"><a class="submenu_title"
										href="온라인 경매">온라인 경매</a>
										<ul class="depth_2" id="menu_list">
											<li><a href="온라인 경매 1">온라인 경매 2</a></li>
											<li><a href="온라인 경매 2">온라인 경매 2</a></li>
											<li><a href="온라인 경매 3">온라인 경매 3</a></li>
										</ul></li>
									<li class="selected"><a class="submenu_title"
										href="블라인드 경매">블라인드 경매</a>
										<ul class="depth_2" id="menu_list">
											<li><a href="블라인드 경매 1">블라인드 경매 2</a></li>
											<li><a href="블라인드 경매 2">블라인드 경매 2</a></li>
											<li><a href="블라인드 경매 3">블라인드 경매 3</a></li>
										</ul></li>
								</ul>
							</div></li>
						<li id="main_service" class="menu"><a class="menu_title"
							href="서비스소개페이지">서비스 소개</a>
							<div class="contextual">
								<ul class="depth_1">
									<li class="selected"><a class="menu_title" href="온라인 경매">온라인
											경매</a>
										<ul class="depth_2" id="menu_list">
											<li><a href="온라인 경매 1">온라인 경매 2</a></li>
											<li><a href="온라인 경매 2">온라인 경매 2</a></li>
											<li><a href="온라인 경매 3">온라인 경매 3</a></li>
										</ul></li>
									<li class="selected"><a class="menu_title" href="블라인드 경매">블라인드
											경매</a>
										<ul class="depth_2" id="menu_list">
											<li><a href="블라인드 경매 1">블라인드 경매 2</a></li>
											<li><a href="블라인드 경매 2">블라인드 경매 2</a></li>
											<li><a href="블라인드 경매 3">블라인드 경매 3</a></li>
										</ul></li>
								</ul>
							</div></li>
						<li id="main_customer" class="menu"><a class="menu_title"
							href="고객센터페이지">고객센터</a>
							<div class="contextual">
								<ul class="depth_1">
									<li class="selected"><a class="menu_title" href="온라인 경매">온라인
											경매</a>
										<ul class="depth_2" id="menu_list">
											<li><a href="온라인 경매 1">온라인 경매 2</a></li>
											<li><a href="온라인 경매 2">온라인 경매 2</a></li>
											<li><a href="온라인 경매 3">온라인 경매 3</a></li>
										</ul></li>
									<li class="selected"><a class="menu_title" href="블라인드 경매">블라인드
											경매</a>
										<ul class="depth_2" id="menu_list">
											<li><a href="블라인드 경매 1">블라인드 경매 2</a></li>
											<li><a href="블라인드 경매 2">블라인드 경매 2</a></li>
											<li><a href="블라인드 경매 3">블라인드 경매 3</a></li>
										</ul></li>
								</ul>
							</div></li>
					</ul>
				</nav>
				<div class="search">
					<a href="검색"><img class="search_img"
						src="https://media.istockphoto.com/vectors/basic-app-magnifier-icon-vector-id800313034?k=6&m=800313034&s=170667a&w=0&h=uvpZQHYd9nB6yyL3bnogFSF1XC_cewQ3I6kUItSVTIw="></a>
				</div>
				<div class="login">
					<a href="javascript:popup()">로그인</a>
				</div>
			</div>
		</section>
	</header>
</body>
</html>