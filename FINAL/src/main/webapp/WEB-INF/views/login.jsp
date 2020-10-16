<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script>"jquery-3.5.1min.js"</script>
  <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('37ce67905ce0fd50ce6c67104e979081');
        
        function loginWithKakao() {
        Kakao.Auth.login({
          success: function(authObj) {
            //alert(JSON.stringify(authObj))
            alert("로그인 성공")
          },
          fail: function(err) {
            // alert(JSON.stringify(err))
            alert("로그인 실패")
          },
        })
      }
        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script> 
    <script>
    
	    function moveClose() {
	      opener.location.href="http://localhost:9090/final/idcheck";
	      self.close();
	    }
	    function moveClose2() {
		      opener.location.href="http://localhost:9090/final/pwcheck";
		      self.close();
		    }
	    function moveClose3() {
		      opener.location.href="http://localhost:9090/final/singup";
		      self.close();
		    }
    </script>
    <style>
    	input{
        display: block;
        margin: 5px;
        width: 400px;
        height: 40px;
        margin-top: 20px;
      }
      li{
      	list-style: none;
      	display: inline;
      	padding-left: 15px;
      	padding-right: 15px;
      	color: #cccccc;
      }
      a{
      	text-decoration: none;
      }
    </style>
</head>
<body>
	<div id="container" style="width: 600px; height: 600px; margin-left: 50px;">
    <form style="margin-top: 100px;">
        <input type="text" name="id" id="id" placeholder="아이디" >
        <input type="password" name="pw" id="pw" placeholder="비밀번호">
        <input type="submit" value="로그인" style=" margin-left: 5px; background-color: #FFAC04; color: white;
        height: 60px;">
        <ul>
        	<li><a href="javascript:moveClose()">아이디 찾기</a></li>
        	<li style="border-left: 1px solid #cccccc"><a href="javascript:moveClose2()">비밀번호 찾기</a></li>
        	<li style="border-left: 1px solid #cccccc"><a href="javascript:moveClose3()">회원가입</a></li>
        </ul>
        <div id="kakao_id_login" style="margin-left: 50px; margin-top: 30px;">
        <a id="custom-login-btn" href="javascript:loginWithKakao()">
	  	<img
	    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
	    width="277px;" height="60px;"/>
		</a>
		</div>
	    <!-- 네이버아이디로로그인 버튼 노출 영역 -->
	  <div id="naver_id_login" style="margin-left: 50px; margin-top: 10px;">
	  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
	  <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("J9LhL5HfjKG4bDjLYBHL", "http://localhost:9090/final/login/");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 277,60);
	  	naver_id_login.setDomain("http://localhost:9090/final/login/");
	  	naver_id_login.setState(state);
	  	naver_id_login.setPopup();
	  	naver_id_login.init_naver_id_login();
	  </script>
	  </div>
    </form>
    
  </div>
</body>
</html>