package web.service.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.Star;

public interface StarService {
	
	
	/**
	 * 회원번호로 별점 작성수 조회
	 * 
	 * @param req
	 * @return int
	 */
	int countStarByUserNo(HttpServletRequest req);

}
