<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
.wrapper {
	width: 60%;
	margin: 0 auto;
}

h1 {
	text-align: center;
}

#step {
	height: 200px;
	text-align: center;
}

.join {
	width: 100%;
}

.jointable {
	margin: 0 auto;
	width: 80%;
}

#ceoid, #campaddr, #campaddr2, #campaddr3, #campname, #campsite,
	#camptel {
	width: 300px;
	height: 30px;
}

.theme, .campfac, .campctg {
	border-spacing: 0px;
	border: 1px solid #848484;
	text-align: center;
	width: 700px;
}

.themename>td, .facname>td, .ctgname>td {
	width: 100px;
	border: 1px solid #848484;
	height: 30px;
	background-color: #ccc;
}

.themecheck>td, .faccheck>td, .ctgcheck>td {
	border: 1px solid #848484;
	height: 30px;
}

.button {
	text-align: center;
	width: 1000px;
}

.button>button {
	width: 300px;
	height: 30px;
}

.button {
	margin: 0 auto;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="wrapper">
		<br><br>
		<h1>마이페이지</h1>
		<hr style="border: 2px solid black">
		<div class="join">
			<form action="mypageupdate.do" method="post" class="jointable">
				<table>
					<tr>
						<td style="width: 300px"><label for="ceoId">*아이디</label></td>
						<td><input type="text" id="ceoid" name="ceoId" value="${c.ceoId }" readonly>
						<td><span id="chkId"></span></td>
					</tr>
					<tr>
						<td style="width: 300px"><label for="campaddr">*캠핑장
								주소</label></td>
						<td><input type="text" id="campaddr" name="campaddr" readonly>&nbsp;
							<button type="button" id="addrchk" onclick="execDaumPostcode()"
								style="width: 100px; height: 35px; font-size: 15px;">검색</button></td>
					</tr>
					<tr>
						<td style="width: 300px"><label for="campaddr2"></label></td>
						<td><input type="text" id="campaddr2" name="campaddr2"
							readonly></td>
						<td></td>
					</tr>
					<tr>
						<td style="width: 300px"><label for="campaddr3"></label></td>
						<td><input type="text" id="campaddr3" name="campaddr3"></td>
						<td></td>
					</tr>
					<tr>
						<td style="width: 300px">*캠핑장 이름<label for="campname"></label></td>
						<td><input type="text" id="campname" name="campname" value="${c.campName }"  required></td>
						<td></td>
					</tr>
					<tr>
						<td style="width: 300px">웹사이트<label for="campsite"></label></td>
						<td><input type="text" id="campsite" name="campsite" value="${c.campSite }" ></td>
						<td></td>
					</tr>
					<tr>
						<td style="width: 300px">*전화번호<label for="camptel"></label></td>
						<td><input type="text" id="camptel" name="camptel" value="${c.campTel }" ></td>
						<td></td>
					</tr>
					<tr>
						<td style="width: 300px">*테마선택 (중복선택가능)<label for="camptheme"></label></td>
						<td>
							<table class="theme">
								<tr class="themename">
									<td>산</td>
									<td>바다</td>
									<td>계곡</td>
									<td>강</td>
									<td>저수지</td>
									<td>섬</td>
									<td>유원지</td>
								</tr>
								<tr class="themecheck">
									<td><input type="checkbox" name="themecheck" value="산"></td>
									<td><input type="checkbox" name="themecheck" value="바다"></td>
									<td><input type="checkbox" name="themecheck" value="계곡"></td>
									<td><input type="checkbox" name="themecheck" value="강"></td>
									<td><input type="checkbox" name="themecheck" value="저수지"></td>
									<td><input type="checkbox" name="themecheck" value="섬"></td>
									<td><input type="checkbox" name="themecheck" value="유원지"></td>
								</tr>
							</table> 기타 : <input type="text" style="width: 500px; height: 25px;">
						</td>
					</tr>
					<tr>
						<td style="width: 300px">*시설선택 (중복선택가능)<label for="campfac"></label></td>
						<td>
							<table class="campfac">
								<tr class="facname">
									<td>전기</td>
									<td>샤워실</td>
									<td>수세식</td>
									<td>화로대</td>
									<td>와이파이</td>
									<td>동계가능</td>
									<td>파쇄석</td>
								</tr>
								<tr class="faccheck">
									<td><input type="checkbox" name="faccheck" value="전기"></td>
									<td><input type="checkbox" name="faccheck" value="샤워실"></td>
									<td><input type="checkbox" name="faccheck" value="수세식"></td>
									<td><input type="checkbox" name="faccheck" value="화로대"></td>
									<td><input type="checkbox" name="faccheck" value="와이파이"></td>
									<td><input type="checkbox" name="faccheck" value="동계가능"></td>
									<td><input type="checkbox" name="faccheck" value="파쇄석"></td>
								</tr>
								<tr class="facname">
									<td>파쇄석</td>
									<td>잔디</td>
									<td>온수</td>
									<td>난로대여</td>
									<td>물놀이가능</td>
									<td>애견가능</td>
									<td>매점</td>
								</tr>
								<tr class="faccheck">
									<td><input type="checkbox" name="faccheck" value="파쇄석"></td>
									<td><input type="checkbox" name="faccheck" value="잔디"></td>
									<td><input type="checkbox" name="faccheck" value="온수"></td>
									<td><input type="checkbox" name="faccheck" value="난로대여"></td>
									<td><input type="checkbox" name="faccheck" value="물놀이가능"></td>
									<td><input type="checkbox" name="faccheck" value="애견가능"></td>
									<td><input type="checkbox" name="faccheck" value="매점"></td>
								</tr>
								<tr class="facname">
									<td>썰매장</td>
									<td>방방이</td>
									<td>놀이터</td>
									<td>낚시</td>
								</tr>
								<tr class="faccheck">
									<td><input type="checkbox" name="faccheck" value="썰매장"></td>
									<td><input type="checkbox" name="faccheck" value="방방이"></td>
									<td><input type="checkbox" name="faccheck" value="놀이터"></td>
									<td><input type="checkbox" name="faccheck" value="낚시"></td>
								</tr>
							</table> 기타 : <input type="text" style="width: 500px; height: 25px;"
							name="">
						</td>
					</tr>
					<tr>
						<td style="width: 300px">*카테고리선택 <br>(중복선택가능)<label
							for="campctg"></label></td>
						<td>
							<table class="campctg">
								<tr class="ctgname">
									<td>데크</td>
									<td>카라반</td>
									<td>글램핑</td>
									<td>팬션/민박</td>
								</tr>
								<tr class="ctgcheck">
									<td><input type="checkbox" name="ctgcheck" value="데크"></td>
									<td><input type="checkbox" name="ctgcheck" value="카라반"></td>
									<td><input type="checkbox" name="ctgcheck" value="글램핑"></td>
									<td><input type="checkbox" name="ctgcheck" value="팬션/민박"></td>
								</tr>
							</table> 기타 : <input type="text" style="width: 500px; height: 25px;">
						</td>
					</tr>
				</table>
				<br> <br>
				<div class="button">
					<input type="submit" value="다음페이지로" style="font-size: 18px;">
					<input type="reset" value="취소" style="font-size: 18px;">
				</div>
				<br> <br>
				<input type="hidden" id="theme" name="theme" value="${c.campTheme }">
				<input type="hidden" id="fac" name="fac" value="${c.campFac }">
				<input type="hidden" id="ctg" name="ctg" value="${c.campCtg }">
			</form>
		</div>
	</div>
	<script>
		$( document ).ready(function() {
			$("input[name=themecheck]").each(function(){
				var theme = $("#theme").val().split(",");
				for(var i = 0 ; i < theme.length ;i++){					
					if($(this).val() == theme[i].trim()){
						$(this).attr("checked","checked");
					}
				}
			})
			$("input[name=faccheck]").each(function(){
				var fac = $("#fac").val().split(",");
				for(var i = 0 ; i < fac.length ;i++){					
					if($(this).val() == fac[i].trim()){
						$(this).attr("checked","checked");
					}
				}
			})
			$("input[name=ctgcheck]").each(function(){
				var ctg = $("#ctg").val().split(",");
				for(var i = 0 ; i < ctg.length ;i++){					
					if($(this).val() == ctg[i].trim()){
						$(this).attr("checked","checked");
					}
				}
			})
		});
	
		$("#camptel").focusout(function() {
			var regExp = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;
			if (!regExp.test($("#camptel").val())) {
				alert("전화번호 형식이 일치하지 않습니다.");
			}
		});
		$("input[name=ceoId]").keyup(function() {
			var ceoId = $(this).val();
			$.ajax({
				url : "/checkId.kh",
				data : {ceoId : ceoId},
				success : function(data) {
					if (data == 0) {
						$("#chkId").html("사용가능한 아이디");
					} else {
						$("#chkId").html("이미 사용중인 아이디");
					}
				}
			});
		});
		$("input[type=submit]").click(function() {
			var theme = "";

			$("input[name='themecheck']:checked").each(function(idx) {
				if (idx != 0)
					theme += ",";
				theme += $(this).val();
			});
			console.log(theme);
			$("[name=theme]").val(theme);
			return theme;
		});
		$("input[type=submit]").click(function() {
			var fac = "";

			$("input[name='faccheck']:checked").each(function(idx) {
				if (idx != 0)
					fac += ",";
				fac += $(this).val();
			});
			console.log(fac);
			$("[name=fac]").val(fac);
			return fac;
		});
		$("input[type=submit]").click(function() {
			var ctg = "";

			$("input[name='ctgcheck']:checked").each(function(idx) {
				if (idx != 0)
					ctg += ",";
				ctg += $(this).val();
			});
			console.log(ctg);
			$("[name=ctg]").val(ctg);
			return ctg;
		});
	</script>
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								document.getElementById("campaddr2").value = extraAddr;

							} else {
								document.getElementById("campaddr2").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('campaddr').value = data.zonecode;
							document.getElementById("campaddr2").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							document.getElementById("campaddr3").focus();
						}
					}).open();
		}
		
	</script>
</body>
</html>