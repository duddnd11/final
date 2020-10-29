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
import com.auction.vo.MemberDto;
import com.auction.vo.MemberVo;
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
			String filename = "(이름없음)";
			
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
			System.out.println("등록됨!!!!");
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
	public String showAuctionNormal(Model model,String category) {
		List<ProductVo> list = service.selectAuction();
		List<ProductVo> listCategory = service.showNormalCategory(category);
		List<String> categoryMenu = new ArrayList<String>();
		boolean check =true;
		for(ProductVo vo : list) {
			check=true;
			for(String str : categoryMenu) {
				if(vo.getCategory().equals("") || str.equals(vo.getCategory())) {
					check=false;
					break;
				}
			}
			if(check==true) {
				categoryMenu.add(vo.getCategory());
			}
		}
		setImg(list);
		setImg(listCategory);
		model.addAttribute("category", categoryMenu);
		if(category==null) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("list",listCategory);
		}
		return "showAuctionNormal";
	}
	
	@RequestMapping(value="/showAuctionBlind")
	public String showAuctionBlind(Model model,String category) {
		List<ProductVo> listShowBlind = service.selectAuctionBlind();
		List<ProductVo> listCategory = service.showBlindCategory(category);
		List<String> categoryMenu = new ArrayList<String>();
		boolean check =true;
		for(ProductVo vo : listShowBlind) {
			check=true;
			for(String str : categoryMenu) {
				if(vo.getCategory().equals("") || str.equals(vo.getCategory())) {
					check=false;
					break;
				}
			}
			if(check==true) {
				categoryMenu.add(vo.getCategory());
			}
		}
		setImg(listShowBlind);
		setImg(listCategory);
		model.addAttribute("category", categoryMenu);
		if(category==null) {
			model.addAttribute("voListShowBlind", listShowBlind);
		}else {
			model.addAttribute("voListShowBlind", listCategory);
		}
		return "showAuctionBlind";
	}
	
	@RequestMapping(value="/showDetail")
	public String showDetail(Model model, int pno, HttpSession session) {
//		session.setAttribute("member", "admin");				//수정
		MemberVo ID =  (MemberVo) session.getAttribute("member");
		
		ProductVo vo = service.selectOne(pno);
		List<AuctionVo> list = adminService.chart(pno);	
		if(vo.getFilenames()==null || vo.getFilenames().equals("")) {
			vo.setImg1(null);
			vo.setImg2(null);
		} else {
			vo.setImg1(vo.getFilenames().split("_!_")[0]);
			vo.setImg2(vo.getFilenames().split("_!_")[1]);
			vo.setImage(null);
		}
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("ID", ID);
		return "showDetail";
	}
	
	@RequestMapping(value="/insertAuction")
	public String insertAuction(HttpSession session, Model model, int pno, int myprice) {
		MemberVo ID =  (MemberVo) session.getAttribute("member");
		String id = ID.getID();
		AuctionVo vo = new AuctionVo(id, pno, myprice);
		int result = service.insertAuction(vo);
		if(result==2) {
			System.out.println("입찰됨!!!");
		}
		model.addAttribute("result", result);
		return "showDetail";
	}
	
}
