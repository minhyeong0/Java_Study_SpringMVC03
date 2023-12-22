package kr.bit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.bit.entity.Member;
import kr.bit.service.BoardService;

@Controller
@RequestMapping("/login/*")
public class LoginController {
	
	@Autowired
	BoardService boardService;
	
	
	@RequestMapping("/loginProcess")
	public String login(Member vo, HttpSession session) {
		Member mvo = boardService.login(vo);
		if(mvo != null)
			session.setAttribute("mvo", mvo);
		
		return "redirect:/board/list";
	}
	
	@RequestMapping("/logoutProcess")
	public String logout(HttpSession session) {
		session.invalidate(); //저장된 세션 전부 삭제
		return "redirect:/board/list";
	}
}
