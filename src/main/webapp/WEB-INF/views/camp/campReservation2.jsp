<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<br>
	<c:forEach items="${campResList }" var="campResList" varStatus="index">
		<input type="hidden" name="calSdate" id="calSdate" value="${campResList.resInDate }">
	</c:forEach>
	<hr>
	<c:forEach items="${campResList }" var="campResList" varStatus="index">
		<input type="hidden" name="calEdate" id="calEdate" value="${campResList.resOutDate }">
	</c:forEach>
	
	<div class="cal_top">
        <a href="#" id="movePrevMonth"><span id="prevMonth" class="cal_tit">&lt;</span></a>
        <span id="cal_top_year"></span>
        <span id="cal_top_month"></span>
        <a href="#" id="moveNextMonth"><span id="nextMonth" class="cal_tit">&gt;</span></a>
    </div>
    <div id="cal_tab" class="cal">
    	��
    </div>
    <div class="page-title2">
    <div class="page-title">
            | Reservation
    </div>
    </div>
    
    <div class="reservationInfo">
   	<!-- ķ���� ���̺� : campInfo
   	ķ���� �� ���̺� : campRoomInfo
   	���� ���̺� : userInfo -->
   	<div class="reser">
   	<h4>ķ���� ����</h4>
    	<table>	
    		<tr>
    			<th>ȸ����</th>
    			<th>${sessionScope.user.userName }</th>
    		</tr>
    		<tr>
    			<th>ķ�����</th>
    			<th>${campInfo.campName }</th>
    		</tr>
    		<tr>
    			<th>���̸�</th>
    			<th>${campRoomInfo.roomName }</th>
    		</tr>
    		<tr>
    			<th>�����ο�</th>
    			<th>${campRoomInfo.roomMember }</th>
    		</tr>
    		<tr>
    			<th>��,��ǽð�</th>
    			<th>15:00 / 11:00(����)</th>
    		</tr> 	
    		<tr>
    			<th>�ݾ�(1�ڱ���)</th>
    			<th id="roomPrice">${campRoomInfo.roomPrice }</th>
    		</tr>	
    	</table> 
    	<hr>
		<h4>���� ����</h4>
		<form action="/camp/campRes.do" method="post" accept-charset="utf-8">  			
			<input type="hidden" name="userNo" value=${sessionScope.user.userNo }> <!-- �α��μ���������� -->			
			<input type="hidden" name="campNo" value=${campInfo.campNo }>
			<input type="hidden" name="campRoomNo" value=${campRoomInfo.roomNo }>
			<table>			
				<tr>
					<th>��¥����</th>
					<th>�Խ� : <input type="date" name="resInDate" id="sdate" min="" required></th>
					<th>��� : <input type="date" name="resOutDate" id="edate" min="" required><span id="dateresult" style="color:red; font-size:9px;"></span></th>
				</tr>
				<tr>
					<th>�ο���</th>
					<th><input type=text size="2" id="resMember" name=resMember value=2>
						<input type=button value="+" id="countPlus" onClick="javascript:this.form.resMember.value++;" style="background-color:#405944; color:#f3d479;">
						<input type=button value="-" id="countMinus"onClick="javascript:this.form.resMember.value--;" style="background-color:#405944; color:#f3d479;">
						<br><span style="font-size:10px;">*�����ο� �ʰ��� 1�δ� 5,000���� �߰������ �߻��մϴ�.</span>
					</th>
				</tr>
				<tr>
					<th>����� ��û����</th>
					<th><input type="text" name="resMemo" placeholder="ex)�Ⱦ���Ź�帳�ϴ�!" value=""></th>
				</tr>				
			</table>
			
		
		<hr>
    	<h4>���� ����</h4>
    	<table>
    		<tr>
    			<th>���� ����Ʈ</th>
    			<th id="userTotalPoint">${sessionScope.user.userPoint }</th>
    		</tr>
    		<tr>
    			<th><input type="text" size="8" id="userUsePoint" name="userUsePoint" value=0></th>
    			<th><input type="button" id="point" value="����Ʈ ����ϱ�" style="background-color:#405944; color:#f3d479;"></th>
    		</tr>
    		<tr>
    			<th>�����ݾ�</th>
    			<th id="price">${campRoomInfo.roomPrice }</th>
    			<th><input type="hidden" id="price2" name="resPrice" value=""></th>
    			<th><input type="hidden" id="constPrice" name="constPrice" value="${campRoomInfo.roomPrice }"></th>   			
    		</tr>    		    		
    		<tr>
    			<th><br><input type="button" id="payment" value="�����ϱ�" style="background-color:#405944; color:#f3d479;">
    			        <input type="button" value="�ڷΰ���" style="background-color:#405944; color:#f3d479;" onclick="history.back(-1);">
    			    <br><p id="paymentResult">*������ ������ �����մϴ�.</p></th>
    			
    		</tr>   		
    	</table>
    	<input type="submit" id="res" value="�����ϱ�" style="display:none; background-color:#405944; color:#f3d479;"> 
    	<input type="hidden" id="payresult" value="0">
    	</form>
   	</div>
    	
    </div>
 <link rel="stylesheet" href="/resources/css/camp/reservation2.css">
