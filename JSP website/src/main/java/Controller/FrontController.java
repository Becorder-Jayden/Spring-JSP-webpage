package Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Spring;

@WebServlet("/FrontController")
public class FrontController extends HttpServlet{
	private static final long serialVersionUTD = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI();
		String project = request.getContextPath();
		String command = uri.substring(project.length()); 
		
		String[] subpath =  command.split("/");
		String location = subpath[1];	// JspWebPage

		if (location.equals("main")){
			MainController mainc = new MainController();
			mainc.doGet(request, response);
		}
		else if (location.equals("member")) {
			MemberController mc = new MemberController();
			mc.doGet(request, response);
		} 
		else if (location.equals("personal")) {
			PersonalController pc = new PersonalController();
			pc.doGet(request, response);
		}
		else if (location.equals("group")) {
			GroupController gc = new GroupController();
			gc.doGet(request, response);
		}
		else if (location.equals("board")) {
			BoardController bc = new BoardController();
			bc.doGet(request, response);
		}
		else if (location.equals("faq")) {
			FaqController fc = new FaqController();
			fc.doGet(request, response);
		}
		else if (location.equals("crew")) {
			CrewController cc = new CrewController();
			cc.doGet(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);		// post 방식을 사용할 때 데이터를 전송
	}
}
