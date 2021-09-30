<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<title>예약 페이지</title>
<link href="/resources/css/all.css" rel="stylesheet">
<link href="/resources/css/reset.css" type="text/css" rel="stylesheet">
<link  href="/resources/css/bootstrap.css" type="text/css" rel="stylesheet">
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
	 html, body{
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
	}
	
	form {
		width:100%;
		height:100%;
	}
	
	.wrap{
		width:100%;
		height:auto;
		display:flex;
		justify-content: center;
	}

	.wrap_res{
		width:1130px;
		height:100%;
	}

	.now{
	color:white;
	}
	
	
	/* div{
		border: solid thin;
	} */


	/* 상단 네비게이션---------------------------------------------- */
	.nav{
		width:100%;
		display: flex;
		justify-content: space-around;
		align-items: center;
		font-weight: bold;
		height: 50px;
		background-color: rgb(97, 191, 173);
		color:black;
	}
	
	
	.nav>div:hover{
		color: white;
	}

    hr{
        width:100%;
    }
	
	/* -----------------------------------매장 상단 설명 */
    @media screen and (max-width: 700px) {
        #description{
            width:100%;
            height:auto;
            margin-bottom : 15px;
        }
        /* 배경사진 */
        .picture{
            position: relative;
            width: 100%;
            min-width:50%;
            height: 300px;
            background: url("https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTAxMDRfMTI4%2FMDAxNjA5NzY2MzMyODA5.9JJ0tPl0BXdP5biTBDXVnM_nJC4_tfQekiyjv1M7dqog.D35YCMymi94tvSbhxuKxeTbWCodEPP4ckSaLadCRJ_0g.JPEG.positively_h%2FIMG_9599.JPG&type=a340");
            background-size: cover;
        }

        .picture::before{
            content: "";
            opacity: 0.4;
            position: absolute;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 0px;
            background-color: #fff;
    }

        /* 매장이름 */
        .pic_text{
           	position: absolute;
		    left: 50%;
		    transform: translateX(-50%);
		    bottom: 0%;
		    color: black;
		    font-weight: bolder;
		    font-size: 20px;
		    width: 100%;
		    display: flex;
		    justify-content: center;
        }

        /* 매장 정보기입란 */
        .message{
            width: 100%;
            height: 100px;
            padding: 10px;
            font-size: 13px;
            border-bottom: 2px solid rgb(97, 191, 173, 0.7);
        }
        
    }

    @media screen and (min-width: 700px) {
        #description{
        width:100%;
        height:auto;
        display:flex;
        margin-bottom : 15px;
    }
        
    /* 배경사진 */
    .picture{
        position: relative;
		width: 50%;
        min-width:50%;
		height: 300px;
        background-size: cover;
        }
        
    #store_img{
    	width: 100%;
    	height: 300px;
    }

    .picture::before{
        content: "";
        opacity: 0.4;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
        background-color: #fff;
    }


        /* 매장이름 */
        .pic_text{
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		bottom: 0%;
        color:black;
		font-weight: bolder;
        font-size: 20px;
	}

        /* 매장 정보기입란 */
        .message{
		width: 50%;
		height: 300px;
		padding: 10px;
		font-size: 13px;
		border-bottom: 2px solid rgb(97, 191, 173, 0.7);
	}
        
    }


	/* 날짜,시간,인원/테이블 선택칸 ---------------------------------------*/
	/* 날짜 ------------------------------*/
	.cal_wrap{
		width: 320px;
		height: 30px;
		display: flex;
		justify-content: center;
	}
	
	
	/* 날짜 버튼에 있는 text */
	#cal_text{
		width: 320px;
		display: flex;
		justify-content: space-between;
	}
	
	
	/* 시간----------------------------- */
	/* 시간 div들 라인 */
	.time_L1, .time_L2, .time_L3{
		flex-wrap: wrap;
	    height: auto;
	    width: 100%;
	    display: flex;
	    justify-content: flex-start;
	}
	
	
	.time_L1, .time_L2, .time_L3>button{
		margin: 4px 2px 4px 2px;
	
	}
	
	.button_div{
		margin: 10px;
	}
	
	/* 시간 버튼에 있는 text */
	#time_text{
		width: 320px;
		display: flex;
		justify-content: space-between;
	}
	
	
	.btn{
		width: 75px;
	}
	
	
	/* 인원/테이블------------------------- */
	.table_wrap>div{
		margin: 10px 0 10px 0;
	}
	
	/* 인원/테이블 버튼에 있는 text */
	#table_text{
		width: 320px;
		display: flex;
		justify-content: space-between;
	}
	
	/* 인원, 증감버튼 */
	.table_header{
		display: flex;
		justify-content: space-between;
	}
	
	/* 증감버튼 */
	.member_cal{
		display: flex;
	}
	
	
	.member_cal>*{
		margin: 0 5px 0 5px;
	}
	
	/* 선택된 테이블:-.- */
	.table_no{
		display: flex;
		justify-content: flex-end;
	}
	
	/* 테이블 선택하기 버튼영역 */
	.table_select_btn{
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	/* 테이블 선택하기 버튼 */
	#btn_table{
		width: 320px;
		height: 35px;
		border: none;
		background-color: rgb(97, 191, 173);
		color: white;
		font-size: 18px;
	}
	
	
	.modal-footer{
		display: flex;
		align-content: flex-end;
	}
	
	
	#table_modal{
		width: 200px;
		height: 35px;
		border: none;
		background-color: rgb(97, 191, 173);
		color: white;
		font-size: 18px;
	}
	
	
	/* 예약자 정보칸 --------------------------------------------------*/
	/* 예약자 정보칸 wrap */
	.client_info{
		width: 100%;
		padding: 0 20px 0 20px;
	}
	
	/* 예약자 정보, 필수입력 */
	.client_head{
		display: flex;
		justify-content: center;
        align-items: center;
	}

    .client_head>*{
        margin-left:10px;
    }
	
	/* 정보입력칸 */
	.client_body *{
		font-size: 12px;
        
	}

    .client_body{
        display:flex;
        justify-content: center;
    }
	
	
	.client_body i{
		color: rgb(97, 191, 173);
	}
	
	
	.client_input>div{
		display: flex;
		align-items: center;
        margin:10px 0px 0px 0px; 
	}
	
	
	.client_input input, .client_input textarea{
		width: 400px;
	}
	
	
	.client_input input{
		height: 30px;
        width:300px;
	}
	
	
	.ci_text{
		font-size: 14px;
        margin-right:10px
	}
	
	/* 최하단 예약하기 버튼 */
    .res_btn{
        width:100%;
        justify-content: center;
        align-items: center;
        padding-bottom:20px
    }

	#btn_reservation{
		width: 320px;
		height: 45px;
		border: none;
		color: white;
		font-size: 18px;
        display: flex;
        justify-content: center;
        align-items: center;
	}
	
