<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
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
          <a href="index.html">
            <img src="imgs/logo.jpg" alt="logo" style="width: 100%" />
          </a>
        </div>

        <!-- 프로필 -->
        <div class="profile_img">
          <img
            src="imgs/profile_none.jpg"
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
        <!-- 전환: 로그인 요청/각오 -->
        <div class="motto">
          <p>
            로그인 해주세요
          </p>
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

      <!-- navbar, 모든 페이지 공통, 수정 x -->
      <!-- Q. 로그인, 회원가입 글씨 키우는 방법? -->
      <div class="nav" style="position:relative; left:180px; justify-content: end">
        <div class="end" name="login">
          <a href="<%=request.getContextPath() %>/member/memberLogin.do" style="text-decoration: none">로그인</a>
        </div>
        &nbsp;&nbsp;
        <div class="end" name="enroll">
          <a href="<%=request.getContextPath() %>/member/memberJoin.do" style="text-decoration: none">회원가입</a>
        </div>
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
        <div class="container" style="left: 200px; width:90%">
          <div class="row">
            <h1>로그인</h1>
            
            <!-- Q.페이지 중앙으로 이동 --> <!-- A. col 클래스에 margin:auto 적용: 가운데 정렬이 가능하다. -->
              <div class="col-sm-4" style="margin:auto;">
                <div class="row">
                    <img src="./imgs/representative_img.PNG" alt="이미지/아이콘" style="width:300px;">
                </div> 
                
                <div class="container">
                  <div class="row">
                    <input class="form-control" type="text" placeholder="ID">
                  </div>
                  <div class="row">
                    <input class="form-control" type="text" placeholder="Password">
                  </div>
                  <div class="row">
                    <div class="col-sm-6">
                      <input type="checkbox">아이디 저장
                    </div>
                    <div class="col-sm-6">
                      <input type="checkbox">자동 로그인
                    </div>
                  </div>
                  <div class="row">
                    <button class="btn btn-primary">LOGIN</button>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
