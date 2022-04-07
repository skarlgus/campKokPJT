<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/customer/mypage.css">
    <style>
		td{
			text-align: center;
		}
		        .pageNavi a:hover{
            text-decoration-line: none;
            color: #f3d479;
        }
    </style>
</head>

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
                <li><a href="/reserve.do?userNo=${user.userNo }">예약 확인</a></li>
                <li style="background-color: #405944;">
                	<a style=" font-size: 14px; font-weight: bold; color: #f3d479;" href="/reserveAll.do?reqPage=1&userNo=2">
                		<b>이용 내역</b>
                	</a>
                </li>
                <li><a href="/review.do?reqPage=1&userId=user01">리뷰 내역</a>
                <li><a href="/point.do?userNo=2">포인트 내역</a></li>
            </ul>
        </div>
        <div class="mypage-form">
                   <c:if test="${list==null }">
                     <br>
                     	<p>캠핑장을 이용하신 내역이 없습니다.</p>
                     </c:if>
                     <c:if test="${list!=null }">
                    <table class="mypage-tbl">
                           <tr>
                               <th width="20%">캠핑장 명</th>
                               <th width="20%">데스크 명</th>
                               <th width="50%">이용 날짜</th>
                               <th width="10%">인원 수</th>
                           </tr>
                           <c:forEach items="${list }" var="r">
                           <tr>
                           		<td width="20%">${r.campName }</td>
                           		<td width="20%">${r.campRoomName }</td>
                           		<td width="50%">${r.resInDate } ~ ${r.resOutDate }</td>
                           		<td width="10%">${r.resMember } 명</td>
                           </tr>
                             </c:forEach>
                        </table>
                        <div class="pageNavi">${pageNavi }</div>
                  </c:if>
                </div>
            </div>

            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>