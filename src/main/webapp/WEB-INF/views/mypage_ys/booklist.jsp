 

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
   .contents{
      width: 1000px;
      height: 700px;
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
		#content{ height : 400px;
			
		 }
		 
		 #sponserlist {
			border-collapse: collapse;
			border-spacing: 0;
			margin-top:10px;
			margin-left : 140px;
			font-weight: bold;
			height:45px;
			font-family: 'Nanum Gothic', sans-serif;
			font-size: 20px;
			display : inline-table;
		
		}
		#th1{ width:190px; height:50px; border-radius : 10px 0px 0px 10px;}
		#th2{ width:190px;  }
		#th3{ width:190px; }
		#th4{ width:190px; border-radius : 0px 10px 10px 0px; }
.list_title{
			background-color:rgb(234, 234, 234); vertical-align: middle;
			
		}
  #list_table{
			margin-top : 30px;
			margin-left : 140px;
			border-collapse: collapse;
			border-spacing: 0;
		/* 	border-top : 2px solid gray;
			border-bottom : 2px solid gray; */
			 text-align: center;
				
		}
		 #list_table td { height:40px;  } 
	 	#noList{text-align:center; width:2000px; height:300px; font-size: 18px; vertical-align: middle;  }
		#td1{ width:190px; height:30px; }
		#td2{ width:190px;}
		#td3{ width:190px; }
		#td4{ width:190px; }
		.list_line2{
			font-size : 15px;
		}
#gomain{width: 125px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		margin-left:450px;   margin-top:50px;    font-size: 18px;  text-align: center; border: 0; border-radius: 5px;}
#buttonTab{margin-left:450px; margin-top:25px;}
</style>

</head>
<body>
   <!-- 로고, 장바구니, 메뉴바 -->
   <div class="outer">
   <c:import url="../common/menubar.jsp"/>
   
   <div class = "contents">
  <div id="title"><h1>예약 조회</h1></div>
    	<table id = "content_table" style="margin-left: auto; margin-right: auto;">
			<tr>
				<td class = "content_title" id = "title2">예약 부스 내역 조회<%-- - 총 게시글 갯수 : ${ pi.listCount } --%>
				</td>
			</tr>
			
		</table>
		
		 <div id="listarea">
		    <table id="sponserlist">
		    	<tr>
		    		<th class="list_title" id="th1">예약번호 </th>
		    		<th class="list_title" id="th2">지점 위치</th>
		    		<th class="list_title" id="th3">예약 날짜</th>
		    		<th class="list_title" id="th4">예약 시간</th>
		    	</tr>
		    		
		    </table>
   	    </div>
   	   
		
	 <div id = "tablearea2">
					<table id = "list_table">
					<c:forEach var="re" items="${ list }">
						<!-- 게시글 불러오는곳 -->
					<!-- <tr>
						<td id="noList">존재하는 게시글이 없습니다.</td>
					</tr> -->
							<tr id="contentTr">
						<td class = "list_line2" id="td1"  > ${ re.rid }</td>
							<td class = "list_line2" id="td2" >${re.recCompany} ${ re.address }</td>
							<td class="list_line2" id="td3"> ${ re.rdate }</td>
							<td class="list_line2" id="td4"> ${ re.rtime }</td>
						</tr>
						</c:forEach>
						</table>
						<table id="buttonTab">
						<tr align="center" height="20" id="buttonTab">
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="relist.li">
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
						<c:url var="pagination" value="relist.li">
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
					<c:url var="after" value="relist.li">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		</table>
					
				</div>
    	
		<button onclick = "location.href = 'index.jsp'" id = "gomain" class="defaultBtn">메인으로</button>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
   </div>
   
    	<c:import url="../common/footer.jsp"/> 
   </div>
</body>
</html>