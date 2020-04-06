<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>successPayment</title>
<style>
	#title{padding-bottom: 80px;}
	.ment{font-size: 37px; font-weight: bold; text-align: center; margin-bottom: 80px;}
	.btns{text-align: center; margin-bottom: 200px;}
	.btns button{width: 160px; height: 50px; border-radius: 3px; border: none; color: white; font-weight: bold;
				font-size: 20px;}
	.goOrderList{background: rgb(243, 156, 18); margin-right: 8px;}
	.goMain{background: grey;}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	
		<div class="contents">
			<div id="title"><h1>주문/결제</h1></div>
			
			<div class="ment">주문이 완료되었습니다.</div>		
			
			<div class="btns">
				<button type="submit" class="goOrderList">주문내역 보기</button>
				<button type="reset" class="goMain">메인 화면으로</button>
			</div>	
		</div>
		
	<c:import url="../common/footer.jsp"/>
</div>
</body>
</html>