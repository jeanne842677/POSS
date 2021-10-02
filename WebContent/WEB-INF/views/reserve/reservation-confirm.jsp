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
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
	html, body{
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
	}
	
	.wrap{
		width:100%;
		height:100%;
		display:flex;
		justify-content: center;
	}
	
	.wrap_res{
		width:1130px;
		height:100%;
	}

	.now{
	color:white;
	}
	
	/* div{
		border: solid thin;
	} */


	/* 상단 네비게이션---------------------------------------------- */
	.nav{
		width:100%;
		display: flex;
		justify-content: space-around;
		align-items: center;
		font-weight: bold;
		height: 50px;
		background-color: rgb(97, 191, 173);
		color:black;
	}
	
	
	.nav>div:hover{
		color: white;
	}
	
	/* text */
	.content{
		width: 100%;
		height:300px;
		padding: 10px;
	}
	
	#title{
		display:flex;
		justify-content: center;
		align-items: center;
		width:100%;
		font-weight: bolder;
		font-size: 20px;
		
	}	

	.hr{
		width:100%;
		display:flex;
		justify-content: center;
	}

	.info_wrap{
		width:100%;
		display:flex;
		justify-content:center;
	}
	
	.info{
		width:200px;

	}

	.info>div{
		padding:10px;
		display: flex;
		justify-content: baseline;
	}
	
	/* 버튼 */

	.foot_wrap{
		display:flex;
		justify-content: center;
		width:100%;
	}
	.btn_wrap{
		width: 100%;
		padding-bottom: 20px;
		display:flex;
		justify-content: center;
		margin-top: 5vh;
	}
	
	#cancel{
		width: 120px;
		height: 45px;
		border: none;
		margin:10px;
	}
	
	#confirm{
		width: 120px;
		height: 45px;
		border: none;
		margin:10px;
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
	





<script type="text/javascript">
function cancel(reserveIdx, userId) {
	let resIdx = reserveIdx;
	let id = userId;
   	setModalTitle('modal1','예약취소');
   	setModalBody('modal1', '정말로 예약을 취소 하시겠습니까?');
   	modal1();
   	setYesFunc = function testFnc(){
   		modal2();
   		setModalTitle('modal2','예약취소 완료');
   	    setModalBody('modal2', '예약이 취소되었습니다.');
   		setOkayFunc = function rCancel(){
   			location.href = '/reserve/'+id+'/reservation-cancel?reserveIdx='+resIdx;
   		}
   	}
};

</script>
</body>
</html>