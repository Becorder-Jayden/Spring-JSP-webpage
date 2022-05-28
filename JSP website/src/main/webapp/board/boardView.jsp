<%@page import="Service.BoardDAO"%>
<%@page import="Domain.SearchCriteria"%>
<%@page import="Domain.PageMaker"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.BoardVo" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="javax.servlet.http.HttpSession" %>
<%
	ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
	SearchCriteria scri = (SearchCriteria)request.getAttribute("scri");
	BoardVo bv = (BoardVo)request.getAttribute("bv");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>퍼스널 데이터</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link href="main.css" id="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  	
 	<script>
 		function enroll() {
 			
 			var fm = document.frm
 			
 			
			if (fm.FBTITLE.value==""){															
 				alert("제목을 입력하세요");
 				fm.FBTITLE.focus();																// Q. focus가 갔다가 바로 사라지는데 해결하는 방법은? 5/25
 				return;																						// A. form 태그 안에 있는 buttom의 'type=button'이 지정되어 있지 않으면 바로 submit이 작동된다. 버튼 태그에 type을 추가해서 해결
 			}
 			else if (fm.FBCONTENT.value==""){
 				alert("내용을 입력하세요");
 				fm.FBCONTENT.focus();
 				return;
 			}
 			 				
			fm.action = "<%=request.getContextPath()%>/board/boardWriteAction.do";
			fm.method = "post";
			fm.submit();
 		
 		}
 		
 	</script>
  
  
  </head>
  <body>
    <div class="layout-container" style="max-width: 1000px">
      <!-- 사이드 메뉴 바 -->
      <div
        class="side_menu"
        id="menu"
        style="
          width: 200px;
          height: 100%;
          position: fixed;
          background-color: lightgray;
          text-align: center;
        "
      >
        <!-- 페이지 로고 -->
        <div class="logo">
          <a href="../index.jsp">
            <img src="../imgs/logo.jpg" alt="logo" style="width: 100%" />
          </a>
        </div>

        <!-- 프로필 -->
        <div class="profile_img">
          <img
            src="../imgs/profile_ex.jpg"
            alt="profile_img"
            style="
              height: 100px;
              width: 100px;
              border-radius: 50px;
              margin-top: 50px;
            "
          />
        </div>
        <br>
        <!-- 각오 -->
        <div class="motto">
          <p>
<%
	if (session.getAttribute("midx") != null) {
		out.println(session.getAttribute("memberId") + "님");
	}
