package web.controller.eval;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/eval/filter")
public class FilterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("filter test : " + req.getParameter("food"));
		req.setAttribute("food", req.getParameter("food"));
		req.getRequestDispatcher("/WEB-INF/views/eval/filter.jsp").forward(req, resp);
	}
	
}
