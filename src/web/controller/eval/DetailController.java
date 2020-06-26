package web.controller.eval;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Image;
import web.dto.Menu;
import web.service.face.ImageService;
import web.service.face.MenuService;
import web.service.impl.ImageServiceImpl;
import web.service.impl.MenuServiceImpl;

@WebServlet("/eval/detail")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MenuService menuService = new MenuServiceImpl();
	
	private ImageService imageService = new ImageServiceImpl();
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		Ajax 로 받은 메뉴넘버
		int foodByMenuNo = Integer.parseInt(req.getParameter("food"));
		System.out.println(foodByMenuNo);
		
		// 받은 메뉴넘버로 메뉴정보 전체가져오기	
		Menu menu = menuService.getMenuByMenu(foodByMenuNo);
		System.out.println("선택한 메뉴 메뉴 정보 : " + menu);
		
		// 받은 메뉴넘버로 이미지정보 전체 가져오기
		Image image = imageService.getImageByMenuno(foodByMenuNo);
		System.out.println("선택한 메뉴 이미지 정보 : "+ image);
		req.setAttribute("menu", menu);
		req.setAttribute("image", image);
		
		
		req.getRequestDispatcher("/WEB-INF/views/eval/detail.jsp").forward(req, resp);
	}

}
