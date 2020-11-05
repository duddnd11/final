package com.kk.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;

@Controller
public class ProductController {
	@Autowired
	ProductService service;
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/applyProduct")
	public String applyProduct(HttpSession session, Model model) {
		MemberVo vo = (MemberVo) session.getAttribute("member");
		String id = vo.getID();
		model.addAttribute("id", id);
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
		
		int result = service.insertProduct(vo);
		if(result == 1) {
			System.out.println("등록됨!!!!");
		}else {
			System.out.println("등록...안됨..");
		}
		model.addAttribute("result", result);
		return "myPage";
		
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
		service.hitcountUp(pno);
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
		if(vo.getBestmoney() >= vo.getLastmoney()) {
			if(service.dealChage(pno)==1) {
				vo.setDeal(2);
				System.out.println("상한가 마감 deal :"+vo.getDeal());
				
			}
		}
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		model.addAttribute("ID", ID);
		return "showDetail";
	}
	
	@RequestMapping(value="/insertAuction")
	public String insertAuction(HttpSession session, HttpServletResponse res, Model model, int pno, int myprice, int moneyup,String auctionmenu) {
		MemberVo ID =  (MemberVo) session.getAttribute("member");
		ProductVo pVo  = service.selectOne(pno);
		int diff=0, myDiff=0;
		if(ID==null) {
			return "login";
		}
		String id = ID.getID();
		AuctionVo vo = new AuctionVo(id, pno, myprice+moneyup);	// yg,1012,1000
		int result=0;
		if(auctionmenu.equals("일반")) {
			result = service.insertAuction(vo,auctionmenu,diff,myDiff);
			if(result==2) {
				System.out.println("입찰됨!!!");
			}
		}else { //블라인드
			diff =Math.abs(pVo.getBestmoney()-pVo.getPrice());
			myDiff = Math.abs(pVo.getPrice()-myprice);
			service.insertAuction(vo,auctionmenu,diff,myDiff);
		}

		return "redirect:/showDetail?pno="+pno;
	}
	/*
	@RequestMapping(value="/rejectAction")
	public String rejectAction(int pno, String grade) {
		if(grade.equals("z")) {
			return "redirect:/showDetail?pno="+pno;
		}
		int result = service.dealChage(pno);
		System.out.println("시간 마감: "+result);
		return "redirect:/main";
	}*/
	
	@RequestMapping(value="/addLike")
	public String addLike(int pno, HttpSession session) {
		MemberVo member =  (MemberVo) session.getAttribute("member");
		String ID = member.getID();
		String str = pno+"_!_";	//1137_!_
		String likeArr[]=service.selectLike(ID).split("_!_");
		int check=0;
		for(int i=0; i<likeArr.length ;i++) {
			System.out.println(likeArr[i]+"="+pno);
			if(likeArr[i].equals(String.valueOf(pno))) {
				check=1;
				System.out.println("비교문: "+check);
				break;
			}
		}
		if(check ==0) {
			int result = service.addLike(str, ID);
			System.out.println("관심상품: "+result);
		}
		return "redirect:/showDetail?pno="+pno;
	}
	@RequestMapping(value="payment")
	public String payment(HttpSession session,int pno,Model model) {
		MemberVo member =  (MemberVo) session.getAttribute("member");
		String ID = member.getID();
		ProductVo vo =service.selectOne(pno);
		model.addAttribute("vo", vo);
		return "payment";
	}
	@RequestMapping(value="paymentAction")
	public String paymentAction(int pno,Model model) {
		model.addAttribute("pno", pno);
		return "paymentAction";
	}
}




