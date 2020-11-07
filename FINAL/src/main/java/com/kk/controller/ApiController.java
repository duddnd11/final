package com.kk.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.api.NaverLoginBo;
import com.auction.api.PaymentCheck;
import com.auction.service.MemberService;
import com.auction.service.ProductService;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class ApiController {
	private NaverLoginBo naverLoginBo;
	private String apiResult= null;
	@Autowired
	PaymentCheck paymentCheck;
	@Autowired
	ProductService pService;
	@Autowired
	MemberService mService;
	@Autowired
	private void setNaverLoginBo(NaverLoginBo naverLoginBo) {
		this.naverLoginBo = naverLoginBo;
	}

	
//	@RequestMapping(value="/result")
//	public String login(Model model,HttpSession session) {
//		System.out.println("로그인확인");
//		return "login";
//	}
	
	@RequestMapping(value="result")
	public String callback(Model model, String code,String state,HttpSession session ) throws IOException, ParseException {
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBo.getAccessToken(session, code, state);
		apiResult = naverLoginBo.getUserProfile(oauthToken);
		JSONParser jsonParse = new JSONParser(); //JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다. 
		JSONObject jsonObj = (JSONObject) jsonParse.parse(apiResult);
		JSONObject jsonResponse = (JSONObject)jsonObj.get("response");
		String id = (String) jsonResponse.get("id");
		String name=(String) jsonResponse.get("name");
		String email =(String) jsonResponse.get("email");
		String birthday =(String) jsonResponse.get("birthday");
		MemberVo vo  = new MemberVo(id, "312fdqwd", name, "", "", email, birthday, "e");
		vo.setApi("naver");
		int apiCheck=mService.apiLogin(id, "naver");
		if(apiCheck==0) {
			mService.insertApi(vo);
		}
		session.setAttribute("member", vo);
		model.addAttribute("result", apiResult);
		return "loginaction";
	}
	
	@RequestMapping(value="paymentResult")
	public String paymentResult(String imp_uid,String mid,Model model,int pno,HttpSession session) {
		String token =paymentCheck.getImportToken();
		String amount=paymentCheck.getAmount(token, mid);
		paymentCheck.setHackCheck(amount, mid, token);
		Map<String,String> map = paymentCheck.paymentInformation(token, mid); 
		
		MemberVo member =  (MemberVo) session.getAttribute("member");
		String ID = member.getID();
		ProductVo vo =pService.selectOne(pno);
		pService.payment(pno);
		model.addAttribute("vo", vo);
		model.addAttribute("map", map);
		return "paymentAction";
	}
}
