<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>예약 페이지</title>
<link href="/resources/css/reserve/reservation-form.css?ver=1"  rel="stylesheet">
<link href="/resources/css/all.css" rel="stylesheet">
<link href="/resources/css/reset.css" type="text/css" rel="stylesheet">
<link  href="/resources/css/bootstrap.css" type="text/css" rel="stylesheet">
<link  href="/resources/css/reserve/reservation-form.css" type="text/css" rel="stylesheet">
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script defer type="text/javascript" src="/resources/js/reserve/reservation-form.js"></script>
<style type="text/css">
@font-face{
	font-family:'nanuml';
	src:url(/resources/font/NanumSquareRoundOTFL.otf) format('truetype');
}

body{
	font-family:nanuml;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
<form action="/reserve/${userId}/reservation-insert" method="post" id="frm_reserve">
<div class="wrap">
	<div class="wrap_res">
	<!-- 네비게이션 바 -->
	<div class="nav">
        <div class="now" onclick="location.href='/reserve/${userId}/reservation-form'">예약하기</div>
        <div onclick="location.href='/reserve/${userId}/reservation-lookup'">예약확인</div>
        <div onclick="location.href='/board/${userId}/notice'">게시판</div>
	</div>

	<!-- 매장 사진 -->
	<div id="description">
        <div class='picture'>
            <div class="pic_text">
				<img id="store_img" src="${imageFile.downloadLink}">
			</div>
        </div>
            
        <!-- 매장 정보기입란 -->
        <div class="message">
           ${reserveConfig.storeInfo}
        </div>
    </div>
	
	<!-- 날짜,시간,인원/테이블 선택칸 -->
	<div class='select'>
		<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button collapsed" id="cal_btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
		        <div id="cal_text">
		        	<div><i class="far fa-calendar"></i>&nbsp날짜 선택</div><div id='selected_date'>-.-</div>
		        </div>
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      	
		      	
		      	<!-- 아코디언 1번 컨텐츠 -->
		      	<div class="cal_wrap">
		      		<div>선택된 날짜 :&nbsp</div>
		      		<jsp:useBean id="currDay" class="java.util.Date"></jsp:useBean>
		      		<fmt:formatDate var="dayFormat" value="${currDay}" pattern="yyyy-MM-dd"/>
		      		<div><input type="date" name="reDate" id='input_date' value="${reserveConfig.startPeriod}" min="${reserveConfig.startPeriod}" max="${reserveConfig.endPeriod}"></div>
		      	</div>
		      	
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">		     
		        <div id="time_text">
		        	<div><i class="far fa-clock"></i>&nbsp시간 선택</div><div id='selected_time'>-.-</div>
		        </div>
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      
		      
		        <!-- 아코디언 2번 컨텐츠 -->
		        <div class='time_L1'>
		        	<jsp:useBean id="currTime" class="java.util.Date"></jsp:useBean>
		        	<c:forEach items="${timeArr}" var="ta">
	        			<div class="button_div">
	        			<fmt:parseDate var="taDate" value="${ta}" pattern="HH:mm" type="time"/>
	        			<fmt:formatDate var="taFormat" value="${taDate}" pattern="HH:mm"/>
	        			<fmt:formatDate var="curFormat" value="${currTime}" pattern="HH:mm"/>
	        					<button type="button" class="btn btn-primary time-btn" onclick="time_selector('${ta}')">${ta}</button>
	        			</div>
		        	</c:forEach>
		        </div>
		        
		        
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingThree">
		      <button class="accordion-button collapsed" id="table_btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		        <div id="table_text">
		        	<div><i class="far fa-user"></i>&nbsp인원/테이블 선택</div><div id='selected_client'>-.-</div>
		        </div>
		      </button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      
		      
		        <!-- 아코디언 3번 컨텐츠 -->
		        <div class="table_wrap">
		        	<div class="table_header">
						<div>인원</div>
						<div class="member_cal">
							<input type='button'onclick='count("minus")' value='-'/>
							<div id='result'>0</div>
							<input type='button' onclick='count("plus")' value='+'/>
						</div>
		        	</div>
		        </div>
		        
		        
		      </div>
		    </div>
		  </div>
		</div>	
	</div>
	<input type="hidden" name="time" id="time">
	<input type="hidden" name="num" id="num">
	<input type="hidden" name="seatIdx" id="seatIdx" value="1">
	<!-- 공백 -->
	<hr style="border:6px color= rgb(97, 191, 173); padding: 0 20px 0 20px">
	<!-- 예약자 정보칸 -->
	<div class='client_info'>
		<div class='client_head'>
			<div>예약자 정보</div>
			<div style="font-size:12px; color:rgb(97, 191, 173)"><i class="fas fa-check"></i>필수입력</div>
		</div>
		
		<hr style="border:6px color= rgb(97, 191, 173);">
		
		<div class='client_body'>
			
			<div class='client_input'>
				<div>
					<div class="ci_text"><i class="fas fa-check"></i>예약자</div>
					<div><input type="text" name="name" id="name" class="form-control" placeholder="예약자를 입력해주세요" autocomplete="off"></div>
				</div>
				
				<div>
					<div class="ci_text"><i class="fas fa-check"></i>연락처</div>
					<div><input type="text" name="phone" id="number"  class="form-control" placeholder="연락처를 입력해주세요" autocomplete="off"></div>
				</div>
				
				<div>
					<div class="ci_text">요청사항</div>
					<div><textarea rows="4" style="resize: none" class="form-control" name="content" placeholder="요청하실 내용을 입력해주세요"></textarea></div>
				</div>
				
				<hr style="border:6px color= rgb(97, 191, 173);">
				<div  class="res_btn">
				    <button id='btn_reservation' type="button"   onclick="res_confirm()" class="btn btn-secondary">예약하기</button>
                </div>
				<hr style="border:6px color= rgb(97, 191, 173);">
			</div>
		</div>
	</div>
</div>
</div>
</form>


</body>
</html>