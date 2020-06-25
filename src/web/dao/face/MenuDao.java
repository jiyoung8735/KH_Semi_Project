package web.dao.face;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dto.Fran;
import web.dto.Menu;
import web.util.Paging;

public interface MenuDao {

	/**
	 *  게시글 수 조회
	 * @return - 전체 게시글 수
	 */
	public int selectCntAll(int franno);

	/**
	 * 
	 * @param paging
	 * @return
	 */
	public List<Menu> selectCntAll(Paging paging , int franno);

	/**
	 * 특정 게시글 조회
	 * @param menuno - 조회할 menuno를 가진 객체
	 * @return Menu - 조회된 결과 객체
	 */
	public Menu selectMenuByMenuno(Menu menuno);

	

	public int insertMenu(Menu menu, int franno);

	
	/**
	 * 전체 메뉴 가져오기 (평점보기 첫페이지)
	 * @return - 전체 메뉴 객체 
	 */
	public List<Menu> selectAllMenu();


}
