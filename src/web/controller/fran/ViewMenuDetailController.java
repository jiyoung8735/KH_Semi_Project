package web.controller.fran;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Menu;
import web.service.face.MenuService;
import web.service.impl.MenuServiceImpl;

@WebServlet("/fran/view")
public class ViewMenuDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MenuService menuService = new MenuServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	
		Menu menuno = menuService.getMenuNo(req);
		
		System.out.println(menuno);
		
		Menu viewMenu = menuService.view(menuno);
		
		
		req.setAttribute("viewMenu", viewMenu);
		
		req.getRequestDispatcher("/WEB-INF/views/fran_board/view.jsp").forward(req, resp);
	}
	
}
