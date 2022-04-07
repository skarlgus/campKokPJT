<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캠핑장</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
        <div>
            <p>캠핑장</p>
            <p>전국 방방곡곡의 캠핑장을 한 곳에 모아보았습니다.<br>원하는 캠핑장을 찾아보세요.</p>
        </div>
    </div>
    <div class="camp-content">
        <div class="page-title">
            
        </div>
        <div class="searchbar">
            <form action="/searchCampList.do" method="get">
            	<input type="hidden" name="reqPage" value="1">
                <select name="searchSelect">
                	<option value="campName">캠핑장이름</option>
                	<option value="campAddr">지역</option>
                </select>
                <input type="text" name="keyword"><button type="submit">검색</button>
            </form>
        </div>
        <div class="camp-naeyong">
        <!-- varStatus 번호 매길때 'i'역할!! -->
        	<c:forEach items="${list }" var="cl" varStatus="status">
        	<%-- ${brandList[status.index] }
        	${brandList[status.index].name}
        	${list.name } 한개의 for each문에서 여러개 list 같이 불러오고 싶을 때 사용하는 방법! --%>
	            <div class="camp-item">
	                <a href="/campView.do?campNo=${cl.campNo }">
	                <%-- 번호 출력하고 싶을 때 ${status.count } --%>
	                    <div class="camp-item-img">
	                    	<!-- 캠핑장 이미지 경로 설정 -->
	                        <img src="/resources/upload/camp/${cl.imgpath }">
	                    </div>
	                    <ul>
	                        <li style="display: none">${cl.campNo }</li>
	                        <li>${cl.campAddr }</li>
	                        <li>${cl.campName }</li>
	                        <li><p>★ ${cl.campStar }</p><p>${cl.campMinPrice }원 ~</p></li>
	                    </ul>
	                </a>
	            </div>
            </c:forEach>
        </div>

        <div class="paging">
            ${pageNavi }
        </div>

    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
    <link rel="stylesheet" href="/resources/css/user/campList.css">
</body>
</html>