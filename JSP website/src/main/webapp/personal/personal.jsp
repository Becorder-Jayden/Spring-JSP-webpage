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
          <!-- 페이지 이름 -->
          <div>
            <h1>퍼스널 데이터</h1>
          </div>

          <!-- 기록 등록 -->
          <div class="row">
            <h3>일일 기록 등록 : 
              <script>
                date = new Date();
                year = date.getFullYear();
                month = date.getMonth() + 1;
                day = date.getDate();
                document.write(year+"년 "+month+"월 "+day+"일");
              </script>
            </h3>
            <div class="row" style="margin:auto;">
              <div class="col-sm-3">
                <input type="image" alt="인증사진 업로드" />
                  <button href="#" class="btn btn-secondary">사진 업로드</button>
              </div>
              <div class="col-sm-9">
                <div class="row">
                  <div class="row">
                    <div class="col-sm-4">
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="현재 체중">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <button href="#" class="btn btn-primary">등록</button>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="form-floating col-sm-10">
                    <textarea name="" id="" cols="40" rows="10" class="form-control" placeholder="운동/식단/기록 등" style="resize:none;"></textarea>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- 잔디형 그래프 -->
          <div class="row">
            <h3>잔디 그래프</h3>
            <div class="row" style="margin:auto;">
              <!-- C.이미지 삽입으로 대체해야 함 -->
              <img src="imgs/grass_graph.PNG" alt="잔디 그래프" />
            </div>
          </div>

          <!-- 주간 기록 확인  -->
          <div class="row">
            <h3>주간 기록</h3>
            <div class="row" style="margin:auto; text-align: center;">
              <table>
                <tr>
                  <th>요일</th>
                  <th>월</th>
                  <th>화</th>
                  <th>수</th>
                  <th>목</th>
                  <th>금</th>
                  <th>토</th>
                  <th>일</th>
                </tr>
                <tr>
                  <th>사진 등록</th>
                  <td><img src="imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                </tr>
                <tr>
                  <th>기록</th>
                  <td>70.2kg</td>
                  <td>74.2kg</td>
                  <td>70.9kg</td>
                  <td>70.8kg</td>
                  <td>70.6kg</td>
                  <td>70.2kg</td>
                  <td>70.4kg</td>
                </tr>
              </table>
            </div>
          </div>

          <!-- 아래 편집 -->
          <div class="row">
            <h3>체중 변화 그래프</h3>
            <div class="row" style="margin:auto;">
              <img src="/Back-end/JSP website/imgs/grass_graph.PNG" alt="체중 변화 그래프" />
            </div>
          </div>
          <div class="row">
            <h3>업로드 기록</h3>
          </div>
          <div class="row">
            <table class="table" style="text-align: center;">
              <tr>
                <th>번호</th><th>날짜</th><th>기록</th><th>연속기록</th><th>상세보기</th>
              </tr>
              <!-- C.아코디언 기능에 따라 보기/접기 변환 -->
              <!-- Q. 5/18 HELP 필요 -->
              <tr>
                <td>4</td><td>2022/5/5</td><td>70kg</td></td><td>1일차</td>
                <td>
                  <a href="" id="seeDetails" style="text-decoration:none;" data-bs-toggle="collapse" data-bs-target="#details" aria-controls="details">
                    접기
                  </a>
                  <tr>
                    <td colspan="2">사진 <img src="" alt=""></td><td colspan="2">메모 <p>메모 내용입니다</p></td><td></td>
                  </tr>
                </td>
              </tr>
              <tr>
                <td>3</td><td>2022/5/3</td><td>70kg</td></td><td>3일차</td><td><a href="#" style="text-decoration:none;">보기</a></td>
              </tr>
              <tr>
                <td>2</td><td>2022/5/2</td><td>70kg</td></td><td>2일차</td><td><a href="#" style="text-decoration:none;">보기</a></td>
              </tr>
              <tr>
                <td>1</td><td>2022/5/1</td><td>70kg</td></td><td>1일차</td><td><a href="#" style="text-decoration:none;">보기</a></td>
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
  </body>
</html>
