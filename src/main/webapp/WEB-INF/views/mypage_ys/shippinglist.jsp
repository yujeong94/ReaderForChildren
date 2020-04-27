 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
.contents {
   width: 1000px;
 /*   height: 600px; */
   background: white;
   margin: auto;
   margin-bottom: 100px;
   padding: 20px;
}

#title {
   margin: 50px;
   text-align: center;
}
#content_table td{
			border-bottom : 1pt solid gray;
				width : 1170px;
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
		#th1{ width:60px;  height:50px; border-radius : 10px 0px 0px 10px;}
		#th2{ width:60px;  }
		#th3{ width:190px; }
		#th4{ width:140px;}
		#th5{ width:210px; }
		#th6{ width:140px; text-align:left; border-radius : 0px 10px 10px 0px;}
.list_title{
			background-color:rgb(234, 234, 234); vertical-align: middle;
			
		}
  #list_table{
			margin-top : 30px;
			margin-left : 140px;
			border-collapse: collapse;
			border-spacing: 0;
			border-top : 2px solid gray;
			border-bottom : 2px solid gray;
				
		}
		 #list_table td { border-bottom : 2px solid gray;  vertical-align: middle; text-align: center;  } 
	 	#noList{text-align:center; width:2000px; height:300px; font-size: 18px; vertical-align: middle;  }
		#td1{ width:60px; height:50px; }
		#td2{ width:60px;}
		#td3{ width:190px; }
		#td4{ width:140px; }
		#td5{ width:190px; }
		#td6{ width:140px;  }
		.list_line2{
			font-size : 15px; 
		}
		#insert{margin-right:47px; margin-top:15px;}
		#buttonTab{margin-left:450px; margin-top:25px;}
		 /* .btn{margin-bottom:15px;}  */
		 .upBtn{width:100px;height:35px;  color: white;  box-shadow: none; 
    border: none; border-radius: 5px; margin-top:30px; }
    .defaultSA{background: rgb(231, 76, 60); color: white; border-radius: 3px; border: none; font-weight: bold;
			font-size: 11px; width: 68px; height: 22px;}
			#rlevel{margin-left:80px; width:140px;}
			
