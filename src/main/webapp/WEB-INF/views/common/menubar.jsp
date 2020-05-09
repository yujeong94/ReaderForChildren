<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menubar</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
	#menuShow {
		height: 100%;
	    width: 0;
	    position: fixed;
	    z-index: 1;
	    top: 0;
	    right: 0;
	    background-color: white;
	    overflow-y: hidden;
	    transition: 0.5s;
	    padding-top: 60px;
	}
	#menuShow a {
	    padding: 8px 8px 8px 30px;
	    text-decoration: none;
	    font-size: 20px;
	    color: #1C1C1C;
	    display: block;
	    transition: 0.3s;
	}
	
	#menuShow a:hover {
		color: orange;
	}
	/* .menulist  */.closeBtn {
	    position: absolute;
	    top: 0;
	    right: 25px;
	    font-size: 36px;
	    margin-left: 50px;
	}
#menuBtn {
		cursor : pointer;
	} 
	
#util2 {
	position: relative;
	z-index: 2;
    width: 50px;
	height: 50px;
}
/*  */
.menu-trigger {
   margin-right: 70px;
   margin-bottom: 50px;
}
.menu-trigger,
.menu-trigger span {
    display: inline-block;
    transition: all .4s;
    box-sizing: border-box;
}

.menu-trigger {
    position: relative;
    width: 45px;
    height: 30px;
    top: 5px;
}

.menu-trigger span {
    position: absolute;
    left: 0;
    width: 100%;
    height: 3px;
    background-color: #2E2E2E;
    border-radius: 50px;
}

.menu-trigger span:nth-of-type(1) {
    top: 0;
}

.menu-trigger span:nth-of-type(2) {
    top: 12px;
}

.menu-trigger span:nth-of-type(3) {
    bottom: 0;
}
	
.menu-trigger.active-1 span:nth-of-type(1) {
    -webkit-transform: translateY (14px) rotate (-45deg);
    transform: translateY(14px) rotate(-45deg);
}

.menu-trigger.active-1 span:nth-of-type(2) {
    opacity: 0;
}

.menu-trigger.active-1 span:nth-of-type(3) {
    -webkit-transform: translateY(-14px) rotate(45deg);
    transform: translateY(-14px) rotate(45deg);
}

</style>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<header>
      <div class = "mainheader clear-fix">
         <h2 class = "logo">
            <a href="${ contextPath }/index.jsp"><img src="${ contextPath }/resources/images/logo2.png" width = 130px height = 130px/></a>
         </h2>
         <ul class='util'>
         	<li><a href="${ contextPath }/calist.li"><img src = "${ contextPath }/resources/images/cart.png" width = 40px height = 40px></a></li>
         	<li id="util2">
         		<a class="menu-trigger" href="#">
					<span></span>
					<span></span>
					<span></span>
				</a>	
			</li>
         	<%-- <li><img src = "${ contextPath }/resources/images/open-menu.png" width = 40px height = 40px id = "menuBtn" onclick="openMenu();"></li> --%>
         </ul>
      </div>
      
      <c:url var="ablist" value="ablist.ab"/>
      <c:url var="splist" value="splist.sp"/>
      <c:url var="aulist" value="aulist.au"/>
      <c:url var="calist" value="calist.li"/>

      <div id="menuShow">
			<!-- <a href="#" class="closeBtn" onclick="closeMenu();">X</a> -->
			<a href="${ ablist }" style="margin-top: 50px;">오디오북 shop</a>
			<a href="${ splist }">아동 후원</a>
			<a href="${ contextPath }/volView.vo">봉사 일정</a>
			<a href="${ aulist }">Reader 오디션 지원</a>
			<a href="javascript:void(0)" id="recBtn">녹음부스 예약</a>
			<%-- <a href="${ contextPath }/recordView.re" id="recBtn">녹음부스 예약</a> --%>
			<a href="${ contextPath }/eventList.ev">진행 중인 이벤트</a>
			<a href="${ contextPath }/noList.no">공지사항</a>
			<a href="javascript:void(0);" onclick="qna();" >Q&A</a>
		</div>
   </header>
   <script>
   var burger = $('.menu-trigger');

   burger.each(function(index){
       var $this = $(this);
       
       $this.on('click', function(e){
           e.preventDefault();
           $(this).toggleClass('active-' + (index+1));
           console.log($(this).attr("class"));
           if($(this).attr("class") == "menu-trigger active-1") {
        	   openMenu();
           } else {
        	   closeMenu();
           }
       })
   });
   </script>
   <script>
	   function openMenu() {
		    document.getElementById("menuShow").style.width = "230px";
		    $("#menuShow").css("z-index","1");
		}
	   
	   function closeMenu() {
		    document.getElementById("menuShow").style.width = "0";
		}
	   
	   $("#recBtn").click(function(){
		  	var userId = "${ loginUser.userId }";
			var admin = "${ adminUser.userId }";
			
			if(userId == "" && admin == "") {
				swal("로그인 후 이용해주세요.");
			} else if(userId != "") {
				
				$.ajax({
					url: "divisionFind.re",
					type: "post",
					data: {userId:userId},
					success: function(data){
						console.log(data);
						if(data == "1") {
							swal("리더회원만 예약할 수 있습니다.");
						} else {
							location.href="recordView.re";
						}
					}
				});
				
			} else {
				location.href="recordView.re";
			}
			

	   });
   </script>
   

	<script>
    function qna() {
    	var userId = "${ loginUser.userId }";
		var admin = "${ adminUser.userId }";
		
    	if(userId != "" && admin == ""){
	        window.open("${ contextPath }/chatView.ch","", "width = 500, height = 600,left=500,top=100");
    	}else if(userId == "" && admin != ""){
    		window.open("${ contextPath }/chatView2.ch","", "width = 500, height = 600,left=500,top=100");
    	}
    }
	</script>
	

</body>
</html>