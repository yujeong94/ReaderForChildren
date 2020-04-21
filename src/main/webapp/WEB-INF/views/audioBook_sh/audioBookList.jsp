<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>audioBookList</title>
<style type="text/css">
	.btnArea{margin: 0 auto; width: 870px; height: 50px;}
	#uploadBtn{float: right; background: rgb(231, 76, 60); color: white;
			border: none; width: 100px; height: 40px; border-radius: 5px;
			font-weight: bold; font-size: 17.5px; margin: 0 5px 20px 5px; cursor: pointer;}
	.search{text-align: center; margin-bottom: 80px;}
	.selectbox{width: 80px; height: 32px; border-radius: 5px; margin-right: 10px;}
	.frame{text-align: center;}
	.searchline{border: 0; border-bottom: 2px solid darkgray; outline: none; width: 500px; height: 40px;}
	.sBtn{border: none; background:none;} .sBtn:hover {cursor: pointer;}
	.product{width: 300px; display: inline-block; margin: 10px 10px 40px 10px; align: center; border: 1px solid gray;}
	.bookImg{margin-bottom: 10px;}
	.text1{font-weight: bold; font-size: 18px; margin-bottom: 10px;}
	.text2{color: gray; margin-bottom: 10px;}
	.frame{margin-bottom: 30px; height: 1080px;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	
		<div class="contents">
			<div id="title"><h1>오디오북</h1></div>
			
			<div class="btnArea">
				<button id="uploadBtn" onclick="location.href='abinsertView.ab';">상품 등록</button>
			</div>
			
			<br clear="all">

			<div class="search">
				<select class="selectbox" id="searchCondition" name="searchCondition">
					<option selected disabled>-------</option>
					<option value="title" id="title">제목</option>
					<option value="writer" id="writer">저자</option>
					<option value="publisher" id="publisher">출판사</option>
				</select>
				<input type="search" id="searchValue" class="searchline">
				<button class="sBtn" onclick="searchBoard();"><img src="${ contextPath }/resources/images/search.PNG" width="30px" height="30px"></button>
			</div>
			
			<div class="frame">
				<c:forEach var="b" items="${ blist }">
				<div class="product">
					<div class="bookImg">
						<%-- <input type="hidden" value="${ b.bkCode }"> --%>
						<c:url var="abdetail" value="abdetail.ab">
							<c:param name="bkCode" value="${ b.bkCode }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						
						<c:forEach var="bi" items="${ bilist }">	
							<c:if test="${ b.bkCode eq bi.bkCode }">
								<a href="${ abdetail }">
									<img src="${ contextPath }/resources/bookUploadImages/${ bi.changeName }" width="300px" height="300px" class="image">
								</a>
							</c:if>
						</c:forEach>
					</div>
					<div style="text-align:center;">
						<div class="text1">${ b.bkName }</div>
						<div class="text2">${ b.bkWriter } / ${ b.bkPublisher }</div>
						<div class="text1">${ b.bkPrice }원</div>
					</div>
				</div>
				</c:forEach>
			</div>
			
			<div class="pagingArea">
				
				<!-- 검색 결과에 따라 루트 지정 -->
				<c:if test="${ searchValue eq null }">
					<c:set var="loc" value="ablist.ab" scope="page"/>
				</c:if>
				<c:if test="${ searchValue ne null }">
					<c:set var="loc" value="search.ab" scope="page"/>
				</c:if>
			
			
				<!--	<<	-->
				<c:if test="${ pi.currentPage <= 1 }">
					<button disabled>&lt;&lt;</button>
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="${ loc }">
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
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
							<c:if test="${ searchValue ne null }">
								<c:param name="searchCondition" value="${ searchCondition }"/>
								<c:param name="searchValue" value="${ searchValue }"/>
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
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
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
	function searchBoard(){
		var searchCondition = $("#searchCondition").val();
		var searchValue = $("#searchValue").val();
		
		location.href="search.ab?searchCondition="+searchCondition+"&searchValue="+searchValue;
	}
	</script>
	
	
</body>
</html>