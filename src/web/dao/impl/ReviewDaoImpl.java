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
	public Review selectReview(int userno) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Review review = null;
		
		String sql = "SELECT * FROM REVIEW WHERE USERS_NO = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userno);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {

				review = new Review();
				review.setReviewNo( rs.getInt(1));
				review.setReviewContent( rs.getString(2) );
				review.setReviewDate( rs.getDate(3) );
				review.setReviewGood( rs.getInt(4) );
				review.setReviewBad( rs.getInt(5) );
				review.setReviewReport( rs.getString(6) );
				review.setUserNo( rs.getInt(7) );
				review.setMenuNo( rs.getInt(8) );
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		
		return review;
	}
	

}
