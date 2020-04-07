<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventDetail</title>
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

.textareaStyle{
	width: 650px;
	overflow-y: hidden;
	text-align: center;
	margin: 30px;
	margin-bottom: 60px;
	font-size: 1.7em;
	font-weight: bold;
	resize: none;
	border: none;
}

.event_text{
	margin: 10px;
	margin-bottom: 50px;
}

.circleStyle{
	width: 250px;
	margin: auto;
	padding: 9px;
	border-radius: 20px;
	font-size: 1.5em;
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
	width: 30px;
	vertical-align: middle;
}

.noticeStyle{
	text-align: left;
	padding-top: 30px;
	padding-bottom: 10px;
	padding-left: 200px;
}

#pStyle{
	text-align: left;
	padding-left: 200px;
	margin-bottom: 50px;
	font-size: 13px;
}

.borderStyle{
	border-bottom: 3px double lightgray;
}

.inputStyle{border-radius: 4px; box-shadow: none; padding: 0.5rem 0.6rem; font-size: 0.8rem;
   		line-height: 1.5; vertical-align: middle; border: 1px solid #ced4da; 
   		transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; width: 90%;}
   		
.replyTD{
	padding-top: 10px;
}
 		
.replyStyle{
	border-bottom: 1px solid lightgray
}

#replyInsert{
	padding-top: 8px;
	padding-bottom: 8px;
}

.replyName{
	display: inline-block;
	font-size: 15px; font-weight: bold;
	text-align: left;
}
.replyDate{
	display: inline-block;
	font-size: 11px; width: 680px;
	margin-left: 7px;
	text-align: left;
	vertical-align: middle;
}
.replyUpdate{
	display: inline-block; width: 130px;
}

#reply_content{
	font-size: 13px; text-align: left; padding: 8px; padding-left: 15px;
}

.btn1{
	vertical-align: middle;
}

.btn2{
	font-size: 13px;
	padding: 4px 10px;
	font-weight: normal;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<div id="title"><h1>EVENT</h1></div>
		<form action="#">
			<table class="tableStyle">
				<tr>
					<td class="label tdStyle">제목</td>
					<td colspan="3" class="data tdStyle">[EVENT] 2월 best 오디오 북 증정</td>
				</tr>
				<tr>
					<td class="label tdStyle">작성일</td>
					<td class="data data2 tdStyle" id="enrollDate">2020-03-29</td>
					<td class="label tdStyle">조회수</td>
					<td class="data data2 tdStyle" id="count">9278</td>
				</tr>
				<tr>
					<td colspan="4" class="tdStyle" id="imgTd"><img alt="#" src="${ contextPath }/resources/images/poster.jpg" width="70%"></td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro">
						<textarea class="textareaStyle" readonly>2월 best 오디오북 '###' 을 증정합니다.
이벤트 소개!!
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_circle">
						<div class="circleStyle">이벤트 기간</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro">
						<textarea class="textareaStyle event_text" readonly>2020년 3월 19일(목) ~ 2020년 3월 21일(토) 자정까지
당첨 발표 - 3월 22일(일)
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_circle">
						<div class="circleStyle">이벤트 참여 방법</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro">
						<textarea class="textareaStyle event_text" readonly>홈페이지에 로그인 한 뒤, 해당 게시글 댓글을 적어주세요.
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_circle">
						<div class="circleStyle">이벤트 당첨 기준</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro">
						<textarea class="textareaStyle event_text" readonly>운영자 기준, 5명 추천되며 당첨자 분들께는
개별 연락이 갈 예정입니다.
						</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div class="noticeStyle">
							<img src="${ contextPath }/resources/images/exclamation-mark.png" id="markImg">
							<label id="labelStyle">공지사항</label>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="borderStyle">
						<p id="pStyle">
						- 본 이벤트는 회원가입 하신 분들만 참여 하실 수 있습니다.<br>
						- 불공정한 방법으로 참여한 이벤트는 당첨이 취소 됩니다.<br>
						- 통신 예절에 어긋나는 글이나 상업적인 글, 타 사이트 관련된 글 또는 도용한 글은<br>
						 &nbsp;&nbsp;관리자에 의해 사전통보 없이 삭제될 수 있으며, 이벤트 참여에 제한을 받을 수 <br>
						 &nbsp;&nbsp;있습니다.<br>
						- 댓글을 중복으로 작성하실 시 이벤트 참여 대상에 제외됩니다.<br>
						- 이벤트 상품은 교환/반품이 불가한 점 참고 바랍니다.<br>
						- 정확한 배송을 위하여, 마이페이지에서 배송받을 주소와 개인 정보를 꼭 확인바랍니다.<br>
						</p>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="replyStyle" id="replyInsert">
						<input type="text" class="inputStyle" name="reply" id="reply" placeholder="댓글을 작성해주세요.">
						<input type="submit" class="defaultBtn upBtn btn1" value="등록">
					</td>
				</tr>
				<tr>
					<td colspan="4" class="replyTD">
						<div class="replyName">신수정</div>
						<div class="replyDate">2020-03-31</div>
						<div class="replyUpdate">
							<button class="defaultBtn upBtn btn2">수정</button>
							<button class="defaultBtn delBtn btn2">삭제</button>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="replyStyle" id="reply_content">이벤트 참여합니다.</td>
				</tr>
			</table>
		</form>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
</body>
</html>