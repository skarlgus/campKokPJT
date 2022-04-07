<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="/resources/css/customer/noticeList.css">
</head>
<style>
.board-top {
	width: 1200px;
}

.write-btn {
	display: inline-block;
	width: 90px;
	height: 45px;
	font-size: 16px;
	text-align: center;
	background-color: #405944;
	margin-bottom: 10px;
	list-style: none;
	line-height: 45px;
	color: #f2f2f2;
	text-decoration-line: none;
	transition-duration: 0.3s;
	box-shadow: 2px 2px 6px rgba(0, 0, 0, .1), 0 0 2px rgba(0, 0, 0, .2);
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

.post {
	display: inline-block;
	width: 92%;
	height: 50px;
	text-align: left;
	align-item: baseline;
}
/*         .post input{
        	display:inline-block;
        } */
.search-text {
	width: 350px;
	height: 40px;
	border: 1px solid #b8b0b0;
	background-color: #fff;
	opacity: 80%;
	padding-left: 18px;
	vertical-align: middle;
	outline: none;
	background-color: #f2f2f2;
	transition-duration: 0.3s;
}

.search-text:focus {
	background-color: #fff;
	opacity: 100%;
	border: 1px solid #b8b0b0;
	box-shadow: 2px 2px 6px rgba(0, 0, 0, .1), 0 0 2px rgba(0, 0, 0, .2);
}

.btn-post {
	background: url(/resources/img/customer/search.png);
	background-repeat: no-repeat;
	background-position: center;
	border: none;
	width: 30px;
	height: 40px;
	vertical-align: middle;
	/* width: 100px;
            height: 40px;
            font-weight: bold;
            font-size: 17px;
            background-color: #dfd3d3;
            border: 2px solid #dfd3d3;
            border-radius: 5px;
            color: #4a4a4a;
            vertical-align:middle; */
}

.btn-post:focus {
	outline: none;
}

.write-btn:hover {
	text-decoration-line: none;
	background-color: #5A7356;
	color: #fff;
}

.notice-tbl th {
	text-align: center;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
		<div>
			<p>FAQ</p>
			<p></p>
		</div>
	</div>
	<div class="notice-content">
		<div class="page-title">| FAQ</div>
		<div class="board-top">
			<div class="post">
				<form action="/searchFAQList.do">
					<input type="hidden" name="reqPage" value="1"> <input
						type="text" name="keyword" placeholder="검색어를 입력해주세요."
						class="search-text"> <input type="submit" class="btn-post"
						value="">
					<c:forEach items="${list }" var="mainFaq" end="0">
						<input type="hidden" name="faqUser" value="${mainFaq.faqUser }">
					</c:forEach>
				</form>
			</div>
			<!-- <div class="write">
				<a href="#" class="write-btn">쪽지보내기</a>
			</div> -->
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
				<c:forEach items="${list }" var="mainFaq">
					<tr>
						<td style="text-align: center">${mainFaq.faqNo }</td>
						<td><a href="/faqView.do?faqNo=${mainFaq.faqNo }">${mainFaq.faqTitle }</a></td>
						<td style="text-align: center">${mainFaq.userId }</td>
						<td style="text-align: center">${mainFaq.faqDate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<div class="pageNavi">${pageNavi }</div>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>