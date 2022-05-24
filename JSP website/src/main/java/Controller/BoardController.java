package Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

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
	
		String uploadPath = "../../src/main/webapp/";
		String saveFolder = "imgs";
		String saveFullPath = uploadPath + saveFolder;
		
		
		
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
		
//		// 게시판 글쓰기 action
//		else if (command.equals("/board/boardWriteAction.do")) {
//			
//			int sizeLimit = 1024*1024*15; 			// 단위 : MB
//			
//			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());	// Q: 에러가 나는 이유?
//			// DefaultFileRenamePolicy(): 파일 이름이 같을 때 rename 정책을 사용
//			
//			Enumeration files = multi.getFileNames();	// 열거자에 저장될 파일을 담는 객체 생성
//			
//			String file = (String)files.nextElement();					// 담긴 파일 객체의 파일 이름을 얻는다
//			String fileName = multi.getFilesystemName(file);			// 저장되는 파일 이름 					// multi 적용 x로 인해 getFilesystemName이 적용되지 않음
//			String originFileName = multi.getOriginalFileName(file); 	// 원래 파일 이름
//		}
		
	};
	
	public void doPost(HttpServletRequest request, HttpServletRequest response) {
		
	};

}
