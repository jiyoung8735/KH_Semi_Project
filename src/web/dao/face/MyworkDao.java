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
	 * Mywork 목록 조회
	 * 
	 * @param int userno
	 * @return List<Mywork>
	 */
	public List<Mywork> selectAll(int userno);
	
	/**
	 * MenoNo로 Mywork 조회
	 * 
	 * @param menuNo
	 * @return Mywork객체
	 */
	public Mywork selectMywork(int userno, int menuNo);

}
