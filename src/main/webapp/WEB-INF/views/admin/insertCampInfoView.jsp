<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Camp Info View</title>
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
				<h1>신규등록 캠핑장정보 관리</h1>
				<hr>
				<form action="/insertCampInfo.do" method="POST">
					<div class="table-wrap" style="margin-top: 30px;">
						<table class="table table-striped">
							<tr>
								<th>사업자 아이디</th>
								<td>
									<input class="read-only" type="text" name="ceoId" value="${campInfo.ceoId }" readonly="readonly">
								</td>
								<th>사업자명</th>
								<td>${campInfo.ceoInfo.userName }</td>
							</tr>
							<tr>
								<th>카테고리</th>
								<td colspan="3">
									<input class="read-only" type="text" name="campCtg" value="${campInfo.campCtg }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>캠핑장명</th>
								<td colspan="3">
									<input type="hidden" name="campNo" value="${campInfo.campNo }" readonly="readonly"> <input class="read-only" type="text"
										name="campName" value="${campInfo.campName }">
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input class="read-only" type="text" name="campTel" value="${campInfo.campTel }" readonly="readonly">
								</td>
								<th>웹사이트</th>
								<td>
									<input class="read-only" type="text" name="campSite" value="${campInfo.campSite }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">
									<input class="read-only" type="text" name="campAddr" value="${campInfo.campAddr }" readonly="readonly" style="width: 100%;">
								</td>
							</tr>
							<tr>
								<th>테마</th>
								<td colspan="3">
									<input class="read-only" type="text" name="campTheme" value="${campInfo.campTheme }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>시설</th>
								<td colspan="3">
									<input class="read-only" type="text" name="campFac" value="${campInfo.campFac }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<c:forEach items="${campInfo.campFiles }" var="campFile">
									<input type="hidden" name="campFileName" value="${campFile.campFileName }" readonly="readonly">
								</c:forEach>
								<td colspan="3">
									<c:forEach items="${campInfo.campFiles }" var="campFile">
										<input class="read-only" type="text" name="campFilePath" value="${campFile.campFilePath }" readonly="readonly">
									</c:forEach>
								</td>
							</tr>
							<tr>
								<th>이미지 미리보기</th>
								<td colspan="3">
									<div style="text-align: left;">
										<c:forEach items="${campInfo.campFiles }" var="campFile">
											<img id="img-view" src="/imgPreview.do?filePath=${campFile.campFilePath }" style="width: 20%;">
										</c:forEach>
									</div>
								</td>
							</tr>
							<tr>
								<th colspan="4" style="text-align: left;">
									<h1 style="margin-left: 0;">주변 이용시설</h1>
								</th>
							</tr>
							<tr>
								<th>이용시설</th>
								<td>
									<input class="read-only" type="text" name="envName" value="${campInfo.campEnv.envName }" readonly="readonly">
								</td>
								<th>전화번호</th>
								<td>
									<input class="read-only" type="text" name="envTel" value="${campInfo.campEnv.envTel }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>주소</th>
								<td colspan="3">
									<input class="read-only" type="text" name="envAddr" value="${campInfo.campEnv.envAddr }" readonly="readonly" style="width: 100%;">
								</td>
							</tr>
							<tr>
								<th>이미지</th>
								<input type="hidden" name="envFileName" value="${campInfo.campEnv.envFileName }" readonly="readonly">
								<td colspan="3">
									<input class="read-only" type="text" name="envFilePath" value="${campInfo.campEnv.envFilePath }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>이미지 미리보기</th>
								<td colspan="3">
									<c:if test="${not empty campInfo.campEnv.envFilePath }">
										<div style="text-align: left;">
											<img id="img-view" src="/imgPreview.do?filePath=${campInfo.campEnv.envFilePath }" style="width: 20%">
										</div>
									</c:if>
								</td>
							</tr>
							<tr>
								<td colspan="4" style="text-align: center;">
									<input class="btn btn-warning btn-lg" type="submit" value="캠핑장 등록">
									<button class="btn btn-warning btn-lg" type="button" onclick="location.href='/deleteTempCampInfo.do?campNo=${campInfo.campNo}'">캠핑장
										등록 반려</button>
								</td>
							</tr>
						</table>
					</div>
				</form>
				<hr>
				<div style="text-align: center;">
					<button class="btn btn-warning btn-md btn-list" onclick="location.href='/selectTempCampInfoList.do?reqPage=1'">목록</button>
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