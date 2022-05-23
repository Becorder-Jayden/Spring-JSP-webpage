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
          <p>
            OOO님
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

      <!-- nav에 해당, 모든 페이지 공통, 수정 x -->
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
        <div class="container" style="left: 200px; width: 90%">
          <div class="row">
            <h1>자유게시판</h1>
            <div class="container">
              <div class="row" style="text-align: right;">
                <div class="col-sm-11">
                  <!-- Q. 토글로 만들 수 있을까? --> <!-- A. 5/17 토글x 아코디언으로 가능 -->
                  <!-- 새 글 쓰기: 아코디언 트리거 -->
                  <div class="accordion" id="accordionParent">
                    <div class="accordion-header" id="headingBtn">
                      <button class="btn btn-primary" id="writeBtn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseWrite" aria-controls="collapseWrite">
                        새 글 쓰기
                      </button>
                    </div>
                    <div id="collapseWrite" class="accordion-collapse collapse" >
                      <div class="accordion-body">

                        <!-- 글쓰기 입력 -->
                          <div class="container" style="text-align: center;">
                            <h3>새 글 쓰기</h3>
                            <div class="row">
                              <div class="row">
                                <div class="col-sm-2">
                                  작성자 
                                </div>
                                <div class="col-sm-3">
                                  <!-- C. 사용자 정보를 불러와서 자동으로 입력가능하도록 함. 수정 불가 -->
                                  <div class="input-group">
                                    <input type="text" class="form-control" placeholder="OOO">
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-sm-2">
                                  카테고리 
                                </div>
                                <div class="col-sm-3">
                                  <select name="" id="" class="form-select">
                                    <option value="All">전체</option>
                                    <option value="All">공지</option>
                                    <option value="All">자유/소통</option>
                                    <option value="All">운동법</option>
                                    <option value="All">식단</option>
                                    <option value="All">졸업 인증</option>
                                  </select>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-sm-2">
                                  제목
                                </div>
                                <div class="col-8">
                                  <div class="input-group">
                                    <input type="text" class="form-control">
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-sm-2">
                                  내용
                                </div>
                                <div class="col-sm-8">
                                    <textarea name="" id="" cols="75" rows="10" style="resize: none;"></textarea>
                                </div>
                              </div>
                            </div>
                            <div class="row" style="text-align: right;">
                              <div class="col-sm-11">
                                <button href="#" class="btn btn-danger">삭제</button> 
                                <button href="#" class="btn btn-secondary">수정</button> 
                                <button href="#" class="btn btn-primary">등록</button>
                              </div>
                            </div>
                          </div>
                      </div>
                    </div>
                  </div>
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
