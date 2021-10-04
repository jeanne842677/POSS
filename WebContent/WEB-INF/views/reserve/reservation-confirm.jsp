<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>예약 확인페이지</title>
<link href="/resources/css/all.css" rel="stylesheet">
<link href="/resources/css/reset.css" type="text/css" rel="stylesheet">
<link href="/resources/css/reserve/reservation-confirm.css" rel="stylesheet">
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script defer type="text/javascript" src="/resources/js/reserve/reservation-confirm.js"></script>
<style type="text/css">
@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

body{
	font-family:nanumr;
}

.table th {
    text-align: center;
    position: sticky;
    top: 0px;
    background-color: #aaa;
    color: #fff;
    z-index: 10;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
<div class="wrap">
	<div class="wrap_res">
	<!-- 네비게이션 바 -->
	<div class="nav">
        <div onclick="location.href='/reserve/${userId}/reservation-form'">예약하기</div>
        <div class="now" onclick="location.href='/reserve/${userId}/reservation-lookup'">예약확인</div>
        <div onclick="location.href='/board/${userId}/notice'">게시판</div>
	</div>
	
	<div class="content">
		<div id="title">예약 내역</div>
		<hr style="border:6px color= rgb(97, 191, 173);">
		<div class="info_wrap">
			<c:if test="${not empty reserve}">
				<div class='info'>
					<div id="name">예약자 : <c:out value="${reserve.name}"/></div>
					<div id="phone">연락처 : <c:out value="${reserve.phone}"/></div>
					<div id="cnt">인 원 : <c:out value="${reserve.num}"/>인</div>
					<div id="table">예약날짜 : <c:out value="${reserve.reDate}"/></div>
					<div id="table">예약시간 : <c:out value="${reserve.reTime}"/></div>
				</div>
			</c:if>
			<c:if test="${not empty selectReserve}">
				<div class='info'>
					<div id="name">예약자 : <c:out value="${selectReserve.name}"/></div>
					<div id="phone">연락처 : <c:out value="${selectReserve.phone}"/></div>
					<div id="cnt">인 원 : <c:out value="${selectReserve.num}"/>인</div>
					<div id="table">예약날짜 : <c:out value="${selectReserve.reDate}"/></div>
					<div id="table">예약시간 : <c:out value="${selectReserve.reTime}"/></div>
				</div>	
			</c:if>
		</div>
	</div>
	
	<div class="btn_wrap">
		<div class="foot_wrap">
			<c:if test="${not empty reserve}">
				<button type="button" class="btn btn-secondary" id="cancel" onclick="cancel(${reserve.reserveIdx},'${userId}')">예약취소</button>
			</c:if>
			<c:if test="${not empty selectReserve}">
				<button type="button" class="btn btn-secondary" id="cancel" onclick="cancel(${selectReserve.reserveIdx},'${userId}')">예약취소</button>
			</c:if>
			<c:if test="${empty reserve and empty selectReserve}">
				<button type="button" class="btn btn-secondary" id="cancel" disabled>예약취소</button>
			</c:if>
			<button type="button" class="btn btn-primary" id="confirm" onclick="location.href='/reserve/${userId}/reservation-lookup'">확인</button>
		</div>
	</div>
</div>
</div>
	





</body>
</html>