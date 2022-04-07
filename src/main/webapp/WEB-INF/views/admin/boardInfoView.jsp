<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Info View</title>
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
				<h1>자유게시판 관리</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<table class="table table-striped">
						<tr>
							<th>작성자</th>
							<td>${boardInfo.userId }</td>
							<th>작성일</th>
							<td>${boardInfo.boardDate }</td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3">${boardInfo.boardTitle }</td>
						</tr>
						<tr>
							<th>첨부파일</th>
							<td colspan="3">${boardInfo.boardFilePath }</td>
						</tr>
						<tr>
							<th>이미지</th>
							<td colspan="3">
								<c:if test="${not empty boardInfo.boardFilePath }">
									<div style="text-align: left;">
										<img id="img-view" src="/resources/upload/board/${boardInfo.boardFilePath }" style="width: 20%;">
									</div>
								</c:if>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<textarea class="read-only" readonly="readonly" style="width: 100%">${boardInfo.boardContents }</textarea>
							</td>
						</tr>
					</table>
				</div>
				<hr>
				<div style="text-align: center;">
					<button class="btn btn-warning btn-lg" onclick="location.href='/deleteBoardInfo.do?boardNo=${boardInfo.boardNo}'">삭제하기</button>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectBoardInfoList.do?reqPage=1'">목록</button>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">

	<style type="text/css">
.table>tbody>tr>td {
	text-align: left;
}
</style>
</body>
</html>
