function inputKeyword(userId) {
   let keyword = document.querySelector("#keywordBox").value;
   if(keyword == "") {
	   location.href='/board/'+userId+'/notice';
   }else {
	   location.href='/board/'+userId+'/search?keyword='+keyword;
   }
}


function confirmPrivate(idxParams, privateParams, pwParams, userId){
	   
	   let boardIdx = idxParams;
	   let isPrivate = privateParams;
	   let boardPw = pwParams;
	   let boardId = userId;
	   
	   if(isPrivate == 0){
	      location.href = '/board/'+boardId+'/post?boardIdx='+boardIdx;
	   } else if(privateParams == 1){
	      modal3();
	      setModalTitle('modal3','비밀번호 확인');
	      setConfirmFunc = function confirmPw(){
	            
	      if(document.getElementById("confirmPw").value == pwParams){
	               modal2();
	                  setModalTitle('modal2','비밀번호 확인 완료');
	                   setModalBody('modal2', '비밀번호가 확인되었습니다.');
	                  setOkayFunc = function confirmTrue(){
	                     location.href = '/board/'+userId+'/post?boardIdx='+idxParams;
	               }
	                  
	      } else {
	               modal2();
	                  setModalTitle('modal2','비밀번호 확인 실패');
	                   setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
	                  setOkayFunc = function rCancel(){
	                  location.href = '/board/'+userId+'/notice';
	                  }
	            }
	         }
	   }
	   
	}