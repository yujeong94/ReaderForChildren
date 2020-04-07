<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
</style>
</head>
<body>
<div class="outer">
	<jsp:include page="common/menubar.jsp"/>
	<div class="home_contents">
		<c:if test="${ empty sessionScope.loginUser }">	
			<form class="home_login">
				<table>
				<tr>
					<th>ID</th>
					<td><input type="text" id="inputId"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" id="inputPwd"></td>
				</tr>
				</table>
				<div class="btnBox">
					<button type="submit" class="defaultBtn" id="joinBtn">Join</button>
					<button type="submit" class="defaultBtn" id="loginBtn">Login</button>
					<br clear="both">
					<span id="findPwd">Find Password</span>
					<span id="findId">Find ID</span>
				</div>
			</form>
		</c:if>
		<c:if test="${ !empty sessionScope.loginUser }">
			<c:out value="${ loginUser.name }님 환영합니다."/>
		</c:if>
	</div>
	<jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>
