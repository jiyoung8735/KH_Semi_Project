package web.dao.face;

import java.util.List;

import web.dto.Mywork;
import web.util.Paging;

public interface MyworkDao {
	
	/**
	 * Mywork 갯수 조회
	 * 
	 * @return int
	 */
	public int selectCntAll();
	
	/**
	 * 페이징 대상 Mywork 목록 조회
	 * 
	 * @param Paging객체
	 * @return List<Mywork>
	 */
	public List<Mywork> selectAll(Paging paging);
	
	/**
	 * MenoNo로 Mywork 조회
	 * 
	 * @param menuNo
	 * @return Mywork객체
	 */
	public Mywork selectMyworkByMenoNo(int menuNo);

}
