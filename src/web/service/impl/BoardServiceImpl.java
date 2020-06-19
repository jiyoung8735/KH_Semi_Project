package web.service.impl;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import web.dao.face.BoardDao;
import web.dao.impl.BoardDaoImpl;
import web.dto.Board;
import web.dto.User;
import web.service.face.BoardService;
import web.util.Paging;

public class BoardServiceImpl implements BoardService{

	private BoardDao boardDao = new BoardDaoImpl();
	
	@Override
	public int getUserno(HttpServletRequest req) {
		
		User user = new User();
		HttpSession session = req.getSession();
		
		user.setUserId((String)session.getAttribute("userid"));
		
	
		return 0;
	}
	
	@Override
	public List<Board> viewPosts() {
		
		List<Board> board = new ArrayList<>();
		board = boardDao.serlectBoard();
		
		return board;
	}

	@Override
	public Paging getPaging(HttpServletRequest req) {
		//전달파라미터 curPage를 파싱한다
				String param = req.getParameter("curPage");
				int curPage = 0;
				if( param!=null && !"".equals(param) ) {
					curPage = Integer.parseInt(param);
				}
				System.out.println(curPage);
				
				//Board 테이블의 총 게시글 수를 조회한다
				int totalCount = boardDao.selectCntAll();

				//Paging 객체 생성 - 현재 페이지(curPage), 총 게시글 수(totalCount) 활용
				Paging paging = new Paging(totalCount, curPage);
				
				//Paging 객체 반환
				return paging;
	}

	@Override
	public List<Board> getList(Paging paging) {
		return boardDao.selectAll(paging);
	}

	@Override
	public void addPosts(HttpServletRequest req) {
		Board board = new Board();
		
		board.setBdTitle((String)req.getAttribute("title"));
		board.setBdQuestion((String)req.getAttribute("content"));
		
		boardDao.insertBoard(board);
	}

	

}