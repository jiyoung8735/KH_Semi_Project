package web.dao.face;

import web.dto.Star;

public interface StarDao {
	
	/**
	 * 회원번호로 작성한 별점 조회
	 * 
	 * @param userno
	 * @return Star 객체
	 */
	Star selectStar(int userno);

}
