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