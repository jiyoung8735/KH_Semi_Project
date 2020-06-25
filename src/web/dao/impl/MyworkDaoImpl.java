package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web.dao.face.MyworkDao;
import web.dbutil.JDBCTemplate;
import web.dto.Mywork;
import web.util.Paging;

public class MyworkDaoImpl implements MyworkDao {

	@Override
	public int selectCntAll() {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		int cnt = 0;
		
		String sql = "SELECT COUNT(*) FROM ( select A.*, U.users_nick from";
		sql += "	(select R.*, M.menu_name from";
		sql += "	(select S.menu_no, S.star_score, S.users_no, S.star_date, R.review_content";
		sql += "	from star S, review R where S.menu_no=R.menu_no) R,";
		sql += "	menu M";
		sql += "	where R.menu_no=M.menu_no) A, users U";
		sql += "	where A.users_no=U.users_no )";
		
		try {
			ps = conn.prepareStatement(sql);
			
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
	public List<Mywork> selectAll(int userno) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Mywork> listMywork = new ArrayList<>();

		System.out.println(userno);
		
		String sql = "SELECT * FROM";
		sql += "	(SELECT A.*, U.USERS_NICK FROM"; 
		sql += "	(SELECT R.*, M.MENU_NAME FROM"; 
		sql += "	(SELECT S.USERS_NO, S.MENU_NO, S.STAR_SCORE, S.STAR_DATE, R.REVIEW_CONTENT FROM STAR S LEFT OUTER JOIN REVIEW R ON S.MENU_NO = R.MENU_NO AND S.USERS_NO = R.USERS_NO ) R, MENU M";     
	    sql += "	WHERE R.MENU_NO = M.MENU_NO )A, USERS U";
	    sql += "	WHERE A.USERS_NO = U.USERS_NO)";
	    sql += "	WHERE USERS_NO = ?";	
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1,userno);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				Mywork mywork = new Mywork();
				mywork.setMenuName( rs.getString("MENU_NAME") );
				mywork.setMenuNo( rs.getInt("MENU_NO") );
				mywork.setReviewContent( rs.getString("REVIEW_CONTENT") );
				mywork.setStarScore( rs.getDouble("STAR_SCORE") );
				mywork.setUsersNick( rs.getString("USERS_NICK") );
				mywork.setUsersNo( rs.getInt("USERS_NO") );
				mywork.setWrittendate( rs.getDate("STAR_DATE") );
				
				listMywork.add(mywork);
				System.out.println("MyworkDaoImpl : " + listMywork);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		return listMywork;
	}



	@Override
	public Mywork selectMywork(int userno, int menuNo) {

		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Mywork mywork = null;
		
		String sql = "SELECT * FROM";
		sql += "	(SELECT A.*, U.USERS_NICK FROM"; 
		sql += "	(SELECT R.*, M.MENU_NAME FROM"; 
		sql += "	(SELECT S.USERS_NO, S.MENU_NO, S.STAR_SCORE, S.STAR_DATE, R.REVIEW_CONTENT FROM STAR S LEFT OUTER JOIN REVIEW R ON S.MENU_NO = R.MENU_NO AND S.USERS_NO = R.USERS_NO ) R, MENU M";     
	    sql += "	WHERE R.MENU_NO = M.MENU_NO )A, USERS U";
	    sql += "	WHERE A.USERS_NO = U.USERS_NO)";
	    sql += "	WHERE USERS_NO = ? AND MENU_NO = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userno);
			ps.setInt(2, menuNo);
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				mywork = new Mywork();
				mywork.setMenuName( rs.getString("MENU_NAME") );
				mywork.setMenuNo( rs.getInt("MENU_NO") );
				mywork.setReviewContent( rs.getString("REVIEW_CONTENT") );
				mywork.setStarScore( rs.getInt("STAR_SCORE") );
				mywork.setUsersNick( rs.getString("USERS_NICK") );
				mywork.setUsersNo( rs.getInt("USERS_NO") );
				mywork.setWrittendate( rs.getDate("STAR_DATE") );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		return mywork;
	}

}
