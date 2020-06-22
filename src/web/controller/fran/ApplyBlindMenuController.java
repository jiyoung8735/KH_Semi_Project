package web.controller.fran;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fran/apply/blind")
public class ApplyBlindMenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
//	ㅎㅇㅎㅇ
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/fran_board/applyBlind.jsp").forward(req, resp);
	}
	
}
