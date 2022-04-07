package com.campkok.customer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.campkok.admin.visit.controller.VisitController;
import com.campkok.admin.visit.model.vo.Visit;
import com.campkok.customer.model.service.UserService;
import com.campkok.customer.model.vo.UserVO;

@Controller
public class UserController {
	@Autowired
	private UserService service;
	@Autowired
	private VisitController visitCtrl;

	// 작업페이지로 이동(추후 삭제)
	@RequestMapping("/index2.do")
	public String index2() {
		return "index2";
	}

	// 회원가입 선택 페이지로 이동
	@RequestMapping("/joinPage.do")
	public String join() {
		return "user/joinPage";
	}

	// 회원가입 페이지로 이동
	@RequestMapping("/joinFrm.do")
	public String joinFrm() {
		return "user/joinFrm";
	}

	// 회원가입
	@RequestMapping("/customerJoin.do")
	public String customerJoin(UserVO u, Model model) {
		System.out.println(u);
		int result = service.insertUser(u);
		if (result > 0) {
			model.addAttribute("msg", "캠핑의 모든 것! 캠콕에 가입하신걸 환영합니다.");
		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다. 관리자에게 문의하세요.");
		}
		model.addAttribute("loc", "/main.do");
		return "common/msg";
	}

	// 아이디 중복체크
	@ResponseBody
	@RequestMapping("/checkId.do")
	public String checkId(UserVO u) {
		UserVO user = service.checkId(u);
		System.out.println(user);
		if (user == null) {
			return "0";
		} else {
			return "1";
		}
	}
	
	// 아이디 찾기로 이동
	@RequestMapping("/findIdPage.do")
	public String findIdPage() {
		return "user/findId";
	}
	
	// 아이디 찾기
	@RequestMapping("/findId.do")
	public String findId(UserVO u, Model model) {
		UserVO user = service.findUserId(u);
		System.out.println(u);
		if(user.getUserId() != null) {
			model.addAttribute("user",user);
			return "user/findIdResult";
		}else {
			model.addAttribute("msg","회원정보가 존재하지 않습니다.");
			model.addAttribute("loc","/findIdPage.do");
			return "common/msg";
		}
	}
	
	// 비밀번호 찾기로 이동
	@RequestMapping("/findPwPage.do")
	public String findPwPage() {
		return "user/findPw";
	}
	
	// 비밀번호 찾기
	@RequestMapping("/findPw.do")
	public String findPw(UserVO u, Model model) {
		UserVO user = service.findUserPw(u);
		System.out.println(u);
		if(user.getUserPw() != null) {
			model.addAttribute("user",user);
			return "user/findPwResult";
		}else {
			model.addAttribute("msg","회원정보가 존재하지 않습니다.");
			model.addAttribute("loc","/findPwPage.do");
			return "common/msg";
		}
		
	}

	// 로그인 페이지로 이동
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "user/loginFrm";
	}

	// 로그인
	@RequestMapping("/login.do")
	public String login(UserVO u, HttpSession session, Model model, HttpServletRequest req) {
		System.out.println(u.getUserId());
		System.out.println(u.getUserPw());
		UserVO user = service.selectOneUser(u);

		if (user != null) {
			session.setAttribute("user", user);
			model.addAttribute("msg", user.getUserName() + "님 환영합니다");

			if (user.getUserLevel() != 0)
				model.addAttribute("loc", "/main.do");
			else {
				Visit visit = new Visit();

				visit.setVisitId((String) user.getUserId());
				visit.setVisitIp((req.getRemoteAddr()));
				visit.setVisitRefer(req.getHeader("referer"));
				visit.setVisitAgent(req.getHeader("User-Agent"));
				visitCtrl.insertVisitInfo(visit);
				model.addAttribute("loc", "/pageAdmin.do?reqPage=1");
			}
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호를 확인해주세요.");
			model.addAttribute("loc", "/loginFrm.do");
		}
		return "/common/msg";
	}

	// 로그아웃 
	@RequestMapping("/logout.do")
	public String logout(HttpSession session, Model model, @SessionAttribute(required = false) UserVO user) {
		if (user != null) {
			session.invalidate();
			model.addAttribute("msg", "로그아웃 되었습니다. 안녕히가세요.");
		} else {
			model.addAttribute("msg", "로그인되어있지 않습니다.");
		}
		model.addAttribute("loc", "/main.do");
		return "common/msg";
	}
}
