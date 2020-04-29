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
	h1{margin-bottom: 60px;}
	.search{text-align: center; margin-bottom: 10px; display: inline-block; padding: 0 40px; float: right;}
	.selectbox{width: 120px; height: 35px; border-radius: 5px; margin-right: 10px;}
	.tb{margin: 0 auto 30px; width: 90%; text-align: center; border-collapse: collapse;
		border-spacing: 0; background: rgb(254, 249, 248);}
	td{vertical-align: middle;}
	.titleTr{background: rgb(235, 130, 118); color: white; height: 50px; font-size: 17px; font-weight: bold; border-bottom: 2px solid grey;}
	.contentTr{height: 45px; font-size: 15px; border-bottom: 1px solid grey;}
	.defaultBtn{display: inline-block; float: right; margin-right: 50px;}
	.upBtn{background: rgb(231, 76, 60);}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>	
	
		<div class="contents">
		<div id="title"><h1>공지사항</h1></div>
		
		<div class="search">
			<select class="selectbox" id="searchCondition" name="searchCondition" onchange="searchAjax();">
				<option selected disabled>카테고리 선택</option>
				<option value="delivery" id="delivery"
					<c:if test="${ searchCondition == 'delivery' }">selected</c:if>>결제/배송</option>
				<option value="audition" id="audition"
					<c:if test="${ searchCondition == 'audition' }">selected</c:if>>리더 오디션</option>
				<option value="sponsor" id="sponsor"
					<c:if test="${ searchCondition == 'sponsor' }">selected</c:if>>아동 후원</option>
				<option value="volunteer" id="volunteer"
					<c:if test="${ searchCondition == 'volunteer' }">selected</c:if>>봉사활동</option>
				<option value="record" id="record"
					<c:if test="${ searchCondition == 'record' }">selected</c:if>>녹음부스 예약</option>
				<option value="event" id="event"
					<c:if test="${ searchCondition == 'event' }">selected</c:if>>이벤트</option>
			</select>
		</div>
		
		<table class="tb" id="tb">
			<thead>
				<tr class="titleTr">
					<td width="30">No</td>
					<td width="120">카테고리</td>
					<td width="230">제목</td>
					<td width="80">작성자</td>
					<td width="80">작성일</td>
					<td width="30">조회</td>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="n" items="${list}">
				<tr class="contentTr">
					<td>${ n.noCode }</td>
					<td>${ n.category }</td>
					<td>${ n.noTitle }</td>
					<td>${ n.adId }</td>
					<td>${ n.noDate }</td>
					<td>${ n.noHit }</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<c:if test="${ adminUser ne null }">
		<input type="button" class="defaultBtn upBtn" value="글작성">	
		</c:if>
		
		<br clear="all">
		
			<div class="pagingArea">
					
				<!-- 검색 결과에 따라 루트 지정 -->
				<c:if test="${ searchCondition eq null }">
					<c:set var="loc" value="noList.no" scope="page"/>
				</c:if>
				<c:if test="${ searchCondition ne null }">
					<c:set var="loc" value="search.no" scope="page"/>
				</c:if>
				
				
				<!--	<<	-->
				<c:if test="${ pi.currentPage <= 1 }">
					<button disabled>&lt;&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="${ loc }">
						<c:if test="${ searchCondition ne null }">
							<c:param name="searchCondition" value="${ searchCondition }"/>
						</c:if>
							
						<c:param name="page" value="${ pi.currentPage - 1}"/>
					</c:url>
					<a href="${ before }"><button>&lt;&lt;</button></a>
				</c:if>
					
				<!-- 	페이지 	-->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<button disabled>${ p }</button>
					</c:if>
						
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="${ loc }">
							<c:if test="${ searchCondition ne null }">
								<c:param name="searchCondition" value="${ searchCondition }"/>
							</c:if>
								
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }"><button>${ p }</button></a>
					</c:if>
				</c:forEach>
					
				<!--	>>	-->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<button disabled>&gt;&gt;</button>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="${ loc }">
						<c:if test="${ searchCondition ne null }">
							<c:param name="searchCondition" value="${ searchCondition }"/>
						</c:if>
							
						<c:param name="page" value="${ pi.currentPage + 1 }"/>					
					</c:url>
					<a href="${ after }"><button>&gt;&gt;</button></a>
				</c:if>
			</div>
		
		
		</div>
		
	<c:import url="../common/footer.jsp"/>
	</div>
	
	<script>
	
	function searchAjax(){
		var searchCondition = $("#searchCondition").val();
		
		location.href="search.no?searchCondition="+searchCondition;
	}
	
	
	$('.upBtn').click(function(){
		location.href="noInsert.no";
	});
	</script>
</body>
</html>