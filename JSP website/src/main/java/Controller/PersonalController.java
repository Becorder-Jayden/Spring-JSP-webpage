package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Domain.PersonalVo;
import Service.PersonalDAO;

@WebServlet("/PersonalController")
public class PersonalController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String uri = request.getRequestURI(); // 전체 주소(ex. /JspWebpage/personal/personal.do)
		String project = request.getContextPath(); // 프로젝트명(JspWebPage)
		String command = uri.substring(project.length());

		System.out.println("command :" + command);

		// 전역 변수 설정
		String uploadPath = "E:\\Open API A반\\Back-end\\JSP website\\src\\main\\webapp\\";
		String saveFolder = "imgs";
		String saveFullPath = uploadPath + saveFolder;

		PersonalDAO pd = new PersonalDAO();
		
		
		
		
		
		if (command.equals("/personal/personal.do")) {

			HttpSession session = request.getSession();
			if (session.getAttribute("midx") != null) {
				int midx = (int)session.getAttribute("midx");
				ArrayList<PersonalVo> plist = pd.personalSelectALL(midx);
				request.setAttribute("plist", plist);
				RequestDispatcher rd = request.getRequestDispatcher("/personal/personal.jsp");
				rd.forward(request, response);
			} else {
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 해주세요.')");
				out.println("location.href='"+request.getContextPath()+"/member/memberLogin.do'");
				out.println("</script>");
			}
		}

		// 일일 몸무게 입력
		else if (command.equals("/personal/personalWriteAction.do")) {
			
			int sizeLimit = 1024*1024*15;
			 
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			
			String file = (String) files.nextElement(); 
			String fileName = multi.getFilesystemName(file);

			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");

			String pbWeight = multi.getParameter("pbWeight");
			int pbWeight_ = Integer.parseInt(pbWeight);
			// 6/7. form이 없으면 parameter를 가져올 수 없다
			System.out.println("pbWeight_: " + pbWeight_);
			

			String pbMemo = multi.getParameter("pbMemo");
			System.out.println("pbMemo: " + pbMemo);

			pd = new PersonalDAO();
			pd.insertPersonal(midx, pbWeight_, fileName, pbMemo);

			response.sendRedirect(request.getContextPath() + "/personal/personal.do");
		}

		
	}

	public void doPost(HttpServletResponse request, HttpServletResponse response) {

		doPost(request, response);

	}

}
