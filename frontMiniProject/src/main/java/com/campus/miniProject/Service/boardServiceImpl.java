package com.campus.miniProject.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.campus.miniProject.DAO.boardDAO;
import com.campus.miniProject.VO.boardVO;
import com.campus.miniProject.VO.dagulVO;
import com.campus.miniProject.VO.myPageVO;
import com.campus.miniProject.VO.pageNationVO;

@Service
@Primary
public class boardServiceImpl implements boardService {
	@Inject
	boardDAO dao;

	@Override
	public List<myPageVO> boardPlanList(myPageVO vo) {
		// TODO Auto-generated method stub
		return dao.boardPlanList(vo);
	}

	@Override
	public int boardPlanListDelete(int [] datano) {
		// TODO Auto-generated method stub
		return dao.boardPlanListDelete(datano);
	}

	@Override
	public int boardPlanListUpdate(myPageVO vo) {
		// TODO Auto-generated method stub
		return dao.boardPlanListUpdate(vo);
	}

	@Override
	public int boardHumorListInsert(boardVO vo) {
		// TODO Auto-generated method stub
		return dao.boardHumorListInsert(vo);
	}

	@Override
	public int boardHumorCount() {
		// TODO Auto-generated method stub
		return dao.boardHumorCount();
	}

	@Override
	public List<boardVO> boardHumorList(pageNationVO vo) {
		// TODO Auto-generated method stub
		return dao.boardHumorList(vo);
	}

	@Override
	public int boardHitUp (int no) {
		// TODO Auto-generated method stub
		return dao.boardHitUp(no);
	}

	@Override
	public boardVO boardHumorShow(int no) {
		// TODO Auto-generated method stub
		return dao.boardHumorShow(no);
	}

	@Override
	public int dagulInsert(dagulVO vo) {
		// TODO Auto-generated method stub
		return dao.dagulInsert(vo);
	}

	@Override
	public List<dagulVO> dagulList(int no) {
		// TODO Auto-generated method stub
		return dao.dagulList(no);
	}
}
