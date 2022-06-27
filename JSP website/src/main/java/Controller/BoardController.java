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

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Domain.BoardVo;
import Domain.CommentVo;
import Domain.PageMaker;
import Domain.SearchCriteria;
import Service.BoardDAO;
import Service.CommentDAO;


// controller : �럹�씠吏� �씠�룞怨� �븘�슂�븳 �뜲�씠�꽣 �쟾�넚�쓣 �떞�떦
@WebServlet("/BoardController")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
		super();
		public BoardController() {
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// �뜲�씠�꽣 �씤肄붾뵫 �꽕�젙
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		// 寃쎈줈 異붿텧
		String uri = request.getRequestURI();
		String project = request.getContextPath();
		String command = uri.substring(project.length());
		
		// 寃쎈줈 �솗�씤
		System.out.println("command: " + command);
	
		// �뜲�씠�꽣 ���옣 寃쎈줈 �꽕�젙
		String uploadPath = "E:\\Open API A諛�\\Back-end\\JSP website\\src\\main\\webapp\\";
		String saveFolder = "imgs";
		String saveFullPath = uploadPath + saveFolder;
		
		// �쟾�뿭蹂��닔 �꽕�젙
		BoardDAO bd = new BoardDAO();	// board DB �젒洹�
		CommentDAO cd = new CommentDAO();	// comment DB �젒洹�
		
		
		
		// 寃뚯떆�뙋 �씠�룞
		if (command.equals("/board/board.do")) {
			
			/*�럹�씠吏�*/
			String page = request.getParameter("page");
			if (page == null) page = "1";
			int pagex = Integer.parseInt(page);
			
			/*寃��깋�뼱*/
			String keyword = request.getParameter("keyword");
			if (keyword == null) keyword = "";
			String searchType = request.getParameter("searchType");
			if (searchType == null) searchType = "fbtitle";
			String category = request.getParameter("category");
			if (category == null) category = "";
			
			/*遺꾨쪟 湲곗�*/
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);	// �럹�씠吏�
			scri.setKeyword(keyword);	// �궎�썙�뱶
			scri.setSearchType(searchType);	// 寃��깋 �쑀�삎
			scri.setCategory(category);

			bd = new BoardDAO();
			int cnt = bd.boardTotal(scri);

			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);

			/*寃뚯떆�뙋�뿉 DB 異쒕젰*/
			// DB �뜲�씠�꽣瑜� 媛��졇�삤湲� �쐞�빐 �뜲�씠�꽣 �뻾(alist) �젙�쓽 �썑 request�뿉 �쟾�넚
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);
			
			request.setAttribute("alist", alist);
			request.setAttribute("pm", pm);
			
			// �씠�룞
			RequestDispatcher rd = request.getRequestDispatcher("/board/board.jsp");
			rd.forward(request, response);
		}	
		
		
		
		// 寃뚯떆�뙋 湲��벐湲� �씠�룞
		else if (command.equals("/board/boardWrite.do")){
			
			/*�럹�씠吏�*/
			String page = request.getParameter("page");
			if (page == null) page = "1";
			int pagex = Integer.parseInt(page);
			
			/*寃��깋�뼱*/
			String keyword = request.getParameter("keyword");
			if (keyword == null) keyword = "";
			String searchType = request.getParameter("searchType");
			if (searchType == null) searchType = "";						// Q. 寃뚯떆湲� 踰덊샇濡� 李얘린 ? A. 援ы쁽 �셿猷�
			String category = request.getParameter("category");
			if (category == null) category = "";
			
			/*遺꾨쪟 湲곗�*/
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);	// �럹�씠吏�
			scri.setKeyword(keyword);	// �궎�썙�뱶
			scri.setSearchType(searchType);	// 寃��깋 �쑀�삎
			scri.setCategory(category);

			request.setAttribute("scri", scri);	// �럹�씠吏� 怨꾩궛�쓣 �쐞�빐 �쟾�넚			
			
			
			// BoardDAO �넂 �쟾�뿭蹂��닔濡� �씠�룞
			
			int cnt = bd.boardTotal(scri);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			/*寃뚯떆�뙋�뿉 DB 異쒕젰*/
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);		// DB �뜲�씠�꽣瑜� 媛��졇�삤湲� �쐞�빐 �뜲�씠�꽣 �뻾(alist) �젙�쓽 �썑 request�뿉 �쟾�넚
			request.setAttribute("alist", alist);
			request.setAttribute("pm", pm);
			
			// �씠�룞
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardWrite.jsp");
			rd.forward(request, response);
		}
		
		
		// 寃뚯떆�뙋 湲��벐湲� �룞�옉
		else if (command.equals("/board/boardWriteAction.do")) {
			
			// �씠誘몄� �뙆�씪 �엯�젰
			// cf. lib �뙆�씪�뿉 cos.jar, imgscalr-lib.jar �뙆�씪 異붽� �븘�슂
			int sizeLimit = 1024*1024*15;		// �뙆�씪 �겕湲곕�� 15MB濡� �젣�븳
			
			MultipartRequest multi = new MultipartRequest(request, saveFullPath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
			// DefaultFileRenamePolicy(): �뙆�씪 �씠由꾩씠 �룞�씪�븷 �븣 Rename �젙梨낆쓣 �궗�슜   
			
			
			// ���옣�맆 �뙆�씪�쓣 �떞�뒗 媛앹껜 �깮�꽦
			Enumeration files = multi.getFileNames();			// jsp�뿉�꽌 name媛믪쓣 �넻�빐 媛��졇�삤湲� �븣臾몄뿉 input�뿉 name �냽�꽦�씠 �븘�슂
			

			// �떞湲� �뙆�씪 媛앹껜�쓽 蹂��닔 媛��졇�삤湲�
			String file = (String) files.nextElement();
			String fileName = multi.getFilesystemName(file);
			String originFileName = multi.getOriginalFileName(file);
			
			// �엯�젰媛믪쓣 諛쏆븘�샂	cf. 'multipart/form-data'濡� �뜲�씠�꽣瑜� �쟾�넚�뻽�쑝誘�濡� multipartrequest瑜� �넻�빐 媛믪쓣 諛쏆븘�삤濡쒕룆 �븳�떎 
			String fbWriter = multi.getParameter("FBWRITER");			
			String fbCategory = multi.getParameter("FBCATEGORY");
			String fbTitle = multi.getParameter("FBTITLE");
			String fbContent = multi.getParameter("FBCONTENT");
			
			// �꽭�뀡�쑝濡쒕��꽣 �쁽�옱 濡쒓렇�씤�븳 �쉶�썝�쓽 �젙蹂�(midx)瑜� 媛��졇�샂
			HttpSession session = request.getSession();
			int midx = (int) session.getAttribute("midx");
			
			// DB�뿉 �뜲�씠�꽣 �엯�젰
			bd = new BoardDAO();
			int value = bd.insertBoard(midx, fbCategory, fbTitle, fbContent, fbWriter, fileName);
			
			if (value==1) {
				response.sendRedirect(request.getContextPath()+"/board/board.do");
			}
			else {
				response.sendRedirect(request.getContextPath()+"/board/boardWrite.do");
			}
		}
		
		
		// 寃뚯떆湲� 蹂닿린
		else if (command.equals("/board/boardView.do")) {
			
			/*�럹�씠吏�*/
			String page = request.getParameter("page");
			if (page == null) page = "1";
			int pagex = Integer.parseInt(page);
			
			/*寃��깋�뼱*/
			String keyword = request.getParameter("keyword");
			if (keyword == null) keyword = "";
			String searchType = request.getParameter("searchType");
			if (searchType == null) searchType = "";
			String category = request.getParameter("category");
			if (category == null) category = "";
			
			/*遺꾨쪟 湲곗�*/
			SearchCriteria scri = new SearchCriteria();
			scri.setPage(pagex);	// �럹�씠吏�
			scri.setKeyword(keyword);	// �궎�썙�뱶
			scri.setSearchType(searchType);	// 寃��깋 �쑀�삎
			scri.setCategory(category);
			request.setAttribute("scri", scri);	// �럹�씠吏� 怨꾩궛�쓣 �쐞�빐 �쟾�넚			
			
			
			// BoardDAO �넂 �쟾�뿭蹂��닔濡� �씠�룞
			
			int cnt = bd.boardTotal(scri);
			
			PageMaker pm = new PageMaker();
			pm.setScri(scri);
			pm.setTotalCount(cnt);
			
			/*寃뚯떆�뙋�뿉 DB 異쒕젰*/
			ArrayList<BoardVo> alist = bd.boardSelectAll(scri);		// DB �뜲�씠�꽣瑜� 媛��졇�삤湲� �쐞�빐 �뜲�씠�꽣 �뻾(alist) �젙�쓽 �썑 request�뿉 �쟾�넚
			request.setAttribute("alist", alist);
			request.setAttribute("pm", pm);
			
			// 寃뚯떆湲� �씤�뜳�뒪 異붿텧
			String fbidx = request.getParameter("fbidx");
			int fbidx_ = Integer.parseInt(fbidx);

			// 寃뚯떆湲� 蹂닿린
			bd = new BoardDAO(); // �쟾�뿭蹂��닔�뿉 BoardDAO 議댁옱
			BoardVo bv = bd.boardSelectOne(fbidx_);
			request.setAttribute("bv", bv);

			// �뙎湲�
			ArrayList<CommentVo> clist = cd.selectComment(fbidx_);
			request.setAttribute("clist", clist);
			
			/*�씠�룞*/
			RequestDispatcher rd = request.getRequestDispatcher("/board/boardView.jsp");
			rd.forward(request, response);
		}
		
		
		// 寃뚯떆湲� �궘�젣
		else if (command.equals("/board/boardDeleteAction.do")) {
			
			String fbidx = request.getParameter("fbidx");
			int fbidx_ = Integer.parseInt(fbidx);
			
			cd = new CommentDAO();
			int value = cd.deleteBoard(fbidx_);
			
			response.sendRedirect(request.getContextPath()+"/board/board.do");
			
		}
		
		
		// �뙎湲� �벑濡�
		else if (command.equals("/board/boardCommentAction.do")) {
			
			// �꽭�뀡�쑝濡� 遺��꽣 �젙蹂대�� �뿰寃�
			HttpSession session = request.getSession();
			
			int midx = (int) session.getAttribute("midx");
			int fbidx = Integer.parseInt(request.getParameter("fbidx"));
			String cmWriter = request.getParameter("cmWriter");
			String cmComment = request.getParameter("cmComment");
			// cmidx�뒗 �옄�룞�쑝濡� �꽕�젙�릺誘�濡� 蹂��닔濡� �궗�슜�븯吏� �븡�뒗�떎.
			
			// �뜲�씠�꽣 �떞湲�
			cd = new CommentDAO();
			int value = cd.insertComment(fbidx, cmWriter, cmComment, midx);
			// 寃곌낵 泥섎━
			response.sendRedirect(request.getContextPath()+"/board/boardView.do?fbidx="+fbidx+"");
		}
		
		
		// �뙎湲� �궘�젣
		else if (command.equals("/board/boardCommentDeleteAction.do")) {
			
			// 蹂��닔 媛��졇�삤湲�
			HttpSession session = request.getSession();
			
			int fbidx = Integer.parseInt(request.getParameter("fbidx"));
			
			String cmidx = request.getParameter("cmidx");
			int cmidx_ = Integer.parseInt(cmidx);
			int value = cd.deleteComment(cmidx_);
			
			response.sendRedirect(request.getContextPath()+"/board/boardView.do?fbidx="+fbidx+"");
		}
		
		
	}
			


	
	public void doPost(HttpServletRequest request, HttpServletRequest response) {
		
	};

}
