<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
          <p>어제보다 나은 오늘 ☆★</p>
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
            <a href="<%=request.getContextPath() %>/personal/personal.jsp" style="text-decoration: none;"><li>퍼스널 데이터</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/group/group.jsp" style="text-decoration: none"><li>그룹 데이터</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/crew/crew.jsp" style="text-decoration: none"><li>크루 모집</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/board/board.jsp" style="text-decoration: none"><li>자유게시판</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/faq/faq.jsp" style="text-decoration: none"><li>이용 문의</li></a>
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
	                <button class="btn btn-primary" id="writeBtn" type="button" onclick="location.href='<%=request.getContextPath() %>/board/boardWrite.do';">
	                  새 글 쓰기
	                </button>
                </div>
              </div>
              <div class="row" style="margin:auto;">
                <div class="col">
                  <button herf="#" class="btn btn-light">전체</button>
                  <button herf="#" class="btn btn-light">공지</button>
                  <button herf="#" class="btn btn-light">자유/소통</button>
                  <button herf="#" class="btn btn-light">운동법</button>
                  <button herf="#" class="btn btn-light">식단</button>
                  <button herf="#" class="btn btn-light">다이어트 성공 인증</button>
                </div>
                <div class="row">
                  <div class="col-sm-3">
                    <input class="form-control" type="text">
                  </div>
                  <div class="col-sm-2">
                    <button herf="#" class="btn btn-secondary">검색</button>
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
                    <tr>
                        <td>2</td>
                        <td>공지</td>
                        <!-- page 이동 예시  -->
                        <td><a href="bulletin_board_page.html" style="text-decoration: none; color: black;">온라인 예절을 지켜주세요.</a></td>
                        <td><a href="#" style="text-decoration: none; color: black;">침착맨</a></td>
                        <td>2022/05/03</td>
                      </a>
                    </tr>
                    <tr>
                      <td>5</td>
                      <td>공지</td>
                      <td><a href="#" style="text-decoration: none; color: black;">일본에서 건너온 저탄고지 다이어트</a></td>
                      <td><a href="#" style="text-decoration: none; color: black;">김풍</a></td>
                      <td>2022/05/05</td>
                    </tr>
                    <tr>
                      <td>4</td>
                      <td>공지</td>
                      <td><a href="#" style="text-decoration: none; color: black;">다이어트 중 친오빠 특</a></td>
                      <td><a href="#" style="text-decoration: none; color: black;">기안84</a></td>
                      <td>2022/05/04</td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>공지</td>
                      <td><a href="#" style="text-decoration: none; color: black;">어젯밤 꿈에서 먹은 음식</a></td>
                      <td><a href="#" style="text-decoration: none; color: black;">침착맨</a></td>
                      <td>2022/05/04</td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>공지</td>
                      <td><a href="#" style="text-decoration: none; color: black;">온라인 예절을 지켜주세요</a></td>
                      <td><a href="#" style="text-decoration: none; color: black;">침착맨</a></td>
                      <td>2022/05/03</td>
                    </tr>
                    <tr>
                      <td>1</td>
                      <td>자유/소통</td>
                      <td><a href="#" style="text-decoration: none; color: black;">현기증 나니깐 어서 라면 끓여주세요</a></td>
                      <td><a href="#" style="text-decoration: none; color: black;">주펄</a></td>
                      <td>2022/05/01</td>
                    </tr>
                  </table>
                  <div class="row text-center" style="font-size: 20px; margin:auto;">
                    <p>
                      <a href="" style="text-decoration: none"><</a>
                      <a href="" style="text-decoration: none">1</a>
                      <a href="" style="text-decoration: none">2</a>
                      <a href="" style="text-decoration: none">3</a>
                      <a href="" style="text-decoration: none">4</a>
                      <a href="" style="text-decoration: none">5</a>
                      <a href="" style="text-decoration: none">></a>
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