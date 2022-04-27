package com.campus.miniProject.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.campus.miniProject.DAO.myPageDAO;
import com.campus.miniProject.VO.myPageVO;

@Service
@Primary
public class myPageServiceImpl implements myPageService {
	@Inject
	myPageDAO dao;

	@Override
	public int planInsert(myPageVO vo) {
		// TODO Auto-generated method stub
		return dao.planInsert(vo);
	}

	@Override
	public List<myPageVO> planOut(String userid) {
		// TODO Auto-generated method stub
		return dao.planOut(userid);
	}
}
