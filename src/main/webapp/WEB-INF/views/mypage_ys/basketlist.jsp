 

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
 /*      height: 700px; */
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
		
		#th1{ width:130px; height:50px; border-radius : 10px 0px 0px 10px;}
		#th2{ width:355px;  }
		#th3{ width:10px; }
		#th4{ width:190px;  }
		#th5{ width:140px; border-radius : 0px 10px 10px 0px; }
.list_title{
			background-color:rgb(234, 234, 234);  vertical-align: middle; 
		}
		
		#list_table{
			margin-top : 30px; margin-left : 140px; border-collapse: collapse; border-spacing: 0; border-top : 2px solid gray; 
			border-bottom : 2px solid gray; text-align: center; font-size:16px;
		}
		 #list_table td { border-bottom : 2px solid gray; vertical-align: middle; } 
	 	#noList{text-align:center; width:2000px; height:300px;}
		#td1{ width:110px; height:100px;  }
		#td2{ width:240px;}
		#td3{width:100px;}
		#td4{ width:190px; }
		#td5{ width:140px;}
		.list_line2{
			font-size : 15px;
		}
	
#chk_list{width:17px; height:17px;}
#chk_all{width:17px; height:17px;}
#golist{width: 125px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer; 
		margin-left:260px;   margin-top:35px;    font-size: 18px; line-height: 40px; border: none; border-radius: 5px;}
#checkdelete{margin-left:140px; margin-top:15px;}
#buttonTab{margin-left:480px; margin-top:25px;}
</style>

</head>
<body>
   <!-- 로고, 장바구니, 메뉴바 -->
<div class="outer">
   <c:import url="../common/menubar.jsp"/>
   
   <div class = "contents">
  <div id="title"><h1>장바구니</h1></div>

	<table id = "content_table" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td class = "content_title" id = "title2">상품 목록
			</td>
			
		</tr>
		
	</table>
    
     <div id="listarea">
    <table id="sponserlist">
    	<tr>
    		<th class="list_title" id="th1">목록번호<input type="checkbox" id="allCheck" onclick="allChk(this);"  /></th>
    		<th colspan="2" class="list_title" id="th2">상품명</th>
    		<th class="list_title" id="th3"></th>
    		<th class="list_title" id="th4">가격</th>
    		<th class="list_title" id="th5">주문관리</th>
    	</tr>
    </table>
    </div>
    
    <div id = "tablearea2">
					<table id = "list_table">
					
					<c:forEach var="ca" items="${ list }">
						<!-- 게시글 불러오는곳 -->
					<!-- <tr>
						<td id="noList">존재하는 게시글이 없습니다.</td>
					</tr> -->
							<tr class="contentTr">
							
							<!-- <td align="center"></td> -->
							<td align="center"></td>
					 <td align="left">
					<input type="hidden" id="bkCode" value="${ ca.bkCode }">
					<input type="hidden" id="page" value="${ pi.currentPage }">
					<c:url var="abdetail" value="abdetail.ab">
							<c:param name="bkCode" value="${ ca.bkCode }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						<c:url var="cadelete" value="cadelete.li">
						<c:param name="cNo" value="${ ca.cNo }"/>
						</c:url>
			</td>  
			
						<td class = "list_line2" id="td1"  > ${ca.cNo } <input type="checkbox" id="chk_all" class="basketCheck" name="RowCheck" /></td>
							<td class = "list_line2" id="td3" ><img src="${ contextPath }/resources/bookUploadImages/${ca.changeName}" width="140px" height="110px"/></td>
							<td  class = "list_line2" id="td2">${ ca.bkName }</td>
							
							<td class="list_line2" id="td4">${ca.orPrice }</td>
							<td  class="list_line2" id="td5" ><%-- ${ca.status } --%><button type="button" onclick="deletecart()">삭제하기</button>
						
						<!-- <td>
								
							</td> -->
						
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
					<c:url var="before" value="calist.li">
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
						<c:url var="pagination" value="calist.li">
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
					<c:url var="after" value="calist.li">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		</table>
					
				</div>
	<div>
	<table>
  		<tr>
  			<td>
  	 			<button onclick="checkdeleteValue();" id="checkdelete">선택삭제</button>
			</td>
			<td>
				 <button onclick = "location.href = ''" id = "golist" >주문하기</button>
			</td>
		</tr>  
    </table>
    
     <script>
		function deletecart(){
			var bool = confirm("삭제하시겠습니까?");
			
			if( bool ){
				location.href='${cadelete}';
			}
		}
		</script>
		
		<script >
		$(function(){
			$('#td2').mouseenter(function(){
				$(this).css({'color':'yellowgreen', 'font-weight':'bole', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).css({'color':'black', 'font-weight':'normal'});
			}).click(function(){
			
				 var bkCode = $('#bkCode').val();
				var page = $('#page').val(); 
				/* var bkCode = $(this).children('td #td2').eq(0).text(); */
				
				location.href="abdetail.ab?bkCode="+bkCode+"&page="+${pi.currentPage};
				
			});						
		});
	</script>
		
    </div>
    
    
   </div>
   	<c:import url="../common/footer.jsp"/> 
   </div>
   
</body>
</html>