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
	 * 별점작성 갯수 조회
	 * 
	 * @return int
	 */
	public int selectCntAll();

	/**
	 * 페이징 적용한 별점작성 목록 조회
	 * 
	 * @param Paging객체
	 * @return List<Star>
	 */
	public List<Star> selectAll(Paging paging);

}
