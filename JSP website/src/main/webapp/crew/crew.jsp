<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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




<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>크루 모집</title>
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
          <div>
            <h1>크루 모집</h1>
          </div>
					&nbsp;
		      &nbsp;
      
          <div class="row">
            <h3>나의 운동 그룹</h3>
            <div class="row" style="margin: auto">
              <div class="container">
                <!-- 모달 트리거 생성 -->
                <button class="btn btn-primary" data-bs-dismiss="modal" data-bs-target="#crewMaker">크루 만들기</button>
                
                <!-- 모달 창 생성 -->
                <div class="modal fade" id="crewMaker" tabindex="-1" aria-hidden="false">
                  <div class="modal-header">
                    <div class="modal-dialog">
                      <div class="modal-header">
                        <h5 class="modal-title">크루 만들기<h5>
                      </div>
                      <div class="modal-body">
                        
                      </div>
                    </div>
                  </div>
                </div>
                
                
                
                <button href="#" class="btn btn-secondary">홍보</button>
                <button href="#" class="btn btn-secondary">수정</button>
                <button href="#" class="btn btn-danger">삭제</button>
              </div>
              <table class="table">
                <tr>
                  <th>크루명</th>
                  <th>크루 목표</th>
                  <th>참여멤버</th>
                  <th>정원</th>
                </tr>
                <tr>
                  <td>말년을 건강하게</td>
                  <td>youtube 다이어트 프로그램</td>
                  <td>침착맨, 주펄, 기안84, 전무님</td>
                  <td>4/4</td>
                </tr>
                <tr>
                  <td>배성재의 텐</td>
                  <td>sbs 라디오 진행 매주 몸무게 발표</td>
                  <td>배성재, 침착맨, 윤태진<a href="" style="text-decoration: none"> + 멤버 추가</a></td>
                  <td>3/4</td>
                </tr>
              </table>
            </div>
          </div>
          &nbsp;
          &nbsp;
          <div class="row">
            <h3>팀원 모집 중인 그룹</h3>
            <div class="row" style="margin: auto">
              <table class="table">
                <!-- 비고: 보기/접기 전환 -->
                <!-- 5/17 C.아코디언 작업 필요 -->
                <tr>
                  <th>크루명</th>
                  <th>크루 목표</th>
                  <th>정원</th>
                  <th>기간</th>
                  <th>비고</th>
                </tr>
                <tr>
                  <td>이젠 컴퓨터 학원</td>
                  <td>개발자 양성과정 마무리 때까지 2kg 빼기</td>
                  <td>3/8</td>
                  <td>2022/03/15 ~ 2022/08/31</td>
                  <td><a href="#" style="text-decoration: none;">보기</a></td>
                </tr>
                <tr>
                  <th>참여멤버</th>
                  <td><span>강사님1, 학원생1, 학운생2</span></td>
                  <td></td>
                  <td></td>
                  <td><button class="btn btn-secondary" style="text-decoration:none;">참여 신청</a></td>
                </tr>
                <tr>
                  <td>롯데 슈퍼</td>
                  <td>과자 안먹고 운동</td>
                  <td>2/4</td>
                  <td>2022/03/00 ~ 2022/10/31</td>
                  <td><a href="#" style="text-decoration: none;">보기</a></td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>

