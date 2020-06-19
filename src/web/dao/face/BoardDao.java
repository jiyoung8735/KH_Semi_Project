package web.dao.face;

import java.util.List;

import web.dto.Board;
import web.util.Paging;

public interface BoardDao {
	public int selectUserno();

	public List<Board> serlectBoard();
	
	public int selectCntAll();
	
	public List<Board> selectAll(Paging paging);
	
	public void insertBoard(Board board);
}