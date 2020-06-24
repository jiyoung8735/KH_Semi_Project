package web.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dao.face.ReportDao;
import web.dao.impl.ReportDaoImpl;
import web.dto.Report;
import web.dto.Review;
import web.service.face.ReportService;

public class ReportServiceImpl implements ReportService {

	private ReportDao reportDao = new ReportDaoImpl();
	
	public Report info(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		String param = String.valueOf(session.getAttribute("userno"));
		int userno = Integer.parseInt(param);
		
		return reportDao.selectReport(userno);
	}

}
