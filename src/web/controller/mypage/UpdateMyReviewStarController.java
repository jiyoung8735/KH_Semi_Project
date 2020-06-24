package web.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Mywork;
import web.service.face.MyworkService;
import web.service.impl.MyworkServiceImpl;


@WebServlet("/update/mywork")
public class UpdateMyReviewStarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MyworkService myworkService = new MyworkServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// Mywork 조회 (MenoNo이용)
		Mywork mywork = myworkService.getMyworkByMenuNo(req);
		
		// 저장
		req.setAttribute("myWork", mywork);
		
		// 포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/update.jsp").forward(req,  resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//1.한줄평&평점 수정
		
		//현재 페이지로 리다이렉트
		resp.sendRedirect("/update/mywork");
		
		
	}
	
}
