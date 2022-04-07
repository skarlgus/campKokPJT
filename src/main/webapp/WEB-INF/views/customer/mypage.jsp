<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/customer/mypage.css">
<style>
	.modify-btn{
		margin:0 auto;
		text-align: center;
	}
        .delete-btn{
        	    display: inline-block;
    background-color: #bf372b;
    width: 200px;
    color: #fff;
    text-decoration: none;
    text-align: center;
    height: 50px;
    line-height: 50px;
    padding: 0;
    border: none;
    font-size: 16px;
        }
          .delete-btn:hover {
            color: #bf372b;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #bf372b;

        }
                input[type=submit] {
            display:  inline-block;
            background-color: #405944;
            width: 200px;
            color: #fff;
            text-decoration: none;
            text-align: center;
            height: 50px;
            line-height: 50px;
            padding: 0;
            border: none;
            font-size: 16px;
        }
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <div class="header-img">
        <div>
            <p>마이페이지</p>
            <p></p>
        </div>
    </div>
    <div class="mypage-content">
        <div class="page-title">
            | My Page
        </div>
        <div class="navi">
            <ul>
                <li style="background-color: #405944;">
                	<a style=" font-size: 14px; font-weight: bold; color: #f3d479;" href="/mypage.do?userNo=${user.userNo }">
                		<b>회원 정보</b>
                	</a>
                </li>
                <li><a href="/reserve.do?userNo=${user.userNo }">예약 확인</a></li>
                <li><a href="/reserveAll.do?reqPage=1&userNo=${user.userNo }">이용 내역</a></li>
                <li><a href="/review.do?reqPage=1&userId=${user.userId }">리뷰 내역</a></li>
                <li><a href="/point.do?userNo=${user.userNo }">포인트 내역</a></li>
            </ul>
        </div>
        <div class="mypage-form">
            <form action="/update.do" method="post">
            <input type="hidden" name="userNo" value="${u.userNo }">
                <table class="mypage-tbl">
                            <tr>
                                <th>아이디</th>
                                <td>${u.userId}</td>
                            </tr>
                            <tr>
                                <th>비밀번호</th>
                                <td style="padding:0;"><input type="password" placeholder="비밀번호를 입력해주세요" name="userPw" value="${u.userPw }"></td>
                            </tr>
                            <tr>
                                <th>이름</th>
                                <td>${u.userName}</td>
                            </tr>
                            <tr>
                                <th>생년월일</th>
                                <td>${u.userBirth }</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td style="padding:0;"><input type="text" placeholder="010-0000-0000" name="userPhone" value="${u.userPhone }"></td>
                            </tr>
                            <tr>
                                <th>주소</th>
                                <td style="padding:0;"><input type="text" name="userAddr" value="${u.userAddr}"></td>
                            </tr>
                            <tr>
                                <th>포인트</th>
                                <td>${u.userPoint}</td>
                            </tr>
                            <tr>
                                <th>가입일</th>
                                <td style="padding-left: 5px;">${u.userDate}</td>
                            </tr>
                </table>
                <br>
               
                <div class="modify-btn">
 					<input type="submit" value="수정">
 					<a href="/delete.do?userNo=${u.userNo }" class="delete-btn">탈퇴</a>	
                </div>
                
            </form>

        </div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>