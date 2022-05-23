package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.MemberDAO;

public class MemberController {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");						// throws ServletException, IOException 입력해야 오류 해결
		response.setContentType("text/html; charset=UTF-8");	
	
		String uri = request.getRequestURI();						// 주소의 전체 경로를 추출
		String project = request.getContextPath();					// 프로젝트 이름을 추출
		String command = uri.substring(project.length());			// 프로젝트 이름을 뺀 나머지 가상경로를 추출
		
		System.out.println("command : " + command);					// 실행된 command 확인을 위한 sysout

		if (command.equals("/member/memberJoinAction.do")) {
			
			String mIdx = request.getParameter("MIDX");								// 값을 받아올 때 getParameter 사용
			String memberId = request.getParameter("MEMBERID");
			String memberPassword = request.getParameter("MEMBERPASSWORD");
			String memberPasswordCheck = request.getParameter("MEMBERPASSWORDCHECK");		
			String memberEmail = request.getParameter("MEMBEREMAIL");
			String memberName = request.getParameter("MEMBERNAME");
			String memberGender = request.getParameter("MEMBERGENDER");				// select 결과로 하나의 값을 갖기 때문에 getParameterValuse 사용 x
			
			
			MemberDAO md = new MemberDAO();
			int value = md.insertMember(memberId, memberPassword, memberEmail, memberName, memberGender);
			
			PrintWriter out = response.getWriter();
			
			System.out.println(value);
		
			// 회원가입 성공
			if (value==1) {
				response.sendRedirect(request.getContextPath()+"/member/memberLogin.do");	
//				out.println("<script>alert('회원가입 성공'); location.href='"+request.getContextPath()+"/index.jsp'</script>");
			}
			// 회원가입 실패
//			else {
//				response.sendRedirect(request.getContextPath()+"/member/memberJoin.do");
//				out.println("<script>alert('회원가입 실패'); location.href='"+request.getContextPath()+"/index.jsp'</script>");
//			}
		
		}
		
		
		
		// 회원가입 페이지 이동
		else if (command.equals("/member/memberJoin.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberJoin.jsp");
			rd.forward(request, response);
		}
		
		// 로그인 페이지 이동
		else if (command.equals("/member/memberLogin.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberLogin.jsp");
			rd.forward(request, response);
		}
		
		
	}

}
