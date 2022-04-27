package com.campus.miniProject.DAO;

import java.util.List;

import com.campus.miniProject.VO.boardVO;
import com.campus.miniProject.VO.dagulVO;
import com.campus.miniProject.VO.myPageVO;
import com.campus.miniProject.VO.pageNationVO;

public interface boardDAO {
	public List<myPageVO> boardPlanList(myPageVO vo);
	public int boardPlanListDelete(int [] datano);
	public int boardPlanListUpdate(myPageVO vo);
	public int boardHumorListInsert(boardVO vo);
	public int boardHumorCount();
	public List<boardVO> boardHumorList(pageNationVO vo);
	public int boardHitUp (int no);
	public boardVO boardHumorShow(int no);
	public int dagulInsert(dagulVO vo);
	public List<dagulVO> dagulList(int no);
}
