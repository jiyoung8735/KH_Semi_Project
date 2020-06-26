package web.controller.mypage;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.service.face.UserService;
import web.service.impl.UserServiceImpl;


@WebServlet("/leavesite")
public class LeaveSiteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UserService userService = new UserServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/mypage/leavesite.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//1.사이트탈퇴
		userService.leaveSite(req);

		//2.세션 정보 삭제
		HttpSession session = req.getSession();
		session.invalidate();
		
		//2.메인페이지로 리다이렉트
		resp.sendRedirect("/main");
	
	}
	
	
}
