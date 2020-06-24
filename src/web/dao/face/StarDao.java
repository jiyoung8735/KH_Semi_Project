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
	

}
