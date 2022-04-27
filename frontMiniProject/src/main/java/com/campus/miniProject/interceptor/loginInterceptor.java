package com.campus.miniProject.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class loginInterceptor extends HandlerInterceptorAdapter {
	//컨트롤러가 호출되기 전에 실행될 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//false:로그인으로 보내기
		//true:해당 컨트롤러로 보내기
		//request객체에서 session객체를 얻어오기
		HttpSession session = request.getSession();
		
		//로그인 상태구하기 null or Y(세팅값)
		String logStatus = (String)session.getAttribute("logStatus");
		if(logStatus!=null && logStatus.equals("Y")) {//로그인 된경우
			//만약 logStatus!=null 이 조건이없다면 equals에서 에러가 뜬다.
			//equals는 null을 지원하지 않는다.
			return true;
		}else {//로그인 안된경우
			response.sendRedirect(request.getContextPath()+"/login");
			return false;
		}
	}
}