<script type="text/javascript">
    
    var today = null;
    var year = null;
    var month = null;
    var firstDay = null;
    var lastDay = null;
    var $tdDay = null;
    var $tdSche = null;
 
    $(document).ready(function() {
        drawCalendar();
        initDate();
        drawDays();
        $("#movePrevMonth").on("click", function(){movePrevMonth();});
        $("#moveNextMonth").on("click", function(){moveNextMonth();});
    });
    
    //calendar �׸���
    function drawCalendar(){	
        var setTableHTML = "";
        setTableHTML+='<table class="calendar">';
        setTableHTML+='<tr><th>SUN</th><th>MON</th><th>TUE</th><th>WED</th><th>THU</th><th>FRI</th><th>SAT</th></tr>';
        for(var i=0;i<6;i++){
            setTableHTML+='<tr height="100">';
            for(var j=0;j<7;j++){
            	//����� room Ķ���� ǥ��
            	if(i==4 && j==5){
            		 setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap; border:1px solid #d9bd6a;">';
                     setTableHTML+='    <div class="cal-day"></div>';
                     setTableHTML+='    <div class="cal-schedule"><span style="color:red;"id="test">����Ϸ�</span></div>';
                     setTableHTML+='</td>';
            	}else{
            		 setTableHTML+='<td style="text-overflow:ellipsis;overflow:hidden;white-space:nowrap; border:1px solid #d9bd6a;">';
                     setTableHTML+='    <div class="cal-day"></div>';
                     setTableHTML+='    <div class="cal-schedule"></div>';
                     setTableHTML+='</td>';
            	}
               
            }
            setTableHTML+='</tr>';
        }
        setTableHTML+='</table>';
        $("#cal_tab").html(setTableHTML);
    }
 
    //��¥ �ʱ�ȭ
    function initDate(){
        $tdDay = $("td div.cal-day")
        $tdSche = $("td div.cal-schedule")
        dayCount = 0;
        today = new Date();
        year = today.getFullYear();
        month = today.getMonth()+1;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
    }
    
    //calendar ��¥ǥ��
    function drawDays(){
        $("#cal_top_year").text(year);
        $("#cal_top_month").text(month);
        
        
        for(var i=firstDay.getDay(); i<firstDay.getDay()+lastDay.getDate(); i++){
        	if(i==3){
        		$tdDay.eq(i).text(++dayCount+"����Ϸ�").css("color","red");
        	}else{
        		$tdDay.eq(i).text(++dayCount);
        	}
            
        }
        for(var i=0;i<42;i+=7){
            $tdDay.eq(i).css("color","red");
        }
        for(var i=6;i<42;i+=7){
            $tdDay.eq(i).css("color","blue");
        }
    }
 
    //calendar �� �̵�
    function movePrevMonth(){
        month--;
        if(month<=0){
            month=12;
            year--;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
        }
    
    function moveNextMonth(){
        month++;
        if(month>12){
            month=1;
            year++;
        }
        if(month<10){
            month=String("0"+month);
        }
        getNewInfo();
    }

    
    function getNewInfo(){
        for(var i=0;i<42;i++){
            $tdDay.eq(i).text("");
        }
        dayCount=0;
        firstDay = new Date(year,month-1,1);
        lastDay = new Date(year,month,0);
        drawDays();
    }
    
    //��¥ ���� ���ñ������� ���� üũ �Ұ�
    $('#sdate').click(function() {            
         var date = new Date(); 
         var yyyy = date.getFullYear(); 
         var mm = date.getMonth()+1>9 ? date.getMonth()+1 : '0' +date.getMonth()+1;
         var dd = date.getDate() > 9 ? date.getDate() : '0' + date.getDate();
         if(mm==1){ mm="01"; }
         var today = yyyy+"-"+mm+"-"+dd;
         $('#sdate').attr('min',today);
      });
      
    $('#edate').click(function() {
    	 var sdate=$('#sdate').val();
         $('#edate').attr('min',sdate); 
      });
    
    //��¥���ÿ� ���� ���� �߰� , ��ǳ�¥�� �Խǳ�¥���� �� ������ ����
    $('#edate').focusout(function() {
		var sdate = $('#sdate').val();
		var edate = $('#edate').val();
    	var splitSdate = sdate.split("-");
		var numberSplitSdate = Number(splitSdate[0]+splitSdate[1]+splitSdate[2]);
		var splitEdate = edate.split("-");
		var numberSplitEdate = Number(splitEdate[0]+splitEdate[1]+splitEdate[2]);
		var dateResult = Number(numberSplitEdate-numberSplitSdate);
		var roomPrice = Number($('#roomPrice').text());
		if(dateResult>0){
			$('#dateresult').html(""); //��¥span����
			$('#userUsePoint').val(""); //����Ʈ �ʱ�ȭ
			$('#resMember').val("2"); //�ο��� �ʱ�ȭ
			$('#price2').val("");
			$('#price').text(roomPrice*dateResult);
		}else{
			$('#dateresult').html("��¥�� Ȯ�����ּ���.");
		}
	});   
    $('#sdate').focusout(function() {
		var sdate = $('#sdate').val();
		var edate = $('#edate').val();
    	var splitSdate = sdate.split("-");
		var numberSplitSdate = Number(splitSdate[0]+splitSdate[1]+splitSdate[2]);
		var splitEdate = edate.split("-");
		var numberSplitEdate = Number(splitEdate[0]+splitEdate[1]+splitEdate[2]);
		var dateResult = numberSplitEdate-numberSplitSdate;
		var roomPrice = Number($('#roomPrice').text());
		if(dateResult>0){
			$('#dateresult').html("");
			console.log(roomPrice*dateResult);
		}else{
			$('#dateresult').html("��¥�� Ȯ�����ּ���.");
		}
	});
    
    //�ο��� +,-
    $('#countPlus').click(function() {
    	var price = Number($('#price').text())+5000; 
    	$('#price').text(price);
    	$('#price2').val(price);
    	var resMember = Number($('#resMember').val());
    	$('#resMember').attr('value',resMember);
    	
    });
    $('#countMinus').click(function() {
    	var price = Number($('#price').text())-5000;
    	$('#price').text(price);
    	$('#price2').val(price);
    	var resMember = Number($('#resMember').val());
    	$('#resMember').attr('value',resMember);
    });
    
    //�����ݾ׿� ����Ʈ ����
    $('#point').click(function name() {
    	var price = Number($('#price').text());
    	var resMember = Number($('#resMember').val());
    	var constPrice2 = price+(5000*(resMember-2));
		var userTotalPoint = Number($('#userTotalPoint').text());
		var userUsePoint = Number($('#userUsePoint').val());
		var price = Number($('#price').text());
		
		if(userUsePoint>constPrice2){
			alert("����Ʈ��� �ݾ��� �����ݾ׺��� Ů�ϴ�.");
			$('#userUsePoint').val(" ");
		}else{
			if(userTotalPoint>=userUsePoint){
				var result = price-userUsePoint;
				$('#price').text(result);
				$('#price2').val(result);
			}else{
				alert("����Ʈ��� �ݾ��� �����ݾ׺��� Ů�ϴ�.");
				$('#userUsePoint').val(" ");
			}
		}
		
	});
    
    //����
    $('#payment').click(function() {  	
		var price = $('#price').text();
		var sdate = $('#sdate').val();
		var edate = $('#edate').val();
		var splitSdate = sdate.split("-");
		var numberSplitSdate = Number(splitSdate[0]+splitSdate[1]+splitSdate[2]);
		var splitEdate = edate.split("-");
		var numberSplitEdate = Number(splitEdate[0]+splitEdate[1]+splitEdate[2]);
		var dateResult = numberSplitEdate-numberSplitSdate;
		
		if(sdate=="" || edate==""){
			$('#dateresult').html("��¥�� �������ּ���.").css("font-size","9px").css("color","red");
		}else{
			$('#dateresult').html("");
			if(dateResult>0){
				$('#dateresult').html("");
				var d = new Date();
				var date = d.getFullYear() +''+(d.getMonth()+1)+''+d.getDate()+''+d.getHours()+''+d.getMinutes()+''+d.getSeconds();
				IMP.init("imp83406565");
				IMP.request_pay({
					merchant_uid : '��ǰ��_'+date,	  //�����ŷ�ID
					name : "�����׽�Ʈ",				  //���� �̸�
					amount : price,              	  //�����ݾ�
					buyer_email : 'next007@nate.com', //������ eamil
					buyer_name : "�������̸�", 			  //������ �̸�
					buyer_tel : "010-1234-5678", 	  //������ ��ȭ��ȣ
					buyer_addr : "����� �������� ��굿", 	  //������ �ּ�
					buyer_postcode : "123-456" 		  //�����ȣ
				},function(rsp){
					if(rsp.success){ //���� ����
						var r3="�����ݾ� : "+rsp.paid_amount;
						$('#paymentResult').html(r3+"<p>�� ������ �Ϸ�Ǿ����ϴ�.<p>");
						var test = $('#payresult').val("1");
						$('#res').css("display","inline");
					}else{ 			 //���� ����
						$('#paymentResult').html("���� ���� ���� : "+rsp.error_msg);
						var test = $('#payresult').val("0");
					}
				})
			}else{
				$('#dateresult').html("��¥�� Ȯ�����ּ���.");
			}
		}
	});
    
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>