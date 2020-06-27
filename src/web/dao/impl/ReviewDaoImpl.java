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

	@Override
	public void updateReviewByMenuNoUserNo(String updateContent, int userno, int menuNo) {

		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		
		int result = -1;
		
		String sql = "UPDATE REVIEW SET REVIEW_CONTENT = ?";
		sql += "	WHERE USERS_NO = ? AND MENU_NO = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, updateContent);
			ps.setInt(2, userno);
			ps.setInt(3, menuNo);
			
			result = ps.executeUpdate();
			
			if(result > 0) {
				JDBCTemplate.commit(conn);
				System.out.println("리뷰 수정 성공");
			}else {
				JDBCTemplate.rollback(conn);
				System.out.println("리뷰 수정 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
	}

	@Override
	public void deleteReviewByMenuNoUserNo(int menuNo, int userno) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		
		int result = -1;
		
		String sql = "DELETE REVIEW WHERE MENU_NO = ? AND USERS_NO = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, menuNo);
			ps.setInt(2, userno);
			
			result = ps.executeUpdate();
			
			if(result>0) {
				JDBCTemplate.commit(conn);
				System.out.println("리뷰 삭제 성공");
			}else {
				JDBCTemplate.commit(conn);
				System.out.println("리뷰 삭제 실패");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
		}
		
	}
	

}
