<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Header</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/resources/css/admin/adminHeader.css">

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.js"></script>
</head>

<body>
	<ul class="header-wrap">
		<li><a href="/pageAdmin.do?reqPage=1"><img alt="Not Found Logo.png" src="/resources/img/admin/Logo.png"></a></li>
		<li>
			<div class="header-menu">
				<a href="/selectTempCampInfoList.do?reqPage=1">신규등록 신청 관리</a> <a href="/selectFAQInfoList.do?reqPage=1">FAQ</a>
				<button class="btnExit" onclick="location.href='/pageMain.do'">Main Page</button>
			</div>
		</li>
	</ul>
</body>
</html>