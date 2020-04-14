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
		margin-left: 15px;
		width: 185px;
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
		background: #EF8F0E;
	} 
	#imgTr {
		border: 1px solid black;
		height: 200px;
	}
	.aCon {
		font-size: 1.1rem;
	}
	
	.downBtn {
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
		
		<c:forEach var="a" items="${ aulist }">
			<table class="aListTable">
				<tr id="imgTr">
					<td><img src="${ contextPath }/resources/uploadFiles/${ a.biName }"></td>
				</tr>
				<tr style="display: none;"><td class="aId"><c:out value="${ a.aNum }"/></td></tr>
				<tr class="conBg"><td style="font-size: 1.2rem;">"${ a.bkName }"</td></tr>  
				<tr class="conTitle conBg"><td>테스트 구절</td></tr>
				<tr class="conBg"><td><a href="${ contextPath }/resources/uploadFiles/${ a.teName }" download="${ a.teName }"><button class="downBtn">다운로드</button></a></td></tr>
				<tr class="conTitle conBg"><td>모집조건</td></tr>
				<tr class="aCon conBg"><td>성별 - ${ a.qGender }</td></tr>
				<tr class="aCon conBg"><td>나이 - ${ a.qAge }</td></tr>
				<tr class="aCon conBg"><td>경력 - ${ a.qCareer }</td></tr>
				<tr class="conTitle conBg"><td>요청사항</td></tr>
				<tr class="aCon conBg"><td height="10%">${ a.request }</td></tr>
				<tr class="conBg">
					<c:url var="apply" value="applyInsert.au">
						<c:param name="bkName" value="${ a.bkName }"/>
					</c:url>
				    <c:if test="${ loginUser.userId != 'admin' }">
					<td class="btnTd"><button class="defaultBtn applyBtn" onclick="location.href='${ apply }'">Apply</button></td>
					</c:if>
					<c:url var="upView" value="auListUpView.au">
						<c:param name="aNum" value="${ a.aNum }"/>
					</c:url>
					<c:if test="${ loginUser.userId == 'admin' }">
						<td class="btnTd">
							<button class="defaultBtn upBtn" onclick="location.href='${ upView }'">Edit</button>
							<button class="defaultBtn delBtn" onclick="location.href='auListDelete.au'">Delete</button> 
						</td>
					</c:if>
				</tr>
			</table>
		</c:forEach>
		<button onclick="location.href='auListInsertView.au'">여기눌러!</button>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
</body>
</html>