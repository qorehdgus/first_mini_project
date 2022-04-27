package com.campus.miniProject;

import java.nio.charset.Charset;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.miniProject.Service.loginService;
import com.campus.miniProject.VO.loginVO;

@RestController
public class loginController {
	
	@Inject
	loginService service;
	
	@RequestMapping(value="insertMember", method = RequestMethod.POST)
	public ResponseEntity<String> joinMember(loginVO vo) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		String chkIn = service.memberCheck(vo);
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		if(chkIn==null) {
			service.memberInsert(vo);
			String msg = "<script>alert('회원가입 성공');location.href='/miniProject/';</script>";
			entity = new ResponseEntity<String>(msg,headers,HttpStatus.OK);
		}else {
			String msg = "<script>alert('회원가입 실패 - 아이디가 중복되었습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg,headers,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PostMapping("login")
	public ModelAndView login(loginVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int chkIn = service.loginCheck(vo);
		if(chkIn>0) {
			session.setAttribute("logId",vo.getUserid());
			session.setAttribute("logStatus", "Y");
			System.out.println("로그인성공");
			mav.setViewName("redirect:/");
		}else {
			System.out.println("로그인실패");
			mav.setViewName("jsp/login");
		}
		return mav;
	}
	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/jsp/login");
		return mav;
	}
	@RequestMapping("joinMember")
	public ModelAndView joinMember() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/jsp/joinMember");
		return mav;
	}
	@RequestMapping("loginOut")
	public ModelAndView loginOut(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:login");
		session.invalidate();
		return mav;
	}
}
