package com.campus.miniProject;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.miniProject.Service.boardService;
import com.campus.miniProject.VO.boardVO;
import com.campus.miniProject.VO.dagulVO;
import com.campus.miniProject.VO.myPageVO;
import com.campus.miniProject.VO.pageNationVO;

@RestController
public class boardController {
	@Inject
	boardService service;
	
	//plan게시판
	@RequestMapping("boardPlan")
	public ModelAndView boardPlan() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/boardPlan");
		return mav;
	}
	@RequestMapping("boardPlanList")
	public ModelAndView boardPlanList(myPageVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		vo.setUserid((String)session.getAttribute("logId"));
		List<myPageVO> lst = service.boardPlanList(vo);
		mav.addObject("lst",lst);
		mav.addObject("month",vo.getMonth());
		mav.addObject("year",vo.getYear());
		mav.setViewName("board/boardPlanList");
		return mav;
	}
	@PostMapping("boardPlanListDelete")
	public ModelAndView boardPlanListDelete(int [] datano, int year, int month) {
		ModelAndView mav = new ModelAndView();
		if(datano!=null) {
			service.boardPlanListDelete(datano);			
		}
		mav.setViewName("redirect:boardPlanList?year="+year+"&month="+month+"");
		return mav;
	}
	@RequestMapping("boardPlanListUpdate")
	public int boardPlanListUpdate(myPageVO vo) {
		myPageController myPageController = new myPageController();
		myPageController.changeJson(vo);
		int updateChk= service.boardPlanListUpdate(vo);
		return updateChk;
	}
	
	//유머 게시판
	@RequestMapping("boardHumor")
	public ModelAndView boardHumor(pageNationVO page) {
		List<boardVO> lst = new ArrayList<boardVO> ();
		ModelAndView mav = new ModelAndView();
		page.setTotalRecord(service.boardHumorCount());
		lst = service.boardHumorList(page);
		mav.addObject("lst",lst);
		mav.addObject("page",page);
		mav.setViewName("/board/boardHumor");
		return mav;
	}
	
	@RequestMapping("boardHumorWrite")
	public ModelAndView boardHumorWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/boardHumorWrite");
		return mav;
	}
	
	@RequestMapping("boardHumorWriteOk")
	public ModelAndView boardHumorWriteOk(boardVO vo, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		vo.setIp(request.getRemoteAddr());
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		service.boardHumorListInsert(vo);
		mav.setViewName("redirect:boardHumor");
		return mav;
	}
	@RequestMapping("humorboardShow")
	public ModelAndView humorboardShow(int no) {
		ModelAndView mav = new ModelAndView();
		service.boardHitUp(no);
		boardVO vo = service.boardHumorShow(no);
		mav.addObject("vo",vo);
		mav.setViewName("board/boardHumorShow");
		return mav;
	}
	@RequestMapping("dagul")
	public List<dagulVO> dagulFrm(dagulVO vo, HttpSession session) {
		List<dagulVO> lst = new ArrayList<dagulVO>();
		System.out.println("접근");
		vo.setUserid((String)session.getAttribute("logId"));
		service.dagulInsert(vo);
		lst = service.dagulList(vo.getNo());
		return lst;
	}
}
