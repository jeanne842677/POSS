document.querySelector('#next_btn').addEventListener('click' , e=> {
		
		
		let password = document.querySelector('#password').value
		let passcheck = document.querySelector('#passcheck').value
		let pwReg = /(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9])(?=.{8,})/;
		
		if(password !=passcheck) {

			document.querySelector('.valid-msg').innerHTML = '*비밀번호가 일치하지 않습니다.';
			return;
		}
		
		if(!pwReg.test(password)) {
			
			document.querySelector('.valid-msg').innerHTML = '*비밀번호는 숫자,영문자,특수문자 조합의 8자리 이상 문자열입니다.';
			return;
		}
		
		
		let redirectLogin = () => {
			
			location.href = "/member/login-form";
			
		}
		
		fetch("/member/chang-pass-impl?password=" + password, {method:'POST'})
		.then(res=>res.text())
		.then(text=> {
			
			if(text=="complete"){
				setModalTitle('modal2' , '비밀번호 재설정');
				setModalBody('modal2' , '비밀번호 변경이 완료되었습니다.');
				setOkayFunc = redirectLogin;
				modal2();
			}else if(text=="incomplete") {
				alert("비밀번호 변경에 실패했습니다.");
				redirectLogin();
			}
			
			
			
		});
		
	});