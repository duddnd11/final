package com.kk.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.Connection;
import org.springframework.social.google.api.Google;
import org.springframework.social.google.api.impl.GoogleTemplate;
import org.springframework.social.google.api.plus.Person;
import org.springframework.social.google.api.plus.PlusOperations;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.auction.vo.MemberVo;



@Controller
public class HomeController {
	@Autowired
	GoogleConnectionFactory googleConnectionFactory;
	@Autowired
	OAuth2Parameters googleOAuth2Parameters;
	
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
//	@RequestMapping(value = "/login")
//	public String login() {
//		return "login";
//	}
//	
	@RequestMapping(value = "/googleLogin", method = RequestMethod.POST)
	public String doGoogleSignInActionPage(HttpServletResponse response, Model model) throws Exception{
	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	  String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
	  System.out.println("/member/googleSignIn, url : " + url);
	  model.addAttribute("url",url);
	  return "login/googleLogin";

	}
	@RequestMapping(value = "/googleSignInCallback", method = RequestMethod.GET)
	public String doSessionAssignActionPage(HttpServletRequest request)throws Exception{
	  System.out.println("/member/googleSignInCallback");
	  String code = request.getParameter("code");

	  OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
	  AccessGrant accessGrant = oauthOperations.exchangeForAccess(code , googleOAuth2Parameters.getRedirectUri(),
	      null);

	  String accessToken = accessGrant.getAccessToken();
	  Long expireTime = accessGrant.getExpireTime();
	  if (expireTime != null && expireTime < System.currentTimeMillis()) {
	    accessToken = accessGrant.getRefreshToken();
	    System.out.printf("accessToken is expired. refresh token = {}", accessToken);
	  }
	  Connection<Google> connection = googleConnectionFactory.createConnection(accessGrant);
	  Google google = connection == null ? new GoogleTemplate(accessToken) : connection.getApi();

	  PlusOperations plusOperations = google.plusOperations();
	  Person profile = plusOperations.getGoogleProfile();
	  MemberVo vo = new MemberVo();
	  System.out.println(profile.getDisplayName());
	  
	  vo.setEmail(profile.getAccountEmail());
	  vo.setName(profile.getDisplayName());
	  vo.setID("g_"+profile.getId());
//	  vo.setBirth(profile.getBirthday());
	  
	  HttpSession session = request.getSession();
//	  vo = service.googleLogin(vo);
	  
//	  session.setAttribute("login", vo);


	  return "redirect:/";
	}
	
	@RequestMapping(value = "/result")
	public String result() {
		return "result";
	}
//	@RequestMapping(value = "/signup")
//	public String singup() {
//		
//		return "signup";
//	}
	@RequestMapping(value = "/idcheck")
	public String idcheck() {
		
		return "idcheck";
	}
	@RequestMapping(value = "/pwcheck")
	public String pwcheck() {
		
		return "pwcheck";
	}

	@RequestMapping(value = "/admin/chat")
	public String chat() {
		
		return "chat";
	}
	@RequestMapping(value = "/test")
	public String test() {
		
		return "test";
	}
	
}
