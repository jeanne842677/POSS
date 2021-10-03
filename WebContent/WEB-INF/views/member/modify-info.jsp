<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>내정보 수정</title>
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/all.css">

<style type="text/css">

html, body {
	width:100%;
}

/* 전체 감싸기 */
.wrap{
	display: flex;
	flex-direction: column;
	justify-content: center;
}

/* 상단바 감싸기 */
.nav_wrap{
	display: flex;
	justify-content: center;
}

/* div,ul,li,a,span {
	border: solid thin;
} */

/*네비게이션영역 */
#header{
	width:100%;
    height:100px;
    background-color: #aaa;
    background-color: white;
    justify-content: center;
}

/*로고*/
.logo {
    width:200px;
}

/*상단바*/
.navbar{
	width:100%;
	height: 90px;
	display:flex;
	font-size: 25px;
	border-bottom: 1px solid;
}

/* 상단바 세부 그룹 */
.nav_group{
	margin-top: 3px;
	display: flex;
}

.nav_group > * {
	flex-shrink:0;
}

/* 구현해조 */
.user_name{
   margin-top: 28px;
   font-size: 20px;
   margin-left: 10px;
   display: flex;
   font-weight: bolder;
   color: black;
}

/* 안녕하세요 */
.hello{
   font-size: 13px;
   margin-top: 33px;
   font-weight: bolder;
}

/* 님 */
.nim{
   font-size: 13px;
   margin-top: 33px;
   margin-left: 10px;
   font-weight: bolder;
}

/* 메인으로 버튼 */
#main_button{
	border-radius: 15px;
	font-size: 12px;
	height: 30px;
	margin-top: 27px;
	margin-left: 20px;
}

/* 내정보 수정*/
.modify_my_info_text{
	font-size: 25px;
	font-weight:bold;
	text-align: center;
	margin-top: 25px;
}

/* 수정영역 감싸는 */
.wrap_modify{
	height: 350px;
    width: 493px;
    align-self: center;
    margin-top: 50px;
}

/* 입력공간 */
.info_text{

}


.info_text>div{
	margin-bottom: 20px;
	display: flex;
	justify-content: space-between;
}

.info_text>div label{
	text-align: left;
	font-size: 17px;
}

.info_text input{
	float: right;
	width: 250px;
	margin-left: 30px;
}

/* 내정보 수정 버튼*/
.modify_my_info{
	text-align: center;
	margin-top: 100px;
}

/* 내정보 수정 버튼 */
#modify_confirm_btn{
	width: 750px;
	height: 35px;
	font-size: 15px;
	margin-top: 70px;
}

#searchAddress{
	border-radius: 15px;
	font-size: 12px;
	height: 30px;
}

.ID{
	text-align: left;
}

.noneselect{
	outline:none;
	border: none;
}

.noneselect:focus{
	outline:none;
	border: none;
}



    
</style>
</head>
<body>
<form action="/member/modify" method="post">
    <div class="wrap">
       <header id="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <div class="nav_wrap">
                  <img src="/resources/image/LOGO2.png" class="logo">
                 <div class="nav_group">
                    <div class="hello">
                           안녕하세요
                     </div>
                  <div class="user_name">
                        <strong>${authentication.name}</strong> 
                     </div>
                     <div class="nim">님!</div>
                     <button type="button" class="btn btn-secondary" id="main_button" onclick="javascript:location.href='/index'">> 메인으로</button>
                  </div>  
               </div>
            </nav>
       </header>

      <div class="modify_my_info_text">내정보 수정</div>
          <div class="wrap_modify">
          
              <div class="info_text">
             <div>
              <label>매장명</label>
               <input type="text" id="storeName" class="form-control" name="storeName" value="${authentication.store_name}">
               </div>
               <div>
               <label>매장주소</label>
               <input type="text" id="storeAddress" class="form-control" name="storeAddress" style="width: 135px; margin-left: 132px;" value="${addressNum}">
               <button type="button" class="btn btn-secondary" id="searchAddress" onclick="search();">주소찾기</button>
               </div>
               <div>
               <label></label>
               <input type="text" id="storeDetailAddress" class="form-control" name="storeDetailAddress" value="${detailAddress}">
               </div>
               <div>
               <label>대표자명</label>
               <input type="text" id="managerName" class="form-control" name="name" value="${authentication.name}">
               </div>
               <div>
               <label>대표번호</label>
               <input type="text" id="managerPhone" class="form-control" name="phone" value="${authentication.phone}">
               </div>
               <div id="phoneCheck" class="valid-msg"> </div>
               <div>
               <label>아이디</label>
               <input type="text" id="ID" class="noneselect" name="id" name="id" value="${authentication.userId}" readonly>
               </div>
               <div>
               <label>비밀번호</label>
               <input type="password" id="userPw" class="form-control" name="password" value="${authentication.password}">
               </div>
               <div>
               <label>비밀번호 확인</label>
                <input type="password" class="form-control" id="userPwConfirm" placeholder="PASSWORD">
                </div>
               <div class='d-flex' style="justify-content: space-between;">
                <div id="pwCheck" class="valid-msg"> </div>
               <div id="pwConfirmCheck" class="valid-msg"> </div>
         </div>
         </div>
      </div>
      
      <div class="modify_my_info">
         <button class="btn btn-lg btn-primary" type="submit" id="modify_confirm_btn">확인</button>
      </div>
</div>
</form>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function search(){
   daum.postcode.load(function(){
       new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                  // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                  
                  let addr = '';
                  
                  if (data.userSelectedType === 'R'){
                     addr = data.roadAddress;
                  } else {
                     addr = data.jibunAddress;
                  }
                  
                  document.getElementById("storeAddress").value = data.zonecode;
                  document.getElementById("storeDetailAddress").value = addr;
              }
       }).open();
   });
}


document.querySelector("#modify_confirm_btn").addEventListener("click", e => {
   let pwReg = /(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9])(?=.{8,})/;
   let phoneReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
     
   if(!pwReg.test(userPw.value)){
      e.preventDefault();
      document.querySelector('#userPw').value = "";
      document.querySelector('#userPwConfirm').value = "";
      document.querySelector('#pwCheck').innerHTML ='* 비밀번호는 숫자,영문자,특수문자 조합의 8자리 이상 문자열입니다.'; 
   }
   
   if(pwReg.test(userPw.value)){
      document.querySelector('#pwCheck').innerHTML =''; 
   }
   
   if(userPw.value != userPwConfirm.value) {
      e.preventDefault();
      document.querySelector('#userPwConfirm').value = "";
      document.querySelector('#pwConfirmCheck').innerHTML ='* 비밀번호가 일치하지 않습니다.';
   }
   
   if(userPw.value == userPwConfirm.value){
         document.querySelector('#pwConfirmCheck').innerHTML =''; 
      }
      

   if(!phoneReg.test(managerPhone.value)){
      e.preventDefault();
      document.querySelector('#managerPhone').value = "";
      document.querySelector('#phoneCheck').innerHTML ='* 휴대폰 번호는 9~11자리의 숫자입니다.'; 
   }

   if(phoneReg.test(managerPhone.value)){
      document.querySelector('#phoneCheck').innerHTML =''; 
   }
   
})();

            


</script>
</body>
</html>