package web.dao.face;

import web.dto.Star;

public interface StarDao {
	

	/**
	 * 회원번호로 별점 작성수 조회
	 * 
	 * @param userno
	 * @return int
	 */
	int selectCntStarByUserNo(int userno);

}
