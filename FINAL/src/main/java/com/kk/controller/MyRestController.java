package com.kk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.auction.service.AdminService;
import com.auction.service.CommentService;
import com.auction.vo.CommentVo;
import com.auction.vo.MemberVo;
import com.auction.vo.ProductVo;

@RestController
@RequestMapping(value="/rest", produces="application/json; charset=utf-8")
public class MyRestController {
	@Autowired
	CommentService commentService;
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value="/writecomment")
	@ResponseBody
	public CommentVo writeComment(@RequestBody Map<String,String> param) {
		String ID = "아이디";
		String comment  = param.get("comment");
		String qbno =param.get("qbno");
		
		int ref=Integer.parseInt(param.get("ref"));
		int level=Integer.parseInt(param.get("level"));
		int step=Integer.parseInt(param.get("step"));
		
		CommentVo vo = new CommentVo(Integer.parseInt(qbno),comment, ID,ref,level,step);
		commentService.writeCommentService(vo);
		int maxCno =commentService.selectMaxCnoService();
		if(ref==0) {
			commentService.updateRefService(maxCno);
			vo.setRef(maxCno);
		}
		vo = commentService.topComment(maxCno);
		return vo;
	}
	
	
	@RequestMapping(value = "/admin/itemadmin")
	@ResponseBody
	public List<ProductVo> itemadmin(@RequestBody Map<String, String> param) {
		int admin = Integer.parseInt(param.get("admin"));
		int offset = Integer.parseInt(param.get("offset"));
//		List<ProductVo> list = adminService.adminProduct(admin);
		List<ProductVo> list = adminService.adminProductPage(admin, offset);
		for(ProductVo vo : list) {
			switch(vo.getGrade()) {
				case "a":
					vo.setGrade("vvip");
					break;
				case "b":
					vo.setGrade("vip");
					break;
				case "c":
					vo.setGrade("gold");
					break;
				case "d":
					vo.setGrade("silver");
					break;
				case "e":
					vo.setGrade("일반");
					break;
			}
		}
		return list;
	}
	@RequestMapping(value = "/admin/itemmanager")
	@ResponseBody
	public List<ProductVo> itemmanager(@RequestBody Map<String, String> param) {
		int admin = Integer.parseInt(param.get("admin"));
		int deal = Integer.parseInt(param.get("deal"));
		int offset = Integer.parseInt(param.get("offset"));
//		List<ProductVo> list = adminService.dealProduct(admin, deal);
		List<ProductVo> list = adminService.dealProductPage(admin, deal, offset);
		for(ProductVo vo : list) {
			switch(vo.getGrade()) {
				case "a":
					vo.setGrade("vvip");
					break;
				case "b":
					vo.setGrade("vip");
					break;
				case "c":
					vo.setGrade("gold");
					break;
				case "d":
					vo.setGrade("silver");
					break;
				case "e":
					vo.setGrade("일반");
					break;
			}
		}
		return list;
	}
	@RequestMapping(value="/admin/page")
	@ResponseBody
	public Map<String,Integer> page(@RequestBody Map<String,Integer> param){
		int admin = param.get("admin");
		int offset = param.get("offset");
		int deal = param.get("deal");
		List<ProductVo> listAll = new ArrayList<ProductVo>();
		if(deal>=0) {
			listAll = adminService.dealProduct(admin, deal);
			admin=admin+deal+1;
		}else {
			listAll = adminService.adminProduct(admin);
		}
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
		System.out.println("======admin :"+admin+"======");
		System.out.println("사이즈:"+listAll.size());
		System.out.println("deal:"+deal);
		System.out.println("np:"+nowPage);
		System.out.println("sp:"+startPage);
		System.out.println("ep:"+endPage);
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("pageSize", pageSize);
		map.put("admin", admin);
		return map;
	}
	
}
