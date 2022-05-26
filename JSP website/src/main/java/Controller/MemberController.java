package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Domain.MemberVo;
import Service.MemberDAO;

public class MemberController {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");						// throws ServletException, IOException 입력해야 오류 해결
		response.setContentType("text/html; charset=UTF-8");	
	
		String uri = request.getRequestURI();						// 주소의 전체 경로를 추출
		String project = request.getContextPath();					// 프로젝트 이름을 추출
		String command = uri.substring(project.length());			// 프로젝트 이름을 뺀 나머지 가상경로를 추출
		
		System.out.println("command :" + command);					// 실행된 command 확인을 위한 sysout

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
			
			// 회원가입 성공
			if (value==1) {
//				response.sendRedirect(request.getContextPath()+"/member/memberLogin.do");		// response가 있어서 script구문이 씹힌다? Q. 확인 필요 
				out.println("<script>alert('회원가입 성공'); location.href='"+request.getContextPath()+"/member/memberLogin.do'</script>");
			}
			// 회원가입 실패
			else {
//				response.sendRedirect(request.getContextPath()+"/member/memberJoin.do");
				out.println("<script>alert('회원가입 실패'); location.href='"+request.getContextPath()+"/member/memberJoin.do'</script>");
			}
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
		
		// 로그인 수행
		else if (command.equals("/member/memberLoginAction.do")) {
			String memberId = request.getParameter("ID");					// memberJoin.jsp에서 전달한 ID, PASSWORD를 받아옴
			String memberPassword = request.getParameter("PASSWORD");
			
			MemberDAO md = new MemberDAO();									// DB(DAO접근)를 통해 ID와 Password가 일치하는 회원 확인 
			MemberVo mv = md.memberLogin(memberId, memberPassword);			// memberLogin을 통해서 로그인
			
			HttpSession session = request.getSession(); 					// session: 연결성 유지
			
			// 로그인 후 페이지 이동
			if (mv != null) {
				session.setAttribute("midx", mv.getMidx());
				session.setAttribute("memberId", mv.getMemberid());
				session.setAttribute("memberName", mv.getMembername());
				
				if (session.getAttribute("saveUrl") != null) {									// saveUrl의 정체는? A.로그인 페이지로 들어가기 전 창 
					response.sendRedirect((String)session.getAttribute("saveUrl"));				// 로그인 전 url 위치가 저장되어 있다면 로그인 후 해당 url로 이동
				} else {																		// saveUrl 값 없이 로그인을 완료했을 때 
					response.sendRedirect(request.getContextPath()+"/personal/personal.do");	// personal 페이지로 이동
				}																				// Q. saveUrl 활용해서 이전페이지로 이동하는 방법 알아보기?
			}
			// 아이디, 비밀번호가 입력되지 않았을 때 로그인 페이지로 이동
			else {
				response.sendRedirect(request.getContextPath() + "/member/memberLogin.do");
			}
		}
		
		// 마이페이지 이동
		else if (command.equals("/member/memberMyPage.do")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberMyPage.jsp");
			rd.forward(request, response);
		}
		
		// 로그아웃 기능
		else if (command.equals("/member/memberLogout.do")) {
			System.out.println("실행");
			
			HttpSession session = request.getSession();			// 연결된 세션을 가져옴
			session.invalidate(); 								// 세션 초기화
			
			response.sendRedirect(request.getContextPath() + "/");	// 인덱스 페이지로 이동하게 됨 (cf. "/"를 기입하지 않아도 자동으로 이동하긴 함)
			
		}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
}
