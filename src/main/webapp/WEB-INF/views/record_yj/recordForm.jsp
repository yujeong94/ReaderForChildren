<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹음 부스 예약하기 | ReaderForChildren</title>
<link rel="stylesheet" href="../../resources/css/common.css">
<link href='${ contextPath }/fullcalendar/packages/core/main.css' rel='stylesheet' />
<link href='${ contextPath }/fullcalendar/packages/daygrid/main.css' rel='stylesheet' />
<script src='${ contextPath }/fullcalendar/packages/core/main.js'></script>
<script src='${ contextPath }/fullcalendar/packages/daygrid/main.js'></script>
<style>
	.btnBox {
		margin-bottom: 80px;
	}
	#map {
		margin: auto;
	}
	#searchAddr {
		text-align: center;
		vertical-align: middle;
		font-size: 1.2rem;
	}
	#myAddr {
		width: 300px;
	}
	
	#calendar{
     	width : 500px;
	   	height : 400px;
	   	margin: auto;
	   	margin-top: 50px;
	   	margin-bottom: 50px;
	}
	
	#timeTable {
		text-align: center;
		margin: auto;
		width: 500px;
		font-size: 1.5rem;
		border: 1px solid black;
	}
	
	#timeTable td {
		border: 1px solid black;
		cursor: pointer;
	}
