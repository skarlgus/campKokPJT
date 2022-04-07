<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Form</title>
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
				<h1>공지사항 등록</h1>
				<hr>
				<div class="table-wrap">
					<form action="/insertNotice.do" method="POST" enctype="multipart/form-data">
						<table class="table table-striped">
							<tr>
								<th>분류</th>
								<td>
									<select name="userCategory" style="float: left;">
										<option value="client">고객</option>
										<option value="ceo">사업자</option>
									</select>
								</td>
								<th>작성자</th>
								<!-- Session ID로 변경 -->
								<td>
									<input type="text" name="userId" value="admin" readonly="readonly" style="border: none; background-color: transparent;">
								</td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="3">
									<input class="form-control" type="text" name="noticeTitle" style="height: 35px; float: left;">
								</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<input type="file" name="noticeFile" onchange="LoadImg(this)">
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<td colspan="3">
									<div style="text-align: left;">
										<img id="img-view" style="width: 20%;">
									</div>
								</td>
							</tr>
							<tr>
								<th>내용</th>
								<td colspan="3">
									<textarea class="form-control" name="noticeContents"></textarea>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<input class="btn btn-warning btn-lg" type="submit" value="등록하기">
								</td>
							</tr>
						</table>
					</form>
				</div>
				<hr>
				<div>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/pageAdmin.do?reqPage=1'">Main</button>
				</div>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<script type="text/javascript" src="/resources/js/admin/imgPreView.js"></script>
</body>
</html>