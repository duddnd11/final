<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<script src="resources/js/jquery-3.5.1.min.js"></script>	
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	로그인성공
<script type="text/javascript">
  var naver_id_login = new naver_id_login("J9LhL5HfjKG4bDjLYBHL", "http://localhost:9090/final/result/");
  // 접근 토큰 값 출력
 console.log(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	var email=naver_id_login.getProfileData('email');
	var id= naver_id_login.getProfileData('id');
	var name= naver_id_login.getProfileData('name');
	var birthday = naver_id_login.getProfileData('birthday');
	// 폰넘버 ,주소
	//location.href="naverLogin?name="+name+"&email="+email+"&birthday="+birthday;
  }
  
</script>
</body>
</html>