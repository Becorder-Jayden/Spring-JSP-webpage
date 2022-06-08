<%@page import="Domain.PageMaker"%>
<%@page import="Domain.GroupVo"%>
<%@page import="java.util.ArrayList"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
if (session.getAttribute("midx") == null){
	
	session.setAttribute("saveUrl", request.getRequestURI());
	
	out.println("<script>");
	out.println("alert('로그인 해주세요.')");
	out.println("location.href='"+request.getContextPath()+"/member/memberLogin.do'");
	out.println("</script>");
}
%>
<%
	ArrayList<GroupVo> glist = (ArrayList<GroupVo>)request.getAttribute("glist");
	GroupVo gv = (GroupVo)request.getAttribute("gv");
	PageMaker pm = (PageMaker)request.getAttribute("pm");
%>




<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>그룹 데이터</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link href="main.css" id="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
  <script>
  	function enrollFn() {
  		var fm = document.write;
 			
  		if (fm.gbtitle.value == "") {
 				alert("제목을 입력하세요.");
				fm.gbtitle.focus();
				return;
  		} else if (fm.gbcontent.value == "") {
  			alert("내용을 입력하세요.");
  			fm.gbcontent.focus();
  			return;
  		}
  		
  		fm.action = "<%=request.getContextPath()%>/group/groupWriteAction.do";
  		fm.method = "post";
  		fm.enctype = "multipart/form-data";
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
          <a href="<%=request.getContextPath()%>">
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
          <p>어제보다 가벼운 오늘 ☆★</p>
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
            <a href="<%=request.getContextPath() %>" style="text-decoration: none;"><li>메인</li></a>
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


      <!-- Q. 로그인, 회원가입 글씨 키우는 방법? -->
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
        id="index"
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
            <h1>그룹게시판</h1>
            <div class="container">
              <div class="row" style="text-align: right;">
                <div class="col-sm-11">
                  <!-- 글쓰기 입력 -->
                  <div class="container" style="text-align: center;">
                 		<form name="write">
                  	<h3>게시글 보기</h3>
           	         	<table class="table" >
					         			<tr>
					         				<th class="col-sm-2" scope="col">작성자</th>
					         				<td style="text-align:left;" colspan="2"><%=gv.getGbwriter()%></td>
					         			</tr>
					         			<tr>
					         				<th class="col-sm-2" scope="col">제목</th>
					         				<td style="text-align:left;" colspan="2"><%=gv.getGbtitle() %></td>
					       				</tr>
					         			<tr>
					         				<th class="col-sm-2" scope="col">내용</th>
					         				<td style="text-align:left;" colspan="2">
						         				<div style="min-height: 200px;">
						         				
<% if (gv.getGbfilename() != null ) { %>						         				
						         					<img src="<%=request.getContextPath() %>/imgs/<%=gv.getGbfilename() %>" style="width:500px">
						         					<br>
<%} %>
					         						<%=gv.getGbcontent()%>">
						         				</div>
			         						</td>
					       				</tr>
			         				</table>
	                    <div class="row" style="text-align: right;">
	                      <div class="col-sm-11">
		                      <button type="button" onclick="location.href='<%=request.getContextPath()%>/board/board.do'" class="btn btn-danger">취소</button> 
		                      <button type="button" class="btn btn-secondary">수정</button>	
		                      <button type="button" class="btn btn-primary" onclick="enrollFn()">등록</button>
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
	      <table class="table">
	               <thead>
		               <tr style="text-align:center">
		                 <th scope="col">번호</th>
		                 <th scope="col">제목</th>
		                 <th scope="col">작성자</th>
		                 <th scope="col">게시일</th>
		                 <th scope="col">조회수</th>
		               </tr>
	               </thead>
	               <tbody>
	               
<% for (GroupVo gvv : glist) { %>	               
	                 <tr>
	                   <td style="text-align:center"><%=gvv.getGbidx() %></td>
	                   <td>
		                   <a href="<%=request.getContextPath() %>/group/groupView.do?gbidx=<%=gvv.getGbidx() %>" style="text-decoration: none; color:black;"><%=gvv.getGbtitle() %></a>
		                </td>
		                <td style="text-align:center">
		                	<%=gvv.getGbwriter() %>
	                	</td>
		                <td style="text-align:center"><%=gvv.getGbwritetime() %></td> 
		                <td style="text-align:center"><%=gvv.getGbhit()%></td>
		              </tr>
<%} %>
	              </tbody>
	            </table>
	                  <div class="row text-center" style="font-size: 20px; margin:auto;">
	                   	<p>

<%
/* 페이징 이동 */
// 맨앞 : first page 이동
if (pm.isPrev()) {
	out.println("<a href='"+request.getContextPath()
							+"/group/groupView.do?page=1"
							+"' style='text-decoration:none;'>◀</a>");
}
	
// < : prev page array 이동
if (pm.isPrev()) {
	out.println("<a href='"+request.getContextPath()
							+"/group/groupView.do?page="+(pm.getStartPage()-1)
							+"' style='text-decoration:none;'>◁</a>");
}

// 페이지 번호
for (int i = pm.getStartPage(); i <= pm.getEndPage(); i++){
	out.println("<a href='"+request.getContextPath() 
							+"/group/groupView.do?page="+i
							+"&gbidx="+gv.getGbidx()+"' style='text-decoration:none;'>"+i+"</a>");			
}

// > : next page array 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/group/groupView.do?page="+(pm.getEndPage()+1)
							+"' style='text-decoration:none;'>▷</a>");
}

// 맨뒤: last page 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/group/groupView.do?page="+(pm.getTotalCount()/20+1)				// Q.페이지 계산 분모를 20이 아니라 변수로 불러오는 방법?
							+"' style='text-decoration:none;'>▶</a>");
}
%>



                    </p>
                  </div>	            
	      </div>
	    </div>
  </body>
</html>
