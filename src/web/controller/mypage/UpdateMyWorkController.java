package web.controller.mypage;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.Review;
import web.service.face.MyworkService;
import web.service.face.ReviewService;
import web.service.face.StarService;
import web.service.impl.MyworkServiceImpl;
import web.service.impl.ReviewServiceImpl;
import web.service.impl.StarServiceImpl;


@WebServlet("/update/mywork")
public class UpdateMyWorkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MyworkService myworkService = new MyworkServiceImpl();
	private ReviewService reviewService = new ReviewServiceImpl();
	private StarService starService = new StarServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Mywork 조회 (MenoNo이용)
		Map<String, Object> mywork = myworkService.getMywork(req);
		// 저장
		req.setAttribute("myWork", mywork);
		
		// Review 요소의 키 꺼내기
		Set set = mywork.keySet();
        Iterator iterator = set.iterator();
        String reviewkey = null;
        while(iterator.hasNext()){
            String key = (String) iterator.next();
            if(key.equals("review")) {
            	reviewkey = key;
            }
        }
        
        // 리뷰내용 존재여부 확인 - 없으면 세션에 저장
        String reviewcontent = ((Review)mywork.get(reviewkey)).getReviewContent();
        if( reviewcontent == null ) {
        	HttpSession session = req.getSession();
        	session.setAttribute("reviewcontent", "non-exist");
        }
        
		// 포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/update.jsp").forward(req,  resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//별점 수정
		starService.updateStar(req);
		
		//리뷰내용 있는 경우 -> update
		//리뷰내용 없는 경우 -> insert
		HttpSession session = req.getSession();
		if( session.getAttribute("reviewcontent") == null) {
			reviewService.updateReview(req);
		}else {
			reviewService.ReviewInsert(req);
		}
		
		//현재 페이지로 리다이렉트
		resp.sendRedirect("/view/mywork");
		
	}
	
}