.valid-msg{
	color:red;	
	font-size:10px;
}	
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
<form action="/reserve/${userId}/reservation-insert" method="post" id="frm_reserve">
<div class="wrap">
	<div class="wrap_res">
	<!-- 네비게이션 바 -->
	<div class="nav">
        <div class="now" onclick="location.href='/reserve/${userId}/reservation-form'">예약하기</div>
        <div onclick="location.href='/reserve/${userId}/reservation-lookup'">예약확인</div>
        <div onclick="location.href='/board/${userId}/notice'">게시판</div>
	</div>

	<!-- 매장 사진 -->
	<div id="description">
        <div class='picture'>
            <div class="pic_text">
				<img id="store_img" src="${imageFile.downloadLink}">
			</div>
        </div>
            
        <!-- 매장 정보기입란 -->
        <div class="message">
           ${reserveConfig.storeInfo}
        </div>
    </div>
	
	<!-- 날짜,시간,인원/테이블 선택칸 -->
	<div class='select'>
		<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button collapsed" id="cal_btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
		        <div id="cal_text">
		        	<div><i class="far fa-calendar"></i>&nbsp날짜 선택</div><div id='selected_date'>-.-</div>
		        </div>
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      	
		      	
		      	<!-- 아코디언 1번 컨텐츠 -->
		      	<div class="cal_wrap">
		      		<div>선택된 날짜 :&nbsp</div>
		      		<jsp:useBean id="currDay" class="java.util.Date"></jsp:useBean>
		      		<fmt:formatDate var="dayFormat" value="${currDay}" pattern="yyyy-MM-dd"/>
		      		<div><input type="date" name="reDate" id='input_date' value="${dayFormat}" min="${dayFormat}" max="${reserveConfig.endPeriod}"></div>
		      	</div>
		      	
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingTwo">
		      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">		     
		        <div id="time_text">
		        	<div><i class="far fa-clock"></i>&nbsp시간 선택</div><div id='selected_time'>-.-</div>
		        </div>
		      </button>
		    </h2>
		    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      
		      
		        <!-- 아코디언 2번 컨텐츠 -->
		        <div class='time_L1'>
		        	<jsp:useBean id="currTime" class="java.util.Date"></jsp:useBean>
		        	<c:forEach items="${timeArr}" var="ta">
	        			<div class="button_div">
	        			<fmt:parseDate var="taDate" value="${ta}" pattern="HH:mm" type="time"/>
	        			<fmt:formatDate var="taFormat" value="${taDate}" pattern="HH:mm"/>
	        			<fmt:formatDate var="curFormat" value="${currTime}" pattern="HH:mm"/>
	        					<button type="button" class="btn btn-primary time-btn" onclick="time_selector('${ta}')">${ta}</button>
	        			</div>
		        	</c:forEach>
		        </div>
		        
		        
		      </div>
		    </div>
		  </div>
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingThree">
		      <button class="accordion-button collapsed" id="table_btn" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
		        <div id="table_text">
		        	<div><i class="far fa-user"></i>&nbsp인원/테이블 선택</div><div id='selected_client'>-.-</div>
		        </div>
		      </button>
		    </h2>
		    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample" style="">
		      <div class="accordion-body">
		      
		      
		        <!-- 아코디언 3번 컨텐츠 -->
		        <div class="table_wrap">
		        	<div class="table_header">
						<div>인원</div>
						<div class="member_cal">
							<input type='button'onclick='count("minus")' value='-'/>
							<div id='result'>0</div>
							<input type='button' onclick='count("plus")' value='+'/>
						</div>
						
		        	</div>
		        	<hr style="border:6px color= rgb(97, 191, 173); padding: 0 20px 0 20px">
		        	<div class="table_no">
		        		<div>선택된 테이블 : </div>
		        		<div id='selected_table'>-.-</div>
		        	</div>
		        	
		        	<div class="table_select_btn">
		        		
		        		
		        		<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary" id='btn_table' data-bs-toggle="modal" data-bs-target="#exampleModal">
						  테이블 선택하기
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">테이블 선택하기</h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						     	   <button type="button" class="btn btn-primary" id="table1" onclick='table_selector("table1")'>table1</button>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" id='table_modal' data-bs-dismiss="modal">선택완료</button>
						      </div>
						    </div>
						  </div>
						</div>
		        		
		        		
		        		
		        	</div>
		        </div>
		        
		        
		      </div>
		    </div>
		  </div>
		</div>	
	</div>
	<input type="hidden" name="time" id="time">
	<input type="hidden" name="num" id="num">
	<input type="hidden" name="seatIdx" id="seatIdx" value="1">
	<!-- 공백 -->
	<hr style="border:6px color= rgb(97, 191, 173); padding: 0 20px 0 20px">
	<!-- 예약자 정보칸 -->
	<div class='client_info'>
		<div class='client_head'>
			<div>예약자 정보</div>
			<div style="font-size:12px; color:rgb(97, 191, 173)"><i class="fas fa-check"></i>필수입력</div>
		</div>
		
		<hr style="border:6px color= rgb(97, 191, 173);">
		
		<div class='client_body'>
			
			<div class='client_input'>
				<div>
					<div class="ci_text"><i class="fas fa-check"></i>예약자</div>
					<div><input type="text" name="name" id="name" class="form-control" placeholder="예약자를 입력해주세요"></div>
				</div>
				
				<div>
					<div class="ci_text"><i class="fas fa-check"></i>연락처</div>
					<div><input type="text" name="phone" id="number"  class="form-control" placeholder="연락처를 입력해주세요"></div>
				</div>
				
				<div>
					<div class="ci_text">요청사항</div>
					<div><textarea rows="4" style="resize: none" class="form-control" name="content" placeholder="요청하실 내용을 입력해주세요"></textarea></div>
				</div>
				
				<hr style="border:6px color= rgb(97, 191, 173);">
				<div  class="res_btn">
				    <button id='btn_reservation' type="button"   onclick="res_confirm()" class="btn btn-secondary">예약하기</button>
                </div>
				<hr style="border:6px color= rgb(97, 191, 173);">
			</div>
		</div>
	</div>
