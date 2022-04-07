<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Info List</title>
</head>
<body>
	<div class="wrap">
		<div class="header-wrap">
			<jsp:include page="/WEB-INF/views/admin/commons/adminHeader.jsp" />
		</div>
		<div class="content-wrap">
			<!-- Navi -->
			<div class="content-navi">
				<jsp:include page="/WEB-INF/views/admin/commons/adminNavi.jsp" />
			</div>

			<!-- Main -->
			<div class="content-main">
				<h1>
					<a href="/selectBoardInfoList.do?reqPage=1">자유게시판 관리</a>
				</h1>
				<hr>
				<div class="search-wrap">
					<form action="/searchBoardInfoList.do" method="GET">
						<input type="hidden" name="reqPage" value="1">
						<table>
							<tbody>
								<tr>
									<td>
										<select class="form-control" id="search-category" name="searchCategory">
											<option value="boardTitle" selected="selected">제목</option>
											<option value="boardContents">내용</option>
											<option value="userId">아이디</option>
										</select>
									</td>
									<td>
										<input class="form-control" id="search" type="text" name="search">
									</td>
									<td>
										<input class="form-control" id="btnSearch" type="submit" value="">
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>

				<div class="table-wrap">
					<table class="table table-striped">
						<tbody>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>첨부파일</th>
								<th>작성자</th>
								<th>작성일</th>
								<th></th>
							</tr>
							<c:forEach items="${boardInfoList }" var="boardInfo">
								<tr>
									<td>${boardInfo.rNum }</td>
									<td>
										<a href="/selectBoardInfo.do?boardNo=${boardInfo.boardNo }"><strong>${boardInfo.boardTitle }</strong></a>
									</td>
									<td>
										<c:if test="${not empty boardInfo.boardFilePath }">
											<img class="img-file" src="/resources/img/admin/free-icon-attached-file-1209914.png">
										</c:if>
									</td>
									<td>${boardInfo.userId }</td>
									<td>${boardInfo.boardDate }</td>
									<td>
										<button class="btn btn-warning btn-md" onclick="location.href='/selectBoardInfo.do?boardNo=${boardInfo.boardNo}'">상세보기</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div id="pageNavi">${pageNavi }</div>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<link rel="stylesheet" href="/resources/css/admin/adminDesignList.css">
</body>
</html>