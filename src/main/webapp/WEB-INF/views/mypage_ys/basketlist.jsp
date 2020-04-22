 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/common.css">

<style>
   
   .contents{
      width: 1100px;
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
		#td2{ width:225px;}
		
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
    		<th class="list_title" id="th1">목록번호<input type="checkbox" id="chk_list" name="chk_list" value="list1" /></th>
    		<th colspan="2" class="list_title" id="th2">상품명</th>
    		<th class="list_title" id="th3"></th>
    		<th class="list_title" id="th4">가격</th>
    		<th class="list_title" id="th5">주문관리</th>
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
						<td rowspan="2" class = "list_line2" id="td1"  > 11 <input type="checkbox" id="chk_all" name="chk_all" /></td>
							<td rowspan="2" class = "list_line2" id="td2" >사진 	</td>
							<td >어린왕자 오디오북</td>
							
							<td rowspan="2" class="list_line2" id="td4">20000원</td>
							<td rowspan="2" class="list_line2" id="td5"><button type="button" >삭제하기</button></td>
						</tr>
						<tr>
							<td>옵션: 오디오북 + 음성</td>
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
    </div>
    
    
   </div>
   	<c:import url="../common/footer.jsp"/> 
   </div>
   
</body>
</html>