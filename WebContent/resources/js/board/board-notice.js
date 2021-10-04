function inputKeyword(userId) {
   let keyword = document.querySelector("#keywordBox").value;
   if(keyword == "") {
	   location.href='/board/'+userId+'/notice';
   }else {
	   location.href='/board/'+userId+'/search?keyword='+keyword;
   }
}

function prev(inputPage) {
   
   let page = inputPage - 1;
   
   if(page == 0){
      alert("전 페이지가 존재하지 않습니다.");
      return;
   }
   
   location.href = "/board/${userId}/notice?page="+page;
}

function confirmPrivate(idxParams, privateParams, pwParams, userId){
   
   if(privateParams == 0){
      location.href = '/board/'+userId+'/post?boardIdx='+idxParams;
   } else if(privateParams == 1){
      let confirmPw = prompt("비밀번호를 입력하세요");
      
      if(confirmPw == pwParams){
         location.href = '/board/'+userId+'/post?boardIdx='+idxParams;
      } else {
         alert("다시 입력하세요!");
         return;
      }
      
   } else {
      alert("오류 발생");
   }
   
}
