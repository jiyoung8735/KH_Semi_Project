package web.dao.impl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web.dao.face.BoardDao;
import web.dbutil.JDBCTemplate;
import web.dto.Board;
import web.util.Paging;

public class BoardDaoImpl implements BoardDao{
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	@Override
	public List<Board> serlectBoard() {
		
		List<Board> list = new ArrayList<>();
		
		conn = JDBCTemplate.getConnection();
		
		String sql = "";
		sql += "SELECT * FROM board ORDER BY BD_NO DESC";
		
		try {
			ps = conn.prepareStatement(sql);
			
			rs = ps.executeQuery(sql);
			
			while(rs.next()) {
				Board board = new Board();
				
				board.setBdNo(rs.getInt("bd_no"));
				board.setBdTitle(rs.getString("bd_title"));
				list.add(board);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return list;
	}

	@Override
	public int selectCntAll() {
conn = JDBCTemplate.getConnection(); //DB연결
		
		//SQL 작성
		String sql = "";
		sql += "SELECT count(*) FROM board";
		
		//최종 결과값
		int cnt = 0;
		
		try {
			ps = conn.prepareStatement(sql); //SQL수행 객체
			
			rs = ps.executeQuery(); //SQL수행 및 결과집합 반환
			
			//조회결과 처리
			while( rs.next() ) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// 객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
//		System.out.println(cnt);
		return cnt;
		
	}

	@Override
	public List<Board> selectAll(Paging paging) {
		//DB연결 객체
				conn = JDBCTemplate.getConnection();
				
				//SQL 작성
				String sql = "";
				sql += "SELECT * FROM (";
				sql += "    SELECT rownum rnum, B.* FROM (";
				sql += "        SELECT";
				sql += "            bd_no, bd_title, bd_question,";
				sql += "            bd_answer, bd_date, bd_cnt";
				sql += "        FROM board";
				sql += "        ORDER BY bd_no DESC";
				sql += "    ) B";
				sql += " ) BOARD";
				sql += " WHERE rnum BETWEEN ? AND ?";
				
				System.out.println(sql);
				
				//결과 저장할 List
				List<Board> boardList = new ArrayList<>();
				
				try {
					ps = conn.prepareStatement(sql); //SQL수행 객체
					
					ps.setInt(1, paging.getStartNo());	//페이징 게시글 시작 번호
					ps.setInt(2, paging.getEndNo());	//페이징 게시글 끝 번호
					
					rs = ps.executeQuery(); //SQL 수행 및 결과집합 저장
					
					//조회 결과 처리
					while(rs.next()) {
						Board b = new Board(); //결과값 저장 객체
						
						//결과값 한 행 처리
						b.setBdNo( rs.getInt("bd_no") );
						b.setBdTitle( rs.getString("bd_title") );
						b.setBdQuestion( rs.getString("bd_question") );
						b.setBdAnswer( rs.getString("bd_answer") );
						b.setBdDate( rs.getDate("bd_date") );
						b.setBdCnt( rs.getInt("bd_cnt") );
//						b.setBdGrp(rs.getString("bd_grp"));
//						b.setBdYn(rs.getCharacterStream("bd_yn"));
						
						//리스트에 결과값 저장
						boardList.add(b);
					}
					
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					//DB객체 닫기
					JDBCTemplate.close(rs);
					JDBCTemplate.close(ps);
				}
				
				//최종 결과 반환
				return boardList;
	}

	@Override
	public void insertBoard(Board board) {
		
	}

	@Override
	public int selectUserno() {
		// TODO Auto-generated method stub
		return 0;
	}

}