<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
        <div>
            <p>비밀번호 찾기</p>
            <p></p>
        </div>
    </div>
    <div class="login-content">
        <div class="login-box">
           <p>회원님의 비밀번호는 '${u.userPw }'입니다.</p>
           <a href="/">메인으로</a>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
<link rel="stylesheet" href="/resources/css/user/findResult.css">
</html>