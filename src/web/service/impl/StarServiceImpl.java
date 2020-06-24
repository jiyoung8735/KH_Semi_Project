package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dao.face.StarDao;
import web.dao.impl.StarDaoImpl;
import web.dto.Star;
import web.service.face.StarService;
import web.util.Paging;

public class StarServiceImpl implements StarService{
	
	private StarDao starDao = new StarDaoImpl();
	

	@Override
	public int countStarByUserNo(HttpServletRequest req) {
	
		HttpSession session = req.getSession();
		String param = String.valueOf(session.getAttribute("userno"));
		int userno = Integer.parseInt(param);
		
		int cnt = starDao.selectCntStarByUserNo(userno);
		
		return cnt;
	}


	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		// 전달파라미터 curPage를 파싱한다
		String param = req.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		}
		
		//Star 테이블의 총 게시글 수를 조회한다
		int totalCount = starDao.selectCntAll();
		
		//Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		//계산된 Paging 객체 반환
		return paging;
	
	}


	@Override
	public List<Star> getList(Paging paging) {
		
		return starDao.selectAll(paging);
	}

}
