<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
		<div>
			<p>회원가입</p>
			<p>회원가입을 통해 캠콕의 서비스를 모두 이용하실 수 있습니다.</p>
		</div>
	</div>
	<div class="join-content">
		<div class="join-select">
			<div>
				<img src="/resources/img/member/user.png">
				<div class="join-select-text">
					<p class="join-select-title">일반회원가입</p>
					<p>
						캠콕의 다양한 서비스를<br>편리하게 이용하실 수 있습니다.
					</p>
				</div>
				<a href="/joinFrm.do">가입하기</a>
			</div>
			<div>
				<img src="/resources/img/member/camp.png">
				<div class="join-select-text">
					<p class="join-select-title">캠핑장회원가입</p>
					<p>
						캠콕에 사업장을<br>등록하실 수 있습니다.
					</p>
				</div>
				<a href="#">가입하기</a>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	
<link rel="stylesheet" href="/resources/css/user/join.css">
</body>
</html>