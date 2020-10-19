package com.kk.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.auction.service.CommentService;
import com.auction.service.QnaBoardService;
import com.auction.vo.CommentVo;
import com.auction.vo.QnaBoardVo;

@Controller
public class ServiceCenterController {
	@Autowired
	QnaBoardService qnaBoardService;
	@Autowired
	CommentService commentService;
	
	private static final Logger logger = LoggerFactory.getLogger(ServiceCenterController.class);
	@RequestMapping(value="/serviceCenter")
	public String serviceCenter() {
		return "serviceCenter";
	}
	
	@RequestMapping(value="/chatting")
	public String chatting() {
		return "chatting";
	}
	
//	@RequestMapping(value="/chatting")
//	public ModelAndView chat(ModelAndView mv,HttpSession session) {
//		System.out.println(session.getAttribute("아이디"));
//		mv.setViewName("chatting");
//		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//		System.out.println("user name:"+user.getUsername());
//		System.out.println("normal chat page");
//		mv.addObject("userid",session.getAttribute("아이디"));
//		return mv;
//	}
	
	@RequestMapping(value="/qnaBoard")
	public String qna(Model model) {
		List<QnaBoardVo> list =qnaBoardService.selectBoard();
		model.addAttribute("qnaBoard", list);
		return "qnaBoard";
	}
	
	@RequestMapping(value="/detail")
	public String content(Model model,int qbno) {
		QnaBoardVo vo =qnaBoardService.selectContent(qbno);
		List<CommentVo> commentList = commentService.selectCommentService(qbno);
		model.addAttribute("comment", commentList);
		model.addAttribute("detail", vo);
		return "detail";
	}
	
	@RequestMapping(value="/qnaWrite")
	public String qnaWrite() {
		return "qnaWrite";
	}
	
	@RequestMapping(value="/qnaWriteAction")
	public String qnaWriteAction(QnaBoardVo vo) {
		vo.setID("qq");
		System.out.println("vo확인"+vo);
		qnaBoardService.wirteBoardService(vo);
		System.out.println("수정ㄴㄴㄴ111");
		return "qnaBoard";
	}
}





