</style>
</head>
<body>
<div class="outer">
	<c:import url="../common/menubar.jsp"/>
	<div class="contents">
	<h1>녹음 부스 예약</h1>
		<div id="map" style="width:500px;height:400px;">
		</div>
		<br>
		<div id="searchAddr">
			<span>주소 : </span><input type="text" id="myAddr"> <button id="searchBtn">검색</button><br>		
		</div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2ba6d1c50b0830380e7bf47f39814068&libraries=services,clusterer,drawing"></script>
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.498981, 127.032914), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
	
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			var positions = [
			    {
			        content: '<div>[ 레벨나인 스튜디오 ] 서울특별시 강남구 727-13 세일빌딩 9층 (논현로 414)</div>', 
			        latlng: new kakao.maps.LatLng(37.498786, 127.038978)
			    },
			    {
			        content: '<div>[ 리플레이사운드 ] 서울특별시 용산구 효창동</div>',
			        latlng: new kakao.maps.LatLng(37.544259, 126.960600)
			    },
			    {
			        content: '<div>[ 지니영상녹음실 ] 역삼동 738번지 KS빌딩 503호 강남구 서울특별시 KR</div>',
			        latlng: new kakao.maps.LatLng(37.498811, 127.036463)
			    },
			    {
			        content: '<div>[ 녹음실뉴렉 ] 충청북도 청주시 상당구 영동 100-6</div>', 
			        latlng: new kakao.maps.LatLng(36.643613, 127.487577)
			    },
			    {
			        content: '<div>[ 모나미녹음스튜디오 ] 대구광역시 수성구 황금2동</div>', 
			        latlng: new kakao.maps.LatLng(35.843868, 128.624458)
			    },
			    {
			        content: '<div>[ 연스튜디오 ] 광주광역시 남구 사동 177-39</div>',
			        latlng: new kakao.maps.LatLng(35.145611, 126.915075)
			    },
			    {
			        content: '<div>[ 뮤직센스 ] 서울특별시 서초구 서초동 1328-11</div>',
			        latlng: new kakao.maps.LatLng(37.495459, 127.028616)
			    },
			    {
			        content: '<div>[ 케이엠아이스튜디오 ] 경기도 구리시 교문동 235</div>',
			        latlng: new kakao.maps.LatLng(37.606107, 127.134291)
			    }
			];

			for (var i = 0; i < positions.length; i ++) {
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: positions[i].latlng // 마커의 위치
			    });

			    // 마커에 표시할 인포윈도우를 생성합니다 
			    var infowindow = new kakao.maps.InfoWindow({
			        content: positions[i].content // 인포윈도우에 표시할 내용
			    });

			    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
			    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
			    
			    // 내가 한거 : 마커의 위치정보 가져오기
			    var geocoder = new kakao.maps.services.Geocoder();
			    kakao.maps.event.addListener(marker, 'click', function() {        
		             console.log(marker.getPosition($(this).latlng));
		             var latlng = marker.latLng; 
		             console.log(latlng);
		            
		             searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
		            	 if (status === kakao.maps.services.Status.OK) {
		                     var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
		                     detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
		                     
		                     var content = '<div class="bAddr">' +
		                                     '<span class="title">법정동 주소정보</span>' + 
		                                     detailAddr + 
		                                 '</div>';

		                     // 마커를 클릭한 위치에 표시합니다 
		                     marker.setPosition(mouseEvent.latLng);
		                     marker.setMap(map);

		                     // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
		                     infowindow.setContent(content);
		                     infowindow.open(map, marker);
		                 }  
		             });
		         });
			    
			}

			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
			    return function() {
			        infowindow.open(map, marker);
			    };
			}

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
			    return function() {
			        infowindow.close();
			    };
			}
			
			/* var geocoder = new kakao.maps.services.Geocoder();
			
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	             
	             // 클릭한 위도, 경도 정보를 가져옵니다 
	             var latlng = mouseEvent.latLng; 
	             console.log(latlng);
	             
	             // 마커 위치를 클릭한 위치로 옮깁니다
	             /* marker.setPosition(latlng);
	             $('#area_x').val(latlng.getLat());
	             $('#area_y').val(latlng.getLng()); */
	             
	             /* console.log("위도 : " + latlng.getLat());
	             console.log("경도 : " + latlng.getLng()); */
	             /* 
	             searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
	                 if (status === kakao.maps.services.Status.OK) {
	                    $('#adr').val(result[0].address.address_name);
	                    var local_name = result[0].address.address_name.substring(0, 2);
	                    if(local_name == '세종'){
	                       local_name = '충남';
	                    }
	                    $('#local_name').val(local_name);
	                 }   
	             });
	         });
	         
	         function searchDetailAddrFromCoords(coords, callback) {
	             // 좌표로 법정동 상세 주소 정보를 요청합니다
	             geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
	         }  */
			
			/* // 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			var inputAddr = $("#myAddr").text();
			$("#searchBtn").click(function(){
				console.log(inputAddr);
			});
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });

			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			        });
			        infowindow.open(map, marker);

			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			  	}
			});  */
		</script>
		
		<div id="calendar"></div>
		
		<script>
	    document.addEventListener('DOMContentLoaded', function() {
	    	var calendarEl = document.getElementById('calendar');
	    
	    	var calendar = new FullCalendar.Calendar(calendarEl, {
	        	plugins: [ 'dayGrid' ]
	        });
	    
	      
	        calendar.addEvent( {'title':'어린이집 일일교사', 'start':'2020-04-10', 'end':'2020-04-10'});
	      
	        calendar.render();
	    });
		</script>
		
		<div id="timeBox">
			<table id="timeTable">
				<tr>
					<td>09:00 - 11:00</td>
					<td>11:00 - 13:00</td>
					<td>13:00 - 15:00</td>
				</tr>
				<tr>
					<td>15:00 - 17:00</td>
					<td>17:00 - 19:00</td>
					<td>19:00 - 21:00</td>
				</tr>
			</table>
		</div>
		<script>
			$("#timeTable td").mouseover(function(){
				$(this).css("background","lightgreen");
			}).mouseout(function(){
				$(this).css("background","white");
			});
		</script>
		<div class=btnBox>
			<button class="defaultBtn upBtn">예약</button>
		</div>
		<script>
			$('.defaultBtn').click(function(){
				alert("예약이 완료되었습니다.");
			});
		</script>
	</div>
	<c:import url="../common/footer.jsp"/>
</div>
</body>
</html>