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
	PageMaker pm = (PageMaker) request.getAttribute("pm");
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
  	function groupGoalWriteFn() {
  		console.log("작동");
  		var fm = document.frm;
  		
  		fm.action = "<%=request.getContextPath()%>/group/groupGoalWriteAction.do";
  		fm.method = "post";
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
          <div>
            <h1>그룹 데이터</h1>
          </div>
          <div class="row">
            <h3>크루 선택</h3>
          </div>
          <div class="row">
            <div class="col">
              <button class="btn btn-secondary">말년을 건강하게</button>
              <button class="btn btn-secondary">배성재의 텐</button>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-6">
              <h3>크루 개요</h3>
              <div class="row">
                <div class="col-sm-3">
                  <p>크루 목표</p>
                </div>
                <div class="col-sm-5">
                  <p>80kg 달성</p>
                </div>
                <div class="col-sm-4">
                  <!-- 모달 실행 트리거 -->
                  <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#gbGoal">
                    크루장 편집
                  </button>

                  <!-- 모달 창 생성 -->
                  <div class="modal fade" id="gbGoal" tabindex="-1" aria-hidden="false">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h5 class="modal-title">크루 목표</h5>
                        </div>
                        <form name="frm">
	                        <div class="modal-body">
	                          <div class="input-group">
	                            <input name="groupGoal" type="text" class="form-control">
	                          </div> 
	                        </div>
	                        <div class="modal-footer">
	                          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	                          <button type="button" class="btn btn-primary" onclick="groupGoalWriteFn()">등록</button>
	                        </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-sm 3">
                  <p>각오 한마디</p>
                </div>
                <div class="col-sm-9">
                  <div class="row">
                    <!-- C. 5초마다 돌아가면서 나타날 수 있도록 함 -->
                    <div class="col-sm-2">
                      <p>침착맨</p>
                    </div>
                    <div class="col-sm-10">
                      <p>이 정돈 껌이지</p>
                    </div>
                    <div class="col-sm-2">
                      <p>주펄</p>
                    </div>
                    <div class="col-sm-10">
                      <p>에이 설마</p>
                    </div>
                    <div class="col-sm-2">
                      <p>김풍</p>
                    </div>
                    <div class="col-sm-10">
                      <p>10만원 내기 정도는 해야겠지?</p>
                    </div>
                  </div>
                  <div class="row-sm-3" style="text-align: center;">
                    <!-- 모달 창 트리거 -->
                    <a href="#" data-bs-toggle="modal" data-bs-target="#gbDetermine" style="text-decoration: none;">
                      등록하기
                    </a>
                    <!-- 모달 생성 -->
                    <div class="modal fade" id="gbDetermine" tabindex="-1" aria-labelledby="gbDetermine" aria-hidden="false">
                      <div class="modal-dialog">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title">각오 한마디</h5> 
                            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                          </div>
                          <div class="modal-body">
                            <div class="input-group">
                              <table class="table">
                                <tr>
                                  <th scope="col">번호</th>
                                  <th scope="col">작성자</th>
                                  <th scope="col">각오</th>
                                </tr>
                                <!-- 번호: 순차증가 자동등록, 작성자: 로그인한 회원의 이름, 각오: input태그 -->
                                <tr>
                                  <td>1</td>
                                  <td>침착맨</td>
                                  <td>이 정도 껌이지</td>
                                </tr>
                                <tr>
                                  <td>2</td>
                                  <td>주펄</td>
                                  <td>에이 설마</td>
                                </tr>
                                <tr>
                                  <td>3</td>
                                  <td>김풍</td>
                                  <td>10만원 내기 정도는 해야겠지?</td>
                                </tr>
                                <tr>
                                  <td>4</td>
                                  <td>OOO</td>
                                  <td>
                                    <div class="input-group" style="text-align: center;">
                                      <input type="input-group-text" class="form-control">
                                    </div>
                                  </td>
                                </tr>
                              </table>
                            </div>
                          </div>     
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="groupGoalWriteFn()">등록</button>
                          </div>
                        </div>     
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <!-- 5/17 C. 오늘 날짜 입력: 자바스크립트 사용 --> <!-- 완료 -->
                <h3>
                  <script>
                    date = new Date();
                    year = date.getFullYear();
                    month = date.getMonth() + 1;
                    day = date.getDate();
                    document.write(year+"/"+month+"/"+day);
                  </script>
                </h3>
              <!-- 위 수정 중 -->
              <div class="row">
                <div class="col-sm-2">
                  <p>침착맨</p>
                </div>
                <div class="col-sm-10">
                  <p>인증 완료</p>
                </div>
                <div class="col-sm-2">
                  <p>주펄</p>
                </div>
                <div class="col-sm-10">
                  <p>인증 완료</p>
                </div>
                <div class="col-sm-2">
                  <p>전무님</p>
                </div>
                <div class="col-sm-10">
                  <p>인증 완료</p>
                </div>
                <div class="col-sm-2">
                  <p>기안84</p>
                </div>
                <div class="col-sm-10">
                  <p>인증 완료</p>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <h3>참여도 랭킹</h3>
            <div class="row" style="margin:auto;">
              <!-- C.다른 그룹과 비교한 성실도 티어 -->
              <div class="col-sm-4">
                <img src="../imgs/representative_img.PNG" alt="" style="width:100%">
              </div>
              <!-- C.재미로 보는 랭킹 -->
              <!-- Q.질문과 이름을 양 끝 배열해야 함  -->
              <!-- C. 그룹 내 랭킹과 돌아가면서 나타나도록 표시 -->
              <div class="col-sm-8">
                <ul class="list-group-flush">
                  <li class="list-group-item">고지가 눈앞에 있는 <strong>기안84</strong></li>
                  <li class="list-group-item">한다면 한다! 끈질긴 <strong>전무님</strong></li>
                  <li class="list-group-item">내가 이 구역의 고인물 <strong>침착맨</strong></li>
                  <li class="list-group-item">상남자 혹은 하남자 <strong>주펄</strong></li>
                </ul>
              </div>
            </div>
          </div>

           
           
          <!-- C.공지글 배경색 다르게 설정 -->
          <div class="row">
            
            <h3>그룹 통계 및 그래프</h3>
            <!-- 꺾은선 그래프 등 ex) 최대, 최소, 평균, 중앙값, 개별 달성도-->
            <!-- 1차 목표: 데이터 표 그리기, 2차 목표: 통계 그래프 그리기 -->
            <!-- 데이터 표 그리기 -->
            <div class="row">
              <img src="../imgs/delta_graph.png" alt="그룹 통계 그래프">
            </div>
            <div class="row col-sm-5">
              <div class="list-group">
                <li class="list-group-item">종료일 까지 D-</li>
                <li class="list-group-item">시작일로부터</li>
                <li class="list-group-item">합산 감량 몸무게</li>
                <li class="list-group-item">크루원 몸무게 평균</li>
                <li class="list-group-item">시작일로부터</li>
              </div>
            </div>
          </div>
          
          <div class="row col-sm-3">
            <h3>그룹 내 랭킹</h3>
            <!-- C.순위와 이름이 떨어지도록 설정 -->
            <div class="list-group">
              <div class="list-group-item">
                1 <span>기안84</span>
              </div>
              <div class="list-group-item">
                2 <span>전무님</span>
              </div>
              <div class="list-group-item">
                3 <span>주펄</span>
              </div>
            </div>
          </div>
          
          &nbsp;
          &nbsp;
          
          <div name="groupboard">
           <div class="col-10">
           	<h3>그룹 게시판</h3>
        		</div>
             <!-- Q. 모달 창 생성과정 꼼꼼히 조사해서 정리 완료하기 -->
             <!-- 모달(글쓰기) 실행 버튼 -->
            <div class="col">
              <button class="btn btn-primary" type="button" onclick="location.href='<%=request.getContextPath()%>/group/groupWrite.do'">글 쓰기</button>
              <button class="btn btn-secondary" type="button" onclick="location.href='<%=request.getContextPath()%>/group/groupBoard.do'">더보기</button>
            </div>
            <table class="table">
              <thead>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">게시일</th>
                <th scope="col">조회수</th>
              </thead>
              <!-- C.게시일 : 1분, 5분, 10분, 15분, 30분, 45분, 1시간, 2시간 ... 1일, 2일 ... 1주 전.. 1년 전.. 등  -->
              <tbody>
              
              
