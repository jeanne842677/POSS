let focusName = function() {
	document.querySelector("#name").focus();
	
}

let focusEmail = function() {
	document.querySelector("#email").focus();
	
}

let focusAuth = function() {

	document.querySelector("#authentication").focus();
	
}

let Nofunc =function() {
	
	
}


let emailAuth = function() {
	
	let uri = "/member/finding-user";
	
	let name = document.querySelector("#name").value;
	let email = document.querySelector("#email").value;
	
	if(!name) {

		setModalTitle('modal2','이메일로 아이디 찾기');
		setModalBody('modal2','이름을 입력하세요.');
		setOkayFunc = focusName;
		
		modal2();

		return;
		
	}else if(!email) {
		setModalTitle('modal2','이메일로 아이디 찾기');
		setModalBody('modal2','이메일을 입력하세요.');
		setOkayFunc = focusEmail;
		modal2();
		
		return;
		
		
	}
	

	fetch(uri+"?name="+name+"&email="+email,{method: "POST"})
	.then(res=> res.text())
	.then(text=> {
			console.dir(text);
			aaa = text;				
			if(text=="successful") {
				
				setModalTitle('modal2','이메일로 아이디 찾기');
				setModalBody('modal2','<b style="color:red;">이메일이 발송되었습니다.</b>');
				removeModalFnc("okay");
				modal2();
				
			}else if (text="failed") {
				setModalTitle('modal2','이메일로 아이디 찾기');
				setModalBody('modal2','<b style="color:red;">입력하신 정보와 일치하는 회원이 없습니다.</b><br>이름과 이메일 정보를 다시 한번 확인해주세요');
				removeModalFnc("okay");
				modal2();
			}
	
	});


}


let emailAuthToken = () => {
	
	
	
	let clientToken = document.querySelector('#authentication').value;

	let name = document.querySelector("#name").value;
	let email = document.querySelector("#email").value;
	
	//인증번호 칸이 비었을때
	if(!clientToken) {
		
		setModalTitle('modal2','이메일로 아이디 찾기');
		setModalBody('modal2','<b style="color:red;">인증번호를 입력하세요.</b>');
		setOkayFunc = focusAuth;
		modal2();
		return;
		
	}
	
	fetch('/member/finding-id-email-auth?clientToken='+clientToken,{method: "POST"})
	
	.then(res=>res.text())
	.then(text => {
		
		console.dir(text);
		if(text=="noToken") {
			
			setModalTitle('modal2','이메일로 아이디 찾기');
			setModalBody('modal2','<b style="color:red;">이메일 인증이 진행되지 않았습니다.</b>');
			removeModalFnc("okay");
			modal2();
			
		}else if(text=="tokenCorrespond") {
			
			//이메일 일치시
			location.href = '/member/finding-id-and-email?name='+name +'&email='+email;
			
			
		}else if (text="tokenDifferent") {

			setModalTitle('modal2','이메일로 아이디 찾기');
			setModalBody('modal2','<b style="color:red;">인증번호가 일치하지 않습니다.</b>');
			setOkayFunc = focusAuth;
			modal2();
			
			
		}
		
		
	})
	
	
	
	
}
