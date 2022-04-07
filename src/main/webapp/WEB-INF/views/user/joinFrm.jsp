<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원가입</title>
<!-- 다음 주소찾기 API -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link rel="stylesheet" href="/resources/css/user/joinFrm.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="header-img">
		<div>
			<p>일반회원가입</p>
			<p>캠콕의 다양한 서비스를 편리하게 이용하실 수 있습니다.</p>
		</div>
	</div>
	<div class="join-content">
		<div class="page-title">| SIGN UP</div>
		<div class="join-naeyong">
			<form action="/customerJoin.do" method="post">
				<table class="jointbl">
					<tr>
						<td><label>아이디</label></td>
						<td><input type="text" name="userId"
							placeholder="5~20자의 영문 소문자, 숫자와 특수기호'_','-'만 사용 가능합니다."></td>
					</tr>
					<tr style="display: none;" id="chkId">
						<td></td>
						<td style="padding: 0px; padding-left: 10px; padding-bottom: 5px;"><span
							id="chkIdMsg"></span></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userPw"
							placeholder="8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요."></td>
					</tr>
					<tr style="display: none;" id="chkPw">
						<td></td>
						<td style="padding: 0px; padding-left: 10px; padding-bottom: 5px;"><span
							id="chkPwMsg"></span></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" name="userPwChk"><span>
								<!--8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.-->
						</span></td>
					</tr>
					<tr style="display: none;" id="chkchkPw">
						<td></td>
						<td style="padding: 0px; padding-left: 10px; padding-bottom: 5px;"><span
							id="chkchkPwMsg"></span></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="userName"></td>
					</tr>
					<tr style="display: none;" id="chkName">
						<td></td>
						<td style="padding: 0px; padding-left: 10px; padding-bottom: 5px;"><span
							id="chkNameMsg"></span></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="userPhone"
							placeholder="ex) 010-0000-0000"></td>
					</tr>
					<tr style="display: none;" id="chkPhone">
						<td></td>
						<td style="padding: 0px; padding-left: 10px; padding-bottom: 5px;"><span
							id="chkPhoneMsg"></span></td>
					</tr>
					<tr style="display: none">
						<td>회원레벨</td>
						<td><input type="text" name="userLevel" value="1"></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="text" name="userBirth"
							placeholder="ex) 1994-12-08"></td>

						<!-- 
                        <td>
                            <select>
                                <option selected>년도</option>
                                <option>1921</option>
                                <option>1922</option>
                                <option>1923</option>
                                <option>1924</option>
                                <option>1925</option>
                                <option>1926</option>
                                <option>1927</option>
                                <option>1928</option>
                                <option>1929</option>
                                <option>1930</option>
                                <option>1931</option>
                                <option>1932</option>
                                <option>1933</option>
                                <option>1934</option>
                                <option>1935</option>
                                <option>1936</option>
                                <option>1937</option>
                                <option>1938</option>
                                <option>1939</option>
                                <option>1940</option>
                                <option>1941</option>
                                <option>1942</option>
                                <option>1943</option>
                                <option>1944</option>
                                <option>1945</option>
                                <option>1946</option>
                                <option>1947</option>
                                <option>1948</option>
                                <option>1949</option>
                                <option>1950</option>
                                <option>1951</option>
                                <option>1952</option>
                                <option>1953</option>
                                <option>1954</option>
                                <option>1955</option>
                                <option>1956</option>
                                <option>1957</option>
                                <option>1958</option>
                                <option>1959</option>
                                <option>1960</option>
                                <option>1961</option>
                                <option>1962</option>
                                <option>1963</option>
                                <option>1964</option>
                                <option>1965</option>
                                <option>1966</option>
                                <option>1967</option>
                                <option>1968</option>
                                <option>1969</option>
                                <option>1970</option>
                                <option>1971</option>
                                <option>1972</option>
                                <option>1973</option>
                                <option>1974</option>
                                <option>1975</option>
                                <option>1976</option>
                                <option>1977</option>
                                <option>1978</option>
                                <option>1979</option>
                                <option>1980</option>
                                <option>1981</option>
                                <option>1982</option>
                                <option>1983</option>
                                <option>1984</option>
                                <option>1985</option>
                                <option>1986</option>
                                <option>1987</option>
                                <option>1988</option>
                                <option>1989</option>
                                <option>1990</option>
                                <option>1991</option>
                                <option>1992</option>
                                <option>1993</option>
                                <option>1994</option>
                                <option>1995</option>
                                <option>1996</option>
                                <option>1997</option>
                                <option>1998</option>
                                <option>1999</option>
                                <option>2000</option>
                                <option>2001</option>
                                <option>2002</option>
                                <option>2003</option>
                                <option>2004</option>
                                <option>2005</option>
                                <option>2006</option>
                                <option>2007</option>
                            </select>
                            <select>
                                <option selected>월</option>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                            </select>
                            <select>
                                <option selected>일</option>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                                <option>04</option>
                                <option>05</option>
                                <option>06</option>
                                <option>07</option>
                                <option>08</option>
                                <option>09</option>
                                <option>10</option>
                                <option>11</option>
                                <option>12</option>
                                <option>13</option>
                                <option>14</option>
                                <option>15</option>
                                <option>16</option>
                                <option>17</option>
                                <option>18</option>
                                <option>19</option>
                                <option>20</option>
                                <option>21</option>
                                <option>22</option>
                                <option>23</option>
                                <option>24</option>
                                <option>25</option>
                                <option>26</option>
                                <option>27</option>
                                <option>28</option>
                                <option>29</option>
                                <option>30</option>
                                <option>31</option>
                            </select>
                        </td>
                         -->
					</tr>
					<tr style="display: none;" id="chkBirth">
						<td></td>
						<td style="padding: 0px; padding-left: 10px; padding-bottom: 5px;"><span
							id="chkBirthMsg"></span></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><input type="radio" class="gender-radio"
							name="userGender" value="남" id="m"><label for="m">남자</label>
							<input type="radio" class="gender-radio" name="userGender"
							value="여" id="f"><label for="f">여자</label></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input id="postCode" style="width: 150px;" type="text"
							placeholder="우편번호" readonly>
							<button id="addrSearchBtn" type="button" onclick="addrSearch();"
								class="joinfrm-btn">주소검색</button></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="text" id="roadAddr" placeholder="도로명주소"
							readonly></td>
					</tr>
					<tr>
						<td></td>
						<td><input id="detailAddr" placeholder="상세주소"> <input
							type="hidden" name="userAddr" id="userAddr"></td>
					</tr>
					<tr style="display: none;" id="chkAddr">
						<td></td>
						<td style="padding: 0px; padding-left: 10px; padding-bottom: 5px;"><span
							id="chkAddrMsg"></span></td>
					</tr>
				</table>

				<div>
					<p>
						<input type="checkbox" class="chk" id="chk_all"> <label for="chk_all"><b> 약관전체동의</b></label>
					</p>
					<p>
						<input type="checkbox" class="chk" name="chk" id="chk1"> <label for="chk1">이용약관에 동의합니다. (필수)</label>
					</p>
					<p>
						<input type="checkbox" class="chk" name="chk" id="chk2"> <label for="chk2">개인정보 처리방침에 동의합니다. (필수)</label>
					</p>
				</div>

				<button type="submit">가입하기</button>
			</form>
		</div>
	</div>

	<script>
		
		// 주소 API
		function addrSearch() {
	    	  new daum.Postcode({
	    		 oncomplete : function(data) {
	    			 //검색해서 선택한 결과가 data라는 매개변수를 통해서 들어옴
	    			 //다양한 값이 들어오지만 그 중 3개의 값만 사용
	    			 //1)우편번호    2)도로명주소    3)지번주소
	    			 $("#postCode").val(data.zonecode); //우편번호
	    			 $("#roadAddr").val(data.roadAddress); //도로명주소
	    			 $("#detailAddr").focus(); //상세주소로 포커스 이동
	    		 } 
	    	  }).open();
	      }
    	
		

		// 정규표현식
        $(document).ready(function() {
            // 배열로 처리
            var check = [false, false, false, false, false, false, false];
            // 포커스인아웃을 사용하면 불필요할때도 값을 검사하지만 체인지는 값이 바뀔때만 검사함 
    	
             $('[name=userId]').change(function() {
            	 $("#chkId").css('display','none');
 				 $("#chkIdMsg").html("");
            	 
            	 /* 아이디 중복체크 */
            	var userId = $(this).val();
            	 
                var reg = /^[a-z][a-z0-9_-]{4,19}$/;
                if (reg.test($(this).val())) {
                	$.ajax({
         				url : "/checkId.do",
         				data : {userId:userId},
         				success : function(data){
         					if(userId != "" && data == 0){
         						$("#chkId").css('display','');
         						$("#chkIdMsg").html("멋진 아이디네요!");
         						$("#chkIdMsg").css('color','#405944');
         						$(this).css('border','1px solid #405944');
         					}else if(userId == ""){
         	                    $("#chkId").css('display','');
         						$("#chkIdMsg").html("아이디를 입력해주세요.");
         						$("#chkIdMsg").css('color','#BF372B');
         						$(this).css('border','1px solid #BF372B');
         	                } else if(userId != "" && data == 1){
         						$("#chkId").css('display','');
         						$("#chkIdMsg").html("이미 사용중인 아이디 입니다.");
         						$("#chkIdMsg").css('color','#BF372B');
         						$(this).css('border','1px solid #BF372B');
         					}
         				} 
         			});
                    check[0] = true;
                } else {
                    check[0] = false;
                    $("#chkId").css('display','');
					$("#chkIdMsg").html("5~20자의 영문 소문자, 숫자와 특수기호'_','-'만 사용 가능합니다.");
					$("#chkIdMsg").css('color','#BF372B');
					$(this).css('border','1px solid #BF372B');
                }
            }); 
            
            $('[name=userName]').change(function() {
                $(this).prevAll().last().children().html("");
                var reg = /^[가-힣]{2,4}$/;
                if (reg.test($(this).val())) {
                    check[1] = true;
                    $("#chkName").css('display','none');
                } else {
                    check[1] = false;
                    $("#chkName").css('display','');
					$("#chkNameMsg").html("한글 2~4글자만 사용 가능합니다.");
                }
            });
            
            $('[name=userPw]').change(function() {
                $(this).prevAll().last().children().html("");
                var reg = /^[A-Za-z0-9_-]{6,18}$/;
                if (reg.test($(this).val())) {
                    check[2] = true;
                    $("#chkPw").css('display','none');
                } else {
                    check[2] = false;
                    $("#chkPw").css('display','');
					$("#chkPwMsg").html("영문대소문자+숫자 6~18자리만 사용 가능합니다.");
                }
            });
            
            $('[name=userPwChk]').change(function() {
                $(this).prevAll().last().children().html("");
                console.log($('[name=userPw]').val());
                if ($(this).val() == $("[name=userPw]").val()) {
                    check[3] = true;
                    $("#chkchkPw").css('display','none');
                } else {
                    check[3] = false;
                    $("#chkchkPw").css('display','');
					$("#chkchkPwMsg").html("비밀번호가 일치하지 않습니다.");
                }
            });
            
    		$("#chk_all").click(function(){
    			var ra = $( '#roadAddr' ).val();
    			var da = $( '#detailAddr' ).val();
    			const str = ra +' '+ da;
    			$("#userAddr").val(str);
    			if ($("#userAddr").val() != null) {
                    check[4] = true;
                    $("#chkAddr").css('display','none');
                } else {
                    check[4] = false;
                    $("#chkAddr").css('display','');
					$("#chkAddrMsg").html("주소를 입력해 주세요.");
                }
    		});
            
            $('[name=userPhone]').change(function() {
                $(this).prevAll().last().children().html("");
                var reg = /^\d{2,3}-\d{3,4}-\d{4}$/;
                if (reg.test($(this).val())) {
                    check[5] = true;
                    $("#chkPhone").css('display','none');
                } else {
                    check[5] = false;
                    $("#chkPhone").css('display','');
					$("#chkPhoneMsg").html("입력형식'010-0000-0000'에 맞춰 입력해주세요.");
                }
            });
            
            $('[name=userBirth]').change(function() {
                $(this).prevAll().last().children().html("");
                var reg = /^\d{3,4}-\d{1,2}-\d{2}$/;
                if (reg.test($(this).val())) {
                    check[6] = true;
                    $("#chkBirth").css('display','none');
                } else {
                    check[6] = false;
                    $("#chkBirth").css('display','');
					$("#chkBirthMsg").html("입력형식'1900-00-00'에 맞춰 입력해주세요.");
                }
            });
            
            /*$('[name=userGender]').change(function() {
                if (($(this).val())!=null) {
                    check[7] = true;
                    $("#chkGender").css('display','none');
                } else {
                    check[7] = false;
                    $("#chkGender").css('display','');
					$("#chkGenderMsg").html("성별을 체크해 주세요");
                }
            });*/
            
            console.log($('[name=userGender]'));
            
            $('form').submit(function() {
                console.log(check);
                var count = 0;
                for (var i = 0; i < check.length; i++) {
                    if (check[i] == true) {
                        count++;
                    }
                }
                if (count < 7) {
                	alert('입력값을 확인 해 주세요');
                	event.preventDefault();
                    //return false;
                }
            });
            
         	// 전체 갯수
            $("input:checkbox[name=is_check]").length
             
            // 선택된 갯수
            $("input:checkbox[name=is_check]:checked").length
             
            // 전체 체크
            $("input[name=mycheck]:checkbox").prop("checked", true);
             
            // 전체 체크 순회
            $("input:checkbox[name=is_check]").each(function() {
             this.checked = true;
            });
             
            // 체크여부 확인
            if($("input:checkbox[name=complete_yn]").is(":checked") == true) {
              //작업
            }
            
        });
    	
	</script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>