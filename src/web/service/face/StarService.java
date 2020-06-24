package web.service.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.Star;

public interface StarService {
	
	/**
	 * 작성한 별점 조회
	 * 
	 * @param req
	 * @return Star객체
	 */
	Star info(HttpServletRequest req);

}
