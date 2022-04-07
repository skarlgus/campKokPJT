<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<link rel="stylesheet" href="/resources/css/customer/noticeView.css">
<!-- 	<link rel="stylesheet" href="/resources/css/camp/comment.css"> -->
</head>
<style>
.notice-content{
	height: 100%;
}
.list-btn {
	display: inline-block;
	width: 80px;
	height: 40px;
	font-size: 16px;
	text-align: center;
	background-color: #405944;
	border: 2px solid #405944;
	border-radius: 7px;
	margin-bottom: 10px;
	list-style: none;
	line-height: 40px;
	color: #f2f2f2;
	text-decoration-line: none;
}

.write {
	width: 1200px;
	text-align: right;
}
        .list-btn:hover{
            text-decoration-line: none;
            color: #f3d479;
        }
                .notice-tbl th{
        	text-align: center;
        }

.notice-tbl2 {

	margin-bottom: 20px;
}
	.inputComment>form>ul>li:first-child{
		list-style:none;
		width: 80%;		
	}
	.inputComment>form>ul>li:last-child{
		list-style:none;
		width: 10%;		
	}
	.inputComment{
	width:1200px;
		background-color: #fcfcfc;
			
	}
	.inputComment:first-child{
	border-top: 3px solid #405944;
	}
	.inputComment>form>ul{
		display: flex;
		justify-content: space-around;
		padding: 10px;
		padding-bottom: 0;
	}
	.inputComment textarea{
		resize: none;
	}	

