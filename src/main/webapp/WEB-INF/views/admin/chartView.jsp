<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chart Page</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>

<body>
	<div class="wrap">
		<div class="header-wrap">
			<jsp:include page="/WEB-INF/views/admin/commons/adminHeader.jsp" />
		</div>

		<div class="content-wrap">
			<!-- Navi -->
			<div class="content-navi">
				<jsp:include page="/WEB-INF/views/admin/commons/adminNavi.jsp" />
			</div>

			<!-- Main -->
			<div class="content-main">
				<ul class="todo">
					<li style="background-color: #f3d479; color: #bf372b;"><strong>작업 리스트</strong></li>
					<li><a href="/selectTempCampInfoList.do?reqPage=1">신규등록 신청 관리 <span class="count">${tempCampCount }</span></a></li>
				</ul>
				<div class="content-list">
					<div id="chart-visitor" style="width: 97.5%">
						<h3>주간 방문자 수</h3>
						<div id="visit" style="margin-top: 10px;"></div>
					</div>
					<div id="chart-gender">
						<h3>회원 성별 비율</h3>
						<div id="gender" style="width: 100%; height: 350px;"></div>
					</div>
					<div id="chart-user">
						<h3>회원 분류</h3>
						<div id="userInfo" style="width: 100%; height: 350px;"></div>
					</div>
					<div id="chart-reservation">
						<h3>캠피장 예약별 인원 통계</h3>
						<div id="reservation" style="width: 100%; height: 350px;"></div>
					</div>
					<div id="chart-review">
						<h3>리뷰 별점 통계</h3>
						<div id="review" style="width: 100%; height: 350px;"></div>
					</div>
				</div>
			</div>

			<!-- Profile -->
			<div class="content-profile">
				<ul class="profile-wrap">
					<li><img alt="Admin Photo" src="/resources/img/admin/main_img4.jpg"></li>
					<li class="profile">
						<table id="profile">
							<tr>
								<th>아이디</th>
								<td>
									<input type="text" name="userId" value="${sessionScope.user.userId }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<input type="text" name="userName" value="${sessionScope.user.userName }" readonly="readonly">
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>
									<input type="text" name="phone" value="${sessionScope.user.userPhone }" readonly="readonly">
								</td>
							</tr>
						</table>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<link rel="stylesheet" href="/resources/css/admin/adminDesignCommon.css">
	<link rel="stylesheet" href="/resources/css/admin/admin.css">

	<style>
h3 {
	color: #fff;
}
</style>

	<script type="text/javascript">
	/* ********** Visit Chart ********** */
    google.charts.load('current', {'packages':['line']});
    google.charts.setOnLoadCallback(visitor);

	  function visitor() {
	
	    var data = new google.visualization.DataTable();
	    data.addColumn('number', 'Day');
	    data.addColumn('number', 'Visitor');
	
	    data.addRows([
	      ${visitUserRatio}
	    ]);
	
	    var options = {
	      chart: {
	      },
	      width: 760.5,
	      height: 350,
	      axes: {
	        x: {
	          0: {side: 'top'}
	        }
	      }
	    };
	
	    var chart = new google.charts.Line(document.getElementById('visit'));
	
	    chart.draw(data, google.charts.Line.convertOptions(options));
	  }
		/* ********** Gender Chart ********** */
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(userGender);
		google.charts.setOnLoadCallback(reservationMember);
		google.charts.setOnLoadCallback(reviewScore);
		
		function userGender() {
			var data = google.visualization.arrayToDataTable([
					[ 'UserRatio', 'Number' ], ${genderRatio} ]);

			var options = {
				title : 'User Gender Ratio',
				pieHole : 0.3,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('gender'));
			chart.draw(data, options);
		}
		
		/* ********** User Chart ********** */
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(userGender);
		google.charts.setOnLoadCallback(userInfo);
		google.charts.setOnLoadCallback(reservationMember);
		google.charts.setOnLoadCallback(reviewScore);
		
		function userInfo() {
			var data = google.visualization.arrayToDataTable([
					[ 'UserInfoRatio', 'Number' ], ${userInfoRatio} ]);

			var options = {
				title : 'User Info Ratio',
				pieHole : 0.3,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('userInfo'));
			chart.draw(data, options);
		}
		
		/* ********** Reservation Chart ********** */
		function reservationMember() {
			var data = google.visualization.arrayToDataTable([
					[ 'Reservation Member', 'Number' ], ${resMemberRatio} ]);

			var options = {
				title : 'Reservation Member',
				pieHole : 0.3,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('reservation'));
			chart.draw(data, options);
		}
		
		/* ********** Review Chart ********** */
		function reviewScore() {
			var data = google.visualization.arrayToDataTable([
					[ 'Review', 'Score' ], ${reviewScoreRatio} ]);

			var options = {
				title : 'Review Score',
				pieHole : 0.3,
			};

			var chart = new google.visualization.PieChart(document
					.getElementById('review'));
			chart.draw(data, options);
		}
	</script>
</body>
</html>