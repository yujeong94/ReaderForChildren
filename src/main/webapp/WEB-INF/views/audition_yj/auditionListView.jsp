<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오디션 지원 리스트 | ReaderForChildren</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
	h2 { 
		font-size: 1.5rem;
		font-weight: 600;
		margin-left: 30px;
		margin-top: 80px;
	}
	h3 {
		font-size: 1rem;
		margin-left: 50px;
		color: red;
	}
	.aListTable {
		float: left;
		margin-top: 80px;
		margin-bottom: 70px;
		margin-left: 25px;
		width: 170px;
		height: 600px;
		text-align: center;
	}
	/* td {
		vertical-align: middle;
	} */
	.conBg {
		background: #FBEACD;
	}
	.conTitle {
		font-weight: 800;
		font-size: 1.3rem;
		margin-bottom: 10px;
	}
	.btnTd {
		vertical-align: bottom;
		padding-bottom: 10px;
	}
 	.applyBtn {
		background: #1F1F84;
	} 
	#imgTr {
		border: 1px solid black;
		height: 200px;
	}
	.aCon {
		font-size: 1.1rem;
		text-align: left;
	}
	
	#downBtn {
		background: #F8B448;
		color: white;
		border: none;
		border-radius: 3px;
	}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents clear-fix">
		<h1>Reader 오디션 지원</h1>
		<h2>이 달의 판매 예정 오디오북</h2>
		<h3>※ 오디션 지원에 관한 자세한 사항은 공지사항을 참고하세요 <a href="#" style="color:navy; text-decoration: none;"> >> 바로가기</a></h3>
		
		<c:forEach begin="1" end="5" var="i">
			<table class="aListTable">
				<tr id="imgTr">
					<td>사진 <c:out value="${ i }"/></td>
				</tr>
				<tr style="display: none;"><td class="aId"><c:out value="${ i }"></c:out></td></tr>
				<tr class="conBg">
					<td style="padding: 30px;">
						<p>책 이름 </p>  
						<p class="conTitle">테스트 구절</p>
						<p><button id="downBtn">다운로드</button></p><br>
						<p class="conTitle">모집조건</p>
						<p class="aCon">성별 - 무관</p>
						<p class="aCon">나이 - 20~30세</p>
						<p class="aCon">경력 - 유</p><br>
						<p class="aCon">요청사항</p>
						<p class="aCon"> ⦁  밝은 목소리</p>
					</td>
				</tr>
				<tr class="conBg">
					<td class="btnTd"><button class="defaultBtn applyBtn" onclick="location.href='apinsertView.au';">Apply</button></td>
					<c:if test="${ loginUser.userId == 'admin' }">
						<td class="btnTd"><button class="defaultBtn upBtn">Edit</button></td>
						<td class="btnTd"><button type="button" class="defaultBtn delBtn">Delete</button></td>
					</c:if>
				</tr>
			</table>
		</c:forEach>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
<script>
	$(".upBtn").click(function(){
		location.href="${ contextPath }/views/audition_yj/auditionListUpdate.jsp";
	});
</script>
</body>
</html>