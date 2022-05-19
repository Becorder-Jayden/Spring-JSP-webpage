<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
          <a href="index.html">
            <img src="imgs/logo.jpg" alt="logo" style="width: 100%" />
          </a>
        </div>

        <!-- 프로필 -->
        <div class="profile_img">
          <img
            src="imgs/profile_ex.jpg"
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
          <!-- C. HTML교재 12-1 참고할 것  -->
          <p>
            OOO님
            <br>
            n일 째 방문을 환영합니다.
          </p>
          <p">어제보다 나은 오늘 ☆★</p>
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
            <a href="personal_data.html" style="text-decoration: none"
              ><li>퍼스널 데이터</li></a
            >
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="group_data.html" style="text-decoration: none"
              ><li>그룹 데이터</li></a
            >
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="crew.html" style="text-decoration: none"
              ><li>크루 모집</li></a
            >
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="bulletin_board.html" style="text-decoration: none"
              ><li>자유게시판</li></a
            >
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="faq.html" style="text-decoration: none"
              ><li>이용 문의</li></a
            >
          </div>
        </ul>
      </div>

      <!-- nav에 해당, 모든 페이지 공통, 수정 x -->
      <!-- Q. 로그인, 회원가입 글씨 키우는 방법? -->
      <div
        class="nav"
        style="position: relative; left: 180px; justify-content: end"
      >
        <div class="end" name="login">
          <a href="login.html" style="text-decoration: none">로그인</a>
        </div>
        &nbsp;&nbsp;
        <div class="end" name="enroll">
          <a href="enrollment.html" style="text-decoration: none">회원가입</a>
        </div>
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
            <img src="imgs/main.jpg" alt="메인 이미지" />
          </div>
          <div class="row" style="margin: auto">
            <!-- C. 이미지 배치시 사이즈 조절 필요-->
            <div class="col-sm-4">
              <img
                src="./imgs/main-part.jpg"
                alt="main-part"
                style="width: 100%"
              />
            </div>
            <div class="col-sm-4">
              <img
                src="./imgs/main-part.jpg"
                alt="main-part"
                style="width: 100%"
              />
            </div>
            <div class="col-sm-4">
              <img
                src="./imgs/main-part.jpg"
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
