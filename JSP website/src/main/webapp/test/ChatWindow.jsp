<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>웹소켓 채팅</title>
<script>
	var webSocket = new WebSoket("<%= application.getInitParameter("CHAT_ADDR")%>/ChatingServer");
	var chatWindow, chatMessage, chatId;
	
	// 채팅창이 열리면 대화창, 메시지 입력창, 대화명 표시란으로 사용할 DOM 객체 저장
	window.onload = function() {
		chatWindow = document.getElementById("chatWindow");
		chatMessage = document.getElementById("chatMessage");
		chatId = document.getElementById('chatId').value;
	}
	
	// 메시지 전송
	function sendMessage() {
		// 대화창에 표시
		chatWindow.innerHTML += "<div class='myMsg'>" + chatMessage.value + "</div>"
		webSocket.send(chatId + '|' + chatMessage.value);		// 서버로 전송
		chatMessage.value = "";		// 메시지 입력창 내용 지우기
		chatWindow.scrollTop = chatWindow.scrollHeight;	// 대화창 스크롤
	}
	
	// 서버와의 연결 종료
	function disconnect() {
		webSocket.close();
	}
	
	// 엔터 키 입력 처리
	function enterKey() {
		if (window.event.keyCode == 13) {	// 13: 'Enter' 키의 코드값
			sendMessage();
		}
		
	}
	
</script>
</head>
<body>
</body>
</html>
