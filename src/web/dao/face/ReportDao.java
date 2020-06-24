package web.dao.face;

import web.dto.Report;

public interface ReportDao {
	
	/**
	 * 회원번호로 신고내역 조회
	 * 
	 * @param userno
	 * @return Report객체
	 */
	Report selectReport(int userno);

}
