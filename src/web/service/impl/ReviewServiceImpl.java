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
		
		return cnt;
	}


	@Override
	public void updateReview(HttpServletRequest req) {
		
		//메뉴번호 전달받기
		String param = req.getParameter("menuNo");
		int menuNo = Integer.parseInt(param);
		System.out.println(menuNo);
		
		//회원번호 꺼내기(세션)
		HttpSession session = req.getSession();
		String p = String.valueOf(session.getAttribute("userno"));
		int userno = Integer.parseInt(p);
		System.out.println(userno);
		
		//수정된 리뷰컨텐츠 전달받기
		String updateContent = req.getParameter("updatereview");
		System.out.println(updateContent);
		
		reviewDao.updateReviewByMenuNoUserNo(updateContent, userno, menuNo);
		
	}


	@Override
	public void deleteReview(HttpServletRequest req) {
		
		//메뉴번호 전달받기
		String param = req.getParameter("menuNo");
		int menuNo = Integer.parseInt(param);
		
		//회원번호 꺼내기(세션)
		HttpSession session = req.getSession();
		String p = String.valueOf(session.getAttribute("userno"));
		int userno = Integer.parseInt(p);
		
		reviewDao.deleteReviewByMenuNoUserNo(menuNo, userno);
		
	}



}
