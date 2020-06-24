package web.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dao.face.ReviewDao;
import web.dao.impl.ReviewDaoImpl;
import web.dto.Review;
import web.service.face.ReviewService;
import web.util.Paging;

public class ReviewServiceImpl implements ReviewService {
	
	
	private ReviewDao reviewDao = new ReviewDaoImpl();
	

	@Override
	public int countReviewByUserNo(HttpServletRequest req) {

		HttpSession session = req.getSession();
		String param = String.valueOf(session.getAttribute("userno"));
		int userno = Integer.parseInt(param);
		
		int cnt = reviewDao.selectCntReviewByUserNo(userno);
		
		return 0;
	}


//	@Override
//	public List<Review> getList(Paging paging) {
//
//		return reviewDao.selectAll(paging);
//	}

}
