<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/member/select-user-id-form.css">
<script defer type="text/javascript" src="/resources/js/member/select-user-id-form.js"></script>

<style type="text/css">
@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

body{
	font-family:nanumr;
}
</style>
    <title>Document</title>
</head>
<body>
	
	<c:if test="${ empty userId || empty reg_date }">
		<script>
			location.href ="/member/lostid"
		</script>
	</c:if>

    <div class="wrap">
        <div class="login_wrap">

            <img id="logo" src="/resources/image/LOGO2.png">
            <div class="inner_login_wrap">
                <div class="text1"><l>* </l>이메일로 아이디 찾기</div>
               <div class="boxWrap">
                    <div class=userIdWrap>
                        <div class="userId"><b>${ userId }</b></div>
                        <div class="reg_date">가입 : ${ reg_date }</div>
                    </div>
                    
               </div>
                <div class="btn_wrap">

                    <button type="button" class="btn btn-secondary" id="login_btn">로그인하기 </button>
                    <button type="button" class="btn btn-light" id="find_pass_btn">비밀번호 찾기</button> 

                </div>
                

            </div>
        </div>
    </div>


</body>
</html>
