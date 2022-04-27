package com.campus.miniProject.Service;

import javax.inject.Inject;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.campus.miniProject.DAO.loginDAO;
import com.campus.miniProject.VO.loginVO;

@Service
@Primary
public class loginServiceImpl implements loginService {
	@Inject
	loginDAO dao;

	@Override
	public int memberInsert(loginVO vo) {
		// TODO Auto-generated method stub
		return dao.memberInsert(vo);
	}

	@Override
	public String memberCheck(loginVO vo) {
		// TODO Auto-generated method stub
		return dao.memberCheck(vo);
	}

	@Override
	public int loginCheck(loginVO vo) {
		// TODO Auto-generated method stub
		return dao.loginCheck(vo);
	}
}
