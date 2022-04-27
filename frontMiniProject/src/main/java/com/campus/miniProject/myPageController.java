package com.campus.miniProject;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.miniProject.Service.myPageService;
import com.campus.miniProject.VO.myPageVO;

@RestController
public class myPageController {
	@Inject
	myPageService service;
	@RequestMapping("myPage")
	public ModelAndView myPage(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<myPageVO> lst = new ArrayList<myPageVO> ();
		List<String> lst2 = new ArrayList<String> ();
		lst = service.planOut((String)session.getAttribute("logId"));
		
		for(int i=0; i<lst.size(); i++) {
			changeJson(lst.get(i));
			lst2.add(lst.get(i).getJsonform());
		}
		
		mav.addObject("lst",lst2);
		mav.setViewName("/jsp/myPage");
		return mav;
	}
	@RequestMapping("planIn")
	public void planIn(myPageVO vo) {
		service.planInsert(vo);
	}
	public void changeJson(myPageVO vo) {
		String date[] = vo.getEdate().split("-");
		
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.MONTH, Integer.parseInt(date[1])-1);
		cal.set(Calendar.DAY_OF_MONTH, Integer.parseInt(date[2])+1);
		
		int Mo = cal.get(Calendar.MONTH)+1;
		String Mo2 = Integer.toString(Mo);
		
		int Da = cal.get(Calendar.DAY_OF_MONTH);
		String Da2 = Integer.toString(Da);
		
		if(Mo<10) {
			Mo2 = "0"+Integer.toString(Mo);
		}
		if(Da<10) {
			Da2 = "0"+Integer.toString(Da);
		}
		
		String NEdate = date[0]+"-"+Mo2+"-"+Da2;
		
		String jsonform="{title:'"+vo.getTitle()+"', start:'"+vo.getSdate()+"', color:'"+vo.getColor()+"', end:'"+NEdate+"'}";
		vo.setJsonform(jsonform);
	}
	
}
