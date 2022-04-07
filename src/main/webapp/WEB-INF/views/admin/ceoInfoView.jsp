<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO Info View</title>
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
				<h1>사업자정보 관리</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<form action="/updateCeoInfo.do" method="POST">
						<table class="table table-striped">
							<tbody>
								<input type="hidden" name="userNo" value="${ceoInfo.userNo }">
								<tr>
									<th>분류</th>
									<td colspan="3">
										<input class="read-only" type="text" value="사업자" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>아이디</th>
									<td colspan="3" style="text-align: left;">
										<input class="read-only" type="text" name="userId" value="${ceoInfo.userId }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>이름</th>
									<td colspan="3">
										<input class="read-only" type="text" name="userName" value="${ceoInfo.userName }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>생년월일</th>
									<td>
										<input class="read-only" type="text" name="userBirth" value="${ceoInfo.userBirth }" readonly="readonly">
									</td>
									<th>성별</th>
									<td>
										<input class="read-only" type="text" name="userGender" value="${ceoInfo.userGender }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td colspan="3">
										<input class="read-only" type="text" name="userPhone" value="${ceoInfo.userPhone }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>주소</th>
									<td colspan="3">
										<input class="read-only" type="text" name="userAddr" value="${ceoInfo.userAddr }" readonly="readonly">
									</td>
								</tr>
								<tr>
									<th>마일리지</th>
									<td colspan="3" style="text-align: left;">
										<input class="form-control" type="text" name="userPoint" value="${ceoInfo.userPoint }" style="width: 30%;">
									</td>
								</tr>
								<tr>
									<th>가입일</th>
									<td colspan="3">
										<input class="read-only" type="text" name="userDate" value="${ceoInfo.userDate }">
									</td>
								</tr>
								<tr>
									<td colspan="4" style="text-align: center;">
										<input class="btn btn-warning btn-lg" type="submit" value="수정하기">
										<button class="btn btn-warning btn-lg" type="button" onclick="location.href='/deleteCeoInfo.do?userNo=${ceoInfo.userNo}'">삭제하기</button>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<c:if test="${not empty ceoInfo.camp }">
					<div class="camp-info">
						<h1 style="margin: 0 auto;">캠핑장 정보</h1>
						<hr style="margin-left: 0;">
						<table class="table table-striped">
							<tr>
								<th>사업자 아이디</th>
								<td>${ceoInfo.camp.ceoId }</td>
								<th>사업자명</th>
								<td>${ceoInfo.userName }</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td colspan="3">${ceoInfo.camp.campCtg }</td>
							</tr>
							<tr>
								<th>캠핑장명</th>
								<td colspan="3">${ceoInfo.camp.campName }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${ceoInfo.camp.campTel }</td>
								<th>웹사이트</th>
								<td>${ceoInfo.camp.campSite }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">${ceoInfo.camp.campAddr }</td>
							</tr>
							<tr>
								<th>테마</th>
								<td colspan="3">${ceoInfo.camp.campTheme }</td>
							</tr>
							<tr>
								<th>시설</th>
								<td colspan="3">${ceoInfo.camp.campFac }</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<c:forEach items="${ceoInfo.camp.campFiles }" var="campFile">
									${campFile.campFilePath }
								</c:forEach>
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<td colspan="3">
									<div style="text-align: left">
										<c:forEach items="${ceoInfo.camp.campFiles }" var="campFile">
											<img id="img-view" src="/imgPreview.do?filePath=${campFile.campFilePath }" style="width: 20%">
										</c:forEach>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</c:if>
				<div style="text-align: center;">
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectCeoInfoList.do?reqPage=1'">목록</button>
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