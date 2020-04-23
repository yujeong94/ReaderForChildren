<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

.divStyle{
	width: 650px;
	font-size: 1.7em;
	margin: 30px;
	margin-bottom: 60px;
	display: inline-block;
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
	padding-bottom: 10px;
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
	display: inline-block; width: 140px; text-align: right;
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

#noneReply{
	font-size: 14px;
	padding: 5px;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<% pageContext.setAttribute("newLineChar", "\r\n"); %>
	
	<!-- 내용 -->
	<div class="contents">
		<div id="title"><h1>EVENT</h1></div>
		<table class="tableStyle" id="tableId">
			<thead>
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
					<td colspan="4" class="tdStyle" id="imgTd"><img alt="#" src="${ contextPath }/resources/uploadFiles/${ event.changeName }" width="630px"></td>
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
						<div class="circleStyle">이벤트 기간</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro cssTD">
						<div class="divStyle event_text">
							<fmt:formatDate pattern="yyyy'년' MM'월' dd'일'(E)" value="${ event.eStart }"/>
							~ <fmt:formatDate pattern="yyyy'년' MM'월' dd'일'(E)" value="${ event.eEnd }"/><br>
							당첨 발표 - <fmt:formatDate pattern="yyyy'년' MM'월' dd'일'(E)" value="${ event.eAnno }"/>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_circle">
						<div class="circleStyle">이벤트 참여 방법</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro">
						<div class="divStyle event_text">
							이벤트 대상자 - ${ event.eTarget } <br>
							${ fn:replace(event.eWay, newLineChar, "<br>") }
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_circle">
						<div class="circleStyle">이벤트 당첨 기준</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="event_content" id="event_intro">
						<div class="divStyle event_text">
							${ fn:replace(event.eStand, newLineChar, "<br>") }
						</div>
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
					<td colspan="4">
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
					<td colspan="4" class="borderStyle">
						<button type="button" class="defaultBtn delBtn btn1" onclick="location.href='eventList.ev'">목록으로</button>
						<c:if test="${ adminUser != null }">
							<button type="button" class="defaultBtn upBtn btn1" id="updateEventBtn">수정</button>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="replyStyle" id="replyInsert">
						<jsp:useBean id="now" class="java.util.Date"/>
						<fmt:formatDate value="${ now }" pattern="yyyyMMdd" var="nowDate"/>
						<fmt:formatDate value="${ event.eEnd }" pattern="yyyyMMdd" var="closeDate"/>
						<c:choose>
							<c:when test="${ nowDate > closeDate }">
								이벤트 기간이 종료되었습니다. 다음 이벤트에서 참여부탁드립니다.<br>
								당첨자 발표를 기다려주세요.
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${ empty sessionScope.loginUser }">
										<c:choose>
											<c:when test="${ !empty sessionScope.adminUser }">
												관리자는 댓글을 작성할 수 없습니다.
											</c:when>
											<c:otherwise>
												로그인시 댓글을 작성하실 수 있습니다.
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:when test="${ (event.eTarget == '후원자' && loginUser.donation == 0) || (event.eTarget == '오디션 지원자' && reader == null)}">
										이벤트 대상자가 아니므로 댓글을 작성하실 수 없습니다.
									</c:when>
									<c:otherwise>
										<input type="text" class="inputStyle" name="reply" id="reply" placeholder="댓글을 작성해주세요.">
										<input type="button" class="defaultBtn upBtn btn1" id="rSubmit" value="등록">
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		// 주기적인 실행
		$(function(){
			getReplyList();
			setInterval(function(){
				getReplyList();
			}, 1000);
		}); 
		
		$(function(){
			
			// 댓글 등록
			$('#rSubmit').on('click', function(){
				var replyCheck = 0;
				var eNum = ${ event.eNum }
				var userId = "${ loginUser.userId}";
				var rContent = $('#reply').val();
				// 댓글여부
				if(rContent != ""){
					$.ajax({
						url: "replyCheck.ev",
						data: {eNum:eNum, userId:userId},
						success: function(data){
							console.log("ajax data:" + data);
							replyCheck = data;
							console.log("댓글여부 replyCheck : " + replyCheck);
							
							if(replyCheck == 0){
								$.ajax({
									url: "addReply.ev",
									data: {eNum:eNum, rContent:rContent},
									type: "post",
									success: function(data){
										if(data != null){
											getReplyList();
											$('#reply').val("");
											replyCheck = 1;
										}
									}
								});
							} else {
								alert('댓글은 한 번만 등록하실 수 있습니다.');
								$('#reply').val("");
							}
						}
					});
				} else {
					alert('댓글을 작성해주세요.');
				}
				
				
			});
			
		});
		
		// 댓글 삭세
		// replyCheck = false로 바꿔야함!
		function deleteReplyImg(obj){
			var userId = $(obj).parent().parent().children('.replyName').text();
			var eNum = ${ event.eNum }
			var loginId = "${ loginUser.userId}";
			var loginAdmin = "${adminUser.userId}";
			
			if(loginId == userId || loginAdmin == 'admin' ){
				var deleteCheck = confirm("정말로 삭제하시겠습니까?");
				if(deleteCheck){
					$.ajax({
						url: "deleteReply.ev",
						data: {userId:userId, eNum:eNum},
						type: "post",
						success: function(data){
							if(data != null){
								getReplyList();
								alert('댓글이 삭제되었습니다.');
							}
						}
					});
				}
			} else {
				alert('회원의 댓글이 아닙니다.');
			}
			
		}
		
		
		// 댓글 리스트 불러오기
		function getReplyList(){
			var eNum = ${event.eNum}
			
			$.ajax({
				url: "replyList.ev",
				data: {eNum:eNum},
				dataType: 'json',
				success: function(data){
					$tableBody = $('#tableId tbody');
					$tableBody.html('');
					
					var $tr;
					
					if(data.length > 0){
						for(var i in data){
							$tr = $(
							'<tr>' +
								'<td colspan=4 class="replyTD">' +
									'<div class="replyName">' + data[i].userId + '</div>' +
									'<div class="replyDate">' + data[i].rDate + '</div>' +
									'<div class="replyUpdate">' + 
										'<img src="${ contextPath }/resources/images/trash.png" width="15px" onclick="deleteReplyImg(this);">' +
									'</div>' +
								'</td>' +
							'</tr>' + 
							'<tr>' + 
								'<td colspan=4 class="replyStyle" id="reply_content">' +
									'<div id="replyDiv">' + decodeURIComponent(data[i].rContent.replace(/\+/g, ' ')) + '</div>' +
								'</td>' +
							'</tr>'
							);
							
							$tableBody.append($tr);
						}
					} else {
						$tr = $('<tr><td colspan=4 id="noneReply">등록된 댓글이 없습니다.</td></tr>');
						$tableBody.append($tr);
					}
				}
			});
		}
		
		// 이벤트 게시물 수정
		$('#updateEventBtn').click(function(){
			var eNum = ${event.eNum};
			location.href='updateEventView.ev?eNum='+ eNum;
		});
		
	</script>
	
</body>
</html>