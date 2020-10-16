package com.yw.ex20;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.yw.service.BoardService;
import com.yw.service.MemberService;
import com.yw.vo.BoardVo;
import com.yw.vo.MemberVo;

@Controller
public class HomeController {
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	@RequestMapping(value="/register")
	public String register() {
		return "register";
	}
	@RequestMapping(value="/registerAction")
	public String registerAction(MemberVo vo,Model model, HttpSession session) throws IllegalStateException, IOException {
		String filePath = session.getServletContext().getRealPath("/resources/images");
		MultipartFile multipart = vo.getMultipart();
		
		String fileName="이미지파일없음";
		
		if(!multipart.isEmpty()) {
			fileName = multipart.getOriginalFilename();
			File file = new File(filePath,fileName);
			
			
			if(!file.exists())
				file.mkdirs();
			multipart.transferTo(file);
		}
		vo.setImagename(fileName);
		model.addAttribute("vo", vo);
		memberService.insertMemberAction(vo);
		return "home";
	}
	@RequestMapping(value="/login")
	public String login() {
		
		return "login";
	}
	@RequestMapping(value="/loginAction")
	public String loginAction(MemberVo vo, HttpSession session,Model model) {
		MemberVo loginVo = memberService.loginMemberAction(vo);
		if(loginVo!=null) {
			session.setAttribute("MemberVo", loginVo);
		}
		
		return "home";
	}
	
	@RequestMapping(value="/modify")
	public String modify(HttpSession session) {
		MemberVo vo  = (MemberVo)session.getAttribute("MemberVo");
		session.setAttribute("MemberVo", vo);
		return "modify";
	}
	
	@RequestMapping(value="/modifyAction")
	public String modifyAction(MemberVo vo,Model model, HttpSession session) throws IllegalStateException, IOException {
		MultipartFile multipart = vo.getMultipart();
		String filePath = session.getServletContext().getRealPath("/resources/images");
		
		String fileName ="이미지파일없음";
		
		if(!multipart.isEmpty()) {
			fileName=multipart.getOriginalFilename();
			File file = new File(filePath, fileName);
			if(!file.exists())
				file.mkdirs();
			multipart.transferTo(file);
		}
		vo.setImagename(fileName);
		memberService.modifyMemberAction(vo);
		session.setAttribute("MemberVo", vo);
		return "home";
	}
	@RequestMapping(value="/board")
	public String board(Model model,int offset,HttpSession session) {
//		MemberVo vo =(MemberVo)session.getAttribute("MemberVo");
//		session.setAttribute("MemberVo", vo);
		
		List<BoardVo> boardAll =boardService.selectBoardAllAction();
		int allCount = boardAll.size();
		int size=10;
		int page = allCount/size;
		List<BoardVo> boardList = boardService.selectBoardAction(size, offset);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("page", page);
		return "board";
	}
	@RequestMapping(value="/detail")
	public String detail(int idx,Model model) {
		BoardVo detail = boardService.detailBoardAction(idx);
		model.addAttribute("detail", detail);
		return "detail";
	}
	@RequestMapping(value="/write")
	public String write() {
		return "write";
	}
	@RequestMapping(value="/writeAction")
	public String writeAction(BoardVo vo,Model model) {
		boardService.writeBoardAction(vo);
		
		if(vo.getRef()==0) {
			List<BoardVo> list = boardService.selectBoardAllAction();
			int idx = list.get(list.size()-1).getIdx();
			boardService.updateRefAction(idx);
		}
		
		return "home";
	}
	@RequestMapping(value="/reply")
	public String reply(HttpSession session,int idx,Model model) {
		BoardVo boardVo =boardService.detailBoardAction(idx);
		String title="re:";
		title+=boardVo.getTitle();
		MemberVo vo =(MemberVo)session.getAttribute("MemberVo");
		boardService.updateLevelAction(boardVo.getLevel(), boardVo.getRef());
		System.out.println("level:"+boardVo.getLevel()+","+"ref:"+boardVo.getRef());
		int level=boardVo.getLevel()+1;
		session.setAttribute("MemberVo", vo);
		model.addAttribute("title", title);
		model.addAttribute("board", boardVo);
		model.addAttribute("level", level);
		return "reply";
	}
	@RequestMapping(value="/replyAction")
	public String replyAction(MemberVo vo) {
		
		return "home";
	}
}







