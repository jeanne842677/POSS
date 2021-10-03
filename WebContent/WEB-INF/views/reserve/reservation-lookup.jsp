<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>예약 조회페이지</title>
<link href="/resources/css/all.css" rel="stylesheet">
<link href="/resources/css/reserve/reservation-lookup.css" rel="stylesheet">
<link href="/resources/css/reset.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	
	
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
<form class="wrap" action="/reserve/${userId}/reservation-search" method="post" id="frm_lookup">
	<div class="wrap_res">
		<!-- 네비게이션 바 -->
		<div class="nav">
	        <div onclick="location.href='/reserve/${userId}/reservation-form'">예약하기</div>
	        <div class="now" onclick="location.href='/reserve/${userId}/reservation-lookup'">예약확인</div>
	        <div onclick="location.href='/board/${userId}/notice'">게시판</div>
		</div>
		
		<div class="content">
			<div id="title">예약 조회</div>
			<hr style="border:6px color= rgb(97, 191, 173);">
			<div class='info'>
				<div id="name">예약자 :&nbsp&nbsp&nbsp<input type="text" class='input' class="form-control" name="name" placeholder="예약자명을 입력해주세요"></div>
				<div id="name">연락처 :&nbsp&nbsp&nbsp<input type="tel" class='input' class="form-control" name="phone" placeholder="연락처를 입력해주세요"></div>
			</div>
		</div>
		
		<div class="foot_wrap">
			<div class="btn_wrap">
				<button type="button" class="btn btn-primary" id="cancel" onclick="location.href='/reserve/${userId}/reservation-form'">예약하기</button>
				<button type="submit" class="btn btn-secondary" id="search">조회</button>
			</div>
		</div>
	</div>
</form>
	





<script type="text/javascript">

</script>
</body>
</html>