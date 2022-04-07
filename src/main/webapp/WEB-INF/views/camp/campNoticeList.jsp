<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>캠핑장 공지사항</title>
	<link rel="stylesheet" href="/resources/css/customer/noticeList.css">
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	
	<div class="header-img">
        <div>
            <p>캠핑장 공지사항</p>
            <p></p>
        </div>
    </div>
	<hr>
	
	<div class="notice-content">
		<div class="page-title">
            | NOTICE
        </div>
         <div class="notice-naeyong">
        	<table class="notice-tbl">
			<tr>
				<th class="notice-tbl-th-1">번호</th>
				<th class="notice-tbl-th-2">제목</th>
				<th>캠핑장</th>
				<th>작성일</th>
			</tr>
			<c:forEach items="${list }" var="n" varStatus="index">
			<tr>
				<td style="text-align: center">${n.campNoticeNo }</td>
				<td><a href="/camp/selectCampNotice.do?campNoticeNo=${n.campNoticeNo}">${n.campNoticeTitle }</a></td>
				<td style="text-align: center">${n.campNo }</td>
				<td style="text-align: center">${n.campNoticeDate }</td>
			</tr>
			</c:forEach>
			</table>
        </div>
        <div class="paging">
            ${pageNavi }
        </div>       
	</div>
 	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>