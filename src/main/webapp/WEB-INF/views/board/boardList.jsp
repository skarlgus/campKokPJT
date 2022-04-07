<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<link rel="stylesheet" href="/resources/css/customer/noticeList.css">
</head>
<style>
.board-top {
	width: 1200px;
}

.write-btn {
	display: inline-block;
	width: 80px;
	height: 40px;
	font-size: 16px;
	text-align: center;
	background-color: #405944;
	border: 2px solid #405944;
	border-radius: 7px;
	margin-bottom: 10px;
	list-style: none;
	line-height: 40px;
	color: #f2f2f2;
	text-decoration-line: none;
}

.write {
	display: inline-block;
	float: right;
}

.selectedPage {
	color: #f2f2f2;
	display: inline-block;
	width: 30px;
	height: 30px;
	border: none;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	background-color: #f3d479;
	margin: 5px;
	font-weight: bold;
	font-size: 15px;
}

.pageNavi {
	width: 100%;
	display: block;
	text-align: center;
	margin-top: 10px;
	font-size: 14px;
}

.pageNavi a {
	text-decoration-line: none;
	color: #405944;
	display: inline-block;
	width: 30px;
	height: 30px;
	border: none;
	text-align: center;
	line-height: 30px;
	border-radius: 5px;
	background-color: white;
	margin: 5px;
}

.pageNavi a:hover {
	text-decoration-line: none;
	color: #f3d479;
}

.post {
	display: inline-block;
	width: 92%;
	text-align: left;
	align-item: baseline;
}

.search-text {
	width: 250px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid #b8b0b0;
	vertical-align: middle;
	outline: none;
	background-color: #f2f2f2;
	transition-duration: 0.3s;
}

.search-text:focus {
	background-color: white;
	border: 2px solid #b8b0b0;
}

.btn-post {
	background: url(/resources/img/customer/search.png);
	background-repeat: no-repeat;
	background-position: center;
	border: none;
	width: 30px;
	height: 40px;
	vertical-align: middle;
}

.btn-post:focus {
	outline: none;
}

.write-btn:hover {
	text-decoration-line: none;
	color: #f3d479;
}

.notice-tbl th {
	text-align: center;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
		<div>
			<p>자유 게시판</p>
			<p></p>
		</div>
	</div>
	<div class="notice-content">
		<div class="page-title">| BOARD</div>
		<div class="board-top">
			<div class="post">
				<form action="/searchBoard.do">
					<input type="hidden" name="reqPage" value="1"> <input
						type="text" name="keyword" placeholder="제목을 입력해주세요."
						class="search-text"> <input type="submit" class="btn-post"
						value="">

				</form>
			</div>
			<c:if test="${sessionScope.user.userId!=null }">
				<div class="write">
					<a href="/boardFrm.do" class="write-btn">작성</a>
				</div>
			</c:if>
		</div>
		<br>
		<div class="notice-naeyong">
			<table class="notice-tbl">
				<tr>
					<th class="notice-tbl-th-1">번호</th>
					<th class="notice-tbl-th-2">제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
				<c:forEach items="${list }" var="b">
					<tr>
						<td style="text-align: center">${b.rnum }</td>
						<td><a href="/boardView.do?boardNo=${b.boardNo }">${b.boardTitle }</a></td>
						<td style="text-align: center">${b.userId }</td>
						<td style="text-align: center">${b.boardDate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="pageNavi">${pageNavi }</div>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>