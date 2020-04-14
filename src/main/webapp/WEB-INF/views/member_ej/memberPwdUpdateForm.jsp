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

.info{
      /* border : 1px solid black; */
      width : 55%;
      height : 45%;
      margin-right : auto;
      margin-left : auto;
      border-collapse: collapse;
      border-spacing: 0;
      margin-top:30px;
      vertical-align: middle; 
      background: rgb(253, 249, 249);
   }
 
#title2{ font-size: 18px; }

 .info_title2{
      width : 25%;
      height : 8%;
      /* border-top : 2px solid gray; */
      vertical-align: middle; 
      font-size:18px;
	       text-align : center;
	 
   }
    .right{
      width:30%;
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
    #updateBtn{margin-right:10px;margin-left:470px;}
    #cancle{margin-left:10px;}
   
</style>
</head>
<body>
 <div class="outer">
   <c:import url="../common/menubar.jsp"/>
   
   <!-- 내용 -->
   <div class="contents">
      <div id="title"><h1>비밀번호 변경</h1></div>
   <form action="mPwdUpdate.me" method="post">
  <table id = "content_table" style="margin-left: auto; margin-right: auto;">
		<tr>
			<td class = "content_title" id = "title2">비밀번호 변경
			</td>
		</tr>
	</table> 
   
   <table class = "info" id="tabletd" >
       <tr>
          <td class = "info_title2" >현재비밀번호</td>
          <td class = "right"><input type = "password" name="userPwd" class = "input_info" ></td>
       </tr>
       <tr>
          <td class = "info_title2">비밀번호</td>
          <td class = "right"><input type = "password" name="newPwd1" class = "input_info"></td>
       </tr>
       <tr>
          <td class = "info_title2">비밀번호 확인</td>
          <td class = "right"><input type = "password" name="newPwd2" class = "input_info"></td>
       </tr>
   </table>
   
   <table>
	   <tr> 
   				<td><input id="updateBtn" type="submit" value="적용" class="upBtn"></td> 
				<td><button type="button" id="cancle" class="upBtn" onclick="location.href='javascript:history.go(-1)'">취소</button></td>
 	  </tr>
    </table>
   
   </form>
   
   </div>
   
   	<c:import url="../common/footer.jsp"/> 
   </div>
   
   
</body>
</html>