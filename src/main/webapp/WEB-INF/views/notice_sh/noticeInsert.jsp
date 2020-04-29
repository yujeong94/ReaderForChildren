<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>noticeInsert</title>
<style>
	.frame{width: 80%; height: 500px; margin: 0 auto 30px; border-top: 1px solid grey; border-bottom: 1px solid lightgrey;}
	.titleLine{background: rgb(254, 249, 248); height: 50px; font-size: 17px; font-weight: bold; padding-top: 25px;}
	.titleSpan{padding-left: 20px;}
	.btnBox{margin-bottom: 30px;}
	.upBtn{margin-right: 8px;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>	
	
		<div class="contents">
			<div id="title"><h1>공지사항</h1></div>
			
			<div class="frame">
				<div class="titleLine">
					<span class="titleSpan">제목</span>
				</div>
			</div>
			
			<div class="btnBox">
				<input type="submit" class="defaultBtn upBtn" value="등록하기">
				<button type="reset" class="defaultBtn delBtn">작성취소</button>
			</div>
		</div>
	<c:import url="../common/footer.jsp"/>	
	</div>	
</body>
</html>