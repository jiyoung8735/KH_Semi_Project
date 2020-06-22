package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import web.dao.face.MenuDao;
import web.dao.impl.MenuDaoImpl;
import web.dto.Board;
import web.dto.Fran;
import web.dto.Menu;
import web.service.face.MenuService;
import web.util.Paging;

public class MenuServiceImpl implements MenuService {

	private MenuDao menuDao = new MenuDaoImpl();
	
	@Override
	public Paging getPaging(HttpServletRequest req) {
		//전달파라미터 curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}
		
		//Menu 테이블의 총 게시글 수를 조회한다
		int totalCount = menuDao.selectCntAll();
		
		//Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage); 
		
		//계산된 Paging 객체 반환
		return paging;
	}

	@Override
	public List<Menu> getList(Paging paging) {
		return menuDao.selectCntAll(paging);
	}

	
	

}
