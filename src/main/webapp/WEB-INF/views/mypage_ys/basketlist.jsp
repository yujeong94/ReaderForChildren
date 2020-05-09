<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		#pay{width:80px;height:35px; margin-left:130px; margin-bottom:30px;}
	
#chk_list{width:17px; height:17px;}
#chk_all{width:17px; height:17px;}
#golist{width: 125px;height: 40px; background-color: rgb(236, 158, 149); color: white; font-weight: bold; cursor:pointer; 
		margin-left:260px;   margin-top:35px;    font-size: 18px; line-height: 40px; border: none; border-radius: 5px;}
#checkdelete{margin-left:140px; margin-top:15px;}
#buttonTab{margin-left:480px; margin-top:25px;}
#total{margin-left:860px; font-size: 18px;  }
.upBtn{color: white;  box-shadow: none; 
    border: none; border-radius: 5px; font-size:13pt; font-weight: bold; }
</style>

</head>
<body>
   <!-- 로고, 장바구니, 메뉴바 -->
<div class="outer">
   <c:import url="../common/menubar.jsp"/>
  	<form name="frm" method="post" onsubmit="return check();">
   <div class = "contents">
  <div id="title"><h1>장바구니</h1></div>

    
     <div id="listarea">
    <table id="sponserlist">
    	<tr>
    		<th class="list_title" id="th1">목록번호<input type="checkbox" name="select" id="allCheck" onclick="selectAll();" /></th>
    		<th colspan="2" class="list_title" id="th2">상품명</th>
    		<th class="list_title" id="th3"></th>
    		<th class="list_title" id="th4">가격</th>
    		<th class="list_title" id="th5"></th>
    	</tr>
    </table>
    </div>
    
    <div id = "tablearea2">
					<table id = "list_table">
					<c:set var="gum" value="0"/>
					<c:forEach var="ca" items="${ list }">
						<!-- 게시글 불러오는곳 -->
					<!-- <tr>
						<td id="noList">존재하는 게시글이 없습니다.</td>
					</tr> -->
					<c:url var="abdetail" value="abdetail.ab">
							<c:param name="bkCode" value="${ ca.bkCode }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<c:url var="cadelete" value="cadelete.li">
					<c:param name="cNo" value="${ ca.cNo }"/>
					</c:url>
					<tr class="contentTr" data-tr_value="${ca.cNo }">
							<!-- <td align="center"></td> -->
						<td align="center"></td>
						<td align="left">
							<%-- <input type="hidden" id="bkCode" value="${ ca.bkCode }"> --%>
							<input type="hidden" id="page" value="${ pi.currentPage }">
						</td>  
						<td class = "list_line2 listTd1" id="td1"> ${ca.cNo } <input type="checkbox" id="cNo" class="chBox" name="cNo" value="${ca.cNo }"/>
																		<input type="hidden" name="bkCode" id="bkCode" class="bkCode2" value="${ ca.bkCode }">
																		<input type="hidden" name="hidden2" id="hidden2" class="hidden22" value="${ ca.audCodeF }">
																		<input type="hidden" name="hidden3" id="hidden3" class="hidden33" value="${ ca.audCodeM }">  
																		</td>
							<td class = "list_line2" id="td3" ><img src="${ contextPath }/resources/bookUploadImages/${ca.changeName}" width="140px" height="110px"/></td>
							<td  class = "list_line2 bkNameClass" id="td2">${ ca.bkName }
								<input type="hidden" name="bkName" value="${ ca.bkName }">
							</td>
							
							<td class="list_line2 priceClass" id="td4">
							<fmt:formatNumber value="${ca.cPrice }" type="number"/>
							<input type="hidden" name="sum" class="price" value="0">
							<input type="hidden" id="hidden1" name="price" value="${ ca.cPrice }">
							<input type="hidden" class="contain" name="containBk" value="${ ca.containBk }">
							</td>
							<td  class="list_line2" id="td5" ><%-- ${ca.status } --%><button type="button" id="delete" class="upBtn" onclick="deletecart()">삭제</button>
						     <input type = "hidden" class = "input_info" name="userId" value="${loginUser.userId }">
						     </td>
						<!-- <td>
								
							</td> -->
						<c:set var="gum" value="${ca.cPrice}"/>
						<c:set var="total" value="${total+gum}"/>
						</tr>
							</c:forEach>
					</table>
					 <span id="total" class="total">
					<input type="hidden" name="tatal" value="${total}"> 총금액: ${total }
					</span>
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
				<input type="button" class="payBtn" id="pay" value="주문하기" >
			</td>
			
		</tr>  
    </table>
   
   
     <script>
     function selectAll() {
    	 	var all = document.getElementById("allCheck");
			var check = document.getElementsByName("cNo");

			for (var i = 0; i < check.length; i++) {
				if (all.checked) {
					check[i].checked = true;
				} else {
					check[i].checked = false;
				}
			}
		}
     
     var checkMessage = "";
     /* function deletecart(){
			var bool = confirm("삭제하시겠습니까?");
			
			if( bool ){
				
				
				location.href='${cadelete}';
				
			};
		};
      */
     
		</script>
		
		<script>
		 $('.upBtn').click(function(){
        if(confirm("삭제하시겠습니까?")){
            $("input[class='chBox']:checked").each(function(){
                var tr_value =$(this).val();
                var tr=$("tr[data-tr_value='"+tr_value+"']");
                tr.remove();
            });
        }else{
            return false;
        }
    });
 

		</script>
		 
		 
		
		<script >
		$(function(){
			$('#td3').mouseenter(function() {
				$(this).css({'color':'yellowgreen', 'font-weight':'bole', 'cursor':'pointer'});
			}).mouseout(function() {
				$(this).css({'color':'black', 'font-weight':'normal'});
			}).click(function() {
			
			 var bkCode = $('#bkCode').val();
				var page = $('#page').val(); 
				/* var bkCode = $(this).parent().children('input').val(); */
				
				location.href="abdetail.ab?bkCode="+bkCode+"&page="+${pi.currentPage};
				
			});						
		});
	</script>
