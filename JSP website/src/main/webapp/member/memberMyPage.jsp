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
  
  <script>
  
		function checkId() {
	  		var fm2 = document.frm;
	  		
	  		fm2.action = "<%=request.getContextPath()%>/member/checkIdAction.do";
	  		fm2.method = "post";
	  		fm2.submit();	
	  		
	  	}
  
  
  	function enroll() {
  		
	   	// id, password, passwordcheck, email, name, gender 입력값 확인. null일 경우 alert 
			var fm = document.frm;
	   	
	   	if (fm.MEMBERID.value == "") {
	   		alert("ID를 입력하세요.");
	   		fm.MEMBERID.focus();
	   		return;
	   	} else if (fm.idDuplication.value == "idUncheck") {
	   		alert('아이디 중복 확인이 필요합니다.')
	   		return false;
	   	
	   		
	   	} else if (fm.MEMBERPASSWORD.value == "") {
	   		alert("비밀번호를 입력하세요.");
	   		fm.MEMBERPASSWORD.focus();
	   		return;
	   	} else if (fm.MEMBERPASSWORDCHECK.value == "") {
	   		alert("비밀번호 확인을 입력하세요.");
	   		fm.MEMBERPASSWORDCHECK.focus();
	   		return;
	   	} else if (fm.MEMBERPASSWORDCHECK.value != fm.MEMBERPASSWORD.value) {		// 비밀번호가 비밀번호 확인과 동일하지 않을 경우 alert
	   		alert("비밀번호가 비밀번호확인과 동일하지 않습니다.");
	   		fm.MEMBERPASSWORDCHECK.value = "";
	   		fm.MEMBERPASSWORDCHECK.focus();
	   		return;
	   	} else if (fm.MEMBEREMAIL.value == "") {
	   		alert("이메일을 입력하세요.");
	   		fm.MEMBEREMAIL.focus();
	   		return;
	   	} else if (fm.MEMBERNAME.value == "") {
	   		alert("이름 또는 닉네임을 입력하세요.")
	   		fm.MEMBERNAME.focus();
	   		return;
	   	} else if (fm.MEMBERGENDER.value == "") {
	   		alert("성별을 선택해주세요.")
	   		return;
	   	}
    	
	  	// 입력된 회원정보를 가상경로로 전송. uri에 정보가 드러나지 않도록 post 방식 사용
	  	fm.action = "<%=request.getContextPath()%>/member/memberJoinAction.do";
	  	fm.method = "post";
	  	fm.enctype = "multipart/form-data";
	  	fm.submit();
	  	
  	}
  	
  	function reset() {
			var fm = document.frm;
			
			fm.MEMBERID = "";
			fm.MEMBERPASSWORD = "";
			fm.MEMBERPASSWORDCHECK = "";
			fm.MEMBEREMAIL = "";
			fm.MEMBERNAME = "";
			fm.MEMBERGENDER = "";
			
			return;
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
          <a href="<%=request.getContextPath()%>/main/main.do">
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
            <a href="<%=request.getContextPath() %>/personal/personal.do" style="text-decoration: none;"><li>퍼스널 데이터</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/group/group.jsp" style="text-decoration: none"><li>그룹 데이터</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/crew/crew.jsp" style="text-decoration: none"><li>크루 모집</li></a>
          </div>
          <div class="row" style="padding: 20px 0 20px 0">
            <a href="<%=request.getContextPath() %>/board/board.do" style="text-decoration: none"><li>자유게시판</li></a>
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
        <!-- 회원가입 입력 창 -->
        <div class="container" style="left: 200px; width:90%">
          <div class="row">
            <h1>마이페이지</h1>
            <div class="col-sm-5" style="margin:auto">
             	<form name="frm" class="container">
		            <table class="table table-borderless">
		            	<tr>
		            		<td>
		            			<img src="../imgs/representative_img.PNG" alt="이미지/아이콘" style="width:300px;">
<!-- 	            			</td> -->
            			</tr>
		            	<tr>
			            	<td>
			            		<div class="input-group">
				            		<input class="form-control" type="text" name="MEMBERID" placeholder="ID" autofocus>
												<button type="button" name="idCheck" class="btn btn-secondary" onclick="checkId()">중복 확인</button>
			            		</div>
		            		</td>
	            		</tr>
		            	<tr>
		            		<td>
		            			<input class="form-control" type="text" name="MEMBERPASSWORD" placeholder="Password 변경">
	            			</td>
            			</tr><!-- Q. 타입을 password로 바꾸니깐 로그인이 안됨? -->
		            	<tr>
		            		<td>
		            			<input class="form-control" type="text" name="MEMBERPASSWORDCHECK" placeholder="Password 변경 확인">
	            			</td>
            			</tr>
		            	<tr>
		            		<td>
		            			<input class="form-control" type="text" name="MEMBEREMAIL" placeholder="Email">
	            			</td>
            			</tr>
		            	<tr>
		            	<tr>
		            		<td>
		            			<input class="form-control" type="text" name="MEMBERNAME" placeholder="이름 또는 닉네임">
	            			</td>
            			</tr>
		            	<tr>
		            	<tr>
		            		<td>
		            			<div class="btn-group col-sm-12" style="margin:auto;">
                          <input class="btn-check" type="radio" name="MEMBERGENDER" id="radioBtn1" value="M">
                          <label class="btn btn-outline-secondary" for="radioBtn1" >
                          	남성
                          </label> 
                          <input class="btn-check" type="radio" name="MEMBERGENDER" id="radioBtn2" value="F">
                          <label class="btn btn-outline-secondary" for="radioBtn2">
                            여성
                          </label> 
                          <input class="btn-check" type="radio" name="MEMBERGENDER" id="radioBtn3" value="N">
                          <label class="btn btn-outline-secondary" for="radioBtn3">
                            비공개
                          </label> 
                    	</div>
	            			</td>
            			</tr>
		            	<tr>
		            		<td>
		            			<input class="form-control" type="file" name="MEMBERIMG" placeholder="프로필 사진 등록">
	            			</td>
            			</tr>
		            	<tr>
		            		<td>
		            			<button type="button" class="btn btn-secondary" onclick="">수정</button>
		            			<button type="button" class="btn btn-secondary" onclick="reset()">리셋</button>
		            		</td>
	            		</tr>
		            </table>
		          </form>
            </div>
          </div>
        </div>
    </div>
  </body>
</html>

