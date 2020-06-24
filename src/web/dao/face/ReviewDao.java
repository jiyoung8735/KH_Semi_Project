package web.dao.face;

import web.dto.Report;
import web.dto.Review;

public interface ReviewDao {
	
	/**
	 * 회원번호로 작성한 리뷰 조회
	 * 
	 * @param userno
	 * @return Review객체
	 */
	Review selectReview(int userno);


}
