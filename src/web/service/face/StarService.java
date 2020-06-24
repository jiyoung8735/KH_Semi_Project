package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Star;
import web.util.Paging;

public interface StarService {
	
	
	/**
	 * 회원번호로 별점 작성수 조회
	 * 
	 * @param req
	 * @return int
	 */
	int countStarByUserNo(HttpServletRequest req);
	
	/**
	 * 페이징 객체 생성
	 * 
	 * @param req
	 * @return Paging (페이징 계산이 완료된 객체)
	 */
	Paging getPaging(HttpServletRequest req);
	
	/**
	 * 별점작성 목록 조회 (paging 적용)
	 * 
	 * @param Paging객체
	 * @return List<Star>
	 */
	List<Star> getList(Paging paging);

}