<script>



function check(){
	var chk_all = $("input:checkbox[class='chBox']").is(":checked");

	
	if('${loginUser}' != ''){	
		
		if(chk_all==false){
			alert("주문하실 상품을 체크해주세요");
			return false;
		} 
		
		return true;
	
	} else{
		alert("로그인 후 이용해주세요.");
		return false;
	}
}


var bkName = null;
var bkCode = 0;
var price = 0;
var codeF = 0;
var codeM = 0;
var contain = null;
var sum = 0;
var hidden1 = null;
var hidden2 = null;
var hidden3 = null;
$(".chBox").click(function(){
	
		bkName = $(this).parent().parent().children(".bkNameClass").text().trim();
		bkCode = $(this).parent().parent().children(".listTd1").children(".bkCode2").val();
		price = $(this).parent().parent().children(".priceClass").text();
		codeF = $(this).parent().parent().children(".listTd1").children(".hidden22").val();
		codeM = $(this).parent().parent().children(".listTd1").children(".hidden33").val();
		/* contain = $(this).parents(".containTr").children(".priceClass").children(".contain").val(); */
		contain = $(this).parent().parent().children(".priceClass").children(".contain").val();
		
		/* console.log("1 " + bkName +" 2 " +bkCode +" 3 "+ price + " 4 "+codeF +" 5 "+ codeM + " 6 " + contain); */
		
		if(contain == 'Y') {
			hidden1 = '도서+오디오북';
		} else {
			hidden1 = '오디오북';
		}
		
		if(codeF != "0" && codeM != "0") {
			hidden2 = '여자음성+남자음성';
		} else if(codeF == "0" && codeM !="0") {
			hidden2 = '남자음성';
		} else if(codeF != "0" && codeM =="0") {
			hidden2 = '여자음성';
		} 
		
		if(codeF !="0" && codeM !="0") {
			hidden3 = codeF + ", " + codeM;
		} else if(codeF == "0" && codeM !="0") {
			hidden3 = codeM;
		} else if(codeF !="0" && codeM =="0") {
			hidden3 = codeF;
		}
		
		
}); 

	$(".payBtn").click(function(){
		var ch = check();
		
		sum = 0;
		if(price != "0"){
			sum = price;
		} else if(price == "0"){
			sum = '0';
		}
		if(ch) {
			
			location.href="purchase.ab?bkName=" + bkName + "&bkCode=" + bkCode + "&hidden1=" + hidden1 + "&hidden2=" + hidden2 + "&hidden3=" + hidden3 + "&sum=" + sum;
		}
	});
	
	
		


</script>

		<script>
 $(".chBox").click(function(){
  $("#allCheck").prop("checked", false);
 });
</script>
    </div>
    
    
   </div>
   </form>
   	<c:import url="../common/footer.jsp"/> 
   </div>
   
</body>
</html>