<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="/resources/css/customer/mypage.css">
    <style>
        h5{
        	color:#eba13d;
        }
        td{
			text-align: center;
		}
    </style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="header-img">
        <div>
            <p>포인트 내역</p>
            <p></p>
        </div>
    </div>
    <div class="mypage-content">
        <div class="page-title">
            | Point
        </div>
        <div class="navi">
            <ul>
                <li><a href="/mypage.do?userNo=${user.userNo }"><b>회원 정보</b></a></li>
                <li><a href="/reserve.do?userNo=${user.userNo }">예약 확인</a></li>
                <li><a href="/reserveAll.do?reqPage=1&userNo=${user.userNo }">이용 내역</a></li>
                <li><a href="/review.do?reqPage=1&userId=user01">리뷰 내역</a>
                <li style="background-color: #405944;">
                	<a style=" font-size: 14px; font-weight: bold; color: #f3d479;" href="/point.do?userNo=2">
                		<b>포인트 내역</b>
                	</a>
                </li>
            </ul>
        </div>
        <div class="mypage-form">
          
           <br>
					<c:forEach items="${list }" var="p" varStatus="status">
					<c:if test="${status.last }">
                    <h5>가용 마일리지는 ${p.pointTotal } 마일리지 입니다.</h5>
                    </c:if>
  					</c:forEach>
  					<br>
                    <h4>적립 내역</h4>
                    <div style="width: 100%;height: 300px; overflow: auto;">
                     <table class="mypage-tbl">
                    
                           <tr>
                               <th width="35%">적립 내역</th>
                               <th width="15%">적립 날짜</th>
                               <th width="15%">적립 마일리지</th>
                               <th width="15%">총 마일리지</th>
                           </tr>
                            <c:forEach items="${list }" var="p">
                           <c:if test="${p.pointSaveContents!=null }">
                           <tr>
                           		<td width="35%">${p.pointSaveContents }</td>
                           		<td width="15%">${p.pointSaveDate }</td>
                           		<td width="15%">${p.pointSave }</td>
                           		<td width="15%">${p.pointTotal }</td>
                           </tr>
                           </c:if>
                           
                             </c:forEach>
                        </table>
                        </div>
                <br><br>
                  <h4>사용 내역</h4>
                  <div style="width: 100%;height: 300px; overflow: auto;">
                    <table class="mypage-tbl">
                    
                           <tr>
                               <th width="35%">사용 내역</th>
                               <th width="15%">사용 날짜</th>
                               <th width="15%">사용 마일리지</th>
                               <th width="15%">총 마일리지</th>
                           </tr>
                           <c:forEach items="${list }" var="p">
                           <c:if test="${p.pointUseContents!=null }">
                           <tr>
                           		<td width="35%">${p.pointUseContents }</td>
                           		<td width="15%">${p.pointUseDate }</td>
                           		<td width="15%">${p.pointUse }</td>
                           		<td width="15%">${p.pointTotal }</td>
                           </tr>
                           </c:if>
                           
                             </c:forEach>
    
                        </table>
                  </div>
                </div>
  				</div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<script>
        $(function () {
            $("#big-box").niceScroll();
            // niceScroll를 적용할 id값을 넣어주세요
            // $("body").niceScroll();
            // body안에 있는 요소들이 scroll로 생기실 nicescroll로 바뀝니다.
          console.log("123");
        });
        </script>
</html>