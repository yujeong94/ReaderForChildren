 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<link rel="stylesheet" href="../../resources/css/common.css">
<style>
.contents {
   width: 1100px;
   height: 600px;
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
		#th6{ width:210px; text-align:left; border-radius : 0px 10px 10px 0px;}
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
		
		 /* .btn{margin-bottom:15px;}  */
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
		<!-- <tr>
			<td id="noList">존재하는 게시글이 없습니다.</td>
		</tr> -->
				<tr id="contentTr">
			<td class = "list_line2" id="td1"  ><input type="checkbox" id="chk_all" name="chk_all" /></td>
				<td class = "list_line2" id="td2" >11</td>
				<td class="list_line2" id="td3">김누구님 배송지</td>
				<td class="list_line2" id="td4">김누구</td>
				<td class="list_line2" id="td5">서울시 강남구 </td>
				<td class="list_line2" id="td6" >010-1111-2222</td><td><div align="right"><button type="button" class="btn" id="update" onclick="updateShipping();">수정</button><button type="button" class="btn" id="delete">삭제</button></div></td>
			</tr>
			
		</table>
	</div>
   
   <div align="right" id="insert">
   	<button type="button" class="btn" id="insert" onclick="insertShipping();">등록하기</button>
   </div>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   </div>
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