package web.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Board;
import web.dto.Report;
import web.dto.Review;
import web.dto.Star;
import web.service.face.ReportService;
import web.service.face.ReviewService;
import web.service.face.StarService;
import web.service.impl.ReportServiceImpl;
import web.service.impl.ReviewServiceImpl;
import web.service.impl.StarServiceImpl;
import web.util.Paging;


@WebServlet("/view/mywork")
public class ViewMyWorkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private StarService starService = new StarServiceImpl();
	private ReviewService reviewService = new ReviewServiceImpl();
	private ReportService reportService = new ReportServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1.Star, Review, Report 정보 조회
		
		// Paging 객체 생성
		Paging paging = starService.getPaging(req);
				
		// Paging 객체 request 컨텍스트에 저장
		req.setAttribute("paging", paging);

		//  목록 list 변수
		List<Star> starList = new ArrayList<>();
		List<Review> reviewList = new ArrayList<>();
		
		// 게시글 목록 받기
		starList = starService.getList(paging);
		reviewList = reviewService.getList(paging);

		// Map
		Map map = new HashMap();
		map.put("star", starList);
		map.put("review", reviewList);
		
		// 전달받은 게시글 목록을 request 컨텍스트에 저장하기
		req.setAttribute("myWorkList", map);
		
		//3.포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/mywork.jsp").forward(req, resp);
	
	}	
	
}
