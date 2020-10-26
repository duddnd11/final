package com.kk.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.auction.service.MemberService;
import com.auction.vo.MemberDto;


@Controller
public class MemberHomeController {
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		
		return "home";
	}
	@RequestMapping(value = "/login", method = RequestMethod.GET)	//로그인
	public String login(Locale locale, Model model) {
		
		return "login";
	}
	
	@RequestMapping(value = "/loginAction")	//로그인 확인, 회원 정보 수정 버튼 있는 화면
	public ModelAndView home3(@ModelAttribute MemberDto dto, HttpSession session, Model model) throws Exception {
		boolean result = service.loginCheck(dto, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.addObject("msg", "성공");
			mav.setViewName("/home3");
			
		} else {
			mav.addObject("msg", "실패");
			mav.setViewName("/login");
		}
	//	model.addAttribute("member", dto);
		return mav;
	}
	
	@RequestMapping(value = "/singup", method = RequestMethod.GET)	//회원가입
	public String singup(Locale locale, Model model) {
		
		return "singup";
	}
	@RequestMapping(value = "/writeAction")	//회원가입 확인
	public String home2(MemberDto dto) {
		System.out.println(dto.getID() + "/" + dto.getPw() + "/" + dto.getName() + "/" +dto.getPhonenum() +"/"+ dto.getAddr() + "/" + dto.getBirth()+ "/" + dto.getGrade() + "/" + dto.getEmail());
		service.writeSignUp(dto);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/memberupdate", method = RequestMethod.GET)//회원정보 수정
	public String update(MemberDto dto, Model model) {
		model.addAttribute("mdto",dto);
		
		return "update";
	}
	
	@RequestMapping(value = "/memberupdateAction")	//회원 정보 수정 확인
	public String home4(MemberDto dto, Model model, HttpSession session) {
		service.memberUpdate(dto);
//		session.setAttribute("id", dto.getID());
//		session.setAttribute("pw", dto.getPw());
//		session.setAttribute("name", dto.getName());
		model.addAttribute("mid",dto.getID());
		model.addAttribute("mpw", dto.getPw());
		model.addAttribute("mname", dto.getName());
		System.out.println(dto.getPw() + "/" + dto.getName());
		return "redirect:/";
	}
	
}
