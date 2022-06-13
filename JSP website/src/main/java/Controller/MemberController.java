package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Domain.MemberVo;
import Service.MemberDAO;

@WebServlet("/MemberController")
public class MemberController {
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");						// throws ServletException, IOException 입력해야 오류 해결
		response.setContentType("text/html; charset=UTF-8");	
	
		String uri = request.getRequestURI();						// 주소의 전체 경로를 추출
		String project = request.getContextPath();					// 프로젝트 이름을 추출
		String command = uri.substring(project.length());			// 프로젝트 이름을 뺀 나머지 가상경로를 추출
		
		System.out.println("command :" + command);					// 실행된 command 확인을 위한 sysout

		String uploadPath = "E:\\Open API A반\\Back-end\\JSP website\\src\\main\\webapp\\";
		String saveFolder = "imgs";
		String saveFullPath = uploadPath + saveFolder;
		
		
		
		
		// 회원가입 : midx(회원고유번호), memberid(아이디), memberpassword(비밀번호), memberpasswordcheck(비밀번호 확인), memberemail(이메일), membername(회원명), membergender(성별), memberImg(프로필 사진)
		if (command.equals("/member/memberJoinAction.do")) {
			
			int sizeLimit = 1024*1024*15;
			
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			
			Enumeration files = multi.getFileNames();
			
			String file = (String) files.nextElement();
			String memberImg = multi.getFilesystemName(file);
			
			String mIdx = multi.getParameter("MIDX");
			String memberId = multi.getParameter("MEMBERID");
			String memberPassword = multi.getParameter("MEMBERPASSWORD");
			String memberPasswordCheck = multi.getParameter("MEMBERPASSWORDCHECK");
			String memberEmail = multi.getParameter("MEMBEREMAIL");
			String memberName = multi.getParameter("MEMBERNAME");
			String memberGender = multi.getParameter("MEMBERGENDER");

			// insterMember 메서드를 이용해 DB(MemberDAO)에 등록
			MemberDAO md = new MemberDAO();
			int value = md.insertMember(memberId, memberPassword, memberEmail, memberName, memberGender, memberImg);
			
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
				session.setAttribute("memberimg", mv.getMemberimg());
				
				if (session.getAttribute("saveUrl") != null) {									
					response.sendRedirect((String)session.getAttribute("saveUrl"));			//6.2 Q.글쓰기버튼 - 로그인해주세요 - 로그인 후 - write.jsp로 이동하는 현상 발생?
				} else {																		 
					response.sendRedirect(request.getContextPath()+"/personal/personal.do");	 
				}																				
				// Q. saveUrl? A.이전 창의 url을 저장 ex) 로그인 전 자유게시판을 클릭했을 때 로그인을 요청받음. 로그인을 했을 때 접근 중이었던 자유게시판으로 바로 이동
			}
			
			// 아이디, 비밀번호가 입력되지 않았을 때 로그인 페이지로 이동
			else {
				response.sendRedirect(request.getContextPath() + "/member/memberLogin.do");
			}
		}
		
		// 아이디 중복 체크
		else if (command.equals("/member/checkIdAction.do")) {

			String memberid = request.getParameter("MEMBERID");
			MemberDAO md = new MemberDAO();
			boolean value = md.checkId(memberid);
			System.out.println("value: " + value);
			
			PrintWriter out = response.getWriter();
			if (value) {
				out.println("<script>alert('중복된 아이디 입니다. 다른 아이디를 입력하세요.');location.href='"+request.getContextPath()+"/member/memberJoin.do'</script>");
				out.println("<script>var fm = document.frm;</script>");
				
			} else {
				out.println("<script>alert('사용가능한 아이디 입니다');location.href='"+request.getContextPath()+"/member/memberJoin.do'</script>");
			}
		}
		
		
		// 마이페이지 이동
		else if (command.equals("/member/memberMyPage.do")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/member/memberMyPage.jsp");
			rd.forward(request, response);
		}
		
		
		
		// 로그아웃 기능
		else if (command.equals("/member/memberLogout.do")) {
			
			HttpSession session = request.getSession();			// 연결된 세션을 가져옴
			session.invalidate(); 								// 세션 초기화
			
			response.sendRedirect(request.getContextPath() + "/main/main.do");	// 인덱스 페이지로 이동하게 됨 (cf. "/"를 기입하지 않아도 자동으로 이동하긴 함)
			
		}
				
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}
	
}
