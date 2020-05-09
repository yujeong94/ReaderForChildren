<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${ contextPath }/js/jquery-3.4.1.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style>
   
   .contents{
      width: 1000px;
      height: 800px;
      background: white;
      margin: auto;
      margin-bottom: 100px;
      padding: 20px;
      font-size:16px;
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
    #title {
   margin: 50px;
   text-align: center;
}
   
   .info{
      border : 1px solid black;
      width : 60%;
      margin-right : auto;
      margin-left : auto;
      border-collapse: collapse;
      border-spacing: 0;
      margin-top:30px;
      vertical-align: middle;  
   }
   
   #info_title{
      height : 50px;
      background : #D8D8D8;
      font-size : 20px;
      vertical-align: middle;  
   }
   
   #info_word{
      margin-left : 5px;
   }
   
   .info_title2{
      width : 25%;
      height : 44px;
      border-top : 2px solid gray;
   }
   
   #address{
      width : 25%;
      height : 48px;
      border-top : 2px solid gray;
   }
   
   .right{
      width: 75%;
      border-top : 2px solid gray;
   }
   
   #ad_num{
      width : 20%;
   }
   
   #check{
      height : 18px;
      font-size : 10px;
      color : gray;
      margin-left : 5px;
      background : lightgray;
      border-radius : 3px;
      border : 1px lightgray solid;
      cursor : pointer;
   }
   
   .info_address{
      margin-top : 3px;
   }
   
   .input_info{
      border-radius: 5px;
      border : 1px lightgray solid;
      height : 24px;
      width : 50%;
   }
   
   #ad_btn{
      width : 15%;
      height : 26px;
      font-size : 12px;
      color : gray;
      margin-left : 5px;
      background : lightgray;
      border-radius : 3px;
      border : 1px lightgray solid;
      cursor : pointer;
   }
   
   .infro_email{
      width : 30%;
   }
   
   #selectEmail{
      height : 26px;
   }
   
   #year{
      width : 15%;
   }
   
   .birth{
      width : 10%;
   }
   
   .gender{
      margin-left : 5%;
   }
.quick_menu {
	 position:absolute; 
	 margin-top: 100px; 
		
	}
	.quick_menu table {
		display: inline-table;
		text-align: center;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
		margin-bottom: 20px;
	}
	.quick_menu td {
		cursor: pointer; 
		vertical-align: middle;  
		background-color: rgb(253, 249, 249);
	}
	.quick_menu td:hover{color:rgb(225, 120, 110);}
.boardTr{width:80px; height:40px; background-color: white;}
	.td {
		border-bottom: 1px solid gray;
	}
	#tabletd {border-left-style:none; border-right-style:none;}
	#tabletd td{ vertical-align: middle;}
#btn{margin-left:370px; margin-top:30px;}
.upBtn{width:90px;height:35px;  color: white;  box-shadow: none; 
    border: none; border-radius: 5px; font-size:13pt; font-weight: bold; }
    .delBtn{width:90px;height:35px;  color: white;  box-shadow: none; 
    border: none; border-radius: 5px; font-size:13pt; font-weight: bold; }
    #updateBtn{margin-right:10px; width:100px;}
    #deleteBtn{margin-left:10px;}
</style>

</head>
<body>
   <!-- 로고, 장바구니, 메뉴바 -->
  <div class="outer">
   <c:import url="../common/menubar.jsp"/>
   
   <div class = "contents">
   <div id="title"><h1>마이페이지</h1></div>
			<!-- <div id="quicklink">
			<table >
				<tr>
				<td>나의 활동</td></tr>
				<tr>
				<td><a href="views/b_member/pwdUpdateForm.jsp"><span id="changePwd">주문내역 조회</span></a></td></tr>
				<tr>
				<td><a href="views/b_member/pwdUpdateForm.jsp"><span id="changePwd">후원내역 조회</span></a></td></tr>
				<tr>
				<td><a href="views/b_member/pwdUpdateForm.jsp"><span id="changePwd">장바구니 조회</span></a></td></tr>
				<tr>
				<td><a href="views/b_member/pwdUpdateForm.jsp"><span id="changePwd">장바구니 조회</span></a></td>
				</tr>
				</table> -->
				
		 
      
				<div class="quick_menu">
				<table>
					
					<tr class="boardTr"><!-- shlist.li -->
						<td class="td" onclick="location.href = 'orlist.li'" id="infoTd">주문 내역 조회
						</td>
					</tr>
					<tr class="boardTr">
						<td class="td" onclick="location.href = 'sllist.sp'" id="infoTd">후원내역 조회
						</td>
					</tr>
					
					<tr class="boardTr">
						<td class="td" onclick="location.href = 'relist.li'" id="infoTd">예약부스 내역 조회
						</td>
					</tr>
					</table>
			</div>
			
    <table class = "info" id="tabletd" >
       <tr id = "info_title">
          <td colspan = "2"><label id = "info_word"><b>${ loginUser.userName }님의 정보</b></label></td>
       </tr>
       <tr>
          <td class = "info_title2">아이디</td>
          <td class = "right">${ loginUser.userId }</td>
       </tr>
       <tr>
          <td class = "info_title2">이름</td>
          <td class = "right">${ loginUser.userName }</td>
       </tr>
       <tr>
          <td class = "info_title2" id = "address">주소</td>
          <td class = "right">(${ loginUser.postalCode })
          ${ loginUser.bAddress }
          ${ loginUser.lAddress }</td>
       </tr>
       <tr>
          <td class = "info_title2">휴대전화</td>
          <td class = "right">${ loginUser.phone }</td>
       </tr>
       <tr>
          <td class = "info_title2">이메일</td>
          <td class = "right" >
          ${ loginUser.email }
          </td>
       </tr>
       <tr>
          <td class = "info_title2">생년월일</td>
          <td class = "right" >${ loginUser.birth }</td>
       </tr>
        <tr>
          <td class = "info_title2">후원금액</td>
          <td class = "right" id="donation" ><fmt:formatNumber value="${ loginUser.donation }" type="number"/>원</td>
       </tr> 
    </table>
    <div id="btn">
    <table>
  
   <tr> 
   <td><button type="button" onclick="location.href='mupdateView.me'" class="upBtn" id="updateBtn">정보수정</button></td> 
					
				<td><button type="button" id="cancels" class="upBtn" onclick="location.href = 'index.jsp'">메인으로</button></td>
				
				<c:url var="mdelete" value="mdelete.me">
						<c:param name="userId" value="${ loginUser.userId }"/>
				</c:url>
				<td><button type="button" id="deleteBtn" class="delBtn" onclick="location.href='${ mdelete }'">회원 탈퇴</button></td>
   </tr>
     </table>
    </div>
    
   </div>
   
  	<c:import url="../common/footer.jsp"/> 
  	
   </div>
   
</body>
</html>