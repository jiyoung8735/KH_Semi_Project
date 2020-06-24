package web.dao.face;

import web.dto.Report;
import web.dto.Review;

public interface ReviewDao {
	
	/**
	 * 회원번호로 리뷰 작성수 조회
	 * 
	 * @param userno
	 * @return int
	 */
	int selectCntReviewByUserNo(int userno);


}
