/* 
	1. 이미 존재하는 아이디로 사용자가 가입하려는 경우 
	2. 비밀번호는 영어, 숫자, 특수문자 조합의 8자리 이상의 문자열
	3. 전화번호는 숫자로만 입력 */
	(()=>{
		let confirmId = '';
   		document.querySelector("#btnIdCheck").addEventListener('click', e => {

   			//id속성값이 지정되어있으면 id값으로 해당 요소객체 호출 가능
   			let id = userId.value;
   			
   			if(id){
				 fetch('/member/id-check?userId=' + id)  	
				.then(text => {
					if(!respons.ok)	throw new Error(response); 
					return response.text();
				}).then(text => {
					if(text == 'available'){
						document.querySelector('#idCheck').innerHTML ='사용 가능한 아이디 입니다.';   	
						confirmId = id;
					}else if(text == 'disable'){
						document.querySelector('#idCheck').innerHTML ='사용 불가능한 아이디 입니다.';   						
					}
				})
   			}
   		})
	
   		document.querySelector('#frm_join').addEventListener('submit', e => {
   			
   			if(confirmId != userId.value){
   				e.preventDefault();
   				document.querySelector('#idCheck').innerHTML ='아이디 중복 검사를 통과하지 않았습니다.';   	
   			}
   		})
	})();

	
	
	
	
	
	
	