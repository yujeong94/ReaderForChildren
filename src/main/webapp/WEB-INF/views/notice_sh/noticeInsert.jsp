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
	.frame{width: 80%; margin: 0 auto 30px; border-top: 1px solid grey; border-bottom: 1px solid lightgrey;}
	.titleLine{background: rgb(254, 249, 248); height: 50px; font-size: 17px; font-weight: bold; padding-top: 25px;}
	.titleSpan{padding-left: 20px; margin-right: 10px;}
	.titleInput{border-radius: 3px; width: 450px; height: 25px; margin-right: 30px; outline: none;}
	.selbox{border-radius: 3px; width: 120px; height: 30px; outline: none;}
	.contentArea{background: rgb(254, 249, 248); height: 400px; padding-top: 25px;}
	.contentDiv{display: inline-block; font-size: 17px; font-weight: bold; padding-left: 20px; margin-right: 10px;}
	textarea{resize: none; outline: none; border-radius: 4px;}
	.btnBox{margin-bottom: 30px;}
	.upBtn{margin-right: 8px;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>	
	
		<form method="post" action="noInsert.no">
			<div class="contents">
				<div id="title"><h1>공지사항</h1></div>
				
				<div class="frame">
					<div class="titleLine">
						<span class="titleSpan">제목</span>
						<input type="text" class="titleInput" name="noTitle">
						
						<span class="titleSpan">카테고리</span>
						<select class="selbox" name="category">
							<option selected disabled>카테고리 선택</option>
							<option value="결제/배송">결제/배송</option>
							<option value="리더 오디션">리더 오디션</option>
							<option value="아동 후원">아동 후원</option>
							<option value="봉사활동">봉사활동</option>
							<option value="녹음부스 예약">녹음부스 예약</option>
							<option value="이벤트">이벤트</option>
						</select>
					</div>
					
					<br>
					
					<div class="contentArea">
						<div class="contentDiv">내용</div>
						<textarea rows="23" cols="100" name="noContent"></textarea>
					</div>
				</div>
				
				<div class="btnBox">
					<input type="submit" class="defaultBtn upBtn" value="등록하기">
					<button type="reset" class="defaultBtn delBtn">작성취소</button>
				</div>
			</div>
		</form>	
	
	<c:import url="../common/footer.jsp"/>	
	</div>	
</body>
</html>