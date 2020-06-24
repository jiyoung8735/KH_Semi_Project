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
	public List<Mywork> selectAll(Paging paging) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<Mywork> listMywork = new ArrayList<>();
		
		String sql = "select * from (";
		sql += "		select rownum rnum, B.* from (";
		sql += "			select A.*, U.users_nick from";
		sql += "	          (select R.*, M.menu_name from";
		sql += "				(select S.menu_no, S.star_score, S.users_no, S.star_date, R.review_content";
		sql += "					from star S, review R where S.menu_no=R.menu_no) R,";
		sql += "	                  menu M";
		sql += "					where R.menu_no=M.menu_no) A, users U";
		sql += "				where A.users_no=U.users_no"; 
		sql += "	          )B";  
		sql += "	       )C where rnum between ? and ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, paging.getCurPage());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while( rs.next() ) {
				Mywork mywork = new Mywork();
				mywork.setMenuName( rs.getString("MENU_NAME") );
				mywork.setMenuNo( rs.getInt("MENU_NO") );
				mywork.setReviewContent( rs.getString("REVIEW_CONTENT") );
				mywork.setStarScore( rs.getInt("STAR_SCORE") );
				mywork.setUsersNick( rs.getString("USERS_NICK") );
				mywork.setUsersNo( rs.getInt("USERS_NO") );
				mywork.setWrittendate( rs.getDate("STAR_DATE") );
				
				listMywork.add(mywork);
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
	public Mywork selectMyworkByMenoNo(int menuNo) {

		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Mywork mywork = null;
		
		String sql = "select * from"; 
		sql +=		"	 	( select A.*, U.users_nick from";
		sql += 		"			(select R.*, M.menu_name from";
		sql += 		"				(select S.menu_no, S.star_score, S.users_no, S.star_date, R.review_content";
		sql += 		"			from star S, review R where S.menu_no=R.menu_no) R,";
		sql +=		"		menu M";
		sql += 		"  		where R.menu_no=M.menu_no) A, users U";
		sql +=		"	where A.users_no=U.users_no ) where menu_no = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, menuNo);
			
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