<% for (GroupVo gv : glist){%>
                <tr>
                  <th><%=gv.getGbidx() %></th>
                  <td>
                   <a href="<%=request.getContextPath() %>/group/groupView.do?gbidx=<%=gv.getGbidx() %>" style="text-decoration: none; color:black;"><%=gv.getGbtitle() %></a>
                	</td>
                <td>
                	<a href="#" style="text-decoration: none; color:black;"><%=gv.getGbwriter() %></a>
               	</td>
                <td><%=gv.getGbwritetime() %></td>
                <td><%=gv.getGbhit() %></td>
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
							+"/group/group.do?page=1"
							+"' style='text-decoration:none;'>◀</a>");
}
	
// < : prev page array 이동
if (pm.isPrev()) {
	out.println("<a href='"+request.getContextPath()
							+"/group/group.do?page="+(pm.getStartPage()-1)
							+"' style='text-decoration:none;'>◁</a>");
}

// 페이지 번호
for (int i = pm.getStartPage(); i <= pm.getEndPage(); i++){
	out.println("<a href='"+request.getContextPath() 
							+"/group/group.do?page="+i
							+"' style='text-decoration:none;'>"+i+"</a>");			
}

// > : next page array 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/group/group.do?page="+(pm.getEndPage()+1)
							+"' style='text-decoration:none;'>▷</a>");
}

// 맨뒤: last page 이동
if (pm.isNext() && pm.getEndPage() > 0) {
	out.println("<a href='"+request.getContextPath()
							+"/group/group.do?page="+(pm.getTotalCount()/20+1)				// Q.페이지 계산 분모를 20이 아니라 변수로 불러오는 방법?
							+"' style='text-decoration:none;'>▶</a>");
}
%>

                    </p>
                  </div>

           
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
