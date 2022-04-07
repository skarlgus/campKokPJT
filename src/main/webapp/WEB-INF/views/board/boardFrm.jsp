<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 작성</title>
<script type="text/javascript" src="/nse_files/js/HuskyEZCreator.js" charset="utf-8"></script>
    <link rel="stylesheet" href="/resources/css/customer/noticeView.css">
    <style>
    	form{
    		width:100%;
    	}
    	input[type=text]{
    		width:100%;
    		outline: none;
    		font-size:16px;
    		border:none;
    		height: 100%;
    	}
    	input[type=submit]{
    		font-family: 'Noto Sans KR', sans-serif;
    		padding:0;
    		border:none;
    		width:200px;
    		height: 50px;
    		font-size:16px;
    	}
    			textarea{
			width:99.5%;
			height:400px;
			border:none;
			resize: none;
			text-align:center;
		}
		textarea:focus{
			outline:none;
		}
		        .notice-tbl th{
        	text-align: center;
        }
    </style>
</head>

<body>
<c:set var="today" value="<%=new java.util.Date()%>" />
<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy-MM-dd" /></c:set>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="header-img">
        <div>
            <p>자유 게시판</p>
            <p></p>
        </div>
    </div>
    <div class="notice-content">
        <div class="page-title">
            | BOARD
        </div>
        <div class="notice-naeyong">
        	<form action="/insertBoard.do" method="post" enctype="multipart/form-data">
            <table class="notice-tbl">
                <tr>
                    <th class="">제목</th>
                    <td colspan="3"><input type="text" name="boardTitle"></td>
                </tr>
                <tr>
                    <th width="25%">작성자</th>
                    <td width="25%"><input type="text" name="userId" value="${sessionScope.user.userId }"></td>
                    <th width="25%">등록일</th>
                    <td width="25%"><input type="text" name="boardDate" value="${date }"></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3"><input type="file" name="file"></td>
                    <%-- <td colspan="3">${b.boardFilepath }</td> --%>
                </tr>
                <tr>
                    <td colspan="4" style="height: 400px;"><textarea rows="3" cols="40" name="boardContents" id="boardContents"></textarea></td>
                </tr>
                <tr>
                	<td colspan="4" style="text-align: center;height: 55px;">
                    	<input type="submit" class="notice-btn" value="등록">
                    	<a href="javascript:history.go(-1)" class="notice-btn">취소</a>
                    </td>
                </tr>
            </table>
            	</form>
            <table class="notice-tbl2">
                <tr>
                    <th style="width: 200px;">다음글</th>
                    <td><a href="#">공지사항입니다</a></td>
                </tr>
                <tr>
                    <th>이전글</th>
                    <td><a href="#">공지사항입니다</a></td>
                </tr>
            </table>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
<!-- 			<script>
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
				oAppRef : oEditors,
				elPlaceHolder : "boardContents",
				sSkinURI : "/nse_files/SmartEditor2Skin2.html",
				fCreator : "createSEditor2"
			});
			function submitContents(elClickedObj) {
				console.log(document.getElementById("boardContents").value);
				oEditors.getById["boardContents"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다. 
				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

				try {
					elClickedObj.form.submit();
				} catch (e) {
				}
			}
		</script> -->
</body>
</html>