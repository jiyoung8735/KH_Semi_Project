package web.controller.eval;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dao.face.ImageService;
import web.dao.impl.ImageServiceImpl;
import web.dto.Image;
import web.dto.Menu;
import web.service.face.MenuService;
import web.service.impl.MenuServiceImpl;

@WebServlet("/eval")
public class EvalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MenuService menuService = new MenuServiceImpl();
	
	private ImageService imageService = new ImageServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Menu> menu = menuService.getAllMenu();
//		System.out.println("전체 메뉴리스트 : "+ menu);
//		for (int i = 0; i < menu.size(); i++) {
//			System.out.println(menu.get(i));
//		} 
		List<Image> image = imageService.getAllImage();
//		System.out.println("전체 이미지리스트 : " + image);
//		for (int i = 0; i < image.size(); i++) {
//			System.out.println(image.get(i));
//		} 
		
		
		req.setAttribute("menu", menu);
		req.setAttribute("image", image);

		
		req.getRequestDispatcher("/WEB-INF/views/eval/default.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}
