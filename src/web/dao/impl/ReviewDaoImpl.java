package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.dao.face.ReviewDao;
import web.dbutil.JDBCTemplate;
import web.dto.Report;
import web.dto.Review;

public class ReviewDaoImpl implements ReviewDao {

	
	@Override
	public int selectCntReviewByUserNo(int userno) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int cnt = 0;
		
		String sql = "SELECT COUNT(*) FROM REVIEW WHERE USERS_NO = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userno);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		return cnt;
	}
	

}
