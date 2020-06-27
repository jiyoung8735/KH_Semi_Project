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

	/**
	 * 회원번호와 메뉴번호로 리뷰 조회하여 수정
	 * 
	 * @param menuNo
	 * @param updateContent
	 */
	void updateReviewByMenuNoUserNo(String updateContent, int userno, int menuNo);
	
	/**
	 * 회원번호와 메뉴번호로 별점 삭제
	 * 
	 * @param menuNo
	 * @param userno
	 */
	void deleteReviewByMenuNoUserNo(int menuNo, int userno);


}
