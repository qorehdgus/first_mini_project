package com.campus.miniProject.Service;

import java.util.List;

import com.campus.miniProject.VO.myPageVO;

public interface myPageService {
	public int planInsert(myPageVO vo);
	public List<myPageVO> planOut(String userid);
}
