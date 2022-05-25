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
import Service.BoardDAO;

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
		
		
		
		// 게시판 이동
		if (command.equals("/board/board.do")) {
			
			
			
			BoardDAO bd = new BoardDAO();
			
			
			ArrayList<BoardVo> alist = bd.boardSelectAll();
			System.out.println(alist);
			
			request.setAttribute("alist", alist);
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/board/board.jsp");
			rd.forward(request, response);
		}
		
		// 게시판 글쓰기 동작
		else if (command.equals("/board/boardWrite.do")){
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
			rd.forward(request, response);	
		}
		
		
		
		// 게시판 글쓰기 action
		else if (command.equals("/board/boardWriteAction.do")) {
			
			System.out.println("boardWriteAction.do 실행");
			
			String fbWriter = request.getParameter("FBWRITER");
			String fbCategory = request.getParameter("FBCATEGORY");
			String fbTitle = request.getParameter("FBTITLE");
			String fbContent = request.getParameter("FBCONTENT");
			
			
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			BoardDAO bd = new BoardDAO();
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
