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







.text1 {

    height : 30px;
    margin : 0px;
 


}




#next_btn {

  	background-color: rgb(255, 139, 139);
    color:white;
    font-weight: 600;

}


l {
	color:rgb(255, 139, 139);
    
}

#userId {
    font-weight: 600;
    color:rgb(97,191,173);
}

.valid-msg{
	color:red;	
	font-size:10px;
}

 </style>
    <title>Document</title>
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


<script type="text/javascript">
	
	
	

		
	
	document.querySelector('#next_btn').addEventListener('click' , e=> {
		
		
		let password = document.querySelector('#password').value
		let passcheck = document.querySelector('#passcheck').value
		let pwReg = /(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9])(?=.{8,})/;
		
		if(password !=passcheck) {

			document.querySelector('.valid-msg').innerHTML = '*비밀번호가 일치하지 않습니다.';
			return;
		}
		
		if(!pwReg.test(password)) {
			
			document.querySelector('.valid-msg').innerHTML = '*비밀번호는 숫자,영문자,특수문자 조합의 8자리 이상 문자열입니다.';
			return;
		}
		
		
		let redirectLogin = () => {
			
			location.href = "/member/login-form";
			
		}
		
		fetch("/member/chang-pass-impl?password=" + password, {method:'POST'})
		.then(res=>res.text())
		.then(text=> {
			
			if(text=="complete"){
				setModalTitle('modal2' , '비밀번호 재설정');
				setModalBody('modal2' , '비밀번호 변경이 완료되었습니다.');
				setOkayFunc = redirectLogin;
				modal2();
			}else if(text=="incomplete") {
				alert("비밀번호 변경에 실패했습니다.");
				redirectLogin();
			}
			
			
			
		});
		
	});

</script>

</body>
</html>
