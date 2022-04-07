<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <style>
       .content {
            background-color: #5a7356;
            margin: 0 auto;
            border-radius: 10px;
            width: 1200px;
            height: 800px;
        }
        .chat-main{
            width: 100%;
            height: 100%;
            
        }
        .chat-main>div:first-child{
            height: 10%;
        }
        .chat-main>div:first-child>h2{
            line-height: 50px;
            margin: 0;
            margin-left: 10px;
            color: #eba13d;
        }
        .chat-main>div:first-child>p{
            line-height: 10px;
            margin: 0;
            font-size: 11px;
            margin-left: 10px;
            color: #f3d479;
            font-weight: lighter;
        }
        .chat-list{
            width: 30%;
            height: 90%;
            background-color: white;
            float: left;
        }
        .chat-content{
            width: 70%;
            height: 90%;
            background-color: #f2f2f2;
            float: right;
        }
        .chat-search{
            height: 50px;
            margin: 0 auto;
            text-align: center;
            line-height: 50px;
        }
         .chat-search>input[type=text]{
            width: 80%;
            height: 40px;
            border: none;
            background-color: white;
            border-radius: 5px;
             vertical-align:middle;
        } 
        .chat-search>input[type=submit]{
            background: url(/search.png);
            background-repeat: no-repeat;
            background-position:center;
            border: none;
            width: 15%;
            height: 40px;
            vertical-align:middle;
        }
        .chat-search>input:focus{
            outline: none;
        }
        .chat-info-list{
            height: 670px;
            overflow:auto;
        }
        
        .chat-info{
            width: 100%;
            height: 50px;
            border-bottom: 1px solid #f2f2f2;
            margin: 0 auto;
        }
        .chat-info:first-child{
            border-top: 1px solid #f2f2f2;
            border-bottom: 1px solid #f2f2f2;
        }
        .chat-info img{
            float: left;
            margin-right: 3px;
        }
        p{
            margin: 0;
            font-weight: bold;
            margin-top: 2px;
        }

        .chatMsg{
			width:100%;
			height:85%;
			border : none;
			background-color: #8a8d40;
			display:flex;
			flex-direction: column;
			overflow:scroll;
            overflow-x: hidden;
		}
          .chatMsg::-webkit-scrollbar {
            width: 10px;
          }
          .chatMsg::-webkit-scrollbar-thumb {
            background-color: #2f3542;
          }
          .chatMsg::-webkit-scrollbar-track {
            background-color: grey;
          }

        .chat-content>textarea{
            width: 90%;
            height: 13.5%;
            border: none;
            background-color: gainsboro;
            border-radius: 5px;
            resize: none;
            vertical-align: middle;
            font-size: 17px;
            padding: 5px;
        }
        .chat-content>input[type=button]{
            width: 8%;
            height: 6%;
            border: none;
            background-color: #f3d479;
            border-radius: 5px;
            font-size: 15px;
            vertical-align: middle;
        }
        .chat-content>textarea:focus{
            outline: none;
        }
        .chat-content>input:focus{
            outline: none;
        }
        .chatMsg>p{
			padding: 8px;
			border-radius: 5px;
		}
		.others{
			background-color: #fff;
			max-width:300px;
			align-self: flex-start;
		}
		.me{
			background-color: #ffeb33;
			max-width:300px;
			align-self:flex-end;
		}
    </style>
</head>

<body>
   <div class="content">
       
    <div class="chat-main">
       <div><h2>1:1 채팅 페이지</h2><p>캠핑장과의 1:1 문의사항</p></div>
        <div class="chat-list">
           <div class="chat-search">
               <input type="text" placeholder="검색">
               <input type="submit" value="">
           </div>
           <div class="chat-info-list">
            <div class="chat-info">
               <div><img src="/%EA%B7%B8%EB%A6%BC8.png" width="50px;"><p>채팅상대명</p><span>채팅내용ㅇㅇㅇㅇㅇ</span></div>
            </div>
            <div class="chat-info">
               <div><img src="/%EA%B7%B8%EB%A6%BC8.png" width="50px;"><p>채팅상대명</p><span>채팅내용ㅇㅇㅇㅇㅇ</span></div>
            </div>
            </div>
        </div>
        <div class="chat-content">
            <div class="chatMsg" id="chatMsg"></div>
            <textarea id="sendMsg" autofocus></textarea>
            <!-- <input type="button" value="전송"> -->
            <button class="chatSend" id="sendBtn" onclick="sendMsg('${sessionScope.user.userId }');">보내기</button>
        </div>
    </div>
    
    </div>
    	<script>
		var ws;
		window.onload = function () {
			ws = new WebSocket("ws://localhost/allChat.do");
			ws.onopen = onOpen;			//웹소켓 연결 성공시 진행할 함수
			ws.onmessage = onMessage;	//서버에서 메세지가 왔을 때 수행할 함수
			ws.onclose = onClose;		//웹소켓 연결이 끊어졌을 때 동작할 함수
		}
		function onOpen(){
			console.log("서버 접속 완료");
			var msg = {
					type:"register",
					data:"${sessionScope.user.userId }"
			}
			ws.send(JSON.stringify(msg)); //스트링으로 전환해서 웹소켓에 전달
		}
		function onMessage(e){
			$(".chatMsg").append(e.data);
		}
		function onClose() {
			console.log("서버 접속 종료");
		}
		function sendMsg(memberId){
			var sendMsg = $("#sendMsg").val();
			if(sendMsg != ''){
				var sendData = "<p class='others'>"+memberId+" : "+sendMsg+"</p>";
				var msg = {
						type : "chat",
						data : sendData
				}
				ws.send(JSON.stringify(msg));
				$(".chatMsg").append("<p class='me'>"+sendMsg+"</p>");
				$("#sendMsg").val('');
			}
		}
	</script>
	<script>
    document.getElementById('sendMsg').addEventListener('keydown', function(event) {
        if (event.keyCode == 13) {
            event.preventDefault();
            document.getElementById('sendBtn').click();
        }
    });
    document.querySelector('.chatSend').addEventListener('click', function() {
    	sendMsg('${sessionScope.user.userId }');
    });
</script>
	<script>
	$(".chatMsg").scrollTop($(".chatMsg")[0].scrollHeight);
	
	</script>
</body>
</html>