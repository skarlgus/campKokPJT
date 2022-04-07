<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client Info View</title>
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
				<h1>고객정보 관리</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<form action="/updateClientInfo.do" method="POST">
						<table class="table table-striped">
							<tbody>
								<input type="hidden" name="userNo" value="${clientInfo.userNo }">
								<tr>
									<th>분류</th>
									<td colspan="3">
										<select class="form-control" name="userLevel" style="width: 13%">
											<option value="1" selected="selected">고객</option>
											<option value="2">사업자</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td colspan="3" style="text-align: left;">
										<input class="read-only" type="text" name="userId" value="${clientInfo.userId }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td colspan="3">
										<input class="read-only" type="text" name="userName" value="${clientInfo.userName }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<input class="read-only" type="text" name="userBirth" value="${clientInfo.userBirth }" readonly="readonly">
									</td>
									<th>성별</th>
									<td>
										<input class="read-only" type="text" name="userGender" value="${clientInfo.userGender }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td colspan="3">
										<input class="read-only" type="text" name="userPhone" value="${clientInfo.userPhone }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan="3">
										<input class="read-only" type="text" name="userAddr" value="${clientInfo.userAddr }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>마일리지</th>
									<td colspan="3" style="text-align: left;">
										<input class="form-control" type="text" name="userPoint" value="${clientInfo.userPoint }" style="width: 30%;">
									</td>
								</tr>
								<tr>
									<th>가입일</th>
									<td colspan="3">
										<input class="read-only" type="text" name="userDate" value="${clientInfo.userDate }">
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center;">
										<input class="btn btn-warning btn-lg" type="submit" value="수정하기">
										<button class="btn btn-warning btn-lg" type="button" onclick="location.href='/deleteClientInfo.do?userNo=${clientInfo.userNo}'">삭제하기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<hr>
				<div>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectClientInfoList.do?reqPage=1'">목록</button>
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