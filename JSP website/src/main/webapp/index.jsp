<%@page import="Dbconn.Dbconn"%>
<%@page import="Domain.MemberVo"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@page import="javax.swing.text.Document"%>
<%@page import="java.io.Console"%>
<%
	MemberVo mv = (MemberVo) request.getAttribute("mv");
%>
<% 
	Dbconn dbconn = new Dbconn();
	System.out.println("dbconn: " + dbconn);
%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>메인 페이지</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link href="main.css" id="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
          <a href="<%=request.getContextPath() %>/main/main.do">			
            <img src="imgs/logo.png" alt="logo" style="width: 100%" />
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
            <a href="<%=request.getContextPath() %>/personal/personal.do" style="text-decoration: none"
              ><li>퍼스널 데이터</li></a
            >
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/group/group.do" style="text-decoration: none"
              ><li>그룹 데이터</li></a
            >
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/crew/crew.do" style="text-decoration: none"
              ><li>크루 모집</li></a
            >
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/board/board.do" style="text-decoration: none"
              ><li>자유게시판</li></a
            >
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/faq/faq.do" style="text-decoration: none"
              ><li>이용 문의</li></a
            >
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
        id="index"
        style="
          position: relative;
          left: 200px;
          background-color: none;
          position: relative;
        "
      >
        <!-- 페이지 본문 내용 -->
        <div class="row" style="margin: auto">
          <div class="row" style="margin: auto">
            <img src="./imgs/main.png" alt="메인 이미지" />
          </div>
          <div class="row" style="margin: auto">
            <!-- C. 이미지 배치시 사이즈 조절 필요-->
            <div class="col-sm-4">
              <img
                src="./imgs/records.png"
                alt="main-part"
                style="width: 100%"
              />
            </div>
            <div class="col-sm-4">
              <img
                src="./imgs/gymMate.png"
                alt="main-part"
                style="width: 100%"
              />
            </div>
            <div class="col-sm-4">
              <img
                src="./imgs/commu.png"
                alt="main-part"
                style="width: 100%"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
