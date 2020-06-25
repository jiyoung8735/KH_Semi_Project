package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import web.dao.face.ReportDao;
import web.dbutil.JDBCTemplate;
import web.dto.Report;
import web.dto.Review;

public class ReportDaoImpl implements ReportDao {

	@Override
	public List<Map<String, Object>> selectListOfReport(int rptUsers) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;

		List<Map<String, Object>> list = new ArrayList<>();
		
		String sql = "SELECT P.*, R.REVIEW_CONTENT from REPORT P LEFT OUTER JOIN REVIEW R";
		sql += "	ON P.REVIEW_NO = R.REVIEW_NO WHERE RPT_USERS = ?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, rptUsers);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
				Report report = new Report();
				report.setReviewNo( rs.getInt("REVIEW_NO") );
				report.setRptDate( rs.getDate("RPT_DATE") );
				report.setRptDetail( rs.getString("RPT_DETAIL") );
				report.setRptManage( rs.getInt("RPT_MANAGE") );
				report.setRptNo( rs.getInt("RPT_NO") );
				report.setRptNote( rs.getString("RPT_NOTE") );
				report.setRptRsn( rs.getInt("RPT_RSN") );
				report.setRptTarget( rs.getInt("RPT_TARGET") );
				report.setRptUser( rs.getInt("RPT_USERS") );
				report.setRptYn( rs.getString("RPT_YN") );
				
				Review review = new Review();
				review.setReviewNo( rs.getInt("REVIEW_NO") );
				review.setReviewContent( rs.getString("REVIEW_CONTENT") );
				
				Map<String, Object> mapReport = new HashMap<>();
				mapReport.put("report", report);
				mapReport.put("review", review);
				
				list.add(mapReport);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		return list;
	}


}
