<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>noticeList</title>
<style>
	.tr{background: lightgrey; font-size: 17px; height: 40px;}
	#tb{margin: auto; width: 840px; border-collapse: collapse;}
	#tb tr td{padding: 5px;}
	#buttonTab{border-left: hidden; border-right: hidden;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>	
	
		<div class="contents">
		<div id="title"><h1>공지사항</h1></div>
		
		
		<table id="tb">
			<tr class="tr">
				<th>번호</th>
				<th width="300">제목</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			<%-- <c:forEach var="b" items="${ list }"> --%>
			<tr class="contentTR">
				<td align="center"><%-- ${ b.bId } --%></td>
				
				<td align="left">
					<%-- <c:if test="${ !empty loginUser }">
						<c:url var="bdetail" value="bdetail.bo">
							<c:param name="bId" value="${ b.bId }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						<a href="${ bdetail }">${ b.bTitle }</a>
					</c:if>
					<c:if test="${ empty loginUser }">
						${ b.bTitle }		
					</c:if> --%>
				</td>
				
				<td align="center"><%-- ${ b.bWriter } --%></td>
				<td align="center"><%-- ${ b.bCreateDate } --%></td>
				<td align="center"><%-- ${ b.bCount } --%></td>
			</tr>
			<%-- </c:forEach> --%>
			
			<tr>
				<td colspan="6" align="right" id="buttonTab">
					<%-- <c:if test="${ !empty loginUser }">
						&nbsp; &nbsp; &nbsp;
						<button onclick="location.href='binsertView.bo';">글쓰기</button>
					</c:if> --%>
				</td>
			</tr>
			
			<%-- <!-- 페이징 처리 -->
			<tr align="center" height="20" id="buttonTab">
				<td colspan="6">
				
					<!-- [이전] -->
					<c:if test="${ pi.currentPage <= 1 }">
						[이전] &nbsp;
					</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="blist.bo">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="blist.bo">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						[다음]
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="blist.bo">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }">[다음]</a>
					</c:if>
				</td>
			</tr> --%>
		</table>
		<!-- <script>
			$(function(){
				$('.contentTR').mouseenter(function(){
					$(this).css({'color':'yellowgreen', 'font-weight':'bold', 'cursor':'pointer'});
				}).mouseout(function(){
					$(this).css({'color':'black', 'font-weight':'normal'});
				}).click(function(){
					var bId = $(this).children('td').eq(0).text();
					
					location.href="bdetail.bo?bId="+bId+"&page="+${pi.currentPage};
													// page : 뒤로가기를 눌렀을 때, 보던 페이지(목록)로 가도록
				});
			});
		</script> -->
	
		
		
		
		
		</div>
		
	<c:import url="../common/footer.jsp"/>
	</div>
</body>
</html>