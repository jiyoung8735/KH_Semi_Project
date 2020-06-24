package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import web.dao.face.StarDao;
import web.dbutil.JDBCTemplate;
import web.dto.Star;

public class StarDaoImpl implements StarDao {

	@Override
	public Star selectStar(int userno) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Star star = null;
		
		String sql = "SELECT * FROM STAR WHERE USERS_NO = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userno);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				
				star = new Star();
				star.setStarNo( rs.getInt(1));
				star.setStarScore( rs.getInt(2) );
				star.setStarDate( rs.getDate(3) );
				star.setUserNo( rs.getInt(4) );
				star.setMenuNo( rs.getInt(5) );
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		
		return star;
	}

}
