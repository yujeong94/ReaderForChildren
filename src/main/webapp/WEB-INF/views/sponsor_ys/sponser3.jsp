<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
String name = request.getParameter("userName");
%>
<html>
<head>
<meta charset="UTF-8">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

<style>
   
   .contents{
      width: 1000px;
      height: 600px;
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
		#noList{text-align:center; width:900px; height:300px; vertical-align: middle; font-size: 25px; }
		#golist{width: 125px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		margin-left:420px;   margin-top:15px;    font-size: 18px;  text-align: center; border: 0; border-radius: 5px;}
		#gomain{width: 125px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer;
		/* margin-left:150px; margin-bottom:25px; */  margin-top:15px;    font-size: 18px;   text-align: center; border: 0; border-radius: 5px;}
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
			<td class = "content_title" id = "title2">후원 완료
			</td>
		</tr>
	</table>
	<table id = "content_table" style="margin-left: auto; margin-right: auto;">
						
						<tr>
							<td id="noList">'${ loginUser.userName }'님의 후원이 완료되었습니다.<br>
											후원해주셔서 감사합니다.
							</td>
						</tr>
					
					</table>
    <button onclick = "location.href = 'sllist.sp'" id = "golist" class="defaultBtn">후원내역</button>
     <button onclick = "location.href = 'index.jsp'" id = "gomain" class="defaultBtn">메인으로</button>
   </div>
   
   	<c:import url="../common/footer.jsp"/> 
   </div>
   
</body>
</html>