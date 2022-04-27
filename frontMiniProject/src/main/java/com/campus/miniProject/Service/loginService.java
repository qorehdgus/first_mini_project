package com.campus.miniProject.Service;

import com.campus.miniProject.VO.loginVO;

public interface loginService {
	public int memberInsert(loginVO vo);
	public String memberCheck(loginVO vo);
	public int loginCheck(loginVO vo);
}
