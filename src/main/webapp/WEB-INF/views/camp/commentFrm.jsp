<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/camp/comment3.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- userInfo : no,이름,레벨,총포인트 
		          : 화면 넘어올때 캠핑장 no받아야함
	-->
	<div class="inputComment">

	<span id="aa">*일반이용자만 댓글등록이 가능합니다.</span>
		<form action="/camp/insertComment.do" method="post" accept-charset="utf-8">
			<ul>
				<li>
					<input type="hidden" name="userId" value="${sessionScope.user.userId }">
					<input type="hidden" name="campNo" value="${campNo }">
					<textarea name="revContents"></textarea>
				</li>
				<c:if test="${userInfo.userLevel eq '1'}">
				<li>				
					<input type="submit" value="등록"></input>					
				</li>	
				</c:if>		
			</ul>
		</form>	
	</div>
	
	<div class="commentList">
		<c:forEach items="${commentList }" var="commentList">
			<ul id="aa">
				<li>
					<p id="infotext">${commentList.userId }</p>
					<p id="infotext">${commentList.revDate }</p>
				</li>
				<li>
					<p class="linkbox">
						<textarea name="noticeCommentContet">${commentList.revContents }</textarea>
						<!-- user01부분 세션아이디로 바꿔야함 -->
						<c:if test="${commentList.userId eq sessionScope.user.userId }">
							<a href="/camp/commentDelete.do?revNo=${commentList.revNo }&campNo=${campNo }" style="color:#f3d479;">삭제</a>
							<%-- <a class="recShow" href="/camp/commentUpdate.do?revNo=${commentList.revNo }" >수정</a> --%>
						</c:if>
						<!-- 1(고객)부분 2(사업자)로바꿔야함 -->
						<c:if test="${userInfo.userLevel eq '5'}">
							<a href="javascript:void(0)" class="recShow2">답글달기</a>
						</c:if>						
					</p>
					<div class="inputComment re">
						<form action="/camp/insertCommentRe.do" method="post" accept-charset="utf-8">
							<ul>
								<li>
									<input type="hidden" name="" value="${userInfo.userId }">
									<input type="hidden" name="" value="${commentList.revNo }">
									<textarea class="form-control" name="noticeCommentContent"></textarea>
								</li>
								<li>
									<button type="submit" class="btn btn-secondary btn-sm btn-black">등록</button>
									<button type="button" class="btn btn-secondary btn-sm btn-black recCancel">취소</button>
									</li>
							</ul>
						</form>
					</div>		
				</li>
			</ul>
		</c:forEach>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	
	<script>
	$(".recShow").click(function(){
		$(this).hide();
		var idx = $(".recShow").index(this);
		$(".recCancel").eq(idx).parents("div").css("display","block");
	});
	
	$(".recCancel").click(function(){			
		var idx = $(".recCancel").index(this);
		$(this).parents(".re").css("display","none");
		$(".recShow").eq(idx).show();
	});
	</script>
</body>
</html>