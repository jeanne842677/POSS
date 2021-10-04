<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/member/login-form.css">
<script defer type="text/javascript" src="/resources/js/member/login-form.js"></script>
	

<title>Document</title>
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
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
	<div class="wrap">
		<div class="login_wrap">
			<img id="logo" src="/resources/image/LOGO2.png">
			<div class="inner_login_wrap">
				<input type="text" class="form-control" id="userId" placeholder="아이디" required> 
				<input type="password" class="form-control" id="password" placeholder="비밀번호" required>
					<c:if test="${not empty param.err}">
						<div class="valid-msg" id="loginAlert">! 아이디 혹은 비밀번호가 일치하지 않습니다.</div>
					</c:if>
				<button type="button" class="btn btn-secondary" id="loginBtn">로그인</button>
				<button type="button" class="btn btn-light" id="kakaoLoginBtn" onclick="kakaoLogin()">카카오
					계정으로 로그인</button>
				<div class="find_wrap">
					<span><a class="nav-link" href="/member/lostid">아이디 찾기</a></span> <span>|</span>
					<span><a class="nav-link" href="/member/lostpass">비밀번호 찾기</a></span> <span>|</span> 
					<span><a class="nav-link" href="/member/join-form">회원 가입</a></span>
				</div>
				<div class="kakao_join">
                    <span><a class="nav-link" type="button" onclick="insertKakao()">카카오 계정으로 가입하기</a></span>
                </div>
			</div>
		</div>
	</div>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
</body>
</html>
