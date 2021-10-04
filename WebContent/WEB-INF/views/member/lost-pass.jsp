<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/resources/css/member/lost-pass.css">
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<script defer type="text/javascript" src="/resources/js/member/lost-pass.js"></script>
    <title>아이디 찾기</title>
<style type="text/css">
@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

body{
	font-family:nanumr;
}
</style>
</head>
<body style=" background-color:#61bfad;">
    <div class="wrap">
        <div class="login_wrap">

            <img id="logo" src="/resources/image/LOGO2.png">
            <div class="inner_login_wrap">
                <div class="text1"><l>* </l>비밀번호 찾기</div>
                <input type="text" class="form-control" id="id" placeholder="아이디">
                
                <input type="email" class="form-control" id="email" placeholder="이메일@">
                <div class="email_auth"> 
                    <input type="text" class="form-control" id="authentication" placeholder="인증번호를 입력하세요.">
                    <button type="button" class="btn btn-light" id="auth_btn" onclick="emailAuth()">인증번호 받기</button> 
                </div>
                <button type="button" class="btn btn-secondary" id="next_btn" onclick="emailAuthToken()"> 다음으로</button>

            </div>
        </div>
    </div>




<%@ include file="/WEB-INF/views/include/modal.jsp" %>



</body>
</html>
