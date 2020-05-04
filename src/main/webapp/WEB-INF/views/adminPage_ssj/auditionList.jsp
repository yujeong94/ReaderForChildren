<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auditionList</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" /> -->
<style>
.contents {
   width: 1100px;
   height: 600px;
   background: white;
   margin: auto;
   margin-bottom: 100px;
}

.ap_content{
   display: inline-block;
   width: 843px;
   height: 100%;
   vertical-align: middle;
}

#title {
   margin: 50px;
   margin-bottom: 30px;
   text-align: center;
   font-size: 30px;
   font-weight: bold;
}

.listTable{
   margin: auto;
   font-size: 18px;
   text-align: center;
}

.tableDiv{
   height: 420px;
   width: 760px;
   margin: auto;
   margin-bottom: 40px;
   overflow: auto;
}

#listTitle{
   font-weight: bold;
}

table > thead > tr > th {
   background: #233C0B;
   color: white;
   padding: 5px;
   font-size: 20px;
}

table > tbody > tr > td {
   padding: 4px;
}

/* .tableDiv::-webkit-scrollbar-thumb { background-color: pink; } */

.fixedHeader{
   position: sticky;
   top: 0;
}

.NOtd{
   width: 150px;
}

.IDtd{
   width: 150px;
}

.DATEtd{
   width: 200px;
}

.STATUStd{
   width: 200px;
}

.stuTd{
   font-size: 15px;
   vertical-align: middle;
}

/* 검색창 */
.search{
   width: 160px;
   margin-bottom: 10px;
   position: relative;
   left: 635px;
}

.borderTd{
	border-bottom: 1px solid #89978A;
}

#category{
	width: 160px;
	padding: .5em .5em;
	border: 1px solid #C6C618;
	font-family: inherit;
	border-radius: 0px;
}

/* modal css */
/* .modalCSS{
	max-width: 1000px;
} */


</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>
   
   <!-- 내용 -->
   <div class="contents">
      <%@ include file="../common/adminMenubar.jsp" %>
      <div class="ap_content">
         <div id="title">지원자 리스트</div>
         <div class="search">
            <select size=1 id="category" name="event_status">
            	<option value="전체" <c:if test="${ selectbox == '전체' }">selected</c:if>>전체</option>
				<option value="미응답" <c:if test="${ selectbox == '미응답' }">selected</c:if>>미응답 지원서</option>
				<option value="합격" <c:if test="${ selectbox == '합격' }">selected</c:if>>합격자</option>
				<option value="불합격" <c:if test="${ selectbox == '불합격' }">selected</c:if>>불합격자</option>
				<option value="영구정지" <c:if test="${ selectbox == '영구정지' }">selected</c:if>>영구 정지</option>
			</select>
         </div>
         <div class="tableDiv">
            <table class="listTable">
               <thead>
               <tr id="listTitle">
                  <th class="NOtd fixedHeader">No</th>
                  <th class="IDtd fixedHeader">ID</th>
                  <th class="DATEtd fixedHeader">DATE</th>
                  <th class="STATUStd fixedHeader">STATUS</th>
               </tr>
               </thead>
               <tbody>
               <c:if test="${ !empty list }">
	               <c:forEach items="${ list }" var="a" varStatus="s">
	                  <tr>
	                     <td class="NOtd borderTd">${ s.count }</td>
	                     <td class="IDtd borderTd">${ a.userId }</td>
	                     <td class="DATEtd borderTd">${ a.enrollDate }</td>
                     	<c:choose>
                     		<c:when test="${ a.status == 0 }"><td class="STATUStd stuTd borderTd" style="color:#E6C716;">미응답</c:when>
                     		<c:when test="${ a.status == 1 }"><td class="STATUStd stuTd borderTd" style="color:#1D149F;">합격</c:when>
                     		<c:when test="${ a.status == 2 }"><td class="STATUStd stuTd borderTd" style="color:#6D6B6A;">불합격</c:when>
                     		<c:otherwise><td class="STATUStd stuTd borderTd" style="color:#D41113;">영구정지</c:otherwise>
                     	</c:choose>
	                     </td>
	                  </tr>
	               </c:forEach>
               </c:if>
               <c:if test="${ empty list }">
               		<tr>
               			<td colspan=4>리스트 결과가 없습니다.</td>
               		</tr>
               </c:if>
               </tbody>
            </table>
            <!-- <div id="ex1" class="modal modalCSS">
				 test
			</div>
			 
			<p><a href="#ex1" rel="modal:open">모달창띄우기</a></p> -->
         </div>
      </div>
   
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
   <script>
      $(function(){
         $('.listTable td').mouseover(function(){
            $(this).parent().css({'color':'#0FB07A', 'background':'#E9EDE4', 'cursor':'pointer', 'font-weight':'bold'});
         }).mouseout(function(){
            $(this).parent().css({'color':'black', 'background':'none','font-weight':'normal'});
         }).click(function(){
        	var userId = $(this).parent().children().eq(1).text();
        	 
        	location.href="auditionForm.ad?userId="+userId;
         });
         
         /* .ready(function(){
	        
	         #C8C80D, #DE720D
	         var status = $(this).parent().children('.stuTd').text();
	         var trimStatus = status.trim();
	         console.log("status : " + trimStatus);
	         if(trimStatus == "미응답"){
	        	 $('.stuTd').css('color','#D8D16F');
	         } else if(trimStatus == "합격"){
	        	 $('.stuTd').css('color','#1D149F');
	         } else if(trimStatus == "불합격"){
	        	 $('.stuTd').css('color','#6D6B6A');
	         } else {
	        	 $('.stuTd').css('color','#D41113');
	         }
         }) */
         
         $('#category').change(function(){
        	var selectbox = $(this).val();
        	location.href="auditionListSelect.ad?selectbox=" + selectbox;
         });
         
      });
      
   </script>
   
</body>
</html>