package web.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dao.face.StarDao;
import web.dao.impl.StarDaoImpl;
import web.dto.Star;
import web.service.face.StarService;

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

}
