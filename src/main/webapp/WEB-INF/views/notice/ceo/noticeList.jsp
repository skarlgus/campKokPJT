<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/customer/noticeList.css">
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="header-img">
        <div>
            <p>공지사항</p>
            <p></p>
        </div>
    </div>
    <div class="notice-content">
        <div class="page-title">
            | NOTICE
        </div>
        <div class="notice-naeyong">
            <table class="notice-tbl">
                <tr>
                    <th class="notice-tbl-th-1">번호</th>
                    <th class="notice-tbl-th-2">제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                </tr>
                <c:forEach items="${list }" var="ceoNotice" varStatus="index">
                <tr>
                    <td style="text-align: center">${ceoNotice.rNum }</td>
                    <td><a href="/selectMainCeoNotice.do?ceoNoticeNo=${ceoNotice.ceoNoticeNo }">${ceoNotice.ceoNoticeTitle }</a></td>
                    <td style="text-align: center">${ceoNotice.userId }</td>
                    <td style="text-align: center">${ceoNotice.ceoNoticeDate }</td>
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