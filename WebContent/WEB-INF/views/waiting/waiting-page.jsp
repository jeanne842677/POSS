<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/waiting/waiting-page.css">
<style type="text/css">
@font-face{
	font-family:'nanuml';
	src:url(/resources/font/NanumSquareRoundOTFL.otf) format('truetype');
}

body{
	font-family:nanuml;
}
</style>
<title>웨이팅 페이지</title>
  </head>
  <body>
    <div class="wrap">
      <div class="left_wrap">
          <div class="logo"><a href="../index"><img src="/resources/image/LOGO2.png"></a></div>
        <div class="wait_team_wrap">
          <div class="wait_team">
            <div class="wait_team_num_wrap">
              <c:if test="${not empty waitingCnt}">
              <div> 현재 대기팀 </div>
              <div class="team_num">${waitingCnt}</div>
              </c:if>
            </div>
            <div style="font-size:20px;">휴대폰 번호를 입력하시면 <br> 문자로 알려드립니다.</div>
          </div>
        </div>
        <div class="wait_time_wrap">
         <c:if test="${not empty waitingCnt}">
          <span>예상시간</span>
          <span id="wait_time">${waitingCnt*10}</span>
          <span>분</span>
          </c:if>
        </div>
      </div>



      <div class="right_wrap">
        <div class=input_wrap>
          <div class="input_ph">
            <div class="ph_text">휴대폰 번호를 입력하세요.</div>
            <div class="phone_wrap">
              <span class="phone_num" >0</span>
              <span class="phone_num" >1</span>
              <span class="phone_num" >0</span>
              <span class="dash">-</span>
              <span class="phone_num" >0</span>
              <span class="phone_num" >0</span>
              <span class="phone_num" >0</span>
              <span class="phone_num" >0</span>
              <span class="dash">-</span>
              <span class="phone_num">0</span>
              <span class="phone_num">0</span>
              <span class="phone_num">0</span>
              <span class="phone_num">0</span>
            </div>
          </div>
          <div class="input_wait">
              <div style="margin-right: 10px;">인원 수 :</div>
              <span class="phone_num">0</span>
              <div>명</div>

          </div>

        </div>
        <div class="keyboard_wrap">
            <table border="1" class="keypad">
              <tr>
                <th data-num="1">1</th>
                <th data-num="2">2</th>
                <th data-num="3">3</th>
              </tr>
              <tr>
                <th data-num="4">4</th>
                <th data-num="5">5</th>
                <th data-num="6">6</th>
              </tr>
              <tr>
                <th data-num="7">7</th>
                <th data-num="8">8</th>
                <th data-num="9">9</th>
              </tr>
              <tr>
                <th data-num="-1" style="font-size: 35px;">뒤로</th>
                <th data-num="0">0</th>
                <th data-num="-2" style="font-size: 35px;" id="insert_waiting_info">등록</th>
              </tr>

            </table>

        </div>
      </div>
    </div>

<%@ include file="/WEB-INF/views/include/modal.jsp" %>



  </body>
  
  <script type="text/javascript">
	//웹소켓 연결
	var webSocket = new WebSocket("ws://localhost:9090/waitingSocket");
	
	webSocket.onopen = function(message) {
		console.dir("소켓이 연결되었습니다.");
	};
	
	
	// WebSocket 서버와 접속이 끊기면 호출되는 함수
	webSocket.onclose = function(message) {
		console.dir("소켓 연결이 끊어졌습니다.");
	};
	
	
	
	// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
	webSocket.onerror = function(message) {
		console.dir("소켓 에러가 발생했습니다.");
	};
	
	
	
	/// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
	webSocket.onmessage = function(message) {
		
		console.dir(message.data);
		if(message.data=="remove-waiting") {
			
			let teamNum = document.querySelector('.team_num');
			teamNum.innerHTML = parseInt(teamNum.innerHTML) - 1;
			let waitTime = document.querySelector('#wait_time')	;
			waitTime.innerHTML = parseInt(teamNum.innerHTML) * 10;
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
  
  </script>

</html>