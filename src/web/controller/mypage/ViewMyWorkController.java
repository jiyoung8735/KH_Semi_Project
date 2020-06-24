package web.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Board;
import web.dto.Mywork;
import web.service.face.MyworkService;
import web.service.impl.MyworkServiceImpl;
import web.util.Paging;


@WebServlet("/view/mywork")
public class ViewMyWorkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MyworkService myworkService = new MyworkServiceImpl();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// Paging 객체 생성
		Paging paging = myworkService.getPaging(req);
		
		// Paging 객체 request 컨텍스트에 저장
		req.setAttribute("paging", paging);

		// Mywork 목록 list 변수
		List<Mywork> myworkList = new ArrayList<>();
		
		// Mywork 목록 받기
		myworkList = myworkService.getList(paging, req);

		// 전달받은 Mywork 목록을 request 컨텍스트에 저장하기
		req.setAttribute("myworkList", myworkList);
		
		//포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/mywork.jsp").forward(req, resp);
	
	}	
	
}
