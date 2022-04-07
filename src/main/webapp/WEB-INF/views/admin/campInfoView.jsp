<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Camp Info View</title>
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
				<h1>캠핑장정보 관리</h1>
				<hr>
				<div class="table-wrap" style="margin-top: 30px;">
					<table class="table table-striped">
						<tr>
							<th>사업자 아이디</th>
							<td>${campInfo.ceoId }</td>
							<th>사업자명</th>
							<td>${campInfo.ceoInfo.userName }</td>
						</tr>
						<tr>
							<th>카테고리</th>
							<td colspan="3">${campInfo.campCtg }</td>
						</tr>
						<tr>
							<th>캠핑장명</th>
							<td colspan="3">${campInfo.campName }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${campInfo.campTel }</td>
							<th>웹사이트</th>
							<td>${campInfo.campSite }</td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3">${campInfo.campAddr }</td>
						</tr>
						<tr>
							<th>테마</th>
							<td colspan="3">${campInfo.campTheme }</td>
						</tr>
						<tr>
							<th>시설</th>
							<td colspan="3">${campInfo.campFac }</td>
						</tr>
						<tr>
							<th>이미지</th>
							<td colspan="3">
								<c:if test="${not empty campFile.campFilePath }">
									<div style="text-align: left;">
										<c:forEach items="${campInfo.campFiles }" var="campFile">
											<img id="img-view" src="/resources/upload/camp/${campFile.campFilePath }" style="width: 20%;">
										</c:forEach>
									</div>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				<div class="camp-fac-info">
					<h1 style="margin: 0 auto;">주변 이용시설</h1>
					<hr style="margin-left: 0;">
					<table class="table table-striped">
						<tr>
							<th>이용시설</th>
							<td>${campInfo.campEnv.envName }</td>
							<th>전화번호</th>
							<td>${campInfo.campEnv.envTel }</td>
						</tr>
						<tr>
							<th>주소</th>
							<td colspan="3">${campInfo.campEnv.envAddr }</td>
						</tr>
						<tr>
							<th>이미지</th>
							<td colspan="3">
								<c:if test="${not empty campInfo.campEnv.envFilePath }">
									<div style="text-align: left;">
										<img id="img-view" src="/resources/upload/campenv/${campInfo.campEnv.envFilePath }" style="width: 20%;">
									</div>
								</c:if>
							</td>
						</tr>
					</table>
				</div>
				<hr>
				<div style="text-align: center;">
					<button class="btn btn-warning btn-lg" onclick="location.href='/deleteCampInfo.do?campNo=${campInfo.campNo}'">캠핑장 정보 삭제</button>
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectCampInfoList.do?reqPage=1'">목록</button>
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