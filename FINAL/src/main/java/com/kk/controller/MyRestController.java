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
		List<ProductVo> list = adminService.adminProduct(admin);
		return list;
	}
	@RequestMapping(value = "/admin/itemmanager")
	@ResponseBody
	public List<ProductVo> itemmanager(@RequestBody Map<String, String> param) {
		int admin = Integer.parseInt(param.get("admin"));
		int deal = Integer.parseInt(param.get("deal"));
		List<ProductVo> list = adminService.dealProduct(admin, deal);
		return list;
	}
	
}
