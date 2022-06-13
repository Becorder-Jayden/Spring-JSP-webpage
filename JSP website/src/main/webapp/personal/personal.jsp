<%@page import="java.time.Year"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Domain.PersonalVo"%>
<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
if (session.getAttribute("midx") == null) {
	
	session.setAttribute("saveUrl", request.getRequestURI());
	
	out.println("<script>");
	out.println("alert('로그인 해주세요.')");
	out.println("location.href='"+request.getContextPath()+"/member/memberLogin.do'");
	out.println("</script>");
}
%>
<%
	ArrayList<PersonalVo> plist = (ArrayList<PersonalVo>)request.getAttribute("plist");
%>



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
  	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  
  <script>
	/* 전역 변수 입력 */ 
    date = new Date();
    year = date.getFullYear();
    month = date.getMonth() + 1;
    day = date.getDate();
  
    
  	// 데이터 입력
  	function dailyFn() {
    	
  		var fm = document.daily;
  		
  		if (fm.pbWeight.value == "") {
  			alert("현재 체중을 입력하세요.");
  			fm.pbWeight.focus();
  			return;
  		}
  		
  		fm.action = "<%=request.getContextPath()%>/personal/personalWriteAction.do";
  		fm.method = "post";
  		fm.enctype = "multipart/form-data";
  		fm.submit();
  	}
  
	/* 업로드한 사진 미리보기 */
  	function readImage(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById('preview').src = e.target.result;
				};
				reader.readAsDataURL(input.files[0]);
			} else {
				document.getElementById('preview').src = "";
			}
	}	
  	
  	
	      
	/* 그래프 그리기 */ 	
 	  google.charts.load('current', {'packages':['corechart']});
   	google.charts.setOnLoadCallback(drawChart);
		
    // 그래프 변수 설정
		var years = [];
    var months = [];
    var days = [];
    var weight = [];

<% for (PersonalVo pvv : plist) { %>      
    
		var pbdate = '<%=pvv.getPbdate()%>'.split('-');
		
		years.push(parseInt(pbdate[0]));
		months.push(parseInt(pbdate[1]));
		days.push(parseInt(pbdate[2]));
		weight.push(<%=pvv.getPbweight()%>);

<%}%>

		// 그래프 그리기
    function drawChart() {

      var data = new google.visualization.DataTable();
      data.addColumn('datetime', '날짜');
      data.addColumn('number', '체중');
      
      for (var i = 0; i < years.length; i++) {
     		arr = [new Date(years[i], months[i]-1, days[i]), weight[i]];
  	  	data.addRow(arr);
      }
      
			var options = {
          title: '체중 변화 그래프',
          curveType: 'function',
          legend: { position: 'bottom' },
          hAxis:{
	          format: 'MM-dd'
        	  }
        };

  		var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

      chart.draw(data, options);
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
          <!-- 페이지 이름 -->
          <div>
            <h1>퍼스널 데이터</h1>
          </div>
					&nbsp;&nbsp;
          <!-- 기록 등록 -->
          <div class="row">
            <h3>일일 기록 등록 : 
              <script>
                document.write(year+"년 "+month+"월 "+day+"일");
              </script>
            </h3>
            &nbsp;
            <div class="row" style="margin:auto;">
            	<form name="daily">
            	
            	<!-- 수정 중 -->
            	<table>
            		<tr>
            			<td rowspan="2" class="col-sm-4">
            				<img id = "preview" style="width:300px;">
            				<input name="pbWeightImg" type="file" onchange="readImage(this);" class="form-control" alt="인증사진 업로드" />
           				</td>
            			<td>
	            			<div class="input-group">
	            				<input name="pbWeight" type="text" class="form-control" placeholder="현재 체중 (단위 : kg)">
	            				<button type="button" onclick="dailyFn()" class="btn btn-primary input-append">등록</button>
	            			</div>
         					</td>
            		</tr>
            		<tr>
            			<td><textarea name="pbMemo" id="" cols="80" rows="5" class="form-control" placeholder="운동/식단 등 기록" style="resize:none;"></textarea></td>
            		</tr>
            		
            	</table>
            	
            	
            	
            	
            	
<!-- 	              <div class="col-sm-3">
	                <input name="pbWeightImg" type="file" class="form-control" alt="인증사진 업로드" />
	              </div>
	              <div class="col-sm-9">
	                <div class="row">
	                  <div class="row">
	                    <div class="col-sm-5">
	                      <div class="input-group">
	                        <input name="pbWeight" type="text" class="form-control" placeholder="현재 체중(단위: kg)">
	                      </div>
	                    </div>
	                    <div class="col-sm-3">
	                      <button type="button" onclick="dailyFn()" class="btn btn-primary">등록</button>
	                    </div>
	                  </div>
	                </div>
	                <div class="row">
	                  <div class="col-sm-10">
	                    <textarea name="pbMemo" id="" cols="40" rows="5" class="form-control" placeholder="운동/식단 등 기록" style="resize:none;"></textarea>
	                  </div>
	                </div>
	              </div>
 -->	              
            	</form>
            </div>
          </div>
&nbsp;&nbsp;
          <!-- 주간 기록 확인  -->
          <div class="row">
            <h3>주간 기록 : 
	            <script>
								document.write(month+"월 " + "주차");            
	            </script>
            </h3>
            &nbsp;
            <div class="row" style="margin:auto; text-align: center;">
              <table>
                <tr>
                  <th>월</th>
                  <th>화</th>
                  <th>수</th>
                  <th>목</th>
                  <th>금</th>
                  <th>토</th>
                  <th>일</th>
                </tr>
                <tr>
                  <td><img src="../imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="../imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="../imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="../imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="../imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="../imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                  <td><img src="../imgs/representative_img.PNG" alt="등록" style="width:100px"/></td>
                </tr>
                <tr>
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
					
					<br>
					<br>
					&nbsp;&nbsp;
          <!-- 아래 편집 -->
          <div class="row">
            <h3>체중 변화 그래프</h3>
            &nbsp;
            <div class="row" style="margin:auto;">
                <div id="curve_chart" alt="체중 변화 그래프"></div>
            </div>
          </div>
         &nbsp;&nbsp;
          <div class="row">
            <h3>업로드 기록</h3>
          </div>
          &nbsp;
          <div class="row">
            <table class="table" style="text-align: center;">
              <tr>
                <th>번호</th><th>날짜</th><th>체중</th><th>메모</th><th>사진</th>
              </tr>
<% for (PersonalVo pvv : plist) {%>              
              <tr style="height:100px">
                <td><%=pvv.getPbidx() %></td>
                <td><%=pvv.getPbdate() %></td>
                <td><%=pvv.getPbweight() %>kg</td>
                <td><%=pvv.getPbMemo() %></td>
                <td>
<% if (pvv.getPbweightimg() != null) {%>
                	<img src="<%=request.getContextPath() %>/imgs/<%=pvv.getPbweightimg() %>" style="height:100px;">
<%} %>               	
               	</td>
              </tr>
<%} %>
            </table>
            <div class="row text-center" style="font-size: 20px; margin:auto;">
						<!-- 6/7. 페이징 구현 예정 -->
            </div>
        </div>
      </div>
    </div>
  </body>
</html>
