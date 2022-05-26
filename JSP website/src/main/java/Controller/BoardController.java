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
		
		BoardDAO bd = new BoardDAO();	// 자주 사용되므로 전역변수로 설정
		
		// 게시판 이동
		if (command.equals("/board/board.do")) {
			/*페이징*/
			String page = request.getParameter("page");
			if (page==null) page = "1";
			int pagex = Integer.parseInt(page);
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);
			
			
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
			
			System.out.println("boardWriteAction.do 실행");
			
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
	}
			


	
	public void doPost(HttpServletRequest request, HttpServletRequest response) {
		
	};

}