</div>
</div>
</form>
<script type="text/javascript">

function res_confirm() {
	// 예약자명 받아오기
		let name = document.getElementById('name').value;
	//번호 받아오기
		let number = document.getElementById('number').value;
	//인원 받아오기
		let resultCnt = document.getElementById('result');
		let resultClient = document.getElementById('selected_client');
		let resnumber = resultCnt.innerText;
		let count =  resultClient.innerText = resnumber + '인';
	//테이블 받아오기
		let resultTable = document.getElementById('selected_table');
		let tablenum = resultTable.innerText;
		let table = resultTable.innerText = tablenum;
	
	let write = "예약자: " + name + "<br><br>연락처: " + number +"<br><br>인 원: " + count  + "<br><br>테이블: " + table + "<br><br><br>예약을 완료하시겠습니까?";

	modal1();
	setModalTitle('modal1','예약내용 확인');
	setModalBody('modal1', write);
	
	setYesFunc = submit;
		
}

function submit() {
	document.querySelector("#frm_reserve").submit();
}


/* 인원 증감 버튼 
 * 선택된 인원 표시해주기
 */
function count(type) {
	  let resultCnt = document.getElementById('result');
	  let resultClient = document.getElementById('selected_client');
	  let number = resultCnt.innerText;
	  let numParameter = document.getElementById('num');
	  if(type === 'plus') {
	    number = parseInt(number) + 1;
	  }else if(type === 'minus')  {
		  if(number != 0) {
			  number = parseInt(number) - 1;
		  }
	  }
	 
	  resultCnt.innerText = number;
	  resultClient.innerText = number + '인';
	  numParameter.value = number;
	  console.dir(numParameter.value);
}


