package web.dao.face;

import java.util.List;

import web.dto.Star;
import web.util.Paging;

public interface StarDao {
	

	/**
	 * 회원번호로 별점 작성수 조회
	 * 
	 * @param userno
	 * @return int
	 */
	public int selectCntStarByUserNo(int userno);

	/**
	 * 회원번호와 메뉴번호로 별점 수정
	 * 
	 * @param updatescore
	 * @param userno
	 * @param menuNo
	 */
	public void updateStarByUserNoMenuNo(double updatescore, int userno, int menuNo);
	
	/**
	 * 모달에 뿌려지는 평점에 대한 평균값을 나오게하는 메소드 
	 */
	public Double AvgStarSelect(Star star);
	
	/**
	 * 회원번호와 메뉴번호로 별점 삭제
	 * 
	 * @param menuNo
	 * @param userno
	 */
	public void deleteStarByUserNoMenuNo(int menuNo, int userno);

}
