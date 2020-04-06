<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>audioBookList</title>
<style type="text/css">
	.btnArea{margin: 0 auto; width: 800px; height: 50px;}
	#uploadBtn{float: right; background: rgb(231, 76, 60); color: white;
			border: none; width: 100px; height: 40px; border-radius: 5px;
			font-weight: bold; font-size: 17.5px; margin: 0 5px 20px 5px;}
	.search{text-align: center; margin-bottom: 50px;}
	.selectbox{width: 80px; height: 32px; border-radius: 5px; margin-right: 10px;}
	.searchline{border: 0; border-bottom: 2px solid darkgray; outline: none; width: 500px; height: 20px;}
	.product{width: 300px; display: inline-block; margin: 10px; align: center; border: 1px solid gray;}
	.bookImg{margin-bottom: 10px;}
	.text1{font-weight: bold; font-size: 18px; margin-bottom: 10px;}
	.text2{color: gray; margin-bottom: 10px;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	
		<div class="contents">
			<div id="title"><h1>오디오북</h1></div>
			
			<div class="btnArea">
				<button id="uploadBtn" onclick="uploadProduct();">상품 등록</button>
			</div>
			
			<br clear="all">

			<div class="search">
				<select class="selectbox">
					<option>제목</option>
					<option>저자</option>
					<option>출판사</option>
				</select>
				<input type="text" class="searchline">
				<img src="${ contextPath }/resources/images/search.PNG" width="30px" height="30px">
			</div>
			
			<c:forEach var="b" items="${ blist }">
			<div class="product">
				<div class="bookImg">
					<input type="hidden" value="${ b.bkCode }">
					
					<%-- <c:if test="${ !empty loginUser }"> --%>
						<c:url var="abdetail" value="abdetail.ab">
							<c:param name="bkCode" value="${ b.bkCode }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						
						<%-- <a href="${ abdetail }">
							<img src="${ contextPath }/resources/bookUploadImages/${ bi.changeName }" width="300px" height="300px">
						</a> --%>
					<%-- </c:if> --%>
					<%-- <c:if test="${ empty loginUser }">
						<img src="${ contextPath }/resources/bookUploadImages/${ bi.changeName }" width="300px" height="300px">
					</c:if> --%>
				</div>
				<div style="text-align:center;">
					<div class="text1">${ b.bkName }</div>
					<div class="text2">${ b.bkWriter } / ${ b.bkPublisher }</div>
					<div class="text1">${ b.bkPrice }원</div>
				</div>
			</div>
			</c:forEach>
			
		</div>
		
	<c:import url="../common/footer.jsp"/>
	</div>
	
	
	<script>
	function uploadProduct(){
		location.href="${contextPath}/views/audioBook/uploadProduct.jsp";
	}
	</script>

</body>
</html>