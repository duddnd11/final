package com.kk.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String qnaBoard(Model model,int offset,String keyword) {
		//List<QnaBoardVo> list1 = qnaBoardService.searchKeyword(keyword);
		
		if(offset<0) {
			offset=0;
		}
		List<QnaBoardVo> list= null;
		List<QnaBoardVo> listAll = null;
		if(keyword == null) {
			list =qnaBoardService.selectBoard(offset);
			listAll = qnaBoardService.selectBoardAll();
		}else {
			list = qnaBoardService.searchKeyword(keyword,offset);	
			listAll = qnaBoardService.keywordSize(keyword);
		}
		int pageSize=0;
		if(listAll.size()%10==0) {
			pageSize=listAll.size()/10;
		}else {
			pageSize=listAll.size()/10+1;
		}
		int nowPage =offset/10+1 ;
		int startPage = nowPage/10*10;
		int endPage = startPage+9;
		if(nowPage/10 == pageSize/10) {
			endPage=pageSize-1;
		}
		System.out.println("ps"+pageSize);
		System.out.println("sp"+startPage);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("offset", offset);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("qnaBoard", list);
		return "qnaBoard";
	}
	
	@RequestMapping(value="/qnaDetail")
	public String content(Model model,int qbno) {
		QnaBoardVo vo =qnaBoardService.selectContent(qbno);
		List<CommentVo> commentList = commentService.selectCommentService(qbno);
		List<CommentVo> reCommentList = new ArrayList<CommentVo>();
		for(CommentVo comment : commentList) {
			if(comment.getLevel()==1) {
				reCommentList.add(comment);
			}
		}
		model.addAttribute("reComment",reCommentList);
		model.addAttribute("comment", commentList);
		model.addAttribute("detail", vo);
		return "qnaDetail";
	}
	
	@RequestMapping(value="/qnaWrite")
	public String qnaWrite() {
		return "qnaWrite";
	}
	
	@RequestMapping(value="/qnaWriteAction")
	public String qnaWriteAction(QnaBoardVo vo,Model model) {
		vo.setID("qq");
		qnaBoardService.wirteBoardService(vo);
		List<QnaBoardVo> list =qnaBoardService.selectBoard(0);
		model.addAttribute("offset", 0);
		model.addAttribute("startPage", 0);
		model.addAttribute("endPage", 9);
		model.addAttribute("qnaBoard", list);
		return "qnaBoard";
	}
}





















