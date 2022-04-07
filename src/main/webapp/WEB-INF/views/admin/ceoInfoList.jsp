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
					<a href="/selectCeoInfoList.do?reqPage=1">사업자정보 관리</a>
				</h1>
				<hr>
				<div class="search-wrap">
					<form action="/searchCeoInfo.do" method="GET">
						<input type="hidden" name="reqPage" value="1">
						<table>
							<tbody>
								<tr>
									<td>
										<select class="form-control" id="search-category" name="searchCategory">
											<option value="userId" selected="selected">아이디</option>
											<option value="userName">이름</option>
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
								<th>캠핑장명</th>
								<th>전화번호</th>
								<th>주소</th>
								<th>가입일</th>
								<th></th>
							</tr>
							<c:forEach items="${list }" var="ceoInfo">
								<tr>
									<td>${ceoInfo.rNum }</td>
									<td>
										<a href="/selectCeoInfo.do?userNo=${ceoInfo.userNo }"><strong>${ceoInfo.userId }</strong></a>
									</td>
									<td>${ceoInfo.userName }</td>
									<td>
										<a href="/selectCampInfo.do?campNo=${ceoInfo.camp.campNo}"><strong>${ceoInfo.camp.campName }</strong></a>
									</td>
									<td>${ceoInfo.userPhone }</td>
									<td>${ceoInfo.userAddr }</td>
									<td>${ceoInfo.userDate }</td>
									<td>
										<button class="btn btn-warning btn-md" onclick="location.href='/selectCeoInfo.do?userNo=${ceoInfo.userNo }'">상세보기</button>
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