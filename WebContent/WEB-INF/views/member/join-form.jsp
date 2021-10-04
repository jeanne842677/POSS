<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">

<title>회원가입 페이지</title>
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/member/join-form.css">
<script defer type="text/javascript" src="/resources/js/member/join-form.js"></script>
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

 <form class="wrap" action="/member/join" method="post" id="frm_join">
   <div class="wrap_test">
      <img src="/resources/image/LOGO2.png">
      <div class="info_test">
         <div>
            <label><l>* </l>아이디</label>
            <input type="text" class="form-control" name="userId" id="userId" placeholder="ID" required />
            <button type="button" class="btn btn-light" id="btnIdCheck">중복 확인</button>
         </div>
         <div id="idCheck" class="valid-msg" > </div>
         
         <div>
            <label><l>* </l>비밀번호</label>
            <input type="password"  class="form-control" name="password" id="password" placeholder="PASSWORD">
            <label class="password_check"><l>* </l>확인</label>
            <input type="password" class="form-control" id="confirmPassword" placeholder="PASSWORD">
         </div>
         <div class='d-flex' style="justify-content: space-between;">
         	 <div id="pwCheck" class="valid-msg"> </div>
        	 <div id="pwConfirmCheck" class="valid-msg"> </div>
         </div>
         
         <div>
            <label><l>* </l>대표자명</label>
            <input type="text" class="form-control" name="name" id="name" placeholder="대표자명">
         </div>
         <div>
            <label><l>* </l>대표번호</label>
            <input type="tel" class="form-control" name="phone" id="phone" placeholder="대표 전화번호">
         </div>
         <div id="phoneCheck" class="valid-msg"> </div>
         
         <div>
            <label><l>* </l>이메일</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="이메일">
            <button type="button" class="btn btn-light" id="btnEmailCheck">중복 확인</button>
         </div>
         <div id="emailCheck" class="valid-msg" > </div>
        
         <div>
            <label><l>* </l>매장명</label>
            <input type="text" class="form-control" name="storeName" id="storeName" placeholder="매장명">
         </div>
      
            <div class="addr">
               <label><l>* </l>매장주소</label>
               <input type="text" class="form-control"  style="width: 250px; margin-right: 10px;" placeholder="기본주소" name="address" id="address"> 
               <input type="text" class="form-control" name='postCode' name="postCode" id="postCode" style="width: 120px;" placeholder="우편번호" >  
               <button id="storeAddressBtn" type='button' class="btn btn-dark" onclick="search()">주소찾기</button>
            </div>
        
         <div>
            <label></label>
            <input type="text" class="form-control" name="detailAddress" id="detailAddress" style="width: 250px;" placeholder="상세주소">
         </div>

 
            <p class="testConfirm"></p>
            <div>
            <button class="btn btn-secondary join" type='submit'>JOIN-US</button>
         </div>
      </div>
   </div>

 </form>
 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/resources/js/joinForm.js"></script>
</body>
</html>