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
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
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


.modal{
   margin-top: 30vh;
   
   
}


 </style>
    <title>아이디 찾기</title>
</head>
<body>
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


<script type="text/javascript">

let focusName = function() {
	document.querySelector("#id").focus();
	
}

let focusEmail = function() {
	document.querySelector("#email").focus();
	
}

let focusAuth = function() {

	document.querySelector("#authentication").focus();
	
}

let Nofunc =function() {
	
	
}


let emailAuth = function() {
	
	let uri = "/member/finding-user";
	
	let userId = document.querySelector("#id").value;
	let email = document.querySelector("#email").value;
	
	if(!id) {

		setModalTitle('modal2','비밀번호 찾기');
		setModalBody('modal2','아이디를 입력하세요.');
		setOkayFunc = focusName;
		
		modal2();

		return;
		
	}else if(!email) {
		setModalTitle('modal2','비밀번호 찾기');
		setModalBody('modal2','이메일을 입력하세요.');
		setOkayFunc = focusEmail;
		modal2();
		
		return;
		
		
	}
	

	fetch(uri+"?userId="+userId+"&email="+email,{method: "POST"})
	.then(res=> res.text())
	.then(text=> {
			console.dir(text);
			aaa = text;				
			if(text=="successful") {
				
				setModalTitle('modal2','비밀번호 찾기');
				setModalBody('modal2','<b style="color:red;">이메일이 발송되었습니다.</b>');
				removeModalFnc("okay");
				modal2();
				
			}else if (text="failed") {
				setModalTitle('modal2','비밀번호 찾기');
				setModalBody('modal2','<b style="color:red;">입력하신 정보와 일치하는 회원이 없습니다.</b><br>아이디와 이메일 정보를 다시 한번 확인해주세요');
				removeModalFnc("okay");
				modal2();
			}
	
	});


}


let emailAuthToken = () => {
	
	
	
	let clientToken = document.querySelector('#authentication').value;

	let userId = document.querySelector("#id").value;
	let email = document.querySelector("#email").value;
	
	//인증번호 칸이 비었을때
	if(!clientToken) {
		
		setModalTitle('modal2','비밀번호 찾기');
		setModalBody('modal2','<b style="color:red;">인증번호를 입력하세요.</b>');
		setOkayFunc = focusAuth;
		modal2();
		return;
		
	}
	
	fetch('/member/finding-id-email-auth?clientToken='+clientToken,{method: "POST"})
	
	.then(res=>res.text())
	.then(text => {
		
		console.dir(text);
		if(text=="noToken") {
			
			setModalTitle('modal2','비밀번호 찾기');
			setModalBody('modal2','<b style="color:red;">이메일 인증이 진행되지 않았습니다.</b>');
			removeModalFnc("okay");
			modal2();
			
		}else if(text=="tokenCorrespond") {
			
			//이메일 일치시
			location.href = '/member/finding-pass?userId='+userId +'&email='+email;
			
			
		}else if (text="tokenDifferent") {

			setModalTitle('modal2','비밀번호 찾기');
			setModalBody('modal2','<b style="color:red;">인증번호가 일치하지 않습니다.</b>');
			setOkayFunc = focusAuth;
			modal2();
			
			
		}
		
		
	})
	
	
	
	
}


</script>


</body>
</html>
