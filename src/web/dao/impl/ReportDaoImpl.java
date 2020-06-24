package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.dao.face.ReportDao;
import web.dbutil.JDBCTemplate;
import web.dto.Report;

public class ReportDaoImpl implements ReportDao {

	@Override
	public Report selectReport(int userno) {

		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Report report = null;
		
		String sql = "SELECT * FROM REPORT WHERE RPT_TARGET = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userno);

			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				report = new Report();
				report.setRptNo( rs.getInt(1) );
				report.setRptRsn( rs.getInt(2) );
				report.setRptDetail( rs.getNString(3) );
				report.setRptDate( rs.getDate(4) );
				report.setRptYn( rs.getString(5) );
				report.setRptManage( rs.getInt(6) );
				report.setRptNote( rs.getString(7) );
				report.setRptUser( rs.getInt(8) );
				report.setRptTarget( rs.getInt(9) );
				report.setReviewNo( rs.getInt(10) );
				
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		return report;
	}

}
