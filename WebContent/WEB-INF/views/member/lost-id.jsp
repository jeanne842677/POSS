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

    position: absolute;
    width: 80%;
    height: 70%;
    top: 100px;




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

.text1 {

    height : 30px;
    margin : 0px;
 


}

.email_auth {

    display: flex;
    height:50px;

}

#authentication{

    width: 65%;
    margin-right: 10px;

}

#auth_btn {
    width:35%;
    background-color:rgb(97,191,173);
    color:white;
    
    font-weight: 600;
}

#next_btn {

  	background-color: rgb(255, 139, 139);
    color:white;
    font-weight: 600;

}


l {
	color:rgb(255, 139, 139);

}


 </style>
    <title>Document</title>
</head>
<body>
    <div class="wrap">
        <div class="login_wrap">

            <img id="logo" src="/resources/image/LOGO2.png">
            <div class="inner_login_wrap">
                <div class="text1"><l>* </l>이메일로 아이디 찾기</div>
                <input type="text" class="form-control" id="name" placeholder="이름">
                <input type="email" class="form-control" id="email" placeholder="이메일">
                <div class="email_auth"> 
                    <input type="text" class="form-control" id="authentication" placeholder="인증번호를 입력하세요.">
                    <button type="button" class="btn btn-light" id="auth_btn">인증번호 받기</button> 
                </div>
                <button type="button" class="btn btn-secondary" id="next_btn"> 다음으로</button>

            </div>
        </div>
    </div>

<script type="javascript">


</script>

</body>
</html>
