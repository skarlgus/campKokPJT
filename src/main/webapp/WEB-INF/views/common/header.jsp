<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- bootstrap 4 -->

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>



<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Paytone+One&display=swap"
	rel="stylesheet">

</head>
<body>
	<div class="header">
		<div id="header-scroll"></div>
		<div class="header-logo">
			<a href="/"></a><img src="resources/img/main/logo-w.png">
			<p>
				<a href="/main.do">Campkok</a>
			</p>
		</div>
		<nav>
			<ul>
				<li><a href="/index2.do">작업페이지</a></li>
				<li><a href="/campList.do?reqPage=1">캠핑장</a></li>
				<li><a href="/boardList.do?reqPage=1">게시판</a></li>
				<li><a href="#">쇼핑몰</a></li>
				
				<c:choose>
					<c:when test="${sessionScope.user.userLevel != 2 }">
						<li><a href="/faqList.do?reqPage=1&faqUser=client">FAQ</a></li>
						<li><a href="/customerNoticeList.do?reqPage=1">공지사항</a></li>
					</c:when>
					<c:when test="${sessionScope.user.userLevel == 2 }">
						<li><a href="/faqList.do?reqPage=1&faqUser=ceo">FAQ</a></li>
						<li><a href="/mainCeoNoticeList.do?reqPage=1">공지사항</a></li>
						<li><a href="#">광고</a></li>
					</c:when>
				</c:choose>
			</ul>
		</nav>
		<div class="header-user">
			<div class="user-btn">
				<div id="user-btn-slide"></div>
			</div>
			<div class="user-box">
				<ul>
					<c:choose>
						<c:when test="${sessionScope.user == null }">
							<li><a href="joinPage.do">회원가입</a></li>
							<li><a href="loginFrm.do">로그인</a></li>
						</c:when>
						<c:when test="${sessionScope.user.userLevel != 2 }">
							<li><a href="/mypage.do?userNo=${sessionScope.user.userNo }">마이페이지</a></li>
							<li><a href="/dmList.do?userId=${sessionScope.user.userId }">쪽지</a></li>
							<hr>
							<li><a href="logout.do">로그아웃</a></li>
						</c:when>
						<c:when test="${sessionScope.user.userLevel == 2 }">
							<li><a href="#">마이페이지</a></li>
							<li><a href="#">캠핑장 등록</a></li>
							<hr>
							<li><a href="logout.do">로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>

	<script>
        $(document).ready(function() {

            // header user-box show,hide
            $("#user-btn-slide").click(function() {
                if ($(".user-box").css("display") == "none") {
                    /*$(this).css({'float':'right','background-color':'#2d2d2d'});*/
                    // 버튼좀 스무스하게 움직이고 싶은데 마음대로 안되네
                    $(".user-btn").css({'flex-direction':'row-reverse','transition-duration':'0.5s'});
                    $(".user-box").fadeIn('fast');
                } else {
                    /*$(this).css({'float':'','background-color':'#fff'});*/
                    $(this).css({'float':''});
                    $(".user-btn").css({'flex-direction':'row'});
                    // $(".user-btn").css({'backgroun-color':''});
                    $(".user-box").fadeOut('fast');
                }
            });
        });
    </script>

	<style>
		* {
			-webkit-box-sizing: content-box;
			-moz-box-sizing: content-box;
			box-sizing: content-box;
		}
		
		*:before, *:after {
			-webkit-box-sizing: content-box;
			-moz-box-sizing: content-box;
			box-sizing: content-box;
		}
	</style>

	<!-- header css -->
	<link rel="stylesheet" href="/resources/css/common/header.css">
</body>
</html>