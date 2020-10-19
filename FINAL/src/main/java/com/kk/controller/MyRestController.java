package com.kk.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.auction.service.CommentService;
import com.auction.vo.CommentVo;

@RestController
@RequestMapping(value="/rest", produces="application/json; charset=utf-8")
public class MyRestController {
	@Autowired
	CommentService commentService;
	
	@RequestMapping(value="/writecomment")
	@ResponseBody
	public CommentVo writeComment(@RequestBody Map<String,String> param) {
		String ID = "아이디";
		String comment  = param.get("comment");
		System.out.println(comment);
		String qbno =param.get("qbno");
		System.out.println(qbno+","+comment);
		CommentVo vo = new CommentVo(Integer.parseInt(qbno),comment, ID);
		commentService.writeCommentService(vo);
//		List<CommentVo> list =commentService.selectCommentService(2);
		return vo;
	}
}
