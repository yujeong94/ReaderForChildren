<%@ page import="java.util.*" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.StringTokenizer"%>
<%@ page import="java.util.List , java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- <%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 쿠키 읽기
    Cookie[] cookies = request.getCookies();
%> --%>
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
	.search{text-align: center; margin-bottom: 30px;}
	.selectbox{width: 80px; height: 32px; border-radius: 5px; margin-right: 10px;}
	.bestbox{margin-bottom: 50px; background: rgb(255, 248, 242); padding: 20px 0 20px;}
	.best{margin: 0 auto 30px; width: 840px; height: 330px;}
	.bestTitle{font-size: 28px; font-weight: 500; color: #444; text-align: center;}
	.bestText{font-size: 12px; font-weight: 500; color: #444; text-align: center; margin-bottom: 30px;}
	#tb img{width: 230px; height: 250px; margin: 0 10px 0;}
	#tb img{margin-right: 40px;}
	#tb td{font-size: 20px; font-weight: bold; color: rgb(109, 109, 109);}
	#tb img:hover{cursor: pointer;}
	.frame{text-align: center; margin-bottom: 30px;}
	.searchline{border: 0; border-bottom: 2px solid darkgray; outline: none; width: 500px; height: 40px;}
	.sBtn{border: none; background:none;} .sBtn:hover {cursor: pointer;}
	.product{width: 270px; display: inline-block; margin: 10px 10px 40px 10px; align: center;}
	.bookImg{margin-bottom: 10px;}
	.text1{font-weight: bold; font-size: 18px; margin-bottom: 10px;}
	.text2{color: gray; margin-bottom: 10px;}
	.contents{display: inline-block; margin-left: 215px; margin-right: 10px;}
	.latest{display: inline-block; width: 110px; height: 500px; position: fixed;
			background: white;}
	.latestTitle{text-align: center; background: rgb(190, 190, 190); color: white; font-weight: bold; font-size: 17px; 
				vertical-align: middle; padding: 10px 0;}
	.latestTitle span{font-weight: normal; font-size: 14px;}
	.cookieBox{width: 110px; height: 420px;}
	.cookieBox img{margin: 6px 0 0 5px;}
</style>
</head>
<body>
	<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	
		<div class="contents">
			<div id="title"><h1>오디오북</h1></div>
			
			<c:set var="adminUser" value="${ adminUser }"/>
			<c:if test="${ adminUser ne null }">
				<div class="btnArea">
					<button id="uploadBtn" onclick="location.href='abinsertView.ab';">상품 등록</button>
				</div>
			</c:if>
			<br clear="all">
			
			<div class="bestbox">
				<div class="best">
					<div class="bestTitle">BEST SELLERS</div>
					<div class="bestText">지금 가장 사랑받고 있는 오디오북</div>
					<table id="tb">
						<tbody>
						</tbody>
					</table>
				</div>
			</div>

			<div class="search">
				<select class="selectbox" id="searchCondition" name="searchCondition">
					<option value="title" id="title"
						<c:if test="${searchCondition == 'title'}">selected</c:if>>제목</option>
					<option value="writer" id="writer"
						<c:if test="${searchCondition == 'writer'}">selected</c:if>>저자</option>
					<option value="publisher" id="publisher"
						<c:if test="${searchCondition == 'publisher'}">selected</c:if>>출판사
				</select>
				
				<c:if test="${ searchValue ne ''}">
					<c:set var="value" value='${ searchValue }'/>
				</c:if>
				<input type="search" id="searchValue" class="searchline" value="${ value }">
				<button class="sBtn" onclick="searchBoard();"><img src="${ contextPath }/resources/images/search.PNG" width="30px" height="30px"></button>
			</div>

			
			<div class="frame">
				<c:forEach var="b" items="${ blist }">
				<div class="product">
					<div class="bookImg">
						<c:url var="abdetail" value="abdetail.ab">
							<c:param name="bkCode" value="${ b.bkCode }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						
						<c:forEach var="bi" items="${ bilist }">	
							<c:if test="${ b.bkCode eq bi.bkCode }">
								<a href="${ abdetail }">
									<img src="${ contextPath }/resources/bookUploadImages/${ bi.changeName }" width="240px" height="280px" class="image">
								</a>
							</c:if>
						</c:forEach>
					</div>
					
					
						<div style="text-align:center;">
							<div class="text1">${ b.bkName }</div>
							<div class="text2">${ b.bkWriter } | ${ b.bkPublisher }</div>
							
							<c:forEach var="ab" items="${ ablist }">
								<c:if test="${ b.bkCode eq ab.bkCode }">
									<div class="text1" id="text1">
										<img src="${ contextPath }/resources/images/bookIcon.png" width="20px" height="20px"><fmt:formatNumber value="${ b.bkPrice }"/>원
										<img src="${ contextPath }/resources/images/logo2.png" width="30px" height="30px"><fmt:formatNumber value="${ ab.audPrice }"/>원
									</div>
								</c:if>
							</c:forEach>
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
		
		<div class="latest">
			<div class="latestTitle">오늘 본 상품<br><span>1/3</span></div>
			<div style="background: #ffe478; height: 8px;"></div>
			<div class="cookieBox">
			<%-- <%
				if(coo != null){
					for(int i=coo.size-1; i >= 0; i--){
						if(coo[i].getName().indexOf("item") != -1){
							out.print("<img width='100' src='/ReaderForChildren/resources/bookUploadImages/"+URLDecoder.decode(coo[i].getValue(), "UTF-8")+"'/><br/>");
						}
					}
				}
			%> --%>
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
	
	
	<script>
		function bestList(){
			$.ajax({
				url: 'bestList.ab',
				dataType: 'json',
				success: function(data){
					$tableBody = $('#tb tbody');
					$tableBody.html("");
					
					var $tr = $("<tr>");
					
					var $td0 = $("<td>");
					var $td1 = $("<td>");
					var $td2 = $("<td>");
					var $td3 = $("<td>");
					var $td4 = $("<td>");
					var $td5 = $("<td>");
					var $td6 = $("<td>");
					
					var $num1 = $td0.text('1');
					var $num2 = $td2.text('2');
					var $num3 = $td4.text('3');
					var $img0 = $("<img onclick='move(this);'>").attr('src',"${ contextPath }/resources/bookUploadImages/"+data[0].changeName);
					var $img1 = $("<img onclick='move(this);'>").attr('src',"${ contextPath }/resources/bookUploadImages/"+data[1].changeName);
					var $img2 = $("<img onclick='move(this);'>").attr('src',"${ contextPath }/resources/bookUploadImages/"+data[2].changeName);
					
					var $hidden1 = $("<input type='hidden' class='bestBkCode'>").attr('value', data[0].bkCode);
					var $hidden2 = $("<input type='hidden' class='bestBkCode'>").attr('value', data[1].bkCode);
					var $hidden3 = $("<input type='hidden' class='bestBkCode'>").attr('value', data[2].bkCode);
					
					$td0.append($num1);
					$td1.append($img0);
					$td1.append($hidden1);
					$td2.append($num2);
					$td3.append($img1);
					$td3.append($hidden2);
					$td4.append($num3);
					$td5.append($img2);
					$td5.append($hidden3);
					
					for(var i=0; i<7; i++){
						$tr.append(eval('$td'+i));
					}
					
					$tableBody.append($tr);
					
				}
			});
		}
	
		
		$(function(){
			bestList();
			
			setInterval(function(){bestList();}, 100000);
		});
		
		
		function move(obj){
			var bkCode = $(obj).parent().children('input').val();
			var page = ${pi.currentPage};
			
			location.href="abdetail.ab?bkCode="+bkCode+"&page="+page;
		}
	</script>
	
	
</body>
</html>