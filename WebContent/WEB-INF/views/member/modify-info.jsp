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
<link rel="stylesheet" href="/resources/css/member/modify-info.css">
<script defer type="text/javascript" src="/resources/js/member/modify-info.js"></script>
<style type="text/css">
@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

body{
	font-family:nanumr;
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

</body>
</html>