<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<!-- <script type="text/javascript" src="../../lib/sockjs.min.js"></script> -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#chatArea{
		width : 60%;
		height : 500px;
		overflow: auto;
		margin-top : 100px;
		margin-left: auto;
		margin-right: auto;
		border: 2px solid #01D1FE;
		border-radius: 10px;
	}
	
	#chatMessageArea{
		width : 97%;
		height : 470px;
		margin : 10px;
		border: 1px solid #01D1FE;
		border-radius:3px;
	}
	
	#inputMessage_form1{
		width : 60%;
		margin-left: auto;
		margin-right: auto;
		margin-top: 20px; 
		margin-bottom: 15px;
	}
	
	#inputMessage_form2{
		width : 100%;
		margin-left: auto;
		margin-right: auto;
	}
	
	#message{
		border: 1px solid #01D1FE;
		height: 65px;
		width: 80%;
	}
	
	#sendBtnForm{
		float: right; 
		width: 18%; 
		height: 65px; 
		text-align: center; 
		background-color: #01D1FE; 
		border-radius: 5px;
		border : 0px;
		font-weight: bold;
		cursor : pointer;
	}
	
	#userDiv{
		margin-bottom : 5px;
	}
	
	#user{
		border: 1px solid #01D1FE;
	}
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
 
 	<div id = "content">
 		
 		<!-- 채팅 내용 -->
	 		<div id = "chatArea">
			
				<textarea id="chatMessageArea"></textarea>
	
			</div>
		
		<!-- 채팅 입력창 -->
		<div id = "inputMessage_form1">
			<form>
			<div id = "inputMessage_form2">
				<div id = "userDiv">
					<c:if test="${ !empty loginUser }">
						<input id="user" type="text" value="${ loginUser.userName }" readonly/>
					</c:if>
					<c:if test="${ !empty adminUser }">
						<input id="user" type="text" value="${ adminUser.userName }" readonly/>
					</c:if>
				</div>
				<textarea class="form-control" id = "message" placeholder = "Enter..."></textarea>
				
				<input onclick="sendMessage()" value="전송" type="button" id ="sendBtnForm">
			</div>
			</form>
		</div>
		
 	</div>

<script>

	var ws = new WebSocket("ws://localhost:9980/ReaderForChildren/chat");
	
	var messageTextArea = document.getElementById("chatMessageArea");

	ws.onopen = function(){
		console.log('Info : connection opened.');
	};
	
	ws.onmessage = function(event){
		console.log(event.data + '\n');
		messageTextArea.value += event.data+"\n";
	};
	
	ws.oncloese = function(event){
		console.log('Info: connection closed.');
		setTimeout(function(){
			connect(); }, 1000);
	};
	
	ws.onerror = function(err){
		console.log('Error : ',err);
	};

	
	
	
	function sendMessage() {
		var user = document.getElementById("user");
		var message = document.getElementById("message");
		
		// 메시지를 출력
		messageTextArea.value += user.value + "(me) : " + message.value + "\n";

		// WebSocket 서버에 메시지를 송신한다.
		ws.send("{{" + user.value + "}}" + message.value);

		message.value = "";
	}


	
	
	
	
	
	
	
	
	
	
</script>	
	

</body>
</html>