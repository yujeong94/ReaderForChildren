<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>allUserList</title>
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
	margin: 70px;
	margin-bottom:50px;
	text-align: center;
	font-size: 45px;
	font-weight: bold;
}

#chooseDate{text-align:right; margin-bottom: 30px;}

.dateStyle{
	border-radius: 4px; vertical-align: middle; border: 1px solid #ced4da;
	padding: 0.5rem 0.6rem; font-size: 13px; width: 60px;
	position: relative; right: 120px;
}

.coin{
	margin: auto;
	text-align: center;
	
}

.tableStyle{
	margin: auto;
}

.totalCoin{
	font-size: 50px;
	font-weight: bold;
	padding: 15px;
	background: rgb(251, 231, 193);
}

.distribution{
	width: 200px;
	font-size: 20px;
	font-weight: bold;
	padding-top: 40px;
	padding-bottom: 10px;
}

.distriCoin{
	font-size: 25px;
	background: rgb(251, 249, 193);
	padding: 10px;
	border: 4px solid white;
}

.searchBtn{
	width: 35px;
	height: 100%;
	border: 0px;
	outline: none;
	vertical-align: middle;
	color: white;
	padding: 3px;
	border-radius: 4px;
	position: relative; right: 120px;
	background: white;
}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<!-- 내용 -->
	<div class="contents">
		<%@ include file="../common/adminMenubar.jsp" %>
		<div class="ap_content">
			<div id="title">전체 수익 현황</div>
			<div id="chooseDate">
				<jsp:useBean id="now" class="java.util.Date"/>
				<fmt:formatDate value="${ now }" pattern="yyyy" var="nowDateYear"/>
				<input type="number" class="dateStyle dateYear" min="2000" max="${ nowDateYear }" placeholder="연도">
				<input type="number" class="dateStyle dateMonth" min="1" max="12" placeholder="월">
				<button class="searchBtn"><img src="${ contextPath }/resources/images/search2.png" width="25px"></button>
			</div>
			<div class="coin">
				<table class="tableStyle">
					<tr>
						<td colspan="3" class="totalCoin"><p id="counter1"></p></td>
					</tr>
					<tr>
						<td class="distribution">RFC</td>
						<td class="distribution">Reader</td>
						<td class="distribution">Sponsor</td>
					</tr>
					<tr>
						<td class="distriCoin"><p id="counter2"></p></td>
						<td class="distriCoin"><p id="counter3"></p></td>
						<td class="distriCoin"><p id="counter4"></p></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp" %>
	
	<script>
		// 달 검색
		$('.searchBtn').click(function(){
			var dateYear = $('.dateYear').val();
			var dateMonth = $('.dateMonth').val();
			
			if(dateYear == ""){
				alert("연도를 입력해주세요.");
			} else if(dateMonth == ""){
				alert("달을 입력해주세요.");
			} else{
				$.ajax({
					url: "revenueSearch.ad",
					data: {dateYear:dateYear, dateMonth:dateMonth},
					success: function(data){
						function numberCounter(target_frame, target_number) {
						    this.count = 0; this.diff = 0;
						    this.target_count = parseInt(target_number);
						    this.target_frame = document.getElementById(target_frame);
						    this.timer = null;
						    this.counter();
						};
						numberCounter.prototype.counter = function() {
						    var self = this;
						    this.diff = this.target_count - this.count;
						     
						    if(this.diff > 0) {
						        self.count += Math.ceil(this.diff / 5);
						    }
						     
						    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						     
						    if(this.count < this.target_count) {
						        this.timer = setTimeout(function() { self.counter(); }, 20);
						    } else {
						        clearTimeout(this.timer);
						    }
						};

						new numberCounter("counter1", data);
						new numberCounter("counter2", data*0.7);
						new numberCounter("counter3", data*0.2);
						new numberCounter("counter4", data*0.1);
					}
				});
			}
			
		});
		
		var total = ${ r }
		
		function numberCounter(target_frame, target_number) {
		    this.count = 0; this.diff = 0;
		    this.target_count = parseInt(target_number);
		    this.target_frame = document.getElementById(target_frame);
		    this.timer = null;
		    this.counter();
		};
		numberCounter.prototype.counter = function() {
		    var self = this;
		    this.diff = this.target_count - this.count;
		     
		    if(this.diff > 0) {
		        self.count += Math.ceil(this.diff / 5);
		    }
		     
		    this.target_frame.innerHTML = this.count.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		     
		    if(this.count < this.target_count) {
		        this.timer = setTimeout(function() { self.counter(); }, 20);
		    } else {
		        clearTimeout(this.timer);
		    }
		};

		new numberCounter("counter1", total);
		new numberCounter("counter2", total*0.7);
		new numberCounter("counter3", total*0.2);
		new numberCounter("counter4", total*0.1);
		
	</script>
	
</body>
</html>