package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Review;
import web.util.Paging;

public interface ReviewService {
	
	
	/**
	 * 회원번호로 리뷰 작성수 조회
	 * 
	 * @param req
	 * @return int
	 */
	int countReviewByUserNo(HttpServletRequest req);
	

}
