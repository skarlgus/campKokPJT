<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="header-img">
        <div>
            <p>로그인</p>
            <p>캠핑예약의 모든 것! 캠콕에 오신 것을 환영합니다.</p>
        </div>
    </div>
    <div class="login-content">
        <div class="login-box">
           <p>LOGIN</p>
            <form action="/login.do" method="post">
                <table border="0">
                    <tr>
                        <td>아이디</td>
                        <td><input type="text" class="login-input" name="userId"></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" class="login-input" name="userPw"></td>
                    </tr>
                </table>
                <button type="submit" class="login-btn">로그인</button>
            </form>
            
        <p><a href="/findIdPage.do">아이디</a> 또는 <a href="/findPwPage.do">비밀번호</a> 찾기 / <a href="/joinPage.do">회원가입</a></p>
        </div>
    </div>    
    
    
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


<link rel="stylesheet" href="/resources/css/user/loginFrm.css">
</body>
</html>