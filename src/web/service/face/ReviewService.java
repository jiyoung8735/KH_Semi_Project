package web.service.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.Review;

public interface ReviewService {
	
	/**
	 * 작성한 리뷰 조회
	 * 
	 * @param req
	 * @return Review객체
	 */
	Review info(HttpServletRequest req);

}
