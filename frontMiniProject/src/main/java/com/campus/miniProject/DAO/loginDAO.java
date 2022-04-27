package com.campus.miniProject.DAO;

import com.campus.miniProject.VO.loginVO;

public interface loginDAO {
	public int memberInsert(loginVO vo);
	public String memberCheck(loginVO vo);
	public int loginCheck(loginVO vo);
}
