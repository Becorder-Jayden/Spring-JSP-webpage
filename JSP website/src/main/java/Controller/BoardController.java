package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import Domain.BoardVo;
import Domain.PageMaker;
import Domain.SearchCriteria;
import Service.BoardDAO;


// controller : 페이지 이동과 필요한 데이터 전송을 담당

@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 경로 추출
		String uri = request.getRequestURI();
		String project = request.getContextPath();
		String command = uri.substring(project.length());
		
		System.out.println("command :" + command);
	
		String uploadPath = "../../src/main/webapp/";
		String saveFolder = "imgs";
		String saveFullPath = uploadPath + saveFolder;
		
		BoardDAO bd = new BoardDAO();	// DB 접근시 필요, 데이터 전역변수로 설정
		

		// 게시판 이동
		if (command.equals("/board/board.do")) {
			
			/*페이징*/
			String page = request.getParameter("page");
			if (page == null) page = "1";
			int pagex = Integer.parseInt(page);
			
			/*검색어*/
			String keyword = request.getParameter("keyword");
			if (keyword == null) keyword = "";
			String searchType = request.getParameter("searchType");
			if (searchType == null) searchType = "fbtitle";
			
			
			/*분류 기준*/
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);	// 페이징
			scri.setKeyword(keyword);	// 키워드
			scri.setSearchType(searchType);	// 검색 유형

			request.setAttribute("scri", scri);	// 게시판에 보여질 글 분류를 위한 데이터 전송			

			
			// BoardDAO → 전역변수로 이동
			int cnt = bd.boardTotal(scri);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);

			
			/*게시판에 DB 출력*/
			// DB 데이터를 가져오기 위해 데이터 행(alist) 정의 후 request에 전송
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);
			request.setAttribute("alist", alist);
			request.setAttribute("pm", pm);
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/board/board.jsp");
			rd.forward(request, response);
		}
		
		
		
		// 게시판 글쓰기 이동
		else if (command.equals("/board/boardWrite.do")){
			
			/*페이징*/
			String page = request.getParameter("page");
			if (page==null) page = "1";
			int pagex = Integer.parseInt(page);
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);

			request.setAttribute("scri", scri);	// 페이징 계산을 위해 전송			
			
			
			// BoardDAO → 전역변수로 이동
			
			int cnt = bd.boardTotal(scri);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			
			/*게시판에 DB 출력*/
			// DB 데이터를 가져오기 위해 데이터 행(alist) 정의 후 request에 전송
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);
			request.setAttribute("alist", alist);
			request.setAttribute("pm", pm);
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
			rd.forward(request, response);
		}
		
		
		// 게시판 글쓰기 동작
		else if (command.equals("/board/boardWriteAction.do")) {
			
			String fbWriter = request.getParameter("FBWRITER");
			String fbCategory = request.getParameter("FBCATEGORY");
			String fbTitle = request.getParameter("FBTITLE");
			String fbContent = request.getParameter("FBCONTENT");
			
			
			HttpSession session = request.getSession();
			
			int midx = (int) session.getAttribute("midx");
			
			bd = new BoardDAO();
			int value = bd.insertBoard(midx, fbCategory, fbTitle, fbContent, fbWriter);
			
			if (value==1) {
				response.sendRedirect(request.getContextPath()+"/board/board.do");
			}
			else {
				response.sendRedirect(request.getContextPath()+"/board/boardWrite.do");
			}
		}
		
		
		// 게시 글 보기
		else if (command.equals("/board/boardView.do")) {
			
			
			/*페이징*/
			String page = request.getParameter("page");
			if (page==null) page = "1";
			int pagex = Integer.parseInt(page);
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);

			request.setAttribute("scri", scri);	// 페이징 계산을 위해 전송			
			
			
			// BoardDAO → 전역변수로 이동
			
			int cnt = bd.boardTotal(scri);
			
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			
			/*게시판에 DB 출력*/
			// DB 데이터를 가져오기 위해 데이터 행(alist) 정의 후 request에 전송
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);
			request.setAttribute("alist", alist);
			request.setAttribute("pm", pm);
			
			//임의 작성
			String fbidx = request.getParameter("fbidx");
			int fbidx_ = Integer.parseInt(fbidx);
			
			bd = new BoardDAO(); // 전역변수에 BoardDAO 존재
			BoardVo bv = bd.boardSelectOne(fbidx_);
			request.setAttribute("bv", bv);
			//
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardView.jsp");
			rd.forward(request, response);
		}
		
	}
			


	
	public void doPost(HttpServletRequest request, HttpServletRequest response) {
		
	};

}
