package web.dao.face;

import java.util.List;

import web.dto.Star;
import web.util.Paging;

public interface StarDao {
	

	/**
	 * 회원번호로 별점 작성수 조회
	 * 
	 * @param userno
	 * @return int
	 */
	public int selectCntStarByUserNo(int userno);

	/**
	 * 회원번호와 메뉴번호로 별점 수정
	 * 
	 * @param updatescore
	 * @param userno
	 * @param menuNo
	 */
	public void updateStarByUserNoMenuNo(int updatescore, int userno, int menuNo);
	

}
