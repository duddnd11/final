package com.kk.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.auction.api.GoogleApi;
import com.auction.service.MemberService;
import com.auction.vo.MemberVo;



@Controller
public class HomeController {
	@Autowired
	MemberService service;
	
	@Autowired
	GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	OAuth2Parameters googleOAuth2Parameters;
	@Autowired
	MemberService mService;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
//	@RequestMapping(value = "/mainpage")
//	public String maainpage() {
//		
//		return "mainpage";
//	}
	@RequestMapping(value = "/popup")
	public String popup() {
		
		return "popup";
	}
	@RequestMapping(value = "/chatting2")
	public String chatting2() {
		
		return "chatting2";
	}
//	@RequestMapping(value = "/login")
//	public String login() {
//		return "login";
//	}
//	
	/*
	@RequestMapping(value = "/googleLogin", method = RequestMethod.POST)
	public String doGoogleSignInActionPage(HttpServletResponse response, Model model) throws Exception{
	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	  String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	  System.out.println("/member/googleSignIn, url : " + url);
	  model.addAttribute("url",url);
	  return "login/googleLogin";

	}
	*/
	@RequestMapping(value = "/oauth2callback", method = RequestMethod.GET)
	public String doSessionAssignActionPage(@RequestParam("code") String code, HttpSession session, Model model)throws Exception{
		  // 코드 확인
        System.out.println("code : " + code);
        
        // Access Token 발급
        JsonNode jsonToken = GoogleApi.getAccessToken(code);
        String accessToken = jsonToken.get("access_token").toString();
        String refreshToken = "";
        System.out.println(jsonToken.get("refresh_token"));
        /*
        if(jsonToken.("refresh_token")) {
            refreshToken = jsonToken.get("refresh_token").toString();
        }
        String expiresTime = jsonToken.get("expires_in").toString();
 		*/
        // Access Token으로 사용자 정보 반환
        JsonNode userInfo = GoogleApi.getGoogleUserInfo(accessToken);
        System.out.println(userInfo.toString());
        String id = userInfo.get("id").getValueAsText();
        String name= userInfo.get("name").getValueAsText();
        String email = userInfo.get("email").getValueAsText();
        MemberVo vo = new MemberVo(id, "qd12", name, "", "", email, "", "e");
        vo.setApi("google");
        int apiCheck=mService.apiLogin(id, "google");
		if(apiCheck==0) {
			mService.insertApi(vo);
		}
		session.setAttribute("member", vo);

	  return "loginaction";
	}
	
//	@RequestMapping(value = "/result")
//	public String result() {
//		return "result";
//	}
//	@RequestMapping(value = "/signup")
//	public String singup() {
//		
//		return "signup";
//	}
//	@RequestMapping(value = "/idcheck")
//	public String idcheck() {
//		
//		return "idcheck";
//	}
	
	@RequestMapping(value = "/admin/chat")
	public String chat() {
		
		return "chat";
	}
	@RequestMapping(value = "/test")
	public String test() {
		
		return "test";
	}
	
}
