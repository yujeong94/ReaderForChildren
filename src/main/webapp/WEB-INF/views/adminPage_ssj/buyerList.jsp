<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>buyerList</title>
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
	font-size: 13px;
	text-align: center;
}

.tableDiv{
	height: 420px;
	width: 820px;
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
	font-size: 17px;
	vertical-align: middle;
}

table > tbody > tr > td {
	padding: 4px;
	vertical-align: middle;
}

/* .tableDiv::-webkit-scrollbar-thumb { background-color: pink; } */

.fixedHeader{
	position: sticky;
	top: 0;
	z-index: 2;
}

.NOtd{
	width: 90px;
}

.IDtd{
	width: 80px;
}

.ORDERtd{
	width: 20px;
	
}

.BOOKtd{
	width: 220px;
}

.DETAILtd{
	width: 230px;
}

.PRICEtd{
	width: 60px;
}

.STATUStd{
	width: 100px;
}

.borderTd{
	border-bottom: 1px solid #89978A;
}

/* 버튼 css */
button{
	padding: 5px 10px; 
    box-shadow: none; 
    border: none; 
    font-weight: bold;
    border-radius: 5px;
    cursor: pointer;
}

.statusBtn {
    background: #5D3D80;
    color: white;
}

.btnbtn{
	background: #707171;
	color: white;
}

.blinking{
	-webkit-animation:blink 0.4s ease-in-out infinite alternate;
    -moz-animation:blink 0.4s ease-in-out infinite alternate;
    animation:blink 0.4s ease-in-out infinite alternate;
    z-index: 1;
}
@-webkit-keyframes blink{
    0% {opacity:0.6;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0.6;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0.6;}
    100% {opacity:1;}
}

/* 카테고리 */
.search{
	width: 160px;
    margin-bottom: 10px;
    position: relative;
    left: 655px;
}

#category{
	width: 160px;
	padding: .5em .5em;
	border: 1px solid #77A687;
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
			<div id="title">구매자 리스트</div>
			<div class="search">
            <select size=1 id="category" name="event_status">
				<option value="최근" <c:if test="${ selectbox == '최근' }">selected</c:if>>최신순</option>
				<option value="오래된" <c:if test="${ selectbox == '오래된' }">selected</c:if>>오래된순</option>
				<option value="배송준비" <c:if test="${ selectbox == '배송준비' }">selected</c:if>>배송 접수 대기</option>
			</select>
         </div>
			<div class="tableDiv">
				<table class="listTable">
					<thead>
					<tr id="listTitle">
						<th class="NOtd fixedHeader">Date</th>
						<th class="IDtd fixedHeader">ID</th>
						<th class="ORDERtd fixedHeader">Order</th>
						<th class="BOOKtd fixedHeader">Book</th>
						<th class="DETAILtd fixedHeader">Detail</th>
						<th class="PRICEtd fixedHeader">Price</th>
						<th class="STATUStd fixedHeader">Status</th>
					</tr>
					</thead>
					<tbody>
					<c:if test="${ !empty list }">
						<c:forEach var="b" items="${ list }">
							<tr>
								<td class="borderTd">${ b.or_date }</td>
								<td class="borderTd">${ b.user_id }</td>
								<td class="borderTd">${ b.or_no }</td>
								<td class="borderTd">${ b.bk_name }</td>
								<td class="borderTd">옵션:<br>오디오북 (
									<c:choose>
										<c:when test="${ b.aud_code_f > 0 && b.aud_code_m == 0 }">여자</c:when>
										<c:when test="${ b.aud_code_m > 0 && b.aud_code_f == 0 }">남자</c:when>
										<c:otherwise>남자, 여자</c:otherwise>
									</c:choose>
									)
									<c:if test="${ b.contain_bk == 'Y' }">+ 도서</c:if>
								</td>
								<td class="borderTd"><fmt:formatNumber value="${ b.or_price }" type="number"/></td>
								<td class="borderTd">
									<c:choose>
										<c:when test="${ b.contain_bk == 'N' && b.or_status == 'Y' }"></c:when>
										<c:when test="${ b.or_status == 'N' }"><button class="deleteBtn btnbtn">주문취소</button></c:when>
										<c:when test="${ b.del_status == 2 }"><button class="successBtn btnbtn">접수완료</button></c:when>
										<c:otherwise><button class="statusBtn blinking readyBtn">배송접수</button></c:otherwise>
									</c:choose>
									
								</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${ empty list }">
						<tr>
							<td colspan="5" class="noneEvent">주문 내역이 없습니다.</td>
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
				$(this).parent().css({'color':'#233C0B', 'background':'#E9EDE4', 'cursor':'pointer', 'font-weight':'bold'});
			}).mouseout(function(){
				$(this).parent().css({'color':'black', 'background':'none', 'font-weight':'normal'});
			});
			
			$('#category').change(function(){
				var selectbox = $(this).val();
				
				location.href="buyerListCategory.ad?selectbox=" + selectbox;
			});
		});
		
			
			
		$('.statusBtn').click(function(){
			var userId = $(this).parent().parent().children().eq(1).text();
			var orNum = $(this).parent().parent().children().eq(2).text();
			var selectbox = $('#category').val();
			var thisbtn = $(this);
			
			/* var check = confirm("접수하시겠습니까?"); */
			
			swal({
				  title: "배송접수를 하시겠습니까?",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
					  $.ajax({
							url: "orderReceipt.ad",
							data: {userId:userId, orNum:orNum},
							success: function(data){
								console.log("data : " + data);
								if(data == "success"){
									thisbtn.removeClass("statusBtn").removeClass("blinking").removeClass("readyBtn").addClass("successBtn");
									thisbtn.text("접수완료").css({'background':'#707171', 'color':'white'});
									thisbtn.parent().children(".statusBtn").removeClass('blinking');
									
									if(selectbox == "배송준비"){
										window.location.reload();
									}
								}
							}
						});
				  } else {
				    swal("배송 접수가 실패되었습니다.");
				  }
				});
			
			/* if(check){
				$.ajax({
					url: "orderReceipt.ad",
					data: {userId:userId, orNum:orNum},
					success: function(data){
						console.log("data : " + data);
						if(data == "success"){
							thisbtn.removeClass("statusBtn").removeClass("blinking").removeClass("readyBtn").addClass("successBtn");
							thisbtn.text("접수완료").css({'background':'#707171', 'color':'white'});
							thisbtn.parent().children(".statusBtn").removeClass('blinking');
							
							if(selectbox == "배송준비"){
								window.location.reload();
							}
						} else {
							alert("배송 접수가 실패되었습니다.");
						}
					}
				});
			} */
			
		});
		
	</script>
	
</body>
</html>