%>
	         <br>
            n일 째 방문을 환영합니다.
          </p>
          <p id="33">어제보다 나은 오늘 ☆★</p>
        </div>

        <!-- 메뉴 -->
        <ul
          style="
            list-style-type: none;
            background-color: lightyellow;
            text-align: center;
            display: inline-flexbox;
            position: relative;
            text-align: left;
            margin-top: 50px;
          "
        >
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/personal/personal.do" style="text-decoration: none;"><li>퍼스널 데이터</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/group/group.do" style="text-decoration: none"><li>그룹 데이터</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/crew/crew.do" style="text-decoration: none"><li>크루 모집</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/board/board.do" style="text-decoration: none"><li>자유게시판</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/faq/faq.do" style="text-decoration: none"><li>이용 문의</li></a>
          </div>
        </ul>
      </div>

      <!-- nav에 해당, 모든 페이지 공통, 수정 x -->
      <div
        class="nav"
        style="position: relative; left: 180px; justify-content: end"
      > 

				<%
 				// 로그인 전 : 로그인 / 회원가입
 							if (session.getAttribute("midx") == null) {
 								out.println("<div name='login'>");
 								out.println("<a href='" + request.getContextPath() + "' style='text-decoration:none'>로그인</a>");
 								out.println("</div>");
 								out.println("&nbsp;&nbsp;");
 								out.println("<div name='memberJoin'>");
 								out.println("<a href='" + request.getContextPath() + "' style='text-decoration:none'>회원가입</a>");
 								out.println("</div>");
 										
 							}
 							// 로그인 후 : 로그아웃/마이페이지
 							else if (session.getAttribute("midx") != null) {
 							
 								out.println("<div name='logout'>");
 								out.println("<a href='" + request.getContextPath() + "' style='text-decoration:none'>로그아웃</a>");
 								out.println("</div>");
 								out.println("&nbsp;&nbsp;");
 								out.println("<div name='myPage'>");
 								out.println("<a href='" + request.getContextPath() + "' style='text-decoration:none'>마이페이지</a>");
 								out.println("</div>");
 							};
 				%>
      </div>

      <!-- Q. side_menu가 끝나는 지점부터 page가 설정될 수 있도록 세팅하는 방법? -->
      <!-- 페이지 부분 -->
      <div
        class="page"
        id="page"
        style="
          position: relative;
          left: 200px;
          background-color: none;
          position: flex;
        "
      >
        <!-- 페이지 본문 내용 -->
        <div class="container" style="left: 200px; width: 90%">
          <div class="row">
            <h1>자유게시판</h1>
            <div class="container">
              <div class="row" style="text-align: right;">
                <div class="col-sm-11">
                  <!-- 글쓰기 입력 -->
                  <div class="container" style="text-align: center;">
                 		<form name="frm">
                  	<h3>게시글 보기</h3>
           	         	<table class="table" >
					         			<tr>
					         				<th class="col-sm-2" scope="col">작성자</th>
					         				<td style="text-align:left;" colspan="2""><%=bv.getFbWriter() %></td>
					         			</tr>
					         			<tr>
					         				<th class="col-sm-2" scope="col">카테고리</th>
					         				<td style="text-align:left;" colspan="2"><%=bv.getFbCategory() %></td>
					       				</tr>
					         			<tr>
					         				<th class="col-sm-2" scope="col">제목</th>
					         				<td style="text-align:left;" colspan="2"><%=bv.getFbTitle() %></td>
					       				</tr>
					         			<tr>
					         				<th class="col-sm-2" scope="col">내용</th>
					         				<td style="text-align:left;" colspan="2">
						         				<div style="min-height: 200px;">
					         						<%=bv.getFbContent() %>
						         				</div>
			         						</td>
					       				</tr>
					       				<tr>
					       					<th class="col-sm-2" scope="col">댓글</th>
					       					<td class="col-sm-2" style="text-align:left;">작성자</td>
					       					<td style="text-align:left;">댓글</td>
					       				</tr>
					         		</table>
	                    <div class="row" style="text-align: right;">
	                      <div class="col-sm-11">
		                      <button type="button" onclick="location.href='<%=request.getContextPath()%>/board/board.do'" class="btn btn-danger">취소</button> 
		                      <button type="button" class="btn btn-secondary">수정</button>	
		                      <button type="button" onclick="enroll();" class="btn btn-primary">등록</button>	
	                      </div>
	                    </div>
	                  </form>  
                 	</div>
  	            </div>
		          </div>
            </div>
         	</div>
         	
         	
         	
         	
         	
         	
          <div class="row" style="margin:auto;">
             <div class="row">
	              <div class="input-group">
	              	<div class="col">
		                <div class="input-group-append">
		                 <button href="#" class="btn btn-light">전체</button>
		                 <button href="#" class="btn btn-light">공지</button>
		                 <button href="#" class="btn btn-light">자유/소통</button>
		                 <button href="#" class="btn btn-light">운동법</button>
		                 <button href="#" class="btn btn-light">식단</button>
		                 <button href="#" class="btn btn-light">다이어트 성공 인증</button>
		              	</div>
	                </div>
	                <div class="col-sm-3">
				           	<input type="text" class="form-control"> 
	                </div>
	              	<div class="input-group-append">	<!-- 부트스트랩 사용시 form-control 옆에 두기 위해 input-group-append를 사용해야 함 -->
	              		<button class="btn btn-secondary justify-content-end"> 검색</button>
	              	</div>
	             	</div>
             	</div>
              <div class="row" style="margin:auto;">
                <table class="table" style="text-align:center;">
                  <tr>
                    <th>번호</th>
                    <th>카테고리</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                  </tr>
<%
for (BoardVo bvv : alist) {
%>               
                  <tr>
                      <td><%=bvv.getFbidx() %></td>
                      <td><%=bvv.getFbCategory() %></td>
                      <td>
                      	<a href="<%=request.getContextPath() %>/board/boardView.do?fbidx=<%=bvv.getFbidx() %>&fbcategory=<%=bvv.getFbCategory() %>&fbtitle=<%=bvv.getFbTitle() %>&fbcontent=<%=bvv.getFbContent() %>&fbwriter=<%=bvv.getFbWriter() %>" style="text-decoration: none; color: black;">
                       		<%=bvv.getFbTitle() %>
                     		</a>
                   		</td>
                      <td><%=bvv.getFbWriter() %></td>
                      <td><%=bvv.getFbWriteDate() %></td>
                  </tr>
<%} %>
                </table>
                <div class="row text-center" style="font-size: 20px; margin:auto;">
                  <p>
<%
// Q. boardWrite 페이지에서 게시글 이동했을 때 스크롤이 안올라갔으면 좋겠다(renewal 말고?)??


/* 페이징 이동 */
// 맨앞 : first page 이동
if (pm.isPrev()) {
	out.println("<a href='"+request.getContextPath()
							+"/board/boardWrite.do?page=1' style='text-decoration:none;'>◀</a>");
}
	
// < : prev page array 이동
if (pm.isPrev()) {
	out.println("<a href='"+request.getContextPath()
							+"/board/boardWrite.do?page="+(pm.getStartPage()-1)+"' style='text-decoration:none;'>◁</a>");
}

// 페이지 번호
for (int i = pm.getStartPage(); i <= pm.getEndPage(); i++){
	out.println("<a href='"+request.getContextPath() 
							+"/board/boardWrite.do?page="+i+"' style='text-decoration:none;'>"+i+"</a>");			
}

// > : next page array 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/board/boardWrite.do?page="+(pm.getEndPage()+1)+"' style='text-decoration:none;'>▷</a>");
}

// 맨뒤: last page 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/board/boardWrite.do?page="+(pm.getTotalCount()/scri.getPerPageNum()+1)+"' style='text-decoration:none;'>▶</a>");
}
%>                  
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>