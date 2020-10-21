package com.kk.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	
	@RequestMapping(value="/applyProductAction", method = RequestMethod.POST)
	public String applyProductAction(ProductVo vo, Model model, HttpSession session) throws Exception{
		String filePath = session.getServletContext().getRealPath("/resources/images/");
		MultipartFile[] arrMultipart = vo.getMultiparts();		
		String[] arrFilename = new String[arrMultipart.length];		

		for(int i=0; i<=arrMultipart.length-1; i++) {
			MultipartFile multipart = arrMultipart[i];
			String filename = "(이름 없음)";
			
		if(!multipart.isEmpty()) {
			filename = multipart.getOriginalFilename();
			File file = new File(filePath, filename);
			if(!file.exists())
				file.mkdirs();
			multipart.transferTo(file);
		}
		arrFilename[i] = filename;
		
		vo.setFilenames(arrFilename[i] += "_(!_");
		}
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		vo.setUploaddate(time1);
		
		int result = service.insertProduct(vo);
		if(result == 1) {
			System.out.println("경매 등록!!!!");
		}
		model.addAttribute("result", result);
		model.addAttribute("vo", vo);
//		return "mypage";
		return "showAuctionBlind";
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