</style>
</head>
<body>
 <div class="outer">
   <c:import url="../common/menubar.jsp"/>
   
   <!-- 내용 -->
   <div class="contents">
      <div id="title"><h1>배송지 관리</h1></div>
   			<table id = "content_table" style="margin-left: auto; margin-right: auto;">
				<tr>
					<td class = "content_title" id = "title2">배송지 목록 
					</td>
				</tr>
			</table>
   
   	<div id="listarea">
		    <table id="sponserlist">
		    	<tr>
		    		<th class="list_title" id="th1">기본 <br>배송지 </th>
		    		<th class="list_title" id="th2">번호</th>
		    		<th class="list_title" id="th3">배송지 명</th>
		    		<th class="list_title" id="th4">수령인</th>
		    		<th class="list_title" id="th5">주소</th>
		    		<th class="list_title" id="th6">연락처</th>
		    	</tr>
		    </table>
   	    </div>
   
   <div id = "tablearea2">
		<table id = "list_table">
			<!-- 게시글 불러오는곳 -->
			<c:forEach var="sh" items="${ list }">
		<c:if test="${ sh.rLevel == 0 }">
				<tr class="contentTr">
				
				<!-- <td align="center" id="td2" class="list_line2" ></td> -->
			
	 	<td align="left" id="td2"> <button disabled class="defaultSA">기본배송지</button><input type="hidden"  id="chk_all" name="chk_all" />
			
			<input type="hidden" id="page" value="${ pi.currentPage }">
				
			
			
				
					<c:url var="shdetail" value="shdetail.li">
						<c:param name="sNo" value="${ sh.sNo }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<%-- <c:url var="rLUpdate" value="rLupdate.li">
						<c:param name="sNo" value="${ shipping.sNo }"/>
					</c:url> --%> 
					<%--  <a href="${ shdetail }">${ sh.sNo }</a>  --%>
				
				<%-- <c:if test="${ empty loginUser }">
					 ${sh.rName }	
				</c:if> --%>
			</td>
				
				
				
				<td class="list_line2" id="td">${sh.sNo } </td>
				<%-- <td class = "list_line2" id="td2" >${ sh.sNo }</td> --%>
				<td class="list_line2" id="td3">${ sh.sName }님 배송지</td>
				<td class="list_line2" id="td4">${sh.rName }</td>
				<td class="list_line2" id="td5">${sh.rZipcode }${sh.rBasicadd }${sh.rDetailadd }</td>
				<td class="list_line2" id="td6" >${sh.rPhone }</td>
			</tr>
			</c:if>
			<c:if test="${ sh.rLevel == 1 }">
				<tr class="contentTr">
				
			<%-- 	<td align="center" id="td2" class="list_line2" > ${ sh.sNo } </td> --%>
		
			<td align="left" id="td2"> <input type="hidden"  value="${ sh.rLevel }">	
			
			<input type="hidden" id="page" value="${ pi.currentPage }">
			
				
					<c:url var="shdetail" value="shdetail.li">
						<c:param name="sNo" value="${ sh.sNo }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<%--  <a href="${ shdetail }">${ sh.sNo }</a>  --%>
				
				<%-- <c:if test="${ empty loginUser }">
					 ${sh.rName }	
				</c:if> --%>
			</td>
				
				
				
			<td class = "list_line2" id="td1"  >${sh.sNo }</td>
			<%-- <td class = "list_line2" id="td2" >${ sh.sNo }</td> --%>
				<td class="list_line2" id="td3">${ sh.sName }님 배송지</td>
				<td class="list_line2" id="td4">${sh.rName }</td>
				<td class="list_line2" id="td5">${sh.rZipcode }${sh.rBasicadd }${sh.rDetailadd }</td>
				<td class="list_line2" id="td6" >${sh.rPhone }</td><td>
			</tr>
			</c:if>
			</c:forEach>
			
		</table>
		
		<script>
			$(document).ready(function(){
				$('input[type="checkbox"][name="check"]').click(function(){
					if($(this).prop('checked')) {
						$('input[type="checkbox"][name="check"]').prop('checked',false);
						$(this).prop('checked', true);
					}
				});
			});
		
		</script>
		<table id="buttonTab">
						<tr align="center" height="20" id="buttonTab">
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="shlist.li">
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
						<c:url var="pagination" value="shlist.li">
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
					<c:url var="after" value="shlist.li">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
		</tr>
		</table>
		
		
	</div>
   
   
   
   <div align="right" id="insert">
   	<button type="button" class="upBtn" id="insert" onclick="location.href='shinsertView.li';">배송지 등록</button>
   </div>
   
   </div>
   
   <script>
		function deleteShipping(){
			var bool = confirm("삭제하시겠습니까?");
			
			if( bool ){
				location.href='${shdelete}';
				
				location.href="shdelete.li?sNo="+5+"&page="+${pi.currentPage};
				
			}
		}
	</script>
  <!--  <script>
    function rLevelchange(){
    	var rLevel = confirm("기본배송지로 변경하시겠습니까?");
    	
    	if( rLevel ){
    		var sNo = $('#sNo').val();
    		location.href='${rLUpdate}';
    	location.href="rLupdate.li?sNo="+sNo; 
    		
    		
    	}
    }
   </script> -->
   
    <script >
		$(function(){
			$('.contentTr').mouseenter(function(){
				$(this).css({'color':'yellowgreen', 'font-weight':'bold', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).css({'color':'black', 'font-weight':'normal'});
			}).click(function(){
				
				var sNo = $(this).children('td').eq(1).text();
				location.href="shdetail.li?sNo="+sNo+"&page="+${pi.currentPage};
			});						
		});
	</script>
    
   <script>
   function updateShipping(){
       window.open("shippingUpdate.jsp", "updateShipping", "width=500, height=690");
    }
   function insertShipping(){
       window.open("shippingInsert.jsp", "insertShipping", "width=500, height=690");
    }
   
   </script>
   	<c:import url="../common/footer.jsp"/> 
   </div>
   
   
</body>
</html>