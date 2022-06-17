package Controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Domain.CrewVo;
import Service.CrewDAO;
import Service.FaqDAO;

@WebServlet("/CrewController")
public class CrewController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();					// 전체 주소(ex. /JspWebpage/crew/crew.do)
		String project = request.getContextPath();				// 프로젝트명(JspWebPage)
		String command = uri.substring(project.length());
		
		System.out.println("command :" + command);

		
		if (command.equals("/crew/crew.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/crew/crew.jsp");
			rd.forward(request, response);
		}
		
		else if (command.equals("/crew/crewMaker.do")) {

			RequestDispatcher rd = request.getRequestDispatcher("/crew/crewMaker.jsp");
			rd.forward(request, response);
		}

		else if (command.equals("/crew/crewMakerAction.do")) {
			
			String crewName = request.getParameter("crewName");
			String crewPersonnel = request.getParameter("crewPersonnel");
			String crewGoal = request.getParameter("crewGoal");
			String dateStart = request.getParameter("crewDateStart");
			String dateEnd = request.getParameter("crewDateEnd");
			
			CrewDAO cd = new CrewDAO();
			cd.makeCrew(0, crewName, crewGoal, crewPersonnel, dateStart, dateEnd);
			
			response.sendRedirect(request.getContextPath()+"/crew/crew.do");
			
		}
		
	}
	
	public void doPost(HttpServletResponse request, HttpServletResponse response) {
		
		doPost(request, response);
	
	}

}
