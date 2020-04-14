<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>

   
  .contents {
	width: 1000px;
   height: 800px; 
    background: white;
    margin: auto;
    margin-bottom: 100px;
    padding: 20px;
}

   #subHeader{
		width : 1170px;
		height : 100px;
		display : inline-block;
	}
	#boardName{
		width : 94%;
		height : 70px;
		font-family: 'Nanum Gothic', sans-serif;
		font-size: 30pt;
		font-weight: bold;
		display : inline-table;
		border-bottom: 2pt solid gray;
		text-align: center;
	}
	
	#content_table td{
			border-bottom : 1pt solid gray;
				width : 1140px;
		}
		
	#title {
   margin: 50px;
   text-align: center;
}
	#title2{ font-size: 18px; }
	
	.content_title{
			font-weight : bold;
		}
		

  #Box{float:left;height:488px; width:400px; margin-left:65px; margin-top:40px;   border:1px solid #dfdfdf;   font-size: 15px;} 
.inBox{height:488px; width:400px;font-size: 15px; margin-top:30px; }
.name{width:400px; font-size: 25px; text-align:center;}
.intro{font-size:13pt; text-align:left; color:rgb(231, 127, 53);}

 #updateBtn{width: 100px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		margin-left:150px; margin-bottom:25px;  margin-top:20px;  font-size: 15px; text-align: center; border: 0; border-radius: 5px;}
	#cancle{width: 100px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		margin-left:150px; margin-bottom:25px;  margin-top:70px;    font-size: 15px; text-align: center; border: 0; border-radius: 4px;}
</style>

</head>
<body>
   <!-- 로고, 장바구니, 메뉴바 -->
 <div class="outer">
   <c:import url="../common/menubar.jsp"/>
   

   <div class = "contents">
	  <div id="title"><h1>아동 후원</h1></div>
	
		<table id = "content_table" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td class = "content_title" id = "title2">후원기관선택</td>
			</tr>
		</table>
	
	<!-- 기관 -->
	
	 <c:forEach var="b" items="${ list }">
		 <div id="Box"><!-- 젤큰거 --> 
			<div class="inBox"><!-- 그안에 박스 -->
				<%--  <c:if test="${ !empty loginUser }"> --> --%>
					<c:url var="splist" value="splist.sp">
						<c:param name="spCode" value="${ b.spCode }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
				<div class="name"> <!-- 이름칸 -->
					${b.spName }
				</div>
			<br>
				<%-- 	 </c:if> --%>
				
				<div class="intro"><!-- 내용 -->
				${ b.spIntro }
				</div>
				<br>
				
				<div class="phone"> 대표 전화 : ${ b.spPhone }</div><!-- 전화 --><br>
				
				<div class="address"> 주소 : ${ b.spAddress }</div><!-- 번호 -->
				
				<button class="btnBox" id="updateBtn" onclick ="location.href='suinsertView.sp';">후원하기</button>
			</div>
		</div>
	</c:forEach>
  
   </div>
   	<c:import url="../common/footer.jsp"/> 
  
 </div>
</body>
</html>