package com.kk.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.auction.service.AdminService;
import com.auction.service.ProductService;
import com.auction.vo.AuctionVo;
import com.auction.vo.ProductVo;

@Controller
public class ProductController {
	@Autowired
	ProductService service;
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/applyProduct")
	public String applyProduct() {
		return "applyProduct";
	}
	
	@RequestMapping(value="/applyProductAction", method = RequestMethod.POST)
	public String applyProductAction(ProductVo vo, Model model, HttpSession session) throws Exception{
		//String filePath = session.getServletContext().getRealPath("/resources/images/");
		// request.getSession().getServletContext().getRealPath("/");  
		String filePath = session.getServletContext().getRealPath("/")+"resources/images/";
		MultipartFile[] arrMultipart = vo.getMultiparts();		
		String[] arrFilename = new String[arrMultipart.length];		
		String str ="";
		
		for(int i=0; i<=arrMultipart.length-1; i++) {
			MultipartFile multipart = arrMultipart[i];
			String filename = "(�씠由� �뾾�쓬)";
			
		if(!multipart.isEmpty()) {
			filename = multipart.getOriginalFilename();
			File file = new File(filePath, filename);
			if(!file.exists())
				file.mkdirs();
			multipart.transferTo(file);
		}
		arrFilename[i] = filename;
		str += arrFilename[i] += "_!_";
		vo.setFilenames(str);
		}
		
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String time1 = format1.format(time);
		vo.setUploaddate(time1);
		
		int result = service.insertProduct(vo);
		if(result == 1) {
			System.out.println("寃쎈ℓ �벑濡�!!!!");
		}
		model.addAttribute("result", result);
//		return "mypage";
		
		vo.setImg1(vo.getFilenames().split("_!_")[0]);
		vo.setImg2(vo.getFilenames().split("_!_")[1]);
				
		List<ProductVo> list = service.selectAuctionBlind();
		list.add(vo);
		model.addAttribute("vo", list);
		return "showAuctionBlind";
	}
	
	public void setImg(List<ProductVo> list) {
		for(ProductVo vo : list) {
			if(vo.getFilenames()==null || vo.getFilenames().equals("")) {
				vo.setImg1(null);
				vo.setImg2(null);
			} else {
				vo.setImg1(vo.getFilenames().split("_!_")[0]);
				vo.setImg2(vo.getFilenames().split("_!_")[1]);
				vo.setImage(null);
			}
		}
	}
	
	@RequestMapping(value="/main")
	public String main(Model model) {
		List<ProductVo> showPop = service.selectPop();
		List<ProductVo> showHurry = service.selectHurry();
		setImg(showPop);
		setImg(showHurry);
		
		model.addAttribute("showPop", showPop);
		model.addAttribute("showHurry", showHurry);
		return "mainpage";
	}
	
	@RequestMapping(value="/showAuctionNormal")
	public String showAuctionNormal(Model model) {
		List<ProductVo> list = service.selectAuction();
		setImg(list);
		model.addAttribute("list", list);
		return "showAuctionNormal";
	}
	
	@RequestMapping(value="/showAuctionBlind")
	public String showAuctionBlind(Model model) {
		List<ProductVo> listShowBlind = service.selectAuctionBlind();
		setImg(listShowBlind);
		model.addAttribute("voListShowBlind", listShowBlind);
		return "showAuctionBlind";
	}
	
	@RequestMapping(value="/showDetail")
	public String showDetail(Model model, int pno, HttpSession session) {

		session.setAttribute("session_id", "admin");				//�닔�젙

		String ID = (String) session.getAttribute("session_id");
		
		ProductVo vo = service.selectOne(pno);
		List<AuctionVo> list = adminService.chart(pno);	
		if(vo.getFilenames()!=null) {
			vo.setImg1(vo.getFilenames().split("_!_")[0]);
			vo.setImg2(vo.getFilenames().split("_!_")[1]);
			vo.setImage(null);
		} else {
			vo.setImg1(null);
			vo.setImg2(null);
		}
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("ID", ID);
		return "showDetail";
	}
	
	@RequestMapping(value="/showCategory")
	public String showCategory(Model model, String category) {
		
		
		return "showAuctionBlind";
	}
}
