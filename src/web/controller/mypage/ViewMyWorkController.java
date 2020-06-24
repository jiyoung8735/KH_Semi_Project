package web.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Report;
import web.dto.Review;
import web.dto.Star;
import web.service.face.ReportService;
import web.service.face.ReviewService;
import web.service.face.StarService;
import web.service.impl.ReportServiceImpl;
import web.service.impl.ReviewServiceImpl;
import web.service.impl.StarServiceImpl;


@WebServlet("/view/mywork")
public class ViewMyWorkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StarService starService = new StarServiceImpl();
	private ReviewService reviewService = new ReviewServiceImpl();
	private ReportService reportService = new ReportServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1.Star, Review, Report 정보 조회
		Star star = starService.info(req);
		Review review = reviewService.info(req);
		Report report = reportService.info(req);
		
		//2.Request영역에 Star, Review, Star 저장
		
		//3.포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/mywork.jsp").forward(req, resp);
	
	}	
	
}
