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
<style type="text/css">
html , body {
    height: 100%;
    width: 100%;

}

body {
    background-color:rgb(97,191,173);


}




/*전체 wrap*/
.wrap {

    display:flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    width: 100%;
}


/*살구색 로그인창 wrap*/
.login_wrap {
    
    position: relative;

    width: 550px;
    height: 480px;
    border-radius: 10px;
    background-color: rgb(249,247,232);
    box-shadow: 10px 10px grey;
    flex-direction: column;
    display: flex;
    justify-content: center;
    align-items: center;

}

/*로고 이미지*/
#logo {


    width : 450px;
    position: absolute;
    top: -80px;

    

}


/*아이디, 비밀번호 ,로그인, 카카오계정버튼 div들의 wrap*/
.inner_login_wrap {

    width: 80%;
    height: 70%;
    position: absolute;
    top:130px;



}


.inner_login_wrap > * {

    margin: 10px 0 10px 0;
    height : 50px;
    display:block;
    width: 100%;
    margin : 10px 0


}


/*로그인 버튼*/
#loginBtn {
    background-color: RGB(255, 139, 139);
    border-color:RGB(255, 139, 139);
    font-weight: 600;
}


/*카카오 로그인버튼*/
#kakaoLoginBtn {
    background-color: RGB(249, 224, 0);
    border-color:RGB(249, 224, 0);
    color : black;
    font-weight: 600;
}


/*비밀번호 찾기 / 아이디찾기 / 회원가입 찾기 wrap*/
.find_wrap {
    display: flex;
    justify-content: center;
    align-items: center;

}

.find_wrap > * {
    
    margin: 0 10px 0 10px;


}

/*로그인 정보 알림 문구*/

.loginAlert {
    display:none;
    height:15px;
    font-size:11px;
    margin: 15px 0 15px 0;
    color:red;


}


.nav-link {
	
	padding: 0px;
	color: gray;
}


 </style>
    <title>Document</title>
</head>
<body>
    <div class="wrap">
        <div class="login_wrap">
	
            <img id="logo" src="/resources/image/LOGO2.png">
            <div class="inner_login_wrap">
                <input type="text" class="form-control" id="userId" placeholder="아이디">
                <input type="password" class="form-control" id="password" placeholder="비밀번호">
                <div class="loginAlert">!아이디 혹은 비밀번호가 일치하지 않습니다.</div>
                <button type="button" class="btn btn-secondary" id="loginBtn" onclick="defaultLogin()">로그인</button>
                <button type="button" class="btn btn-light" id="kakaoLoginBtn">카카오 계정으로 로그인</button>
                <div class="find_wrap">
                    <span><a class="nav-link" href="/member/lostid">아이디 찾기</a></span>
                    <span>|</span>
                    <span><a class="nav-link" href="/member/lostpass">비밀번호 찾기</a></span>
                    <span>|</span>
                    <span><a class="nav-link" href="/member/join-form">회원 가입</a></span>
                </div>
            </div>
        </div>
    </div>
    
    
<script type="text/javascript">

let defaultLogin=() => {

uri = "/member/login";
fetch(uri , {
	//body에 파라미터 보내기

	method :'post',
	headers : {'Content-Type' : 'application/json'},
	body : JSON.stringify({'key값':'value값'})}
	//json파싱
	//document.value
})


}

</script>

</body>
</html>
