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
	
