package web.controller.join;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.service.face.UserService;
import web.service.impl.UserServiceImpl;


@WebServlet("/join")
public class UserJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/join/join.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("회원가입 POST 요청");
		
		//회원가입
		int result = userService.join(req);
		
		//회원가입성공
		if( result > 0) {
			System.out.println("회원가입성공");
		}else {
			System.out.println("회원가입실패");
		}
		
		resp.sendRedirect("/main");
	
	}
	
}
