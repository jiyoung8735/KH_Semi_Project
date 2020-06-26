package web.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web.dao.face.ImageDao;
import web.dbutil.JDBCTemplate;
import web.dto.Image;
import web.dto.Menu;

public class ImageDaoImpl implements ImageDao{

	private Connection conn = null; //DB연결 객체
	private PreparedStatement ps = null; //SQL수행 객체
	private ResultSet rs = null; //SQL조회 결과 객체
	
	@Override
	public void insertImage(Image imageFile) {
		conn = JDBCTemplate.getConnection();
		
		String sql ="";
		sql += "INSERT INTO Image( IMG_NAME, IMG_ORIGIN, IMG_SERVER, IMG_HOR, IMG_VER,IMG_EXT,IMG_SIZE,IMG_DATE ,MENU_NO )";
		sql += " VALUES(?,?,?,?,?,?,?,sysdate,?)";
		
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, imageFile.getImgName());
			ps.setString(2, imageFile.getImgOrigin());
			ps.setString(3, imageFile.getImgServer());
			ps.setInt(4, imageFile.getImgHor());
			ps.setInt(5, imageFile.getImgVer());
			ps.setString(6, imageFile.getImgExt());
			ps.setInt(7, imageFile.getImgSize());
			ps.setInt(8, imageFile.getMenuNo());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(ps);
		}
	}

	@Override
	public Image selectImage(int menunoByImage) {

		Connection conn = JDBCTemplate.getConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		Image image = null;
		
		String sql = " SELECT * FROM IMAGE WHERE MENU_NO = ?";
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, menunoByImage);
			
			rs = ps.executeQuery();
			
			while( rs.next()) {
				
				image = new Image();
				
				image.setImgNo(rs.getInt("IMG_NO"));
				image.setImgName(rs.getString("IMG_NAME"));
				image.setImgOrigin(rs.getString("IMG_ORIGIN"));
				image.setImgServer(rs.getString("IMG_SERVER"));
				image.setImgHor(rs.getInt("IMG_HOR"));
				image.setImgVer(rs.getInt("IMG_VER"));
				image.setImgExt(rs.getString("IMG_EXT"));
//				IMG_EXT
//				IMG_SIZE
//				IMG_DATE
				image.setMenuNo(rs.getInt("MENU_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(ps);
			JDBCTemplate.close(rs);
		}
		return image;
	}

	
	@Override
	public List<Image> selectImage() {
		conn = JDBCTemplate.getConnection();
		
		String sql = "";
	    sql += " select I.* from image I, menu M where I.menu_no=M.menu_no and M.menu_stat='Y' and M.menu_blind='N'";
	    sql += "  ORDER BY I.MENU_NO DESC";
		
	    List<Image> imageList = new ArrayList<>();
		
	    try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Image image = new Image();
				
				image.setImgNo(rs.getInt("IMG_NO"));
//				image.setImgName(rs.getString("IMG_NAME"));
				image.setImgOrigin(rs.getString("IMG_ORIGIN"));
				image.setImgServer(rs.getString("IMG_SERVER"));
				image.setImgHor(rs.getInt("IMG_HOR"));
				image.setImgVer(rs.getInt("IMG_VER"));
				image.setImgExt(rs.getString("IMG_EXT"));
				image.setImgExt(rs.getString("IMG_EXT"));
				image.setImgSize(rs.getInt("IMG_SIZE"));
				image.setImgDate(rs.getDate("IMG_DATE"));
				image.setMenuNo(rs.getInt("MENU_NO"));
				
				imageList.add(image);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(ps);
		}
		return imageList;
	}

	@Override
	public Image selectImageByMenuno(int foodByMenuNo) {
		
		conn = JDBCTemplate.getConnection();
		
		String sql = "select I.* from image I, menu M where I.menu_no=M.menu_no and M.menu_stat='Y' and M.menu_blind='N' and I.menu_no = ?";
		
		
		Image image  = null;
		
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setInt(1, foodByMenuNo);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				image = new Image();
				image.setImgNo(rs.getInt("IMG_NO"));
//				image.setImgName(rs.getString("IMG_NAME"));
				image.setImgOrigin(rs.getString("IMG_ORIGIN"));
				image.setImgServer(rs.getString("IMG_SERVER"));
				image.setImgHor(rs.getInt("IMG_HOR"));
				image.setImgVer(rs.getInt("IMG_VER"));
				image.setImgExt(rs.getString("IMG_EXT"));
				image.setImgExt(rs.getString("IMG_EXT"));
				image.setImgSize(rs.getInt("IMG_SIZE"));
				image.setImgDate(rs.getDate("IMG_DATE"));
				image.setMenuNo(rs.getInt("MENU_NO"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		return image;
	}

	
	
	
	
	
}
