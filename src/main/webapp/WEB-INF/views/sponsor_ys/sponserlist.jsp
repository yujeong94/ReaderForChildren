 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

<style>
   
   .contents{
      width: 1000px;
      /* height: 800px; */
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
#title3{ font-size: 16px; }
		#content{ height : 400px;
			
		 }
		 #search{margin-top:15px;}
  #searchYear{width: 75px; font-size: 15px; }
#sponsername{width: 850px; font-size: 14px; }
#searchBtn{height:28px; width:80px; margin-left:10px;  }
#year{width:60px; height:20px; font-size: 15px;}
#sus{font-size:15px; width:3px;}
#sponserlist {
			border-collapse: collapse;
			border-spacing: 0;
			margin-left : 140px;
			font-weight: bold;
			/* height:45px; */
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 20px;
			display : inline-table;
		
		}
		
		
		
		#th1{ width:190px; height:50px; border-radius : 10px 0px 0px 10px;}
		#th2{ width:190px;  }
		#th3{ width:190px; }
		#th4{ width:190px; border-radius : 0px 10px 10px 0px; }
.list_title{
			background-color:rgb(234, 234, 234);
			 vertical-align: middle;
		}
		
		#list_table{
			margin-left : 140px;
			border-collapse: collapse;
			border-spacing: 0;
			border-top : 1px solid gray;
			border-bottom : 1px solid gray;
			text-align: center;
			height:60px;
		}
		 #list_table td { vertical-align: middle; }  
		#td1{ width:190px; height:30px; }
		#td2{ width:190px;}
		#td3{ width:190px; }
		#td4{ width:190px; }
		.list_line2{
			font-size : 15px;
		}
		#gomain{width: 125px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		margin-left:480px;   margin-top:15px;    font-size: 18px;  text-align: center; border: 0; border-radius: 5px;}
#total{margin-left:720px; font-size: 18px;  }
</style>

</head>

<body>
   <!-- 로고, 장바구니, 메뉴바 -->
<div class="outer">
   <c:import url="../common/menubar.jsp"/>
   <div class = "contents">
  
   <div id="title"><h1>아동 후원</h1></div>
 
    <div  id = "title3" >
  		
    </div>
    
    
    
    <!-- <div id="listarea"> -->
    <table id="sponserlist">
    	<tr>
    		<th class="list_title" id="th1">no.</th>
    		<th class="list_title" id="th2">후원기관</th>
    		<th class="list_title" id="th3">후원일자</th>
    		<th class="list_title" id="th4">후원금액 </th>
    	</tr>
    </table>
    <!-- </div> -->
    <c:set var="gum" value="0"/>
   <c:forEach var="sp" items="${ list }">
  <!--   <div id = "tablearea2"> -->
     
					<table id = "list_table">
					
						<!-- 게시글 불러오는곳 -->
					<%-- 	<c:if test="${ !empty loginUser }"> --%>
					<c:url var="sllist" value="sllist.sp">
						<c:param name="snum" value="${  sp.snum  }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					
					<%-- <a href="${ sldetail }">@@@제목@@@</a>
					</c:if>
					<c:if test="${ empty loginUser }">
					${ b.bTitle }###제목####		
					</c:if> --%>
					
					<!-- <tr>
						<td id="noList">존재하는 게시글이 없습니다.</td>
					</tr> -->
							<tr id="contentTr">
						<td class = "list_line2" id="td1"  >${ sp.snum }</td>
						<td class = "list_line2" id="td2"> ${ sp.spName} </td> 
							<td class="list_line2" id="td3">${ sp.supdate }</td>
							<td class="list_line2" id="td4" ><fmt:formatNumber value="${ sp.donation }" type="number"/></td>
						</tr>
						<c:set var="gum" value="${sp.donation}"/>
						<c:set var="total" value="${total+gum}"/>
					</table>
			<!-- 	</div> -->
				
    </c:forEach>
    
    <span id="total" class="total">
					총 후원 금액: <fmt:formatNumber value="${ total }" type="number"/>
					</span>
    
    
    
    
      <button type="button" id = "gomain" class="defaultBtn">뒤로가기</button>



   </div>

	<c:import url="../common/footer.jsp"/> 
   </div>
   
   <script>
   		$('.defaultBtn').click(function(){
   			window.history.back();
   		});
   </script>

</body>
</html>