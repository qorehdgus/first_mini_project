package com.campus.miniProject.DAO;

import java.util.List;

import com.campus.miniProject.VO.myPageVO;

public interface myPageDAO {
	public int planInsert(myPageVO vo);
	public List<myPageVO> planOut(String userid); 
}
