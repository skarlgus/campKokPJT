<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/customer/mypage.css">
</head>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="header-img">
        <div>
            <p>예약 확인</p>
            <p></p>
        </div>
    </div>
    <div class="mypage-content">
        <div class="page-title">
            | Reservation
        </div>
        <div class="navi">
            <ul>
                <li><a href="/mypage.do?userNo=${user.userNo }"><b>회원 정보</b></a></li>
                <li style="background-color: #405944;">
                	<a style=" font-size: 14px; font-weight: bold; color: #f3d479;" href="/reserve.do?userNo=${user.userNo }">
                		<b>예약 확인</b>
                	</a>
                </li>
                <li><a href="/reserveAll.do?reqPage=1&userNo=${user.userNo }">이용 내역</a></li>
                <li><a href="/review.do?reqPage=1&userId=${user.userId }">리뷰 내역</a></li>
                <li><a href="/point.do?userNo=${user.userNo }">포인트 내역</a></li>
            </ul>
        </div>
        <div class="mypage-form">
               
                     <c:if test="${list==null }">
                     <br>
                     	<p>최근 예약하신 내역이 없습니다.</p>
                     </c:if>
                     <c:if test="${list!=null }">
                     
                    <c:forEach items="${list }" var="r">
                    <table class="mypage-tbl">
                    
                            <tr>
                                <th>캠피장명</th>
                                <td style="padding-left: 5px;">${r.campName }</td>
                            </tr>
                            <tr>
                                <th>캠피장 데스크명</th>
                                <td style="padding-left: 5px;">${r.campRoomName }</td>
                            </tr>
                            <tr>
                                <th>위치</th>
                                <td style="padding-left: 5px;">${r.campAddr }</td>
                            </tr>
                            <tr>
                                <th>날짜</th>
                                <td style="padding-left: 5px;">${r.resInDate } ${r.resInTime } ~ ${r.resOutDate } ${r.resOutTime }</td>
                            </tr>
                            <tr>
                                <th>예약인원</th>
                                <td style="padding-left: 5px;">${r.resMember } 명</td>
                            </tr>
                            <tr>
                                <th>메모</th>
                                <td style="padding-left: 5px;">${r.resMemo }</td>
                            </tr>
                           
                        </table><br>
                        
                        <span>* 예약에 변동사항이 있을 시에는 따로 문의 부탁드려요~ *</span>
                        <br>
                         </c:forEach>
                       </c:if>
                </div>
            </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>