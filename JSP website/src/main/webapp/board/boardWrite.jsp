<%@page import="Domain.SearchCriteria"%>
<%@page import="Domain.PageMaker"%>
<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.BoardVo" %>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="javax.servlet.http.HttpSession" %>

<%
if (session.getAttribute("midx") == null){
	
	String uri = request.getRequestURI();
	session.setAttribute("saveUrl", uri.substring(0, uri.length()-3) + "do");
	
	out.println("<script>");
	out.println("alert('로그인 해주세요.')");
	out.println("location.href='"+request.getContextPath()+"/member/memberLogin.do'");
	out.println("</script>");
}
%>

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
 			
 			var fm = document.frm1
 			
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
			fm.enctype = "multipart/form-data";		// 이미지와 텍스트를 위한 데이터 전송 타입 
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
          <a href="../main/main.do">
            <img src="../imgs/logo.png" alt="logo" style="width: 100%" />
          </a>
        </div>

				<!-- 프로필 이미지 -->
        <div class="profile_img">
<% if (session.getAttribute("midx") != null && session.getAttribute("memberimg") != null) { %>
          <img
            src="../imgs/<%=session.getAttribute("memberimg")%>"
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
<%} else { %>
        <img
            src="../imgs/profile_none.jpg"
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
<%} %>

				<!-- 사용자 이름 -->
				<div>
