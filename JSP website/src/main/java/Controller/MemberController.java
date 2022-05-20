package Controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.MemberDAO;

public class MemberController {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");	// throws ServletException, IOException 입력해야 오류 해결
		response.setContentType("text/html; charset=UTF-8");
		
		String uri = request.getRequestURI();
		String project = request.getContextPath();
		String command = uri.substring(project.length());
		System.out.println("command : " + command);

		if (command.equals("/member/memberJoinAction.do")) {
			String mIdx = request.getParameter("MIDX");
			String memberId = request.getParameter("MEMBERID");
			String memberPassword = request.getParameter("MEMBERPASSWORD");
			String memberEmail = request.getParameter("MEMBEREMAIL");
			String memberName = request.getParameter("MEMBERNAME");
			String[] memberGender = request.getParameterValues("MEMBERGENDER");		// select 태그의 데이터 전송
			
			String gender = "";
			
			for(int i = 0; i < memberGender.length; i++) {
				gender = gender + "," + memberGender[i];
			}
			gender = gender.substring(1);
		}
		
		MemberDAO md = new MemberDAO();
		int value = md.insertMember(mIdx, memberId, memberPassword, memberEmail, memberName, memberGender);
		
		
	}

}
