package web.controller.board;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.dto.Board;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;
import web.util.Paging;

@WebServlet("/view/posts")
public class BoardViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		session.getAttribute("userid");

		//요청파라미터를 전달하여 Paging 객체 생성하기
		Paging paging = boardService.getPaging(req);
	//	System.out.println("BoardListController - " + paging);
		
		System.out.println(paging.getCurPage());
		//게시글 전체 조회
	//	List<Board> boardList = boardService.getList();
		
		//게시글 페이징 처리 조회
		List<Board> boardList = boardService.getList(paging);
		
		//페이징계산결과 MODEL값 전달
		req.setAttribute("paging", paging);
	
		req.setAttribute("boardList", boardList);
		
		req.getRequestDispatcher("/WEB-INF/views/board/viewPosts.jsp")
			.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	
	}
}