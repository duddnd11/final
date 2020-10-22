package com.kk.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.auction.service.AdminService;
import com.auction.service.CommentService;
import com.auction.service.ProductService;
import com.auction.vo.CommentVo;
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
		System.out.println("comment:"+comment);
		
		int ref=Integer.parseInt(param.get("ref"));
		int level=Integer.parseInt(param.get("level"));
		int step=Integer.parseInt(param.get("step"));
		System.out.println("ref:"+ref+", level:"+level+",step:"+step);
		CommentVo vo = new CommentVo(Integer.parseInt(qbno),comment, ID,ref,level,step);
		commentService.writeCommentService(vo);
		int maxCno =commentService.selectMaxCnoService();
		commentService.updateRefService(maxCno);
		vo = new CommentVo(Integer.parseInt(qbno),comment, ID,maxCno,level,step);
		return vo;
	}
	
	
	@RequestMapping(value = "/admin/item")
	public List<ProductVo> list2(@RequestBody Map<String, String> param) {
		int admin = Integer.parseInt(param.get("admin"));
		int deal = Integer.parseInt(param.get("deal"));
		List<ProductVo> list = adminService.adminProduct(admin, deal);
		return list;
	}
	
}
