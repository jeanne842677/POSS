var check = $("input[type='checkbox']");
check.click(function(){
	$("#public").toggle();
	$("#private").toggle();
});

(() => {
	document.querySelector('#frm_write').addEventListener('submit', e => {
			
			let pwReg = /^\d{4}$/;
			
			if(!pwReg.test(password.value)){
				e.preventDefault();
				document.querySelector('#password').value = "";
				document.querySelector('#pwCheck').innerHTML ='비밀번호는 숫자 4자리입니다.'; 
			}
	})
})();