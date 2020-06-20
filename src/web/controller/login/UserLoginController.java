package web.controller.login;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.User;
import web.service.face.UserService;
import web.service.impl.UserServiceImpl;


@WebServlet("/login")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private UserService userService = new UserServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//포워딩
		req.getRequestDispatcher("/WEB-INF/views/login/login.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		

		//전달파라미터 얻기 - 로그인정보
		User user = userService.getLoginUser(req);
		
		//로그인 인증
		boolean login = userService.login(user);
		
		//로그인 성공
		if(login) {
			//로그인 사용자 정보 얻어오기
			user = userService.info(user);
			
			HttpSession session = req.getSession();
			session.setAttribute("login", login);
			session.setAttribute("userid", user.getUserId());
			session.setAttribute("username", user.getUserName());
			session.setAttribute("usernick", user.getUserNick());
			
			if( user.getUserAuth() == 1 ) {//일반사용자
				resp.sendRedirect("/main");
				return;
			}else if( user.getUserAuth()==2 ) {//프랜차이즈관리자
				resp.sendRedirect("/m/fran");
				return;
			}
		}
		
		//로그인 실패
		resp.sendRedirect("/main");
		
	}
	
	
}
