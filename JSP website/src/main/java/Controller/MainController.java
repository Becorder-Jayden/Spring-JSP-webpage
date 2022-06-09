package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Domain.BoardVo;
import Domain.MemberVo;
import Service.BoardDAO;

@WebServlet("/MainController")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public MainController() {
		super();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String project = request.getContextPath();
		String command = uri.substring(project.length());
		
		System.out.println("command: " + command);
		
		
		
		if (command.equals("/main/main.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/main/main.jsp");
			rd.forward(request, response);
		}
	
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		
	};
}
