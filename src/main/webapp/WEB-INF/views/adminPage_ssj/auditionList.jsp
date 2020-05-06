<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>auditionList</title>
<link rel="stylesheet" href="${ contextPath }/resources/css/common.css">
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
   background: #6E6E6E;
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
   font-weight: 600;
   vertical-align: middle;
}

/* 검색창 */
.search{
   width: 160px;
   margin-bottom: 10px;
   position: relative;
   left: 630px;
}

.borderTd{
	border-bottom: 1px solid #89978A;
}

#category{
	width: 160px;
	padding: .5em .5em;
	border: 1px solid #6E6E6E;
	font-family: inherit;
	border-radius: 0px;
}

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
                     		<c:when test="${ a.status == 0 }"><td class="STATUStd stuTd borderTd" style="color:#D41113;">미응답</c:when>
                     		<c:when test="${ a.status == 1 }"><td class="STATUStd stuTd borderTd">합격</c:when>
                     		<c:when test="${ a.status == 2 }"><td class="STATUStd stuTd borderTd">불합격</c:when>
                     		<c:otherwise><td class="STATUStd stuTd borderTd">영구정지</c:otherwise>
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
         </div>
      </div>
   
   </div>
   
   <%@ include file="../common/footer.jsp" %>
   
   <script>
      $(function(){
         $('.listTable td').mouseover(function(){
            $(this).parent().css({'color':'#4D4A3A', 'background':'#D8D8D8', 'cursor':'pointer', 'font-weight':'bold'});
            
            var statustext = $(this).parent().children().eq(3);
            if(statustext.text().trim() != '미응답'){
            	statustext.css('color','black');
            }
         }).mouseout(function(){
            $(this).parent().css({'color':'black', 'background':'none','font-weight':'normal'});
         }).click(function(){
        	var userId = $(this).parent().children().eq(1).text();
        	 
        	location.href="auditionForm.ad?userId="+userId;
         });
         
         $('#category').change(function(){
        	var selectbox = $(this).val();
        	location.href="auditionListSelect.ad?selectbox=" + selectbox;
         });
         
      });
      
   </script>
   
</body>
</html>