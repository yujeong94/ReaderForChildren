<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	body{
		background : #ffe478;
	}
	
	.float-left{
		float:left;
		margin: 5px;
	}
	
	#textAreaDiv{
		margin-left: 38px;
		margin-top: 20px; 
		margin-bottom: 5px;
	}
	
	.console{
		width : 370px;
		height : 150px;
		margin : 10px;
		border: 1px solid rgb(182,205,221);
		border-radius:3px;
		background : rgb(182,205,221);
	}
	
	#sendDiv{
		width : 370px;
		margin-left : 50px;
	}
	
	.message{
		border: 1px solid rgb(182,205,221);
		height: 30px;
		width: 79%;
	}
	
	.sendBtn{
		float: right; 
		width: 60px; 
		height: 30px; 
		text-align: center; 
		background-color: rgb(182,205,221); 
		border-radius: 5px;
		border : 0px;
		font-weight: bold;
		cursor : pointer;
	}

</style>
</head>
<body>
	<div class="template" style="display:none">
		<div id = "textAreaDiv">
			<textarea class="console" disabled="disabled"></textarea>
		</div>
		
		<form>
			<div id = "sendDiv">
				<input type="text" class="message" onkeydown="if(event.keyCode === 13) return false;">
				<input value="Send" type="button" class="sendBtn">
			</div>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
		var webSocket = new WebSocket("ws://localhost:9980/ReaderForChildren/adminsocket");
		
		webSocket.onopen = function(message) { };
		webSocket.onclose = function(message) { };
		webSocket.onerror = function(message) { };
		
		webSocket.onmessage = function(message) {
		
			let node = JSON.parse(message.data);
			// 메시지의 status는 유저의 접속 형태
			if(node.status === "visit") {
				let form = $(".template").html();
				// div를 감싸고 속성 data-key에 unique키를 넣는다.
				form = $("<div class='float-left'></div>").attr("data-key",node.key).append(form);
				
				$("body").append(form);
			} else if(node.status === "message") {
				// key로 해당 div영역을 찾는다.
				let $div = $("[data-key='"+node.key+"']");
				
				let log = $div.find(".console").val();
				$div.find(".console").val(log + node.message + "\n");
			} else if(node.status === "bye") {
				$("[data-key='"+node.key+"']").remove();
			}
		};
		
		$(document).on("click", ".sendBtn", function(){
		// div 태그를 찾는다.
		let $div = $(this).closest(".float-left");
		// 메시지 텍스트 박스를 찾아서 값을 취득한다.
		let message = $div.find(".message").val();
		// 유저 key를 취득한다.
		let key = $div.data("key");
		// console영역을 찾는다.
		let log = $div.find(".console").val();

		$div.find(".console").val(log + "[운영자] : " + message + "\n");
		$div.find(".message").val("");
		
		webSocket.send(key+"#####"+message);
		});
		
		// 엔터 적용
		$(document).on("keydown", ".message", function(){
			if(event.keyCode === 13) {
				$(this).closest(".float-left").find(".sendBtn").trigger("click");
				return false;
			}
			return true;
		});
	</script>
	
	
</body>
</html>