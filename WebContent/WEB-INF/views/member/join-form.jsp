<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<style type="text/css">

body , html {

width:100%;
height:100%;
}

body {

background-color: rgb(97, 191, 173);


}


.wrap {

width:100%;
height:100%;
display:flex;
justify-content: center;
align-items: center;

}


/*가운데 폼 wrap*/
.wrap_test{

width: 700px;
height: 600px;
border-radius: 10px;
background-color: rgb(249, 247, 232);
box-shadow: 10px 10px grey;

display: flex;
justify-content: center;
position: relative;

}

img{
width: 400px;
position: absolute;
top: -15%;
z-index: 1;

}

label {
display: inline-block;
text-align: left;
width:120px;
line-height: 38px;

}

#join_text {

font-size:20px;
color:black;
font-weight: 800;

}

/*인풋 태그 있는 wrap*/
.info_test{

position: relative;
width: 650px;
top:90px;
height:520px;
}

.info_test>div{
margin-bottom: 15px;
display: flex;
}


.info_test input{
color:black;
width: 220px;
}

.password_check {
margin: 0 10px 0 20px ;
width:50px;

}

#storeAddressBtn {
margin-left: 10px;
}


#storeAddress { 
width:250px;
}

.join{

display: block;
width: 500px;
height: 40px;
background-color: rgb(255, 139, 139);
color: white;
border: hidden;
border-radius: 10px;
margin-left:85px;
margin-top:15px;

}


l {
color:rgb(255, 139, 139);

}


.addr {

display: flex;

}

#auth_id_btn {

margin-left:10px;
background-color:rgb(97,191,173);
color: white;

}
</style>
</head>
<body>
 <div class="wrap">
   <div class="wrap_test">
      <img src="/resources/image/LOGO2.png">
      <div class="info_test">
         <div>
            <label><l>* </l>아이디</label>
            <input type="text" class="form-control" id="userId" placeholder="ID">
            <button type="button" class="btn btn-light" id="auth_id_btn">중복 확인</button> 
         </div>
         <div>
            <label><l>* </l>비밀번호</label>
            <input type="password"  class="form-control" id="userPw" placeholder="PASSWORD">
      
            <label class="password_check"><l>* </l>확인</label>
            <input type="password" class="form-control" id="userPwConfirm" placeholder="PASSWORD">
         </div>
         <div>
            <label><l>* </l>대표자명</label>
            <input type="text" class="form-control" id="managerName" placeholder="대표자명">
         </div>
         <div>
            <label><l>* </l>대표번호</label>
            <input type="text" class="form-control" id="managerPhone" placeholder="대표 전화번호">
         </div>
         <div>
            <label><l>* </l>이메일</label>
            <input type="email" class="form-control" id="managerPhone" placeholder="이메일">
         </div>
         <div>
            <label><l>* </l>매장명</label>
            <input type="text" class="form-control" id="storeName" placeholder="매장명">
         </div>
      
            <div class="addr">
               <label><l>* </l>매장주소</label>
               <input type="text" class="form-control"  style="width: 250px; margin-right: 10px;" placeholder="기본주소" id="address"> 
               <input type="text" class="form-control" id="postcode" style="width: 120px;" placeholder="우편번호" >  
               <button id="storeAddressBtn" class="btn btn-dark" onclick="search()">주소찾기</button>
            </div>
        
         <div>
            <label></label>
            <input type="text" class="form-control" id="storeDetailAddress" style="width: 250px;" placeholder="상세주소">
         </div>

 
            <p class="testConfirm"></p>
            <div>
            <button class="btn btn-secondary join">JOIN-US</button>
         </div>
      </div>
   </div>

</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

document.querySelector(".join").addEventListener('click', e => {
  
   location.href="/member/join";
})

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

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                 //   document.getElementById("address").value = extraAddr;
                
                } else {
                  //  document.getElementById("address").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("storeDetailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>