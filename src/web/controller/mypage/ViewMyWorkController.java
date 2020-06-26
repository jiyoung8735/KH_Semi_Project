package web.controller.mypage;

import java.io.IOException;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Mywork;
import web.service.face.MyworkService;
import web.service.face.ReportService;
import web.service.impl.MyworkServiceImpl;
import web.service.impl.ReportServiceImpl;


@WebServlet("/view/mywork")
public class ViewMyWorkController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MyworkService myworkService = new MyworkServiceImpl();
	
	private ReportService reportService = new ReportServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		// Mywork 목록 list 변수
		List<Mywork> myworkList = new ArrayList<>();
		
		// Mywork 목록 받기
		myworkList = myworkService.getList(req);
		
		// Report 목록 받기
		List<Map<String, Object>> mapMyreport = new ArrayList<>();
		mapMyreport = reportService.getListOfReport(req);

		// 전달받은 데이터 request 컨텍스트에 저장하기
		req.setAttribute("myworkList", myworkList);
		req.setAttribute("Myreport", mapMyreport);
		
		
		//포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/mywork.jsp").forward(req, resp);
	
	}	
	
}
