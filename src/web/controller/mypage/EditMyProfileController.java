package web.controller.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/editProfile")
public class EditMyProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1.프로필 출력
		
		// 2.Request영역에 프로필 객체 저장
		
		// 3.포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/editProfile.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 1.프로필 수정
		
		// 2.본페이지로 리다이렉트
		resp.sendRedirect("/editProfile");
		
		
	}
	
}
