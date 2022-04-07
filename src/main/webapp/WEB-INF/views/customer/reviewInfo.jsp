<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="/resources/css/customer/mypage.css">
<style>
.star {
	display: inline-block;
}

td {
	text-align: center;
}

.pageNavi a:hover {
	text-decoration-line: none;
	color: #f3d479;
}
</style>
</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
		<div>
			<p>리뷰 작성 내역</p>
			<p></p>
		</div>
	</div>
	<div class="mypage-content">
		<div class="page-title">| Review</div>
		<div class="navi">
			<ul>
				<li><a href="/mypage.do?userNo=${user.userNo }"><b>회원
							정보</b></a></li>
				<li><a href="/reserve.do?userNo=${user.userNo }">예약 확인</a></li>
				<li><a href="/reserveAll.do?reqPage=1&userNo=${user.userNo }">이용
						내역</a></li>
				<li style="background-color: #405944;"><a
					style="font-size: 14px; font-weight: bold; color: #f3d479;"
					href="/review.do?reqPage=1&userId=user01"> <b>리뷰 내역</b>
				</a></li>
				<li><a href="/point.do?userNo=2">포인트 내역</a></li>
			</ul>
		</div>
		<div class="mypage-form">
			<c:if test="${rv==null }">
				<br>
				<p>리뷰를 작성하신 내역이 없습니다.</p>
			</c:if>
			<c:if test="${rv!=null }">
				<table class="mypage-tbl">

					<tr>
						<th width="15%">캠핑장 명</th>
						<th width="45%">리뷰 내용</th>
						<th width="13%">별점</th>
						<th width="7%">좋아요</th>
					</tr>
					<c:forEach items="${list }" var="rv">
						<tr>
							<td width="15%">${rv.campName }</td>
							<td width="45%">${rv.revContents }</td>
							<td width="13%"><c:forEach begin="1" end="${rv.revStar }">
									<img class="star" src="/resources/img/customer/star-on.png">
								</c:forEach></td>
							<td width="7%">${rv.revHeart }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="pageNavi">${pageNavi }</div>
			</c:if>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>