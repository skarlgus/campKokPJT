<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CEO Info List</title>
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
					<a href="/selectCampInfoList.do?reqPage=1">캠핑장정보 관리</a>
				</h1>
				<hr>
				<div class="search-wrap">
					<form action="/searchCampInfoList.do" method="GET">
						<input type="hidden" name="reqPage" value="1">
						<table>
							<tbody>
								<tr>
									<td>
										<select class="form-control" id="search-category" name="searchCategory">
											<option value="ceoId" selected="selected">아이디</option>
											<option value="ceoName">이름</option>
											<option value="campName">캠핑장명</option>
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
								<th>아이디</th>
								<th>이름</th>
								<th>카테고리</th>
								<th>캠핑장명</th>
								<th>주소</th>
								<th>전화번호</th>
								<th></th>
							</tr>
							<c:forEach items="${list }" var="campInfo">
								<tr>
									<td>${campInfo.rNum }</td>
									<td>
										<a href="/selectCeoInfo.do?userNo=${campInfo.ceoInfo.userNo }"><strong>${campInfo.ceoInfo.userId }</strong></a>
									</td>
									<td>${campInfo.ceoInfo.userName }</td>
									<td>${campInfo.campCtg }</td>
									<td>
										<a href="/selectCampInfo.do?campNo=${campInfo.campNo }"><strong>${campInfo.campName }</strong></a>
									</td>
									<td>${campInfo.campAddr }</td>
									<td>${campInfo.campTel }</td>
									<td>
										<button class="btn btn-warning btn-md" onclick="location.href='/selectCampInfo.do?campNo=${campInfo.campNo }'">상세보기</button>
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