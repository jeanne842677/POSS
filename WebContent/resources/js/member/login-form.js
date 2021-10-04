let login = function() {
		location.href = "/index";
    }
	
	Kakao.init('e5cd0153e48da9da48f6b22ac3f45bfd');
	
	Kakao.API.request({
		url: '/v1/user/unlink',
		success: function(res){
			
		},				
	})
	
	function insertKakao(){
	   	
		Kakao.Auth.login({
			success: (auth) => {
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(res){
						let kakaoId = res.id;
						location.href = '/member/kakao-join?userId='+kakaoId;
					}
				})
			},
			fail: (err) => {
				console.error(err)
			}
		})
	}
		
    document.querySelector("#loginBtn").addEventListener('click', e => {
 		let id = document.querySelector('#userId').value;
	   	let password = document.querySelector('#password').value;
       
    fetch('/member/login?userId=' + id + '&password=' + password , 
    		{method:'POST'}
    ).then(response => response.text()
    		
    ).then(text => {
    	console.dir(text);
    	 if(text == 'available'){
    		setModalTitle('modal2','Poss 로그인');
			setModalBody('modal2','로그인 되었습니다.');
			setOkayFunc = login;
			modal2();
          }else if(text == 'disable'){
            location.href="/member/login-form?err=1";
          }
    })
  })
  
  function kakaoLogin(){
    	Kakao.Auth.login({
			success: (auth) => {
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(res){
						let kakaoId = res.id;
						
						fetch('/member/kakao-login?userId=' + kakaoId, 
					    		{method:'POST'}
					    ).then(response => response.text()
					    		
					    ).then(text => {
					    	console.dir(text);
					    	 if(text == 'available'){
					    		setModalTitle('modal2','Poss 로그인');
								setModalBody('modal2','로그인 되었습니다.');
								setOkayFunc = login;
								modal2();
					          }else if(text == 'disable'){
					        	  Kakao.API.request({
					  				url: '/v1/user/unlink',
					  				success: function(res){
					  					Kakao.Auth.logout(function() {
					  						location.href = "/member/login-form?err=1";
					  					});
					  				},				
					  			})
					          }
					    })
					}
				})
			},
			fail: (err) => {
				console.error(err)
			}
		})
   }