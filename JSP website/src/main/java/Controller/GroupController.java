package Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.mbeans.GroupMBean;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Domain.GroupVo;
import Service.GroupDAO;

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
		
		
		ㄱㅗㄱㅗㄱㅗㄱㅗㄱㅗ
		
		// ㄹㅓㅏㄱ🤣🤣🤣🤣
		GroupDAO gd = new GroupDAO();
		
		// 그룹 페이지 이동
		if (command.equals("/group/group.do")) {
			
			ArrayList<GroupVo> glist = gd.selectGroupBoardAll();
			request.setAttribute("glist", glist);
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/group/group.jsp");
			rd.forward(request, response);
			
		}
		
		
		// 그룹 게시판 글쓰기 이동
		else if (command.equals("/group/groupWrite.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/group/groupWrite.jsp");
			rd.forward(request, response);
		}
		
		
		// 그룹 게시판 글쓰기 작동
		else if (command.equals("group/groupWriteAction.do")) {
			
			int sizeLimit = 1024*1024*15;
			
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy()); 
			
			
			String gbtitle = request.getParameter("gbtitle");
			String gbcontent = request.getParameter("gbcontent");
			String gbwriter = request.getParameter("gbwriter");
			String gbidx = request.getParameter("gbidx");
			String gbhit = request.getParameter("gbhit");
			String img = request.getParameter("img");
			
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			int gbidx_ = Integer.parseInt(gbidx);
			int gbhit_ = Integer.parseInt(gbhit);	
			
			
			gd = new GroupDAO();
			int value = gd.insertGroupBoard(gbtitle, midx, gbwriter, gbhit_, gbcontent, img);
			
			if (value==1) {
				RequestDispatcher rd = request.getRequestDispatcher("/group/group.do");
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("/group/groupWrite.do");
			}
		}
		
		
		
		
		
		// 그룹 목표 설정
		else if (command.equals("/group/groupGoalWriteAction.do")) {
			
			String groupGoal = request.getParameter("groupGoal");
			request.setAttribute("groupGoal", groupGoal);
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/group/group.do");
			rd.forward(request, response);
		}
		
		
		
		
		
		
	}

}
