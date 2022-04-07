<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO Notice View</title>
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
				<h1>공지사항</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<form action="/updateClientNotice.do" method="POST" enctype="multipart/form-data">
						<table class="table table-striped">
							<input type="hidden" name="clientNoticeNo" value="${clientNotice.clientNoticeNo }">
							<c:if test="${not empty clientNotice.clientNoticeFilePath }">
								<input type="hidden" name="oldFile" value="${clientNotice.clientNoticeFilePath }">
							</c:if>
							<tr>
								<th>작성자</th>
								<td>
									<input class="read-only" type="text" name="userId" value="${clientNotice.userId }" readonly="readonly">
								</td>
								<th>등록일</th>
								<td>
									<input class="read-only" type="text" name="clientNoticeDate" value="${clientNotice.clientNoticeDate }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3">
									<input class="form-control" type="text" name="clientNoticeTitle" value="${clientNotice.clientNoticeTitle }">
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<c:if test="${not empty clientNotice.clientNoticeFilePath }">
										<span id="fileInfo">${clientNotice.clientNoticeFilePath }</span>
									</c:if>
									<input type="file" name="clientNoticeFile" value="${clientNotice.clientNoticeFilePath }" onchange="LoadImg(this)">
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<td colspan="3">
									<div style="text-align: left;">
										<img id="img-view" src="/resources/upload/notice/${clientNotice.clientNoticeFilePath }" style="width: 20%;">
									</div>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea class="form-control" name="clientNoticeContents">${clientNotice.clientNoticeContents }</textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input class="btn btn-warning btn-lg" type="submit" value="수정하기">
									<button class="btn btn-warning btn-lg" type="button"
										onclick="location.href='/deleteClientNotice.do?clientNoticeNo=${clientNotice.clientNoticeNo}&clientNoticeFilePath=${clientNotice.clientNoticeFilePath }'">삭제하기</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
				<hr>
				<div>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectClientNoticeList.do?reqPage=1'">목록</button>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<script type="text/javascript" src="/resources/js/admin/imgPreView.js"></script>
</body>
</html>