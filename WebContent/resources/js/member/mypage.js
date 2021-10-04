document.querySelector("#delete_account_btn").addEventListener("click", e => {
	
	let uri = "/member/deleteUser";

	if(confirm("정말로 POSS를 탈퇴하시겠습니까?")){
			let userId = window.prompt("아이디를 입력해주세요");
			let password = window.prompt("비밀번호를 입력해주세요");
		
			fetch(uri+"?userId="+userId+"&password="+ password, {method: "POST"})
			.then(res => res.text())
			.then(text => {
				if (text == "available") {
					alert("탈퇴 되었습니다.");
					location.href="/index";
		         } else if (text == "disable") {
		        	 alert("아이디 및 비밀번호가 일치하지 않습니다.");
		 			return;
		         }
			})
		
		
	}else{
		alert("취소 되었습니다.");
	}
})
	
function modifyInfo(){
	modal3();
	setModalTitle('modal3','비밀번호 확인');
   	setConfirmFunc = function confirmPw(){
   		if(document.getElementById("confirmPw").value == '${authentication.password}'){
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 완료');
   	   	    setModalBody('modal2', '비밀번호가 확인되었습니다.');
   	   		setOkayFunc = function confirmTrue(){
   				location.href = "/member/modify-info";
   			}
   		} else {
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 실패');
   	   	    setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
   	   		setOkayFunc = function rCancel(){
   	   		location.href = "/member/mypage?userId=${authentication.userId}";
   	   		}
   		}
   	}
	
}