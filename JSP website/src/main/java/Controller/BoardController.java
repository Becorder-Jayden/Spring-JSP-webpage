package Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
		String uploadPath = "E:\\Open API A반\\JspWebPage";
		
		
		
		
		
		// 게시판 이동
		if (command.equals("/board/board.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/board/board.jsp");
			rd.forward(request, response);
		}
		
		// 게시판 글쓰기 이동
		else if (command.equals("/board/boardWrite.do")){
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
			rd.forward(request, response);	
		}
		
		
	};
	
	public void doPost(HttpServletRequest request, HttpServletRequest response) {
		
	};

}
