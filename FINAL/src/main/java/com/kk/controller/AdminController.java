package com.kk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.service.AdminService;
import com.auction.vo.AuctionVo;
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
	public String customer(Model model) {
		model.addAttribute("list", service.showMember());
		return "customer";
	}
	@RequestMapping(value = "/admin/customer/info")
	public String info(String id, Model model) {
		List<ProductVo> listP = service.saleItem(id);
		List<AuctionVo> listA = service.buyItem(id);
		model.addAttribute("sales", listP);
		model.addAttribute("purchase", listA);
		return "customerinfo";
	}
	@RequestMapping(value = "/admin/item")
	public String itemmanager(Model model) {
		List<ProductVo> list = service.showProduct();
		model.addAttribute("list", list);
		return "itemmanager";
	}

	

}
