<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>endEventDetail</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<style>
.contents {
	width: 1100px;
	background: white;
	margin: auto;
	margin-bottom: 100px;
	padding: 20px;
}

#title {
	margin: 50px;
	text-align: center;
}

.tdStyle{
	border-top: 1px solid lightgray;
}

.tableStyle{
	margin: auto; text-align: center;
}

.label{
	font-weight: 600; width: 150px; height: 35px; text-align: center;
	vertical-align: middle; font-size: 15px;
}

.data{
	text-align: left;
	font-size: 15px;
	vertical-align: middle;
}

.data2{
	width: 300px;
}

#imgTd{padding-top: 20px;}

.divStyle{
	width: 650px;
	font-size: 1.7em;
	margin: 30px;
	margin-bottom: 60px;
	display: inline-block;
}

.event_text{
	margin: 10px;
	margin-bottom: 70px;
}

.circleStyle{
	width: 250px;
	margin: auto;
	padding: 9px;
	border-radius: 20px;
	font-size: 1.7em;
	font-weight: bold;
	background: rgb(211, 84, 0);
	color: white;
}

#labelStyle{
	font-size: 1.7em;
	font-weight: bold;
	vertical-align: middle;
}

#markImg{
	width: 40px;
	vertical-align: middle;
}

.noticeStyle{
	text-align: left;
	padding-top: 30px;
	padding-left: 140px;
}

#pStyle{
	text-align: left;
	padding-left: 140px;
	margin-bottom: 50px;
}

.borderStyle{
	padding-bottom: 70px;
	font-size: 22px; font-weight: bold; color: rgb(66, 120, 110);
}

.inputStyle{border-radius: 4px; box-shadow: none; padding: 0.5rem 0.6rem; font-size: 0.9rem;
   		line-height: 1.5; vertical-align: middle; border: 1px solid #ced4da; 
   		transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; width: 90%;}

/* 당첨자 css */
.tableInTableDiv{
	margin: auto;
	padding: 30px;
	background: rgb(237, 237, 214);
	width: 460px;
	border-radius: 20px;
	margin-top: 8px;
	margin-bottom: 60px;
	
}

.tableInTable{
	margin: auto;
}

.inTableTH{
	font-size: 27px;
	font-weight: bold;
	padding-bottom: 20px;
	width: 200px;
}

.inTableTD{
	font-size: 22px;
	font-weight: bold;
	padding: 7px;
}

.borderStyle2{
	border-bottom: 3px double lightgray;
	padding-bottom: 10px;
}


</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<div id="title"><h1>이벤트 당첨자</h1></div>
		<form action="#">
			<table class="tableStyle">
				<tr>
					<td class="label tdStyle">제목</td>
					<td colspan="3" class="data tdStyle">[EVENT] ${ event.eTitle }</td>
				</tr>
				<tr>
					<td class="label tdStyle">작성일</td>
					<td class="data data2 tdStyle" id="enrollDate">${ event.eDate }</td>
					<td class="label tdStyle">조회수</td>
					<td class="data data2 tdStyle" id="count">${ event.eCount }</td>
				</tr>
				<tr>
					<td colspan="4" class="tdStyle" id="imgTd"><img alt="#" src="${ contextPath }/resources/uploadFiles/${ event.changeName }" width="70%"></td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro">
						<div class="divStyle event_text">
							${ fn:replace(event.eContent, newLineChar, "<br>") }
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_circle">
						<div class="circleStyle">당첨자</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro">
						<div class="tableInTableDiv">
							<table class="tableInTable">
								<thead>
									<tr>
										<th class="inTableTH inTablename">회원명</th>
										<th class="inTableTH inTablephone">휴대폰끝4자리</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="m" items="${ member }">
										<c:set var="name" value="${ m.userName}"/>
										<c:set var="len" value="${fn:length(name)}"/>
										<tr>
											<td class="inTableTD">
												${fn:substring(name, 0, len-1)}*</td>
											<td class="inTableTD">${fn:substring(m.phone, 7, 11) }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="borderStyle">
						당첨을 축하합니다:)<br>
						상품은 마이페이지에 등록된 주소로 배송될 예정입니다.<br>
						마이페이지에서 개인정보를 확인해주세요!
					</td>
				</tr>
				<tr>
					<td colspan="4" class="borderStyle2">
						<button type="button" class="defaultBtn delBtn btn1" onclick="location.href='eventEndList.ev'">목록으로</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>