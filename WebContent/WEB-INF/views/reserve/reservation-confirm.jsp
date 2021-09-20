<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인페이지</title>
<link href="resources/css/all.css" rel="stylesheet">
<link href="resources/css/reset.css" type="text/css" rel="stylesheet">
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

<div class="wrap">
	<div class="wrap_res">
	<!-- 네비게이션 바 -->
	<div class="nav">
        <div onclick="location.href='/reserve/reservation-form'">예약하기</div>
        <div class="now" onclick="location.href='/reserve/reservation-lookup'">예약확인</div>
        <div onclick="location.href='/board/notice'">게시판</div>
	</div>
	
	<div class="content">
		<div id="title">예약 내역</div>
		<hr style="border:6px color= rgb(97, 191, 173);">
		<div class="info_wrap">
			<div class='info'>
				<div id="name">예약자 : 홍길동</div>
				<div id="phone">연락처 : 010-0000-0000</div>
				<div id="cnt">인 원 : 2인</div>
				<div id="table">테이블 : Table1</div>
			</div>
		</div>
	</div>
	
	<div class="btn_wrap">
		<div class="foot_wrap">
			<button type="button" class="btn btn-secondary" id="cancel" onclick="cancel()">예약취소</button>
			<button type="button" class="btn btn-primary" id="confirm">확인</button>
		</div>
	</div>
</div>
</div>
	





<script type="text/javascript">
function cancel() {
	let can_con = confirm("예약을 취소하시겠습니까?")
	if(can_con == true){
		location.href='/reserve/reservation-lookup';
	}else{
		return;
	}
	
}



</script>
</body>
</html>