<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>noticeUpdate</title>
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
	.upBtn{margin-right: 8px; background: rgb(231, 76, 60);}
	.delBtn{background: rgb(190, 190, 190);}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>	
	
		<form method="post" action="noUpdate.no">
			<div class="contents">
				<div id="title"><h1>공지사항</h1></div>
				
				<div class="frame">
					<div class="titleLine">
						<span class="titleSpan">제목</span>
						<input type="hidden" name="noCode" id="noCode" value="${ n.noCode }">
						<input type="hidden" name="page" id="page" value="${ page }">
						<input type="text" class="titleInput" name="noTitle" value="${ n.noTitle }">
						
						<span class="titleSpan">카테고리</span>
						<select class="selbox" name="category">
							<c:set var="category" value="${ n.category }"/>
							<option value="결제/배송"<c:if test="${ category == '결제/배송' }">selected</c:if>>결제/배송</option>
							<option value="리더 오디션"<c:if test="${ category == '리더 오디션' }">selected</c:if>>리더 오디션</option>
							<option value="아동 후원"<c:if test="${ category == '아동 후원' }">selected</c:if>>아동 후원</option>
							<option value="봉사활동"<c:if test="${ category == '봉사활동' }">selected</c:if>>봉사활동</option>
							<option value="녹음부스 예약"<c:if test="${ category == '녹음부스 예약' }">selected</c:if>>녹음부스 예약</option>
							<option value="이벤트"<c:if test="${ category == '이벤트' }">selected</c:if>>이벤트</option>
						</select>
					</div>
					
					<div class="contentArea">
						<div class="contentDiv">내용</div>
						<textarea rows="23" cols="100" name="noContent">${ n.noContent }</textarea>
					</div>
				</div>
				
				<div class="btnBox">
					<input type="submit" class="defaultBtn upBtn" value="수정하기">
					<button type="reset" class="defaultBtn delBtn" id="delBtn">취소하기</button>
				</div>
			</div>
		</form>	
	
	<c:import url="../common/footer.jsp"/>	
	</div>
	
	<script>
	$('#delBtn').click(function(){
		var noCode = $('#noCode').val();
		var page = $('#page').val();
		
		location.href="noDetail.no?noCode="+noCode+"&page="+page;
	});
	</script>
</body>
</html>