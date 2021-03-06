package web.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import web.dto.Picture;
import web.service.face.PictureService;
import web.service.face.ReportService;
import web.service.impl.PictureServiceImpl;
import web.service.impl.ReportServiceImpl;


@WebServlet("/view/myreport")
public class ViewMyReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private ReportService reportService = new ReportServiceImpl();
	private PictureService pictureService = new PictureServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//----------프로필 섹션 정보 불러오기------------------------
		// 프로필 사진
		Picture picture = pictureService.info( req );
		
		// 회원 등급
		HttpSession session = req.getSession();
		String param = String.valueOf(session.getAttribute("usergrade"));
		int usergrade = Integer.parseInt(param);
		
		String grade = null;
		
		if( usergrade == 1) { grade = "일반회원"; }
		else if( usergrade == 2) { grade = "우수회원"; }
		else if( usergrade == 3) { grade = "VIP"; }
		else if( usergrade == 4) { grade = "VVIP"; }
		else { grade = null; }
		//-----------------------------------------------------------
	
		
		// Report 목록 받기
		List<Map<String, Object>> mapMyreport = new ArrayList<>();
		mapMyreport = reportService.getListOfReport(req);
		
		// 전달받은 데이터 request 컨텍스트에 저장하기
		req.setAttribute("Myreport", mapMyreport);
		req.setAttribute("picture", picture );
		req.setAttribute("grade", grade);
		
		//포워딩
		req.getRequestDispatcher("/WEB-INF/views/mypage/myreport.jsp").forward(req, resp);
	}
	
}
