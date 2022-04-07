<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body{
            width: 60%;
            margin: 0 auto;
        }
        h1{
            text-align: center;
        }
        #step{
            height: 200px;
            text-align: center;
        }
        .button{
            text-align: center;
            width: 1000px;
        }
        .button>button{
            width: 300px;
            height: 30px;
        }
        .button{
            margin: 0 auto;
        }
    </style>
</head>
<body>
<h1>등록신청완료</h1>
    <div id="step"><img src="step3.png"></div>
    <hr style="border:2px solid black">
    <div style="text-align: center; background-color: #ccc; display: flex; justify-content: center; align-items: center; height: 500px;">
        <div style="width: 800px; height: 300px; background-color: white;">
            <p style="font-size: 30px; font-weight: bold;">000님의 등록신청이 완료되었습니다.</p>
            <p style="font-size: 20px;">관리자의 검토 후 캠핑장 등록이 완료 될 예정입니다.</p>
            <p style="font-size: 20px;">승인까지 약 2시간 정도 소요되며 이 후 서비스 이용이 가능합니다. 감사합니다.</p>
            <br><br>
            <button type="button" style="text-align: center; width: 300px; height: 30px; font-size: 18px;" onclick="location.href='/'">메인으로</button>
        </div>
    </div>
</body>
</html>