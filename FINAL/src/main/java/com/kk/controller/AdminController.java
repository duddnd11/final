package com.kk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.service.AdminService;
import com.auction.vo.ProductVo;

@Controller
public class AdminController {
	@Autowired
	AdminService service;
	
	@RequestMapping(value = "/admin")
	public String admin() {
		
		return "admin";
	}
	@RequestMapping(value = "/admin/customer")
	public String customer() {
		
		return "customer";
	}
	@RequestMapping(value = "/admin/customer/info")
	public String info() {
		
		return "customerinfo";
	}
	@RequestMapping(value = "/admin/item")
	public String itemmanager(Model model) {
		List<ProductVo> list = service.showProduct();
		model.addAttribute("list", list);
		return "itemmanager";
	}

	

}
