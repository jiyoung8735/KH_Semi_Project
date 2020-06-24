package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import web.dao.face.StarDao;
import web.dbutil.JDBCTemplate;
import web.dto.Star;

public class StarDaoImpl implements StarDao {

	@Override
	public Star selectStar(int userno) {
		
		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		
		return null;
	}

}
