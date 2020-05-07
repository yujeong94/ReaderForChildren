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
      width: 1100px;
  /*     height: 700px; */
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
		 #title3{font-size: 18px; text-align:right; color:rgb(225, 120, 110);
		 cursor:pointer}
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
		
		
		
		#th1{ width:110px; height:50px; border-radius : 10px 0px 0px 10px;}
		#th2{ width:340px;  }
		/* #th3{ width:10px; } */
		#th4{ width:190px;  }
		#th5{ width:140px;}
		#th6{ width:80px; border-radius : 0px 10px 10px 0px; }
.list_title{
			background-color:rgb(234, 234, 234); vertical-align: middle;
			/* color : white; */
		}
		
		#list_table{
			margin-top : 30px;
			margin-left : 140px;
			border-collapse: collapse;
			border-spacing: 0;
			border-top : 2px solid gray;
			border-bottom : 2px solid gray;
			text-align: center;
			 font-size:16px;
				
		}
		 #list_table td { border-bottom : 2px solid gray; vertical-align: middle; } 
	 	#noList{text-align:center; width:2000px; height:300px;}
		#td1{ width:110px; height:100px; }
		#td2{ width:180px;} 
		#td3{ width:140px;}
		#td4{ width:140px; }
		#td5{ width:80px; }
		.list_line2{
			font-size : 15px;
		}
		#gomain{width: 125px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		margin-left:480px;   margin-top:15px;  font-size: 18px; text-align: center; border: 0; border-radius: 5px;}
		#buttonTab{margin-left:480px; margin-top:25px;}
		
</style>

</head>
<body>
   <!-- 로고, 장바구니, 메뉴바 -->
 <div class="outer">
   <c:import url="../common/menubar.jsp"/>
   <div class = "contents">
  
  <div id="title"><h1>주문 내역</h1></div>
  
  
	<table style="margin-left: 150px;">
		<tr>
			<td class = "content_title" id = "title3" onclick="location.href = 'shlist.li'" > 배송지 관리</td>
		</tr>
		
	</table>
    
     <div id="listarea">
    <table id="sponserlist">
    	<tr>
    		<th class="list_title" id="th1">목록번호</th>
    		<th colspan="2" class="list_title" id="th2">상품명</th>
    		<th class="list_title" id="th3"></th>
    		<th class="list_title" id="th4">주문일자</th>
    		<th class="list_title" id="th5">주문상태</th>
    		<th class="list_title" id="th6">파일</th>
    	</tr>
    </table>
    </div>
    
    <div id = "tablearea2">
					<table id = "list_table">
					
					<c:forEach var="o" items="${ list }">
					
						<!-- 게시글 불러오는곳 -->
					<!-- <tr>
						<td id="noList">존재하는 게시글이 없습니다.</td>
					</tr> -->
							<tr id="contentTr">
							
							<td rowspan="2" align="center" id="td1">${ o.orNo }</td>
							
					<!--  <td align="left">
					ㄴㄴㄴㄴ
				
			</td>   -->
							
						
							<td rowspan="2" class = "list_line2" id="td2" ><img src="${ contextPath }/resources/bookUploadImages/${o.img }" width="140px" height="110px"/>	</td>
							<td> ${ o.bkName }</td>
							
							<td rowspan="2" class="list_line2" id="td3">${o.orDate }</td>
							<td rowspan="2" class="list_line2" id="td4" >  ${ o.delStatus }
								<c:if test="${ o.delStatus == '배송준비중' }">
									<button id="button" type="button" onclick="deleteBuy()">주문취소</button>
								</c:if>
							<%-- <c:if test="">
								
							</c:if> --%>
							</td>
							<td  rowspan="2" class="list_line2" id="td5">		
							<c:if test="${ o.aud_code_m !='' && o.aud_code_m ne null }">
								[남자]
								<a href="${ contextPath }/resources/audioFileUpload/${o.aud_code_m}"  download="${o.aud_code_m}">
								<img src="${ contextPath }/resources/images/download.png"  width=30px height= 30px/></a>
							</c:if>
							<c:if test="${ o.aud_code_f !='' && o.aud_code_f ne null }">
								[여자]	
								<a href="${ contextPath }/resources/audioFileUpload/${o.aud_code_f}"  download="${o.aud_code_f}">
								<img src="${ contextPath }/resources/images/download.png" width=30px height= 30px/></a>
							</c:if>
						
							</td> 
						</tr>
						
						 <tr>
							<td>
							<c:if test="${ o.containBk != 'N' && o.aud_code_m !='' && o.aud_code_m ne null }">
							 옵션: 오디오북 남자  ${ o.containBk } 
							 </c:if>
							 <c:if test="${o.aud_code_f !='' && o.aud_code_f ne null }">
							 옵션: 오디오북 여자 ${ o.containBk } 
							 </c:if>
							</td>
						</tr> 
						
						<c:url var="ordelete" value="ordelete.li">
						<c:param name="orNo" value="${ o.orNo }"/>
						</c:url>
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
					<c:url var="before" value="orlist.li">
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
						<c:url var="pagination" value="orlist.li">
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
					<c:url var="after" value="orlist.li">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		</table>
					
		 <script>
		function deleteBuy(){
			var bool = confirm("삭제하시겠습니까?");
			
			if( bool ){
				location.href='${ordelete}';
			}
		}
		</script>
   			
        
      <button onclick = "location.href = '../../index.jsp'" id = "gomain" class="defaultBtn">메인으로</button>
    
   </div>
 
   	<c:import url="../common/footer.jsp"/> 
   </div>
   </div>
</body>
</html>