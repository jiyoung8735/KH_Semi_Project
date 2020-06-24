package web.service.face;

import javax.servlet.http.HttpServletRequest;

import web.dto.Report;

public interface ReportService {
	
	/**
	 * 신고내역 조회
	 * 
	 * @param req
	 * @return Report객체
	 */
	Report info(HttpServletRequest req);

}
