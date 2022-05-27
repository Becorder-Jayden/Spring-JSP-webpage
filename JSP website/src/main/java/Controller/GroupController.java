package Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GroupController")
public class GroupController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public GroupController() {
		super();
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		
		
		
		// 그룹 페이지 이동
		if (command.equals("/group/group.do")) {
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/group/group.jsp");
			rd.forward(request, response);
			
		}
		
		// 그룹 목표 설정
		if (command.equals("/group/groupGoalWriteAction.do")) {
			
			String groupGoal = request.getParameter("groupGoal");
			request.setAttribute("groupGoal", groupGoal);
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/group/group.do");
			rd.forward(request, response);
		}
		
		
	}

}
