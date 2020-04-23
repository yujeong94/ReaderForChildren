<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
	h1	{
		margin-top: 150px;
		margin-bottom: 150px;
	}
	.btnBox {
		margin-bottom: 200px;
	}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents">
		<h1>박유정님 지원이 완료되었습니다.<br>
			지원해주셔서 감사합니다.</h1>
		<div class="btnBox">
		<button class="defaultBtn upBtn" onclick="location.href='apDetail.au'">지원서 확인</button>
		</div>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
</body>
</html>