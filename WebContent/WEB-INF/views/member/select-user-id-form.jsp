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


#login_btn {
    
    background-color: rgb(255, 139, 139);
    color:white;
    margin-right: 5px;
   
    
}

#find_pass_btn {
    
    background-color:rgb(97,191,173);
    color:white;
    
    
}


l {
	color:rgb(255, 139, 139);

}

.btn_wrap{
    margin-top: 20px;
    display: flex;
    justify-content: center;
    height:40px;
    
  
    
}

.boxWrap{

    background-color: RGB(248, 249, 250);

    border-radius: 5px;
    border : solid thin RGB(219, 220, 221);
    height:100px;
    display: flex;
    
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

.userIdWrap {

    display: flex;
    
    

}



.userId {

    margin: 0 6px;

}

.reg_date {

    margin-left:140px;
    

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

<script type="text/javascript">
	
	
	
	
	
	document.querySelector('#login_btn').addEventListener('click', e=>{
		
		location.href="/member/login-form";
		
	})
	
	
	document.querySelector('#find_pass_btn').addEventListener('click', e=>{
		
		location.href="/member/change-pass";
		
	})
	
	
	

</script>

</body>
</html>