<% if (session.getAttribute("midx") == null ) {%>
				<p>로그인이 필요합니다.</p>
<%} else {%>
				<p>
<%
	if (session.getAttribute("midx") != null) {
		out.println(session.getAttribute("memberId") + "님");
	}
%>
				</p>
				<p>오늘도 화이팅하세요!</p>
<%} %>
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
            <a href="<%=request.getContextPath() %>/main/main.do" style="text-decoration: none;"><li>메인</li></a>
          </div>        
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
 								out.println("<a href='"+request.getContextPath()+"/member/memberLogin.do' style='text-decoration:none'>로그인</a>");
 								out.println("</div>");
 								out.println("&nbsp;&nbsp;");
 								out.println("<div name='memberJoin'>");
 								out.println("<a href='"+request.getContextPath()+"/member/memberJoin.do' style='text-decoration:none'>회원가입</a>");
 								out.println("</div>");
 										
 							}
 							// 로그인 후 : 로그아웃/마이페이지
 							else if (session.getAttribute("midx") != null) {
 							
 								out.println("<div name='logout'>");
 								out.println("<a href='"+request.getContextPath()+"/member/memberLogout.do' style='text-decoration:none'>로그아웃</a>");
 								out.println("</div>");
 								out.println("&nbsp;&nbsp;");
 								out.println("<div name='myPage'>");
 								out.println("<a href='"+request.getContextPath()+"/member/memberMyPage.do' style='text-decoration:none'>마이페이지</a>");
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
                 		<form name="frm1">
                  	<h3>게시글 쓰기</h3>
           	         	<table class="table" >
					         			<tr>
					         				<th class="col-sm-2" scope="col">작성자</th>
					         				<td style="text-align:left;" colspan="2">
	 					         				<div class="col-sm-3">
	 						         				<input name="FBWRITER" type="text" class="form-control col-sm-3" value="<%=session.getAttribute("memberId") %>" readonly>
	 					         				</div>
 				         					</td>
					         			</tr>
					         			<tr>
					         				<th class="col-sm-2" scope="col">카테고리</th>
				         					<td style="text-align:left;" colspan="2">
 					         					<div class="col-sm-3">
			                          <select name="FBCATEGORY" id="" class="form-select">
 			                          <option value="전체">전체</option>
 			                          <option value="공지">공지</option>
 			                          <option value="자유/소통">자유/소통</option>
 			                          <option value="운동법">운동법</option>
 			                          <option value="식단">식단</option>
 			                          <option value="인증">졸업 인증</option>
 		                           </select>
                         		</div>
                         	</td>
					       				</tr>
					         			<tr>
					         				<th class="col-sm-2" scope="col">제목</th>
					         				<td style="text-align:left;" colspan="2">
 														<input name="FBTITLE" type="text" class="form-control">
 													</td>
					       				</tr>
					         			<tr>
					         				<th class="col-sm-2" scope="col">내용</th>
					         				<td style="text-align:left;" colspan="2">
						         				<div style="min-height: 200px;">
					         						<textarea name="FBCONTENT" class="form-control" id="" cols="75" rows="10" style="resize: none;"></textarea>
						         				</div>
			         						</td>
					       				</tr>
					       				<tr>
					         				<th class="col-sm-2" scope="col">첨부파일</th>
					         				<td style="text-align:left;" colspan="2">
				         						<input class="form-control" type="file" name="filename"> <!-- getFileNames 메서드로 읽어들이기 위해 name 옵션 필요(명칭은 중요하지 않아보인다) --> 
			         						</td>
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
            	&nbsp;
              &nbsp;
              <div class="row" style="text-align: right">
			         	<div class="col-sm-12">
				         	<button class="btn btn-primary" id="writeBtn" type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardWrite.do'">
				          	새 글 쓰기
				          </button>
				        </div>
		        	</div>
              <div class="row">
	              <div class="col justify-content-around">
		              <button name="category" value="all" class="btn btn-light" onclick="location.href='<%=request.getContextPath()%>/board/board.do'">전체</button>
		              <button name="category" value="free" class="btn btn-light" onclick="location.href='<%=request.getContextPath()%>/board/board.do?category=자유/소통'">자유/소통</button>
		              <button name="category" value="workout" class="btn btn-light" onclick="location.href='<%=request.getContextPath()%>/board/board.do?category=운동'">운동</button>
		              <button name="category" value="diet" class="btn btn-light" onclick="location.href='<%=request.getContextPath()%>/board/board.do?category=식단'">식단</button>
		              <button name="category" value="certified" class="btn btn-light" onclick="location.href='<%=request.getContextPath()%>/board/board.do?category=인증'">인증</button>
		            </div>
		          </div>
              <div class="row">
              	<div class="col">
	               	<form class="input-group justify-content-end" name="frm" action="<%=request.getContextPath() %>/board/board.do" method="get">
		                <div class="col-sm-1.5">
			                <select class="form-select" name="searchType">
			                	<option value="fbtitle">제목</option>
			                	<option value="fbidx">번호</option>
			                	<option value="fbwriter">작성자</option>
			                </select>
		                </div>
		                <div class="col-sm-3">
				           		<input type="text" name="keyword" class="form-control"> 
		                </div>
		                <div class="input-group-btn">
		             			<button type="submit" class="btn btn-secondary justify-content-end">검색</button>
		                </div>
	               	</form>
 	            	</div>
             	</div>
             	&nbsp;
             	&nbsp;
	              <div class="row">  
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
                      <td><a href="<%=request.getContextPath() %>/board/boardView.do?fbidx=<%=bvv.getFbidx() %>" style="text-decoration: none; color: black;"><%=bvv.getFbTitle() %></a></td>
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
							+"/board/boardWrite.do?page=1"
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>◀</a>");
}
	
// < : prev page array 이동
if (pm.isPrev()) {
	out.println("<a href='"+request.getContextPath()
							+"/board/boardWrite.do?page="+(pm.getStartPage()-1)
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>◁</a>");
}

// 페이지 번호
for (int i = pm.getStartPage(); i <= pm.getEndPage(); i++){
	out.println("<a href='"+request.getContextPath() 
							+"/board/boardWrite.do?page="+i
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>"+i+"</a>");			
}

// > : next page array 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/board/boardWrite.do?page="+(pm.getEndPage()+1)
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>▷</a>");
}

// 맨뒤: last page 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/board/boardWrite.do?page="+(pm.getTotalCount()/20+1)
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>▶</a>");
}
%>                  
                 </p>
               </div>
             </div>
           </div>
         </div>
       </div>
     </div>
  </body>
</html>
