package com.kk.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.auction.service.MemberService;
import com.auction.service.ProductService;
import com.auction.sha256.SHA256Util;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;


@Controller
public class MemberHomeController {
	@Autowired
	MemberService service;
	@Autowired
	ProductService pService;
//	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//
//		
//		return "home";
//	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)	//로그인
	public String login(Locale locale, Model model) {
		return "login";
	}
	
	@RequestMapping(value = "/login/loginaction")
	public String LoginCheck(MemberVo vo, HttpServletRequest req, HttpSession session, RedirectAttributes redirectattributes) throws Exception {
		session = req.getSession();
		//System.out.println(dto.getID());
		vo.setPw(util(vo.getPw()));
		MemberVo memberdto = service.loginCheck(vo);
		if(memberdto == null) {
			session.setAttribute("member", null);
			redirectattributes.addFlashAttribute("msg", memberdto);
			
		}else {
			session.setAttribute("member", memberdto);
			return "loginaction";
		}
		return "redirect:/singup";
	}
	
	@RequestMapping(value = "/logout")		//로그아웃
	public String logout(HttpSession session) {
		session.invalidate();
		return "logout";
	}
	
	@RequestMapping(value = "/singup", method = RequestMethod.GET)	//회원가입
	public String singup(Locale locale, Model model) {
		return "singup";
	}
	
	public String util(String pw) {
		String str = pw;
		String sha256_en = SHA256Util.encrypt(str);
		System.out.println("SHA256 암호화 : "+sha256_en);
		return sha256_en;
	}
	
	@RequestMapping(value = "/signupaction")	//등록처리
	public String insertPost(RedirectAttributes redirectattributes, MemberVo vo) throws Exception{
	//	model.addAttribute("mvo", vo);
	//	redirectattributes.addFlashAttribute("msg", "regSuccess");
		vo.setPw(util(vo.getPw()));
		
		service.writeSignUp(vo);
		return "redirect:/main";
	}
	
	@RequestMapping(value = "/memberupdate")
	public String memberupdate() {
		return "memberupdate";
	}
	@RequestMapping(value = "/memberaction")
	public String UpdateAction(MemberVo vo, HttpSession session) {
		vo.setPw(util(vo.getPw()));
		service.memberUpdate(vo);
		session.invalidate();
		
		return "redirect:/main";
	}
	@RequestMapping(value="/myPage")
	public String myPage(HttpSession session, Model model) {
		MemberVo member = (MemberVo) session.getAttribute("member");
		List<ProductVo> list = new ArrayList<ProductVo>();
		String likeProduct = pService.selectLike(member.getID());
		String[] pno = likeProduct.split("_!_"); // 1016 1022
		for(int i=0; i<=pno.length-1; i++) { //2
				ProductVo vo = pService.selectOne(Integer.parseInt(pno[i]));
				list.add(vo);
		}
		model.addAttribute("list", list);
		return "myPage";
	}
	@RequestMapping(value="/result/naverLogin")
	public String naverLogin(String id,String name, String email,String birthday,String api,HttpSession session) {
		MemberVo vo = new MemberVo(id, "111", name, "주소", "11111", email, birthday, "c");
		vo.setApi(api);
		int apiCheck=service.apiLogin(id, api);
		System.out.println("api중복체크:"+apiCheck);
		System.out.println(id);
		System.out.println(api);
		if(apiCheck==0) {
			service.insertApi(vo);
		}
		session.setAttribute("member", vo);
		return "loginaction";
	}
}





