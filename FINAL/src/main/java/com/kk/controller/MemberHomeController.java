package com.kk.controller;

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
import com.auction.vo.MemberDto;


@Controller
public class MemberHomeController {
	@Autowired
	MemberService service;
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
	
	@RequestMapping(value = "/loginaction")
	public String LoginCheck(MemberDto dto, HttpServletRequest req, HttpSession session, RedirectAttributes redirectattributes) throws Exception {
		session = req.getSession();
		System.out.println(dto.getID());
		MemberDto memberdto = service.loginCheck(dto);
		if(memberdto == null) {
			session.setAttribute("member", null);
			redirectattributes.addFlashAttribute("msg", memberdto);
			
		}else {
			session.setAttribute("member", memberdto);
			return "loginaction";
		}
		return "redirect:/singup";
	}
	
	@RequestMapping(value = "/singup", method = RequestMethod.GET)	//회원가입
	public String singup(Locale locale, Model model) {
		
		return "singup";
	}
	@RequestMapping(value = "/signupaction")	//등록처리
	public String insertPost(RedirectAttributes redirectattributes, MemberDto dto) throws Exception{
	//	model.addAttribute("mvo", vo);
	//	redirectattributes.addFlashAttribute("msg", "regSuccess");
		service.writeSignUp(dto);
		return "redirect:login";
	}
	
	@RequestMapping(value = "/memberupdate")
	public String memberupdate() {
		return "member";
	}
	@RequestMapping(value = "/memberaction")
	public String UpdateAction(MemberDto dto, HttpSession session) {
		service.memberUpdate(dto);
		session.invalidate();
		
		return "redirect:/login";
	}
	
}
