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
<style type="text/css">
html, body {
	width: 100%;
	min-width: 1130px;
	min-height: 630px;
	height: 100%;
}

.wrap {
	width: 100%;
	height: 100%;
	display: flex;
}

.left_wrap {
	width: 50%;
	background-color: rgb(97, 191, 173);
}

.logo {
	width: 100%;
	height: 10%;
	z-index: 100;
}



.logo>a>img {
	width: 150px;
	margin: 25px 10px 10px 10px;
	display: block;
	position: absolute;
}

.left_wrap * {
	
}

/*현재 대기중인 팀*/
.wait_team_wrap {
	height: 70%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.wait_team {
	border: black red;
	width: 350px;
	height: 350px;
}

.wait_team_num_wrap {
	width: 100%;
	height: 300px;
	margin-top: 5px;
	background-color: rgb(0, 0, 0, 0.8);
	color: white;
	text-align: center;
	font-size: 25px;
	padding-top: 40px;
	border-radius: 3px;
	margin-bottom: 10px;
}

/*현재 태기팀*/
.team_num {
	font-size: 150px;
	line-height: 150px;
	font-weight: 800;
}

/*예상 대기시간*/
.wait_time_wrap {
	display: flex;
	height: 20%;
	background-color: rgb(0, 0, 0, 0.8);
	justify-content: center;
	align-items: center;
}

.wait_time_wrap>span {
	color: white;
	font-size: 60px;
	margin: 0 15px;
}

#wait_time {
	font-size: 70px;
	margin-bottom: 5px;
	margin-right: 5px;
	font-weight: 800;
	color: rgb(249, 247, 232);
}

.right_wrap {
	width: 50%;
	height: 100%;
	display: flex;
	flex-direction: column;
}

/*핸드폰 번호랑 인원수 입력하는 wrap*/
.input_wrap {
	height: 50%;
	display: flex;
	flex-direction: column;
}

.input_ph {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	height: 60%;
}

/*핸드폰 번호를 입력하세요*/
.ph_text {
	font-size: 20px;
	transform: translate(-45%);
	margin: 20px 0 10px 0;
	color: grey;
}

.phone_wrap {
	height: 80px;
	display: flex;
	justify-content: center;
	font-size: 70px;
	line-height: 70px;
	font-weight: bold;
}

/*폰넘버 010-0000-0000*/
.phone_wrap {
	width: 600px;
	color: lightgray;
}

.phone_wrap>span {
	margin: 0 1px 0 1px;
}

/*인원수 wrap*/
.input_wait {
	height: 40%;
	display: flex;
	font-size: 35px;
	justify-content: center;
	margin-top: 10px;
}

.input_wait>* {
	height: 50px;
	font-weight: 800;
}

.input_wait>span {
	font-size: 50px;
	line-height: 42px;
	margin: 0px 4px 0px 4px;
	color: lightgray;
}

.keyboard_wrap {
	height: 1000px;
	background-color: RGB(248, 249, 250);
}

.keypad {
	width: 100%;
	text-align: center;
	height: 100%;
	font-size: 45px;
}

tr, th {
	border: solid thin RGB(226, 231, 235);
}

tr {
	height: 25%;
}

th {
	width: 33.3%
}

#okay {
    width:15%;
    background-color:rgb(97,191,173);
    color:white;
    
    font-weight: 600;
}

</style>

<title>웨이팅 페이지</title>
  </head>
  <body>
    <div class="wrap">
      <div class="left_wrap">
          <div class="logo"><a href="../index"><img src="/resources/image/LOGO6.png"></a></div>
        <div class="wait_team_wrap">
          <div class="wait_team">
            <div class="wait_team_num_wrap">
              <c:if test="${not empty team}">
              <div> 현재 대기팀 </div>
              <div class="team_num">${team}</div>
              </c:if>
            </div>
            <div style="font-size:20px;">휴대폰 번호를 입력하시면 <br> 문자로 알려드립니다.</div>
          </div>
        </div>
        <div class="wait_time_wrap">
         <c:if test="${not empty estimatedTime}">
          <span>예상시간</span>
          <span id="wait_time">${estimatedTime}</span>
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
        <script type="text/javascript">
        let waitingPage = function() {

        	location.href = "/waiting/waiting-page";
        	
        }
      let idx = 0;

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


  </body>

</html>