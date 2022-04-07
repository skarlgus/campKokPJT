<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${cl.campName }</title>

    <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- 네이버 지도 API -->
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=bxltou71l0&submodules=geocoder"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<!-- Swiper -->
    <div class="swiper-container" style="margin-top: 50px;">
        <div class="swiper-wrapper">
        	<c:forEach items="${cl.campFiles }" var="campFile">
	            <div class="swiper-slide">
	            	<!-- 이미지 파일 경로 확인 -->
	                <img src="/resources/upload/camp/${campFile.campFilePath }">
	            </div>
        	</c:forEach>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>

    <!-- Swiper JS -->
    <script src="../package/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
        var swiper = new Swiper('.swiper-container', {
            spaceBetween: 30,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
    </script>


    <div class="camp-content">
        <div class="camp-title">
            <div>
                <p>${cl.campName }</p>
                <p><span>★ ${cl.campStar }&nbsp;&nbsp;</span>&nbsp;${cl.campAddr }</p>
            </div>
            <!-- 기현쓰가 예약버튼 링크 추가 -->
            <c:forEach items="${campRoomList }" var="campRoomList" varStatus="index">
            <a href="/camp/campReservation.do?roomNo=${campRoomList.roomNo }">${campRoomList.roomName }</a>
            </c:forEach>           
        </div>
        <div class="camp-naeyong">
            <div class="hr-sect">캠핑장 정보</div>
            <div>
                <table class="camp-tbl">
                    <tr>
                        <th>테마</th>
                        <td>${cl.campTheme }</td>
                        <th>카테고리</th>
                        <td>${cl.campCtg }</td>
                    </tr>
                    <tr>
                        <th>시설</th>
                        <td colspan="3">
                            <div style="display: flex"><%-- 
                                <ul>
                                	<c:forEach items="${list }" var="cl">
                                   		<li>${cl.campFac }</li>
                                    </c:forEach>
                                </ul> --%>
                                <ul>
                                    <li>${cl.campFac }</li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="camp-re-no">
                <div>
                    <p>REVIEW 
                    <c:choose>
                    	<c:when test="${sessionScope.user == null }">
                    		<a href="#" id="blank">more</a>
                    	</c:when>
                    	<c:otherwise>
                    		<a href="/camp/commentFrm.do?userNo=${sessionScope.user.userNo }&campNo=${campNo }">more</a>
                    	</c:otherwise>
                    </c:choose>             
                    </p>
                    <ul>
                    <c:forEach items="${crList }" var="cr" begin="0" end="4" step="1">
                    	<li><a href="#">${cr.revContents }</a></li>
                    </c:forEach>
                    </ul>
                </div>
                <div>
                    <p>NOTICE <a href="#">more</a></p>
                    <ul>
                    <c:forEach items="${cnList }" var="cn" begin="0" end="4" step="1">
                        <li><a href="#">${cn.campNoticeTitle }</a></li>
                    </c:forEach>
                    </ul>
                </div>
            </div>

            <div class="hr-sect">찾아오시는 길</div>
            <div>
                <p id="address">${cl.campAddr }</p>
                <div id="map" style="width: 1140px; height: 400px;border: 1px solid"></div>
            </div>
            
        </div>

    </div>


    <script>
        window.onload = function() {
        	let campAddr = '${cl.campAddr}'
        	
        	naver.maps.Service.geocode({
		        query: campAddr // String 타입의 주소값
		    }, function(status, response) {
		        if (status !== naver.maps.Service.Status.OK) {
		            // 실행이 되지 않을 경우 
                    return alert('Something wrong!');
                    
		        }
				
                // 제대로 된 query가 들어가 결과가 나올 경우 
		        var result = response.v2, // 검색 결과의 컨테이너
		            items = result.addresses; // 검색 결과의 배열
				/* alert(items[0].x+', '+items[0].y+', '+typeof items[0].x+', '+typeof items[0].y); */
		            
		        
		    	//지도에 마커찍기 
		    	let x = parseFloat(items[0].x); // 경도
		    	let y = parseFloat(items[0].y); // 위도 
		    	
		    	
                // 지도 띄우기 
		    	var map = new naver.maps.Map('map', {
		    	    center: new naver.maps.LatLng(y, x),
		    	    zoom: 19,
		    	    zoomControl: true, //지도 확대,축소 컨트롤러
	                zoomControlOptions: {
	                    position: naver.maps.Position.TOP_RIGHT, //컨트롤러 위치 설정 (우측상단)
	                    style: naver.maps.ZoomControlStyle.SMALL //컨트롤러 크기 설정 (작게)
	                }
		    	});
				
                // 마커 찍기 
		    	var marker = new naver.maps.Marker({
		    	    position: new naver.maps.LatLng(y, x),
		    	    map: map
		    	});
		
		    	// 최초 중심지 주소
	            var contentString = [
	                '<div class="iw_inner" style="padding:10px;">',
	                '	<h4>${cl.campName }</h4>',
	                '	<p>${cl.campAddr }</p>',
	                '</div>'
	            ].join('');

	            var infoWindow = new naver.maps.InfoWindow();
	            naver.maps.Event.addListener(marker, 'click', function(e) {
	                if (infoWindow.getMap()) { //현재 정보창이 열려있으면
	                    infoWindow.close(); //열려있는 정보창 닫기
	                } else {
	                    infoWindow = new naver.maps.InfoWindow({
	                        content: contentString
	                    });
	                    infoWindow.open(map, marker);
	                }
	            });
                
                
		    });
        	

        }
        
        $('#blank').click(function() {
			alert("더보기는 로그인후 이용가능합니다.");
		});
    </script>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    

	<!-- Swiper -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    
    <link rel="stylesheet" href="/resources/css/user/campView.css">
<style>
	

/* Swiper */
.swiper-container {
	width: 1200px;
	height: 700px;
}

.swiper-slide {
	text-align: center;
	font-size: 18px;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
}

.swiper-slide>img {
	width: 100%;
}

:root { -
	-swiper-theme-color: #405944;
}
</style>
</body>
</html>