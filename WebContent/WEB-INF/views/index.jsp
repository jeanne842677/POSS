<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<link rel="stylesheet"
	href="https://bootswatch.com/5/minty/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/all.css">
<script type="text/javascript" src="resources/js/clock.js"></script>
<script type="text/javascript" src="resources/js/weather.js"></script>
<link rel="stylesheet" href="/resources/css/index.css">
<script defer type="text/javascript" src="/resources/js/index.js"></script>
<style type="text/css">
@font-face{
	font-family:'nanuml';
	src:url(/resources/font/NanumSquareRoundOTFL.otf) format('truetype');
}

body{
	font-family:nanuml;
}
</style>

<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body onload="renderCurrentTime()">
	<div class="wrap">
		<header id="header">
			<nav class="navbar">
				<div class="nav_group">
					<div class="logo">
						<img src="/resources/image/LOGO2.png" class="logo">
					</div>
					<c:if test="${not empty authentication}">
						<div class="hello" id="shrink">안녕하세요</div>
						<div class="user_name" id="shrink">${authentication.name}</div>
						<div class="nim" id="shrink">님!</div>

						<div class="my_info" id="shrink">
							<button type="button" class="btn btn-secondary" id="info_button"
								onclick="location.href='/member/mypage?userId=${authentication.userId}'">
								> 내정보</button>
						</div>
					</c:if>
					<c:if test="${empty authentication}">
						<div class="hello" id="shrink">로그인 후 이용해주세요.</div>

						<div class="my_info" id="shrink">
							<button type="button" class="btn btn-secondary" id="info_button"
								onclick="location.href='/member/login-form'">> 로그인</button>
						</div>
					</c:if>
					<div class="clock" id="shrink"></div>
					<c:if test="${not empty authentication}">
						<div class="logout" id="shrink">
							<button type="button" class="btn btn-secondary" id="logout"
								onclick="showConfirmLogout();">
								<div id="logout_btn" id="logout">
									<i class="fas fa-power-off"></i>
								</div>
							</button>
						</div>
					</c:if>
				</div>
			</nav>
		</header>


		<div class="main_menu_wrap">

			<div class="column_0">
				<button type="button" class="btn btn-secondary" id="pos_btn"
					onclick="location.href='/seat/select'">
					<div id="dalar">$</div>
					<div id="pos_text">포스</div>
				</button>
			</div>

			<div class="column_1">
				<button type="button" class="btn btn-primary" id="sales_manage_btn"
					onclick="location.href='/sales/confirm'">
					<div id="store_icon">
						<i class="fas fa-cash-register"></i>
					</div>
					<div id="sales_manage_text">매출관리</div>
				</button>

				<button type="button" class="btn btn-light" id="notiboard_btn"
					onclick="location.href='/board/${authentication.userId}/notice'">
					<div id="board_icon">
						<i class="far fa-comments"></i>
					</div>
					<div id="notiboard_text">게시판</div>
				</button>
			</div>

			<div class="column_2">
				<button type="button" class="btn btn-light" id="waiting_btn"
					onclick="location.href='/waiting/waiting-page'">
					<div id="waiting_icon">
						<i class="fas fa-history"></i>
					</div>
					<div id="waiting_text">웨이팅</div>
				</button>

				<button type="button" class="btn btn-info" id="waitinglookup_btn"
					onclick="location.href='/waiting/waiting-confirm'">
					<div id="waitinglookup_icon">
						<i class="fas fa-user-clock"></i>
					</div>
					<div id="waiting_text">웨이팅 내역</div>
				</button>

				<button type="button" class="btn btn-warning"
					id="reservation_manage_btn"
					onclick="location.href='/reserve/${authentication.userId}/reservation-form'">
					<div id="reservation_manage_icon">
						<i class="fas fa-address-book"></i>
					</div>
					<div id="reservation_manage_text">예약</div>
				</button>
				
			</div>

			<div class="column_3">
				<c:if test="${not empty authentication}">
					<button type="button" class="btn btn-outline-primary"
						id="today_reservation_btn"
						onclick="location.href='/reserve/${authentication.userId}/confirm'">
						<div id="trt">오늘의 예약은</div>
						<div id="today_reservation_text">
							<div id="trt_total">총</div>
							<div id="trt_num">${reservationNum}</div>
							<div id="trt_cnt">건 입니다.</div>
						</div>
					</button>
				</c:if>
				<div class="today_weather_btn">
					<div class='location'></div>
					<div class='weather_temp'></div>
					<div class="weather_wrap">
						<div class="weather_statu"></div>
						<div class="weather_icon"></div>
					</div>
				</div>

			</div>

		</div>

	</div>

<%@ include file="/WEB-INF/views/include/modal.jsp"%>




</body>
</html>