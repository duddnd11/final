package com.kk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	@RequestMapping(value="/adminProduct")
	public String adminProduct() {
		
		return "";
	}

}
