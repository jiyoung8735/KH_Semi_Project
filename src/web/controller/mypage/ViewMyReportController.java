package web.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Report;
import web.dto.Review;
import web.service.face.ReportService;
import web.service.impl.ReportServiceImpl;


@WebServlet("/view/myreport")
public class ViewMyReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReportService reportService = new ReportServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		List<Map<String, Object>> mapMyreport = new ArrayList<>();
		mapMyreport = reportService.getListOfReport(req);
	
		System.out.println(mapMyreport);

		req.setAttribute("Myreport", mapMyreport);
		
		req.getRequestDispatcher("/WEB-INF/views/mypage/myreport.jsp").forward(req, resp);
		
	}

}