/* 	.inputComment>form>ul>li>*{
		height:100%;
	} */
	.commentList{
		width:1200px;
	}
	.commentList *{
		margin:0;
	}
	.commentList>ul{
		color:black;
		display: flex;
		justify-content: space-between;
		background-color: #fcfcfc;
		padding:5px;
		padding-bottom: 10px;
		border-bottom: 2px solid #f5f5f5;
	}
	.commentList>ul>li:first-child{
		display: flex;
		width:20%;
		flex-flow: column;
		justify-content: center;;
		align-items: center;
	}
	.commentList>ul>li:last-child{
		display: flex;
		width:70%;
		float:left;
		flex-flow: column;
		height:100%;
	}
	.commentList p{
		margin: 0;
	}
	.linkBox{
		text-align: right;
	}
	.re>form>ul>li>button{
		height:40%;
	}
	
	.re li,.rere li{
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	.re{
		display: none;
		width:100%;
	}
	.commentList .rere>li:first-child{
		width:10%;
		align-items: flex-end;
	}
	.rere>li:nth-child(2){
		width:15%;
		align-items: center;
	}
	.rere>li:last-child{
		width:75%;
	}
	.changeComment{		
		resize: none;
		width: 95%;
		display: block;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #ced4da;
    border-radius: .25rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	}
	.comment-btn {
	display: inline-block;
	width: 100%;
	height: 55px;
	font-size: 18px;
	text-align: center;
	background-color: #405944;
	border: 2px solid #405944;
	border-radius: 7px;
	margin-bottom: 10px;
	list-style: none;
	line-height: 40px;
	color: #f2f2f2;
	text-decoration-line: none;
	float:right;
}
	.delete-btn{
		color:#bf372b;
	}
	.modify-btn{
		color:#405944;
	}
		.delete-btn:hover{
		text-decoration-line: none;
		color:#bf372b;
	}
	.modify-btn:hover{
	text-decoration-line: none;
		color:#405944;
	}
	.dm-a{
		color:#232323;
		text-decoration-line: none;
	}
	.dm-a:hover{
	color:#232323;
		text-decoration-line: none;
		font-weight: bold;
	}
.modal-body {
	margin: 0 auto;
}

.modal-body>input {
	width: 315px;
}

.dm-info-btn {
	background-color: white;
	border: none;
}

.dm-info-btn:hover {
	font-weight: bold;
}
.write-btn {
	display: inline-block;
	width: 80px;
	height: 40px;
	font-size: 16px;
	text-align: center;
	background-color: #405944;
	border: 2px solid #405944;
	border-radius: 7px;
	margin-bottom: 10px;
	list-style: none;
	line-height: 40px;
	color: #f2f2f2;
	text-decoration-line: none;
	float: right;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
		<div>
			<p>자유 게시판</p>
			<p></p>
		</div>
	</div>
	<div class="notice-content">
		<div class="page-title">| BOARD</div>
		<div class="write">
			<a href="/boardList.do?reqPage=1" class="list-btn">목록</a>
		</div>

		<div class="notice-naeyong">
			<table class="notice-tbl">
				<tr>
					<th class="">제목</th>
					<td colspan="3">${b.boardTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><a href="javascript:void(0);" class="dm-a"  title="클릭하여 쪽지를 보내보세요!" data-toggle="modal" data-target="#myModal">${b.userId }</a></td>
				
					<th>등록일</th>
					<td>${b.boardDate }</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td colspan="3">
						<a href="javascript:fileDownload('${b.boardFilename }','${b.boardFilepath }')">${b.boardFilepath }</a>
					</td>
					
				</tr>
				<tr>
					<td colspan="4" style="height: 400px;">${b.boardContents }</td>
				</tr>
				<!--                 <tr>
                    <td colspan="4" style="text-align: center;height: 55px;"><a href="/boardList.do?reqPage=1" class="notice-btn">목록</a></td>
                </tr> -->
				<c:if test="${sessionScope.user.userId.equals(b.userId) && sessionScope.user!=null}">
				<tr>
					<td colspan="4" style="text-align: center; height: 55px;">
						<a href="/boardUpdateFrm.do?boardNo=${b.boardNo }" class="notice-btn">수정</a> <a href="/deleteBoard.do?boardNo=${b.boardNo }" class="notice-btn">삭제</a>
					</td>
				</tr>
				</c:if>
			</table>
<!-- 			<table class="notice-tbl2">
				<tr>
					<th style="width: 200px;">다음글</th>
					<td>
						<a href="#">공지사항입니다</a>
					</td>
				</tr>
				<tr>
					<th>이전글</th>
					<td>
						<a href="#">공지사항입니다</a>
					</td>
				</tr>
			</table> -->
		</div>
		<c:if test="${!sessionScope.user.userId.equals(b.userId) && sessionScope.user!=null}">
				<!--  쪽지 보내기 모달 -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">쪽지 보내기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				 수신자 아이디 
					 <input type="text" name="dmReceiver" id="dmReceiver" value="${b.userId }"><br> <br>					
					<textarea rows="10" cols="50" name="dmContent" id="dmContents"></textarea>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button class="write-btn" onclick="insertDm('${sessionScope.user.userId }')">보내기</button>
				</div>

			</div>
		</div>
	</div>
	</c:if>
				<c:if test="${sessionScope.user!=null }">
		<div class="inputComment">
			<form action="/insertBoardComment.do" method="post">
				<ul>
					<li>
						<input type="hidden" name="boardCommentLevel" value="1">
						<input type="hidden" name="boardCommentWriter" value="${sessionScope.user.userId }">
						<input type="hidden" name="boardRef" value="${b.boardNo }">
						<!-- <input type="hidden" name ="boardCommentRef" value="0"> -->
						<textarea class="form-control" name="boardCommentContent"></textarea>
						
					</li>
					<li>
						<button type="submit" class="comment-btn">등록</button>
					</li>
				</ul>
			</form>
		</div>
		</c:if>
				<div class="commentList">
			<c:forEach items="${list }" var="bc">
					<ul>
						<li>
							<%-- <p><a href="javascript:void(0);" onclick="dm_menu('${bc.boardCommentWriter }')" data-toggle="modal" data-target="#myModal2">${bc.boardCommentWriter }</a></p> --%>
							<p>${bc.boardCommentWriter }</p>
							<p>${bc.boardCommentDate }</p>
						</li>
						<li>
							<p>${bc.boardCommentContent }</p>
							<textarea name="boardCommentContent" class="changeComment" style="display:none;">${bc.boardCommentContent }</textarea>
							
							<c:if test="${sessionScope.user!=null }">
							<p class="linkBox">
								<c:if test="${bc.boardCommentWriter.equals(sessionScope.user.userId) }">
								<a href="javascript:void(0)" class="modify-btn" onclick="modifyComment(this,'${bc.boardCommentNo }','${b.boardNo }')">수정</a>
								<a href="javascript:void(0)" class="delete-btn" onclick="deleteComment(this,'${bc.boardCommentNo }','${b.boardNo }')">삭제</a>
								</c:if>
							</p>

							</c:if>
						</li>
					</ul>
<%-- 		<c:if test="${!sessionScope.user.userId.equals(bc.boardCommentWriter ) && sessionScope.user!=null}">
				<!--  쪽지 보내기 모달 -->
	<div class="modal" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">쪽지 보내기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
				 <!-- <input type="hidden" name="re-dmSender">
				 <input type="hidden" name="dmReceiver2" id="re-dmReceiver"> -->
				 수신자 아이디 
					 <input type="text" name="dmReceiver2" id="dmReceiver" value="${bc.boardCommentWriter }"><br> <br>					
					<textarea rows="10" cols="50" name="dmContent" id="dmContents"></textarea>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button class="write-btn" onclick="insertDm('${sessionScope.user.userId }')">보내기</button>
				</div>

			</div>
		</div>
	</div>
	</c:if>
				 --%>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
	function insertDm(dmSender) {
		
		var dmReceiver = $("[name=dmReceiver]").val();
		var dmContents = $("[name=dmContent]").val(); 
		console.log(dmContents+"dd");
		console.log(dmSender+"F");
		console.log(dmReceiver+"ss");
		$.ajax({
			url : "/dmInsert.do",
			data : {
				dmReceiver : dmReceiver,
				dmSender : dmSender,
				dmContents : dmContents
			},
			type : "post",
			success : function(data) {
				if (data == 1) {
					alert("쪽지 보내기 성공");
					location.reload();
					sendMsg(dmReceiver);

				} else {
					alert("쪽지 보내기 실패");
				}
			}
		});
	}

		//첨부파일 다운로드
		function fileDownload(filename, filepath) {//인코딩작업해주려고 자바스크립트로 함
			var url = "/boardDownload.do";
			var encFilename = encodeURIComponent(filename);
			var encFilepath = encodeURIComponent(filepath);
			location.href = url + "?filename=" + encFilename + "&filepath="
					+ encFilepath + "&boardNo=" + $
			{
				b.boardNo
			}
			;
		}
		
		function modifyComment(obj, commentNo, boardNo){
			$(obj).parent().prev().show();			//textarea를 보여주는 코드
			$(obj).parent().prev().prev().hide();	//p태그를 숨기는 코드
			//수정버튼 -> 수정완료
			$(obj).html('수정완료');
			$(obj).attr('onclick','modifyComplete(this,"'+commentNo+'","'+boardNo+'")');
			//삭제버튼 -> 수정취소
			$(obj).next().html('취소');
			$(obj).next().attr('onclick','modifyCancel(this,"'+commentNo+'","'+boardNo+'")');
			$(obj).next().next().hide();
		}
		function modifyCancel(obj,commentNo,boardNo){
			$(obj).parent().prev().hide();			//textarea를 숨기는 코드
			$(obj).parent().prev().prev().show();	//p태그를 보여주느는 코드
			//수정완려 -> 수정
			$(obj).prev().html('수정');
			$(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'","'+boardNo+'")');
			//최소 -> 삭제
			$(obj).html('삭제');
			$(obj).attr('onclick','deleteComment(this,"'+commentNo+'","'+boardNo+'")');
			$(obj).next().show();
		}
		function modifyComplete(obj,commentNo, boardNo){
			var form = $("<form action='/updateBoardComment.do' method='post'></form>");
			form.append($("<input type='text' name='boardCommentNo' value='"+commentNo+"'>"));
			form.append($("<input type='text' name='boardNo' value='"+boardNo+"'>"));
			form.append($(obj).parent().prev());
			$("body").append	(form);
			form.submit();
		}
		function deleteComment(obj, commentNo, boardNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href="/deleteBoardComment.do?boardCommentNo="+commentNo+"&boardNo="+boardNo;
			}
		}
	</script>
</body>
</html>