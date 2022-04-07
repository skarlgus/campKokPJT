<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Navi</title>
<link rel="stylesheet" href="/resources/css/admin/adminNavi.css">
</head>

<body>
	<ul class="menu-wrap">
		<li><a href="/pageAdmin.do?reqPage=1">DashBoard</a></li>
		<li><a href="javascript:void(0)" id="notice">공지사항 관리</a>
			<ul class="submenu">
				<li><a href="/pageNoticeForm.do">공지사항 등록</a></li>
				<li><a href="/selectClientNoticeList.do?reqPage=1">고객 공지사항</a></li>
				<li><a href="/selectCeoNoticeList.do?reqPage=1">사업자 공지사항</a></li>
			</ul></li>
		<li><a href="javascript:void(0)" id="user">회원정보 관리</a>
			<ul class="submenu">
				<li><a href="/selectClientInfoList.do?reqPage=1">고객정보 관리</a></li>
				<li><a href="/selectCeoInfoList.do?reqPage=1">사업자정보 관리</a></li>
			</ul></li>
		<li><a href="javascript:void(0)" id="camp">캠핑장정보 관리</a>
			<ul class="submenu">
				<li><a href="/selectCampInfoList.do?reqPage=1">캠핑장 리스트</a></li>
				<li><a href="/selectTempCampInfoList.do?reqPage=1">신규등록 관리</a></li>
			</ul></li>
		<li><a href="/selectBoardInfoList.do?reqPage=1">자유게시판 관리</a></li>
		<li><a href="javascript:void(0)" id="faq">FAQ 관리</a>
			<ul class="submenu">
				<li><a href="/pageFAQForm.do">FAQ 등록</a></li>
				<li><a href="/selectFAQInfoList.do?reqPage=1">FAQ 리스트</a></li>
			</ul></li>
		<li><a href="/pageChart.do">통계</a></li>
	</ul>

	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".submenu").hide();
			$(".submenu").prev().append("<span class='more'>+</span>");

			$("#notice").click(function() {
				$(this).next().slideToggle();
				$(this).children().toggleClass("active");
			});

			$("#user").click(function() {
				$(this).next().slideToggle();
				$(this).children().toggleClass("active");
			})

			$("#camp").click(function() {
				$(this).next().slideToggle();
				$(this).children().toggleClass("active");
			})

			$("#faq").click(function() {
				$(this).next().slideToggle();
				$(this).children().toggleClass("active");
			})
		})
	</script>
</body>
</html>