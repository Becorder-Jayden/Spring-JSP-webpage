package Controller;

import java.io.IOException;
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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Domain.GroupVo;
import Domain.PageMaker;
import Domain.SearchCriteria;
import Service.GroupDAO;

@WebServlet("/GroupController")
public class GroupController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public GroupController() {
		super();
	}
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		String command = uri.substring(path.length());
		
		// 경로 확인
		System.out.println("command: " + command);
		
		// 데이터 저장 경로 설정
		 String uploadPath = "E:\\Open API A반\\Back-end\\JSP website\\src\\main\\webapp\\";
		 String saveFolder = "imgs";
		 String saveFullPath = uploadPath + saveFolder;
		
		// 전역 변수
		GroupDAO gd = new GroupDAO();
		
		
		
		// 그룹 페이지 이동
		if (command.equals("/group/group.do")) {
			
			String page = request.getParameter("page");
			if (page == null) page = "1";
			int page_ = Integer.parseInt(page);
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page_);
			
			int cnt = gd.groupTotal(scri);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<GroupVo> glist = gd.selectGroupBoardAll(scri);
			request.setAttribute("glist", glist);
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/group/group.jsp");
			rd.forward(request, response);
			
		}
		
		
		// 그룹 게시판 글쓰기 이동
		else if (command.equals("/group/groupWrite.do")) {

			String page = request.getParameter("page");
			if (page == null) page = "1";
			int page_ = Integer.parseInt(page);
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page_);
			
			int cnt = gd.groupTotal(scri);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			

			ArrayList<GroupVo> glist = gd.selectGroupBoardAll(scri);
			request.setAttribute("glist", glist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/group/groupWrite.jsp");
			rd.forward(request, response);
		}
		
		
		// 그룹 게시판 글쓰기 작동
		else if (command.equals("/group/groupWriteAction.do")) {
			
			int sizeLimit = 1024*1024*15;
			
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			
			// 저장될 파일을 담는 객체 생성
			Enumeration files = multi.getFileNames();
			
			// 담긴 파일 객체의 변수 가져오기
			String file = (String) files.nextElement();
			String fileName = multi.getFilesystemName(file);
			
			String gbtitle = multi.getParameter("gbtitle");
			String gbcontent = multi.getParameter("gbcontent");
			String gbwriter = multi.getParameter("gbwriter");

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			gd = new GroupDAO();
			int value = gd.insertGroupBoard(gbtitle, midx, gbwriter, gbcontent, fileName);
			
			if (value==1) {
				response.sendRedirect(request.getContextPath()+"/group/group.do");
			} else {
				response.sendRedirect(request.getContextPath()+"/group/groupWrite.do");
			}
		}
		
		// 그룹 게시판 글 보기
		else if (command.equals("/group/groupView.do")) {
			
			
			String page = request.getParameter("page");
			if (page == null) page = "1";
			int page_ = Integer.parseInt(page);
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page_);
			
			int cnt = gd.groupTotal(scri);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			String gbidx = request.getParameter("gbidx");
			int gbidx_ = Integer.parseInt(gbidx);
			
			gd = new GroupDAO();
			GroupVo gv = gd.groupSelectOne(gbidx_);
			request.setAttribute("gv", gv);
			
			ArrayList<GroupVo> glist = gd.selectGroupBoardAll(scri);
			request.setAttribute("glist", glist);
			
			// 조회 수 카운트
			HttpSession session = request.getSession();
			String membername = (String) session.getAttribute("memberName");
			if (!membername.equals(gv.getGbwriter())) {
				gd.groupBoardCount(gbidx_);
			};
			
			
			RequestDispatcher rd = request.getRequestDispatcher("/group/groupView.jsp");
			rd.forward(request, response);
					
		}
		
		// 그룹 게시판 자세히 보기 이동
		else if (command.equals("/group/groupBoard.do"))  {
			
			String page = request.getParameter("page");
			if (page == null) page = "1";
			int page_ = Integer.parseInt(page);
			
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(page_);
			
			int cnt = gd.groupTotal(scri);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			request.setAttribute("pm", pm);
			
			ArrayList<GroupVo> glist = gd.selectGroupBoardAll(scri);
			request.setAttribute("glist", glist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/group/groupBoard.jsp");
			rd.forward(request, response);
		}
		
		
		
		
		// 그룹 목표 설정 - 다시 설계해야 함 
		else if (command.equals("/group/groupGoalWriteAction.do")) {
			
			String groupGoal = request.getParameter("groupGoal");
			request.setAttribute("groupGoal", groupGoal);
			
			// 이동
			RequestDispatcher rd = request.getRequestDispatcher("/group/group.do");
			rd.forward(request, response);
		}
		
	}

}
