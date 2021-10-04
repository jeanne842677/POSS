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
	
	let write = "예약자: " + name + "<br><br>연락처: " + number +"<br><br>인 원: " + count  + "<br><br><br>예약을 완료하시겠습니까?";

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