<%@page import="org.apache.coyote.RequestGroupInfo"%>
<%@page import="org.apache.catalina.connector.OutputBuffer"%>
<%@page import="javax.script.ScriptContext"%>
<%@page import="java.io.Console"%>
<%@page import="Domain.*"%>
<%@page import="java.util.ArrayList"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
	ArrayList<BoardVo> alist = (ArrayList<BoardVo>)request.getAttribute("alist");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
	SearchCriteria scri = (SearchCriteria)request.getAttribute("scri");
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
            <a href="<%=request.getContextPath()%>/personal/personal.do" style="text-decoration: none;"><li>퍼스널 데이터</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath()%>/group/group.do" style="text-decoration: none"><li>그룹 데이터</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath()%>/crew/crew.do" style="text-decoration: none"><li>크루 모집</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath()%>/board/board.do" style="text-decoration: none"><li>자유게시판</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath()%>/faq/faq.do" style="text-decoration: none"><li>이용 문의</li></a>
          </div>
        </ul>
      </div>


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
            <div class="container" style="margin:auto;">
              <div class="row" style="text-align: right;">
                <div class="col-sm-12">
	                <button class="btn btn-primary" id="writeBtn" type="button" onclick="location.href='<%=request.getContextPath()%>/board/boardWrite.do'">
	                  새 글 쓰기
	                </button>
                </div>
              </div>
               &nbsp;
               &nbsp;
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
/* 페이징 이동 */
// 맨앞 : first page 이동
if (pm.isPrev()) {
	out.println("<a href='"+request.getContextPath()
							+"/board/board.do?page=1"
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>◀</a>");
}
	
// < : prev page array 이동
if (pm.isPrev()) {
	out.println("<a href='"+request.getContextPath()
							+"/board/board.do?page="+(pm.getStartPage()-1)
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>◁</a>");
}

// 페이지 번호
for (int i = pm.getStartPage(); i <= pm.getEndPage(); i++){
	out.println("<a href='"+request.getContextPath() 
							+"/board/board.do?page="+i
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>"+i+"</a>");			
}

// > : next page array 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/board/board.do?page="+(pm.getEndPage()+1)
							+"&category="+pm.encoding(pm.getScri().getCategory())
							+"&keyword="+pm.encoding(pm.getScri().getKeyword())
							+"&searchType="+pm.encoding(pm.getScri().getSearchType())
							+"' style='text-decoration:none;'>▷</a>");
}

// 맨뒤: last page 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/board/board.do?page="+(pm.getTotalCount()/20+1)				// Q.페이지 계산 분모를 20이 아니라 변수로 불러오는 방법?
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
      </div>
    </div>
  </body>
</html>