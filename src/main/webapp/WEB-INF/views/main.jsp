<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campkok</title>
<!-- jQuery -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Paytone+One&display=swap"
	rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="/resources/css/main/main.css">

<!-- favicon -->
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
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
						<li><a href="/camp/campjoinFrm.do">캠핑장 등록</a></li>
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
							<li><a href="/camp/campmypage.do?userId=${sessionScope.user.userId }">마이페이지</a></li>
							<li><a href="/camp/campjoinFrm.do?userId=${sessionScope.user.userId }">캠핑장 등록</a></li>
							<hr>
							<li><a href="logout.do">로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>


	<div class="main-content">
		<div class="banner">
			<div class="banner-content">d</div>
			<div class="searchbar">
				<form action="/searchCampList.do" method="post">
					<input type="text" name="keyword" placeholder="어느곳으로 캠핑을 떠나보시겠어요?">
					<input type="hidden" name="reqPage" value="1"> <input
						type="hidden" name="searchSelect" value="campAddr">
					<button type="submit">검색</button>
				</form>

			</div>
			<img src="/resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg">
		</div>

		<div class="hr-sect">이런 캠핑장은 어떠세요?</div>
		<div class="new-camping">
			<div class="new-camping-content">
				<a href="#">
					<div>
						<img
							src="/resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg">
					</div>
					<p>[ 지역 ] 캠핑장이름</p>
				</a>
			</div>
			<div class="new-camping-content">
				<a href="#">
					<div>
						<img
							src="/resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg">
					</div>
					<p>[ 지역 ] 캠핑장이름</p>
				</a>
			</div>
			<div class="new-camping-content">
				<a href="#">
					<div>
						<img
							src="/resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg">
					</div>
					<p>[ 지역 ] 캠핑장이름</p>
				</a>
			</div>
			<div class="new-camping-content">
				<a href="#">
					<div>
						<img
							src="/resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg">
					</div>
					<p>[ 지역 ] 캠핑장이름</p>
				</a>
			</div>
			<div class="new-camping-content">
				<a href="#">
					<div>
						<img
							src="/resources/img/main/3e35dcbb689fea33c2ed122a2b05c07f.jpg">
					</div>
					<p>[ 지역 ] 캠핑장이름</p>
				</a>
			</div>
		</div>

		<div class="hr-sect">새로운 캠핑장</div>
		<div class="new-camping">
			<c:forEach items="${newCampList }" var="newCamp" begin="0" end="4"
				step="1">
				<div class="new-camping-content">
					<a href="/campView.do?campNo=${newCamp.campNo }">
						<div>
							<img src="/resources/img/camp/${newCamp.imgpath }">
						</div>
						<p>[ 지역 ] ${newCamp.campName }</p>
					</a>
				</div>
			</c:forEach>
		</div>

		<div class="hr-sect">캠핑장 랭킹</div>
		<div class="rank-camping-wrap">
			<div class="rank-camping">
				<c:forEach items="${campRanking }" var="rank" varStatus="vs"
					begin="0" end="9" step="1">
					<div class="rank-content">
						<div>
							<img src="/resources/img/camp/${rank.imgpath }">
						</div>
						<ul>
							<li>
								<p>${vs.count }&nbsp;</p>${rank.campName }
							</li>
							<li>${rank.campAddr }</li>
							<li>★ ${rank.campStar }</li>
							<li>${rank.campMinPrice }원~</li>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			// header scroll fadin,out
			var hdOffset = $('.header').offset();
			$(window).scroll(function() {
				if ($(document).scrollTop() > hdOffset.top) {
					$('#header-scroll').stop(true).animate({
						'opacity' : 1
					}, 200);
				} else {
					$('#header-scroll').stop(true).animate({
						'opacity' : 0
					}, 200);
				}
			});

			// user-box show,hide
			$("#user-btn-slide").click(function() {
				if ($(".user-box").css("display") == "none") {
					/*$(this).css({'float':'right','background-color':'#2d2d2d'});*/
					// 버튼좀 스무스하게 움직이고 싶은데 마음대로 안되네
					$(".user-btn").css({
						'flex-direction' : 'row-reverse',
						'transition-duration' : '0.5s'
					});
					$(".user-box").fadeIn('fast');
				} else {
					/*$(this).css({'float':'','background-color':'#fff'});*/
					$(this).css({
						'float' : ''
					});
					$(".user-btn").css({
						'flex-direction' : 'row'
					});
					// $(".user-btn").css({'backgroun-color':''});
					$(".user-box").fadeOut('fast');
				}
			});

			/*
			// header 메뉴 클릭했을때 bgco fix
			$('nav').find('a').click(function() {
			    if ($('#header-scroll').css("opacity") == "0") {
			        $("#header-scroll").animate({
			            'opacity': 1
			        }, 200);
			    } else if($(this).mouseleave()) {
			        $("#header-scroll").css('opacity', '0');
			    }
			});
			 */
		});
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>