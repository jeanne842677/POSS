		//웹소켓 연결
		var webSocket = new WebSocket("ws://localhost:9090/waitingSocket");
		
		webSocket.onopen = function(message) {
			console.dir("소켓이 연결되었습니다.");
		};
		
		
		// WebSocket 서버와 접속이 끊기면 호출되는 함수
		webSocket.onclose = function(message) {
			alert("소켓 연결이 끊어졌습니다.");
		};
		
		
		
		// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
		webSocket.onerror = function(message) {
			alert("소켓 에러가 발생했습니다.");
		};
		
		
		
		/// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
		webSocket.onmessage = function(message) {
			
			console.dir(message.data);
			if(message.data=="remove-waiting") {
				
				let teamNum = document.querySelector('.team_num')
				teamNum.innerHTML = parseInt(teamNum.innerHTML) - 1;
			
			}
			
		};
        

		let idx=0;
		
	 let waitingPage = ()=> {
		 
		 location.href = "/waiting/waiting-page";
		 
	 }

      document.querySelectorAll('tr').forEach(tr=> {
        tr.addEventListener('mousedown', e=>{

            e.target.style.backgroundColor = "RGB(226, 231, 235)";
            let num = e.target.getAttribute("data-num");

            //뒤로버튼을 눌렀을 때
            if(num==-1) {
              
              if(idx<1) {idx=1;}
                

              //thisNum = 핸드폰번호 숫자 입력되는 quertSelector
              let thisNum = document.querySelectorAll(".phone_num")[--idx];
              thisNum.innerHTML = "0";
              thisNum.style.color ="lightgray";
              console.log(thisNum.innerHTML);
              if(idx==1) {
                thisNum.innerHTML = "1";
             }

            //등록 버튼을 눌렀을 때 
            }else if(num==-2) {



                let phoneNum = '';
                let waitingNum = 0;
                document.querySelectorAll(".phone_num").forEach((e,i)=>{
                    
                    if(i==11){
                        waitingNum = e.innerHTML;
                    }else {
                        phoneNum+= e.innerHTML;
                    }
                });

                if(waitingNum==0) { //번호가 모두입력되지 않았거나 인원수가 0명이면 일어나는 분기처리
                	
                	setModalTitle('modal2','웨이팅 등록');
    				setModalBody('modal2','번호를 정확하게 입력해주세요');
    				modal2();
    				
                }else {

                	console.dir(phoneNum);
                	console.dir(waitingNum);
                	
            //핸드폰 번호가 유효한지 체크(밸리데이터) => 010으로 시작하는지? 11자리인지?
    		let phoneReg = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;

    		
    		if(!phoneReg.test(phoneNum)){
    			setModalTitle('modal2','웨이팅 등록');
    			setModalBody('modal2','휴대폰 번호를 확인해주세요.');
    			setOkayFunc = waitingPage;
    			modal2();
    		}
	
                	
                
    //fetch로 넘기기
    document.querySelector("#insert_waiting_info").addEventListener("click", e => {
	let phoneNumParams = phoneNum;
	let waitingNumParams = waitingNum;

	
		fetch("/waiting/waiting-insert?phone="+phoneNumParams+"&waitingPeopleNum="+waitingNumParams
				, {
			method: "POST"
		})
		.then(res => res.text())
		.then(text => {

		 if (text == "disable") {
				setModalTitle('modal2','웨이팅 등록 실패');
			}
		 else {  	
			 		//예약이 완료되면(db저장 & 문자메세지) 모달창으로 현재 예약번호와 함께 안내말 출력
					webSocket.send("waiting-add");		
					setModalTitle('modal2','웨이팅이 등록 되었습니다.');
					setModalBody('modal2', '연락처 : ' + phoneNum + '<br>인원 수 : ' + waitingNum + '<br>예약 번호 : ' + text);
					setOkayFunc = waitingPage;
					modal2();
					
					
					
			
		 }
		})

                


	})

                
              
                




                }

            //그외 숫자 눌렀을 때
            }else {
              if(idx<12) {;

              let thisNum = document.querySelectorAll(".phone_num")[idx];
              thisNum.style.color ="black";
              thisNum.innerHTML = num;
              idx++;

              
  


              }
           
            }


            //대시 문자 처리
            let dash1 = document.querySelectorAll(".dash")[0];
            let dash2 = document.querySelectorAll(".dash")[1];
                if(idx>=4) {
                   dash1.style.color="black";
                }else {
                   dash1.style.color="lightgray";
                }

                if(idx>=8) {
                  dash2.style.color="black";
                }else { 
                  dash2.style.color="lightgray";
                }



        })

        tr.addEventListener('mouseup', e=>{

          e.target.style.backgroundColor = "RGB(248, 249, 250)";
          e.target.style.transitionDuration = "0.2s";



        })


      })