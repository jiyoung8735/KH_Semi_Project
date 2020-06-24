package web.service.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.Review;

public interface ReviewService {
	
	
	/**
	 * 회원번호로 리뷰 작성수 조회
	 * 
	 * @param req
	 * @return int
	 */
	int countReviewByUserNo(HttpServletRequest req);

}
