package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web.dao.face.StarDao;
import web.dbutil.JDBCTemplate;
import web.dto.Star;
import web.util.Paging;

public class StarDaoImpl implements StarDao {


	@Override
	public int selectCntStarByUserNo(int userno) {

		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int cnt = 0;
		
		String sql = "SELECT COUNT(*) FROM STAR WHERE USERS_NO = ?";
		
		
		
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
	public int selectCntAll() {

		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int totalCount = 0;
		
		String sql = "SELECT COUNT(*) FROM STAR";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				totalCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		return totalCount;
	}

	@Override
	public List<Star> selectAll(Paging paging) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		//결과 저장할 List
		List<Star> listStar = new ArrayList<>();
		
		String sql = "select * from ( select rownum rnum, S.* from ( select star_no, star_score, star_date, users_no, menu_no from star order by star_no desc )S  )Star where rnum between ? and ? "; 
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
//				Star star = new Star();
//				star.setStarNo( rs.getString(columnIndex) );
//				star.setStarScore(starScore);
//				star.setStarDate(starDate);
//				star.setUserNo(userNo);
//				star.setMenuNo(menuNo);
				
			}
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			
		}
		
		
		
		return null;
	}

}
