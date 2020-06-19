package web.service.face;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dto.Board;
import web.util.Paging;

public interface BoardService {
	
	public int getUserno(HttpServletRequest req);

	/**
	 * 
	 * @return
	 */
	public List<Board> viewPosts();
	
	public Paging getPaging(HttpServletRequest req);
	
	public List<Board> getList(Paging paging);
	
	public void addPosts(HttpServletRequest req);
}