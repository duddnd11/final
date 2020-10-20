package com.kk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.auction.service.ProductService;
import com.auction.vo.ProductVo;

@Controller
public class ProductController {
	@Autowired
	ProductService service;
	
	@RequestMapping(value="/applyProduct")
	public String applyProduct() {
		return "applyProduct";
	}
	
	@RequestMapping(value="/applyProductAction")
	public String applyProductAction(ProductVo vo, Model model) {
		int result = service.insertProduct(vo);
		if(result == 1) {
			System.out.println("경매 등록!!!!");
		}
		model.addAttribute("result", result);
		return "mypage";
	}
	
	@RequestMapping(value="/main")
	public String main(Model model) {
		List<ProductVo> showPop = service.selectPop();
		List<ProductVo> showHurry = service.selectHurry();
		
		model.addAttribute("showPop", showPop);
		model.addAttribute("showHurry", showHurry);
		return "main";
	}
	
	@RequestMapping(value="/showAuctionNormal")
	public String showAuctionNormal(Model model) {
		List<ProductVo> showNormal = service.selectAuction();
		model.addAttribute("showNormal", showNormal);
		return "showAuctionNormal";
	}
	
	@RequestMapping(value="/showAuctionBlind")
	public String showAuctionBlind(Model model) {
		List<ProductVo> showBlind = service.selectAuctionBlind();
		model.addAttribute("showBlind", showBlind);
		return "showAuctionBlind";
	}
	
	@RequestMapping(value="/showDetail")
	public String showDetail(Model model, int pno) {
		ProductVo vo = service.selectOne(pno);
		model.addAttribute("vo", vo);
		return "showDetail";
	}
}
