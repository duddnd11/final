<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 	<script src="resources/js/jquery-3.5.1.min.js"></script>	
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   
</head>
<body>
	�α��μ���
   <script type="text/javascript">
  var naver_id_login = new naver_id_login("J9LhL5HfjKG4bDjLYBHL", "http://localhost:9090/final/result/");
  // ���� ��ū �� ���
 console.log(naver_id_login.oauthParams.access_token);
  // ���̹� ����� ������ ��ȸ
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // ���̹� ����� ������ ��ȸ ���� ������ ������ ó���� callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email'));
    
  }
</script>
	
</body>
</html>