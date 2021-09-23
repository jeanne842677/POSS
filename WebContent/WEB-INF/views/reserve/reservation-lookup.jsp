<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 조회페이지</title>
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
	
	.info{
		width:100%;
	}

	.info>div{
		margin:30px;
		display: flex;
		justify-content: center;
	}
	
	.input{
		width: 220px;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom-color: lightgray;
		border-bottom-style: thin solid;
	}
	
	.input::placeholder{
		font-size: 13px;
	}
	
	input:focus {
		outline:none;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom-color: #61bfad;
		border-bottom-style: thin solid;
	}
	/* 버튼 */
	.foot_wrap{
		display:flex;
		justify-content: center;
		width:100%;
	}
	.btn_wrap{
		position: relative;
		width: 260px;
		padding-bottom: 20px;
		display:flex;
	}
	
	#cancel{
		width: 120px;
		height: 45px;
		background-color: lightgray;
		color: black;
		border: none;
		margin:10px;
	}
	
	#search{
		width: 120px;
		height: 45px;
		background-color: rgb(97, 191, 173);
		color: white;
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
		<div id="title">예약 조회</div>
		<hr style="border:6px color= rgb(97, 191, 173);">
		<div class='info'>
			<div id="name">예약자 :&nbsp&nbsp&nbsp<input type="text" class='input' class="form-control" placeholder="예약자명을 입력해주세요"></div>
			<div id="name">연락처 :&nbsp&nbsp&nbsp<input type="tel" class='input' class="form-control" placeholder="연락처를 입력해주세요"></div>
		</div>
	</div>
	
	<div class="foot_wrap">
		<div class="btn_wrap">
			<button type="button" class="btn btn-primary" id="cancel" onclick="cacel()">취소</button>
			<button type="button" class="btn btn-secondary" id="search" onclick="search()">조회</button>
		</div>
	</div>
</div>
</div>
	





<script type="text/javascript">
function cancel() {
	location.href='/reserve/reservation-form';
}
function search() {
	location.href='/reserve/reservation-confirm';
}



</script>
</body>
</html>