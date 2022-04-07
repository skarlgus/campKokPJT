<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DM</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/resources/css/customer/mypage.css">
<style>
h5 {
	color: #eba13d;
}

td {
	text-align: center;
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

.delete-btn {
	display: inline-block;
	width: 80px;
	height: 40px;
	font-size: 16px;
	text-align: center;
	background-color: #bf372b;
	border: 2px solid #bf372b;
	border-radius: 7px;
	margin-bottom: 10px;
	list-style: none;
	line-height: 40px;
	color: #f2f2f2;
	text-decoration-line: none;
	float: left;
}

.write {
	display: inline-block;
	width: 100%;
	float: right;
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
#re-dmReceiver{
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
		<div>
			<p>쪽지</p>
			<p></p>
		</div>
	</div>
	<div class="mypage-content">
		<div class="page-title">| DM</div>

		<div class="mypage-form">

			<br>

			<h4>받은 쪽지함</h4>
			<div style="width: 100%; height: 300px; overflow: auto;">
				<table class="mypage-tbl">
					<tr>
						<th>보낸사람</th>
						<th>메세지</th>
						<th>확인여부</th>
						<th>날짜</th>
					</tr>
					<c:forEach items="${list }" var="d">
						<c:if test="${d.dmReceiver.equals(sessionScope.user.userId) }">
							<!-- 받은 쪽지 정보 모달 -->
							<div class="modal" id="myModal-sen-info">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">쪽지 확인</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<div class="modal-body">


											발신자 아이디 <input type="text" name="dmSender2" value="" readonly><br> <br>
											<textarea rows="10" cols="50" name="dmContents" id="dmContents" readonly></textarea>


										</div>

										<!-- Modal footer -->
										<div class="modal-footer">
											<button class="delete-btn" data-toggle="modal" data-target="#myModal-sen-delete">삭제</button>

											<button class="write-btn" data-toggle="modal" data-target="#myModal">답장</button> 

											<!--  <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button> -->
										</div>

									</div>
								</div>
							</div>

							<!-- 쪽지 삭제 모달 -->
							<div class="modal" id="myModal-sen-delete">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">쪽지 삭제</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<div class="modal-body">선택하신 쪽지를 삭제하시겠습니까?</div>

										<!-- Modal footer -->
										<div class="modal-footer">
										
											<button type="button" class="delete-btn" data-dismiss="modal" onclick="deleteDm('${d.dmNo }')">삭제</button>
										</div>

									</div>
								</div>
							</div>
							<tr>
								<td>${d.dmSender }</td>

								<td>
									<button type="button" onclick="selectReDm('${d.dmNo }');updateDm('${d.dmNo }')" class="dm-info-btn" data-toggle="modal" data-target="#myModal-sen-info">${d.dmContents }</button>
								</td>
								<td>${d.dmCheck }</td>
								<td>${d.dmDate }</td>
							</tr>

						</c:if>
					</c:forEach>
				</table>
			</div>
			<br> <br>
			<h4>보낸 쪽지함</h4>
							<div class="write">
					<button type="button" class="write-btn" data-toggle="modal" data-target="#myModal">작성</button>
				</div>
			<div style="width: 100%; height: 300px; overflow: auto;">

				<table class="mypage-tbl">
					<tr>
						<th>받은사람</th>
						<th>메세지</th>
						<th>확인여부</th>
						<th>날짜</th>
					</tr>
					<c:forEach items="${list }" var="d">
						<c:if test="${d.dmSender.equals(sessionScope.user.userId) }">

							<!-- 보낸 쪽지 정보 모달 -->
							<div class="modal" id="myModal-rec-info">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">쪽지 확인</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<div class="modal-body">
											수신자 아이디 <input type="text" name="dmReceiver" value="" readonly><br> <br>
											<textarea rows="10" cols="50" name="dmContents" id="dmContents" readonly></textarea>


										</div>

										<!-- Modal footer -->
										<div class="modal-footer">
											<button class="delete-btn" data-toggle="modal" data-target="#myModal-rec-delete">삭제</button>

										</div>

									</div>
								</div>
							</div>


							<!-- 쪽지 삭제 모달 -->
							<div class="modal" id="myModal-rec-delete">
								<div class="modal-dialog">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">쪽지 삭제</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<div class="modal-body">선택하신 쪽지를 삭제하시겠습니까?</div>

										<!-- Modal footer -->
										<div class="modal-footer">
											<input type="hidden" name="dmNo-del">
											<button type="button" class="delete-btn" data-dismiss="modal" onclick="deleteDm()">삭제</button>
										</div>

									</div>
								</div>
							</div>
							<tr>
								<td>${d.dmReceiver }</td>

								<td>
									<button type="button" onclick="selectDm('${d.dmNo }')" class="dm-info-btn" data-toggle="modal" data-target="#myModal-rec-info">${d.dmContents }</button>
								</td>
								<td>${d.dmCheck }</td>
								<td>${d.dmDate }</td>
							</tr>

						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

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
				 <!-- <input type="hidden" name="re-dmSender">
				 <input type="hidden" name="dmReceiver2" id="re-dmReceiver"> -->
				 수신자 아이디 
					 <input type="text" name="dmReceiver2" id="dmReceiver"><br> <br>					
					<textarea rows="10" cols="50" name="dmContent" id="dmContents"></textarea>

				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button class="write-btn" onclick="insertDm('${sessionScope.user.userId }')">보내기</button>
				</div>

			</div>
		</div>
	</div>



	<script>
		function insertDm(dmSender) {
			
			var dmReceiver = $("[name=dmReceiver2]").val();
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

		function selectDm(dmNo) {
			console.log(dmNo);
			$.ajax({
				url : "/dmSelect.do",
				data : {
					dmNo : dmNo
				},
				type : "post",
				success : function(data) {
					if (data != null) {
						$("[name=dmReceiver]").val(data.dmReceiver);
						$("[name=dmContents]").val(data.dmContents);
						$("[name=dmNo-del]").val(data.dmNo);
						$("[name=re-dmSender]").val(data.dmSender);
	
					}
				}
			});
		}

 		function selectReDm(dmNo) {
			console.log(dmNo);
			$.ajax({
				url : "/dmSelect.do",
				data : {
					dmNo : dmNo
				},
				type : "post",
				success : function(data) {
					if (data != null) {
						$("[name=dmSender2]").val(data.dmSender);
						$("[name=dmReceiver]").val(data.dmReceiver);
						$("[name=dmContents]").val(data.dmContents);
						$("[name=dmNo-del]").val(data.dmNo);
						if(data.dmSender==$("[name=dmSender2]").val()){
							$("[name=dmReceiver2]").val(data.dmSender);

						}
						$("[name=re-dmSender]").val(data.dmSender);
						
						
					}
				}
			});
		}  
		function updateDm(dmNo) {
			$.ajax({
				url : "/dmUpdate.do",
				data : {
					dmNo : dmNo
				},
				type : "post",

			});
		}

		function deleteDm() {
			var dmNo = $("[name=dmNo-del]").val();
			console.log(dmNo+"삭제");
			$.ajax({
				url : "/dmDelete.do",
				data : {
					dmNo : dmNo
				},
				type : "post",
				success : function(data) {
					if (data == 1) {
						alert("삭제 되었습니다.");
						location.reload();
						/* sendMsg(dmReceiver); */

					} else {
						alert("삭제에 실패하였습니다.");
					}
				}
			});
		}

		$(".close").click(function() {
			location.reload();
		});
	</script>

</body>
<style>
button:focus {
	outline: none;
}
</style>
</html>