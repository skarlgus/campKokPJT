<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
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
				<ul class="todo">
					<li style="background-color: #f3d479; color: #bf372b;"><strong>작업 리스트</strong></li>
					<li><a href="/selectTempCampInfoList.do?reqPage=1">신규등록 신청 관리 <span class="count">${tempCampCount }</span></a></li>
				</ul>
				<div class="content-list">
					<!-- Client Info -->
					<div id="client-info">
						<h3>
							<a href="/selectClientInfoList.do?reqPage=1">고객정보 관리</a>
						</h3>
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>번호</th>
									<th>아이디</th>
									<th>이름</th>
									<th>가입일</th>
								</tr>
								<c:forEach items="${clientInfoList }" var="clientInfo" begin="0" end="4" step="1">
									<tr>
										<td>${clientInfo.rNum }</td>
										<td>
											<a href="/selectClientInfo.do?userNo=${clientInfo.userNo }"><strong>${clientInfo.userId }</strong></a>
										</td>
										<td>${clientInfo.userName }</td>
										<td>${clientInfo.userDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button class="btn btn-warning btn-md" onclick="location.href='/selectClientInfoList.do?reqPage=1'">리스트 보기</button>
					</div>

					<!-- CEO Info -->
					<div id="ceo-info">
						<h3>
							<a href="/selectCeoInfoList.do?reqPage=1">사업자정보 관리</a>
						</h3>
						<table class="table table-striped">
							<tr>
								<th>번호</th>
								<th>아이디</th>
								<th>이름</th>
								<th>가입일</th>
							</tr>
							<c:forEach items="${ceoInfoList }" var="ceoInfo" begin="0" end="4" step="1">
								<tr>
									<td>${ceoInfo.rNum }</td>
									<td>
										<a href="/selectCeoInfo.do?userNo=${ceoInfo.userNo }"><strong>${ceoInfo.userId }</strong></a>
									</td>
									<td>${ceoInfo.userName }</td>
									<td>${ceoInfo.userDate }</td>
								</tr>
							</c:forEach>
						</table>
						<button class='btn btn-warning btn-md' onclick="location.href='/selectCeoInfoList.do?reqPage=1'">리스트 보기</button>
					</div>

					<!-- Client Notice -->
					<div id="client-notice">
						<h3>
							<a href="/selectClientNoticeList.do?reqPage=1">고객 공지사항</a>
						</h3>
						<table class='table table-striped'>
							<tbody>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>첨부파일</th>
									<th>등록일</th>
								</tr>
								<c:forEach items="${clientNoticeList }" var="clientNotice" begin="0" end="4" step="1">
									<tr>
										<td>${clientNotice.rNum }</td>
										<td>
											<a href="/selectClientNotice.do?clientNoticeNo=${clientNotice.clientNoticeNo }"><strong>${clientNotice.clientNoticeTitle }</strong></a>
										</td>
										<td>
											<c:if test="${not empty clientNotice.clientNoticeFilePath }">
												<img class="img-file" src="/resources/img/admin/free-icon-attached-file-1209914.png">
											</c:if>
										</td>
										<td>${clientNotice.clientNoticeDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button class='btn btn-warning btn-md' onclick="location.href='/selectClientNoticeList.do?reqPage=1'">리스트 보기</button>
					</div>

					<!-- CEO Notice -->
					<div id="ceo-notice">
						<h3>
							<a href="/selectCeoNoticeList.do?reqPage=1">사업자 공지사항</a>
						</h3>
						<table class="table table-striped">
							<tbody>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>첨부파일</th>
									<th>등록일</th>
								</tr>
								<c:forEach items="${ceoNoticeList }" var="ceoNotice" begin="0" end="4" step="1">
									<tr>
										<td>${ceoNotice.rNum }</td>
										<td>
											<a href="/selectCeoNotice.do?ceoNoticeNo=${ceoNotice.ceoNoticeNo }"><strong>${ceoNotice.ceoNoticeTitle }</strong></a>
										</td>
										<td>
											<c:if test="${not empty ceoNotice.ceoNoticeFilePath }">
												<img class="img-file" src="/resources/img/admin/free-icon-attached-file-1209914.png">
											</c:if>
										</td>
										<td>${ceoNotice.ceoNoticeDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<button class="btn btn-warning btn-md" onclick="location.href='/selectCeoNoticeList.do?reqPage=1'">리스트보기</button>
					</div>

					<!-- Camp Info -->
					<div id="camp-info">
						<h3>
							<a href="/selectCampInfoList.do?reqPage=1">캠핑장 관리</a>
						</h3>
						<table class="table table-striped">
							<tr>
								<th>번호</th>
								<th>사업자명</th>
								<th>캠핑장명</th>
								<th>주소</th>
							</tr>
							<c:forEach items="${campInfoList }" var="campInfo" begin="0" end="4" step="1">
								<tr>
									<td>${campInfo.rNum }</td>
									<td>
										<a href="/selectCeoInfo.do?userNo=${campInfo.ceoInfo.userNo }"><strong>${campInfo.ceoId }</strong></a>
									</td>
									<td>
										<a href="/selectCampInfo.do?campNo=${campInfo.campNo }"><strong>${campInfo.campName }</strong></a>
									</td>
									<td>${campInfo.campAddr }</td>
								</tr>
							</c:forEach>
						</table>
						<button class="btn btn-warning btn-md" onclick="location.href='/selectCampInfoList.do?reqPage=1'">리스트보기</button>
					</div>

					<!-- Board Info -->
					<div id="board">
						<h3>
							<a href="/selectBoardInfoList.do?reqPage=1">자유게시판 관리</a>
						</h3>
						<table class="table table-striped">
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
							<c:forEach items="${boardInfoList }" var="boardInfo" begin="0" end="4" step="1">
								<tr>
									<td>${boardInfo.rNum }</td>
									<td>
										<a href="/selectBoardInfo.do?boardNo=${boardInfo.boardNo }"><strong>${boardInfo.boardTitle }</strong></a>
									</td>
									<td>${boardInfo.userId }</td>
									<td>${boardInfo.boardDate }</td>
								</tr>
							</c:forEach>
						</table>
						<button class="btn btn-warning btn-md" onclick="location.href='/selectBoardInfoList.do?reqPage=1'">리스트보기</button>
					</div>
				</div>
			</div>

			<!-- Profile -->
			<div class="content-profile">
				<ul class="profile-wrap">
					<li><img alt="Admin Photo" src="/resources/img/admin/main_img4.jpg"></li>
					<li class="profile">
						<table id="profile">
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" name="userId" value="${sessionScope.user.userId }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="userName" value="${sessionScope.user.userName }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" name="phone" value="${sessionScope.user.userPhone }" readonly="readonly">
								</td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<link rel="stylesheet" href="/resources/css/admin/admin.css">
</body>
</html>