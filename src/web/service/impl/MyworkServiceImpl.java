package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dao.face.MyworkDao;
import web.dao.impl.MyworkDaoImpl;
import web.dto.Mywork;
import web.service.face.MyworkService;
import web.util.Paging;

public class MyworkServiceImpl implements MyworkService {
	
	private MyworkDao myworkDao = new MyworkDaoImpl();
	
	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		// 전달파라미터 curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//Mywork 테이블의 총 게시글 수를 조회한다
		int totalCount = myworkDao.selectCntAll();
		
		//Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	}

	@Override
	public List<Mywork> getList(Paging paging, HttpServletRequest req) {

		HttpSession session = req.getSession();
		String param = String.valueOf(session.getAttribute("userno"));
		int userno = Integer.parseInt(param);
		
		return myworkDao.selectAll(paging, userno);
	}

	@Override
	public Mywork getMyworkByMenuNo(HttpServletRequest req) {
		
		String param = req.getParameter("menuNo");
		int menuNo = Integer.parseInt(param);
		
		return myworkDao.selectMyworkByMenoNo(menuNo);
	}

}
