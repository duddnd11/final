package com.kk.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}
	@RequestMapping(value = "/popup")
	public String popup() {
		
		return "popup";
	}
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	@RequestMapping(value = "/result")
	public String result() {
		return "result";
	}
	@RequestMapping(value = "/singup")
	public String singup() {
		
		return "singup";
	}
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
	@RequestMapping(value = "/chart")
	public String chart() {
		
		return "chart";
	}
}
