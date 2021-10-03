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
<script type="text/javascript">

function search() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postCode').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddress").focus();
        }
    }).open();
}
</script>
<script type="text/javascript" src="/resources/js/joinForm.js"></script>
</body>
</html>