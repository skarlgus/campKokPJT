<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .wrapper{
            width: 60%;
            margin: 0 auto;
        }
        h1{
            text-align: center;
        }
        h2{
        	text-align : center;
        }
        #step{
            height: 200px;
            text-align: center;
        }
        .join{
            width: 100%;
        }
        .jointable{
            margin: 0 auto;
            width: 80%;
        }
        .campimage,.rentimage,.campenvimage{
        	width : 100px;
            height: 100px;
            background-color: #ccc;
            border: 1px solid #848484;
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
<br><br>
<div class="wrapper">
<h1>캠핑장 등록</h1>
    <div id="step"><img src="/resources/img/camp/step3.png"></div>
    <hr style="border:2px solid black">
    <div class="join">
        <form action="campjoin5.do" method="post" class="jointable" enctype="multipart/form-data">
        <input type="hidden" id="campNo" name="campNo" value="${campNo }" />
        	<br>
            <h2>대표이미지 등록</h2>
            <br>
            <table>
            	<tr>
                    <td style="width: 200px" name="campimg">대표이미지</td>
                    <td>
                        <table>
                            <tr>
                                <td class="campimage">대표 이미지</td>
                            </tr>
                            <tr>
                                <td><input type="file" name="campimage" accept="image/*" onchange="setThumbnail(event);" multiple></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br><br>
            <div class="button">
                    <button type="submit" style="font-size: 18px;">다음페이지</button>
                    <button type="reset" style="font-size: 18px;">취소</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>