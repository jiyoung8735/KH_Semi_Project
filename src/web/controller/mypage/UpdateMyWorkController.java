package web.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Mywork;
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
		Mywork mywork = myworkService.getMywork(req);
		
		// 저장
		req.setAttribute("myWork", mywork);
		
		// 포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/update.jsp").forward(req,  resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//별점 수정
		starService.updateStar(req);
		
		//리뷰 수정
		reviewService.updateReview(req);
		
		
		//현재 페이지로 리다이렉트
		resp.sendRedirect("/view/mywork");
		
		
	}
	
}
