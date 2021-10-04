<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="/resources/css/memeber/change-pass.css">
<link rel="stylesheet" type="text/css" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<script defer type="text/javascript" src="/resources/js/member/change-pass.js"></script>

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

	<c:if test="${ empty userId }">
		<script>
			location.href ="/member/lostid"
		</script>
	</c:if>
	
    <div class="wrap">
        <div class="login_wrap">

            <img id="logo" src="/resources/image/LOGO2.png">
            <div class="inner_login_wrap">
                <div class="text1"><l>* </l>비밀번호 재설정</div>
                <input type="text" class="form-control" id="userId" placeholder="${ userId }" readonly>
                <input type="password" class="form-control" id="password" placeholder="새 비밀번호">
                <input type="password" class="form-control" id="passcheck" placeholder="새 비밀번호 확인">
                <button type="button" class="btn btn-secondary" id="next_btn"> 확인</button>
                <div class="valid-msg"></div>

            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/include/modal.jsp" %>




</body>
</html>
