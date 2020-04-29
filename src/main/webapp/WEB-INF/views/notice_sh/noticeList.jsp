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
	.sBtn{border: none; background:none;} .sBtn:hover {cursor: pointer;}
	.tb{margin: 0 auto 30px; width: 90%; text-align: center; border-collapse: collapse;
		border-spacing: 0;}
	td{vertical-align: middle;}
	.titleTr{background: #D8D8D8; height: 50px; font-size: 17px; font-weight: bold; border-bottom: 2px solid grey;}
	.contentTr{height: 45px; font-size: 15px; border-bottom: 1px solid grey;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>	
	
		<div class="contents">
		<div id="title"><h1>공지사항</h1></div>
		
		<div class="search">
				<select class="selectbox" id="searchCondition" name="searchCondition" onchange="searchAjax();">
				<c:if test="${ searchCondition eq null }">
					<option selected disabled>카테고리 선택</option>
					<option value="delivery" id="delivery">결제/배송</option>
					<option value="audition" id="audition">리더 오디션</option>
					<option value="sponsor" id="sponsor">아동 후원</option>
					<option value="volunteer" id="volunteer">봉사활동</option>
					<option value="record" id="record">녹음부스 예약</option>
					<option value="event" id="event">이벤트</option>
				</c:if>
				<c:if test="${ searchCondition eq 'delivery' }">
					<option disabled>카테고리 선택</option>
					<option selected value="delivery" id="delivery">결제/배송</option>
					<option value="audition" id="audition">리더 오디션</option>
					<option value="sponsor" id="sponsor">아동 후원</option>
					<option value="volunteer" id="volunteer">봉사활동</option>
					<option value="record" id="record">녹음부스 예약</option>
					<option value="event" id="event">이벤트</option>
				</c:if>
				</select>
				
				<button class="sBtn"><img src="${ contextPath }/resources/images/search.PNG" width="30px" height="30px"></button>
			</div>
		
		<table class="tb">
			<tr class="titleTr">
				<td width="30">No</td>
				<td width="120">카테고리</td>
				<td width="230">제목</td>
				<td width="80">작성자</td>
				<td width="80">작성일</td>
				<td width="30">조회</td>
			</tr>
			
			<c:forEach var="n" items="${list}">
			<tr class="contentTr">
				<td>${ n.noCode }</td>
				<td>${ n.category }</td>
				<td>${ n.noContent }</td>
				<td>${ n.adId }</td>
				<td>${ n.noDate }</td>
				<td>${ n.noHit }</td>
			</tr>
			</c:forEach>
		</table>
		
			<div class="pagingArea">
					
				<!-- 검색 결과에 따라 루트 지정 -->
				<c:if test="${ searchCondition eq null }">
					<c:set var="loc" value="noList.no" scope="page"/>
				</c:if>
				<%-- <c:if test="${ searchCondition ne null }">
					<c:set var="loc" value="search.no" scope="page"/>
				</c:if> --%>
				
				
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
	/* function searchBoard(){
		var searchCondition = $("#searchCondition").val();
		
		location.href="search.no?searchCondition="+searchCondition;
	} */
	
	function searchAjax(){
		var searchCondition = $("#searchCondition").val();
		
		$.ajax({
			url: 'search.no',
			data: {searchCondition:searchCondition},
			dataType: 'json',
			success: function(data){
				console.log('성공?');
			}
		});
	}
	</script>
</body>
</html>