/* 선택된 시간 표시해주기 */
function time_selector(time) {
	let resultTime = document.getElementById('selected_time');
	let timeParameter = document.getElementById('time');
	resultTime.innerText = time;
	timeParameter.value = time;
	console.dir(timeParameter.value);
	
}

//데이터 포맷팅 함수
let dateFormat = (date) => {
	
	let month = date.getMonth()+1;
	
	month = month < 10 ? "0" + month : month;
	
	
	return date.getFullYear() + "-" + month + "-" + date.getDate();
}


//시간 포맷 함수
let timeFormat = (date) => {
	
	let hour = date.getHours();
	let minute = date.getMinutes();

	hour = hour < 10 ? "0" + hour : hour;
	minute = minute <10 ? "0" + minute : minute;
	return hour + ":" + minute;
	
}


let todayTimeDisabled = () => {
	
	let time = timeFormat(new Date());
	document.querySelectorAll('.time-btn').forEach(e=> {
		
		if(e.innerText < time) {
			e.setAttribute("class" , "btn btn-primary time-btn disabled");
		}
		
		
	})
	
};


/* 선택된 날짜 표시해주기 */
document.getElementById('input_date').addEventListener('change', e => {
	let resultDate = document.getElementById('selected_date');
	let date = document.getElementById('input_date').value;
	resultDate.innerText = date;
	
	
	let today = dateFormat(new Date());
	
	if(date == today) {
		
		todayTimeDisabled();
		
	}else {
		
		document.querySelectorAll('.time-btn').forEach(e=> {
			
			e.setAttribute("class" , "btn btn-primary time-btn");
			
			
		})
		
	}
	
	
	
})

document.getElementById('selected_date').innerText =  document.getElementById('input_date').value;
todayTimeDisabled();



/* 선택된 테이블 표시해주기 */
function table_selector(table) {
	let resultTable = document.getElementById('selected_table');
	resultTable.innerText = table;
}



</script>





</body>
</html>