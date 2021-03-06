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
   width: 500px;
   height: 600px;
   background: white;
   margin: auto;
   margin-bottom: 100px;
   padding: 20px;
}

	
	#content_table td{
			border-bottom : 1pt solid gray;
				width : 1140px;
				
		}

#title {
   margin: 50px;
   text-align: center;
}

.info{
      /* border : 1px solid black; */
      width : 80%;
      height : 60%;
      margin-right : auto;
      margin-left : auto;
      border-collapse: collapse;
      border-spacing: 0;
      margin-top:30px;
      vertical-align: middle; 
      background: rgb(253, 249, 249);
   }
   .info_address{
      margin-top : 5px; 
   }
 
#title2{ font-size: 18px; }

 .info_title2{
      width : 25%;
      height : 3%;
      /* border-top : 2px solid gray; */
      vertical-align: middle; 
      font-size:18px;
	       text-align : center;
	 
   }
    #address{
      width : 25%;
      height : 100px;
   }
   #address2{width:78%;}
   #ad_num{width:35%;}
    .right{
      width:40%;
      /* border-top : 2px solid gray; */
      vertical-align: middle; 
   }
   .input_info{
      border-radius: 5px;
      border : 1px lightgray solid;
      height : 27px;
      width : 58%;
   }
 /*   .upBtn{width:100px;height:30px; color:white; margin-right : -360px;
      margin-left : 440px; margin-top:30px; cursor:pointer} */
      .upBtn{width:80px;height:35px;  color: white;  box-shadow: none; 
    border: none; border-radius: 5px; margin-top:30px; }
    #updateBtn{margin-right:10px;margin-left:10px;}
    #cancle{margin-left:10px;}
   #rLvel{margin-left:150px;}
   
</style>
</head>
<body>
 <div class="outer">
    <c:import url="../common/menubar.jsp"/> 
   
   <!-- 내용 -->
   <div class="contents">
      <div id="title"><h1>배송지 </h1></div>
   
  <table id = "content_table" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td class = "content_title" id = "title2">
			</td>
			
		</tr>
		
	</table> 
   <table class = "info" id="tabletd" >
       
       <tr>
          <td class = "info_title2" >배송지 명</td>
          <td class = "right"><input type = "hidden" class = "input_info"  >${shipping.sName }</td>
       </tr>
       <tr>
          <td class = "info_title2">수령인</td>
          <td class = "right"><input type = "hidden" class = "input_info" >${shipping.rName }</td>
          
       </tr>
       
       <tr>
          <td class = "info_title2">휴대전화</td>
          <td class = "right"><input type = "hidden" class = "input_info" >${shipping.rPhone }</td>
       </tr>
        <tr>
          <td class = "info_title2" id = "address">주소</td>
          <td class = "right"><input type = "hidden" class = "input_info" id = "ad_num">${shipping.rZipcode }<br>
          <input type = "hidden" id="address2" class = "input_info info_address" >${shipping.rBasicadd }<br>
          <input type = "hidden" id="address2" class = "input_info info_address" >${shipping.rDetailadd }</td>
       </tr>
       
   </table>
	
	
	<c:url var="shupView" value="shupView.li">
			<c:param name="sNo" value="${ shipping.sNo }"/>
			<c:param name="page" value="${ page }"/>
		</c:url> 
		<c:url var="shdelete" value="shdelete.li">
			<c:param name="sNo" value="${ shipping.sNo }"/>
		</c:url>
		 <c:url var="shlist" value="shlist.li">
			<c:param name="page" value="${ page }"/>
		</c:url> 
<c:url var="rLUpdate" value="rLupdate.li">
						<c:param name="sNo" value="${ shipping.sNo }"/>
					</c:url> 


   <table>
 <%--   <c:if test="${ loginUser.userId eq Shipping.userId }"> --%>
   <tr> 
   				<td><button onclick="location.href='${rLUpdate}'" id="rLvel" class="upBtn">기본배송지 설정</button></td>
   				<td><button onclick="location.href='${ shupView }'" id="updateBtn" class="upBtn">수정</button></td> 
				<td><button type="button" id="cancle" class="upBtn" onclick="deleteShipping()">삭제</button></td>
   </tr>
   <%-- </c:if> --%>
     </table>
   
   
   
   <script>
		function deleteShipping(){
			var bool = confirm("삭제하시겠습니까?");
			
			if( bool ){
				location.href='${shdelete}';
			}
		}
	</script>
   
   <script>
    function rLevelchange(){
    	var rLevel = confirm("기본배송지로 변경하시겠습니까?");
    	
    	if( rLevel ){
    		var sNo = $('#sNo').val();
    		location.href='${rLUpdate}';
    	location.href="rLupdate.li?sNo="+sNo; 
    		
    		
    	}
    }
   </script>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   </div>
   	<c:import url="../common/footer.jsp"/> 
   </div>
   
   
</body>
</html>