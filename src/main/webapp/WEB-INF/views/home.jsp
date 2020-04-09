<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Reader For Children</title>
<link rel="stylesheet" href="resources/css/common.css">
<style>
	table { margin-left : 50px; margin-bottom : 10px; }
	th { width : 100px; height : 50px; font-weight : bold; font-size : 14px; }
	#joinBtn,#loginBtn { float : right; font-size : 12px; }
	#joinBtn { margin-left : 10px; background : #848484; }
	#loginBtn { background : #2E2E2E; }
	#findId,#findPwd { margin-top : 10px; float : right; cursor : pointer; font-weight : bold; }
	#findId { margin-right : 10px;}
	
	#welcome{
		font-weight : bold;
		font-size : 25px;
		margin-top : 500px;
	}
	
	.loginMenu{
		font-size : 15px;
		text-align : right;
		font-weight : bold;
		color : brown;
	}	
a:link { color: red; text-decoration: none;}
a:visited { color: black; text-decoration: none;}
a:hover { text-decoration: none; cursor : pointer;}

	
</style>
</head>
<body>
<div class="outer">
	<jsp:include page="common/menubar.jsp"/>
	<div class="home_contents">
		<c:if test="${ empty sessionScope.loginUser }">	
			<form class="home_login" action="login.me" method="post">
				<table>
				<tr>
					<th>ID</th>
					<td><input type="text" id="inputId" name="userId"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" id="inputPwd" name="userPwd"></td>
				</tr>
				</table>
				<div class="btnBox">
					<button type="button" class="defaultBtn" id="joinBtn" onclick="location.href='join.me'">Join</button>
					<button class="defaultBtn" id="loginBtn">Login</button>
					<br clear="all">
					<span id="findPwd">Find Password</span>
					<span id="findId">Find ID</span>
				</div>
			</form>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">

			<table id = "123">
				<tr>
					<td colspan = '2'><label id = "welcome"><a href = "eventInsert.ev"><span style="color: green">${ loginUser.userName }</span></a>님 환영합니다.</label></td>
				</tr>
				<tr>
					<td class = "loginMenu"><a id = "logoutBtn" >로그아웃</a></td>
					<script>
						$(function(){
							$('#logoutBtn').click(function(){
								var an = confirm("로그아웃 하시겠습니까?")
								if(an){
									location.href='logout.me';
								}else{
									return false;
								}
							})
						})
					</script>
				</tr>
			</table>


		</c:if>
	</div>
	<jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>
