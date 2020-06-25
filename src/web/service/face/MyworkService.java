package web.service.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Mywork;
import web.util.Paging;

public interface MyworkService {

	
	/**
	 * Mywork 목록조회
	 * 
	 * @param req
	 * @return List<Mywork>
	 */
	public List<Mywork> getList(HttpServletRequest req);

	/**
	 * MenuNo로 Mywork 조회
	 * 
	 * @param req
	 * @return Mywork객체
	 */
	public Mywork getMywork(HttpServletRequest req);

}
