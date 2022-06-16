package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Domain.FaqVo;
import Service.FaqDAO;

@WebServlet("/FaqController")
public class FaqController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 데이터 인코딩 설정
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String uri = request.getRequestURI(); // 전체 주소(ex. /JspWebpage/faq/faq.do)
		String project = request.getContextPath(); // 프로젝트명(JspWebPage)
		String command = uri.substring(project.length());

		System.out.println("command :" + command);

		// FAQ 페이지 이동
		if (command.equals("/faq/faq.do")) {
			
			FaqDAO fd = new FaqDAO();
			ArrayList<FaqVo> flist = fd.faqSelectAll();
			request.setAttribute("flist", flist);

			RequestDispatcher rd = request.getRequestDispatcher("/faq/faq.jsp");
			rd.forward(request, response);
		}

		// FAQ 작성 페이지 이동
		else if (command.equals("/faq/faqWrite.do")) {

			FaqDAO fd = new FaqDAO();
			ArrayList<FaqVo> flist = fd.faqSelectAll();
			request.setAttribute("flist", flist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/faq/faqWrite.jsp");
			rd.forward(request, response);
		}

		// FAQ 글 등록
		else if (command.equals("/faq/faqWriteAction.do")) {

			String qquestion = request.getParameter("qquestion");
			String qanswer = request.getParameter("qanswer");

			FaqDAO fd = new FaqDAO();
			int value = fd.insertFaq(qquestion, qanswer);

			if (value == 1) {
				System.out.println("글쓰기 성공");
				response.sendRedirect(request.getContextPath()+"/faq/faq.do"); 
			} else {
				System.out.println("글쓰기 실패");
				response.sendRedirect(request.getContextPath()+"/faq/faqWrite.do"); 
			}

		}
	}

	public void doPost(HttpServletResponse request, HttpServletResponse response) {

		doPost(request, response);

	}

}
