package web.controller.fran;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Menu;
import web.service.face.MenuService;
import web.service.impl.MenuServiceImpl;
import web.util.Paging;

@WebServlet("/fran/list")
public class ViewMenuListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MenuService menuService = new MenuServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Paging paging = menuService.getPaging(req);
		
		List<Menu> MenuList = menuService.getList(paging);
		
		req.setAttribute("paging", paging);
		
		req.setAttribute("MenuList", MenuList);
		
		req.getRequestDispatcher("/WEB-INF/views/fran_board/list.jsp").forward(req, resp);
	
	}
	
	
}
