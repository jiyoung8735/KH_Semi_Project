package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Mywork;
import web.util.Paging;

public interface MyworkService {

	/**
	 * 페이징 객체 생성
	 * 
	 * @param req
	 * @return Paging(페이징 계산이 완료된 객체)
	 */
	public Paging getPaging(HttpServletRequest req);
	
	/**
	 * Mywork 목록조회 (페이징 적용이 된 결과)
	 * 
	 * @param Paging객체
	 * @return List<Mywork>
	 */
	public List<Mywork> getList(Paging paging);

	/**
	 * MenuNo로 Mywork 조회
	 * 
	 * @param req
	 * @return Mywork객체
	 */
	public Mywork getMyworkByMenuNo(HttpServletRequest req);

}
