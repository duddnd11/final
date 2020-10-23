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
	public String customer() {
		
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
	public String itemmanager(Model model,int offset) {
		List<ProductVo> listAll = service.showProduct();
		List<ProductVo> list = service.showProductPage(offset);
		int pageSize=0;
		if(listAll.size()>=10 && listAll.size()%10==0 ) {
			pageSize=listAll.size()/10;
		}else {
			pageSize=listAll.size()/10+1;
		}
		int nowPage =offset/10;
		int startPage = nowPage/10*10+1;
		int endPage = startPage+9;
		if(nowPage/10 == pageSize/10) {
			endPage=pageSize;
		}
		model.addAttribute("offset", offset);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("list", list);
		return "itemmanager";
	}

	

}
