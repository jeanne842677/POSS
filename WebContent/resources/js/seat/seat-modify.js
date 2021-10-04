$( function() {
	
	//안쪽 초기화 시키기

	document.querySelectorAll('.ui-resizable-e').forEach(e=> {
		
		e.remove();
		
	})
	document.querySelectorAll('.ui-resizable-s').forEach(e=> {
		
		e.remove();
		
	})
	document.querySelectorAll('.ui-resizable-se').forEach(e=> {
		
		e.remove();
		
	})
	
	
	
	$(".drag").css("position" , "absolute");
    $( ".drag" ).draggable();
	$(".drag").resizable({
		  
		  //마우스 hover 아닐때 핸들러 숨기기
		  autoHide: true,
		  //minHeight, maxHeight, minWidth, maxWidth 최소,최대 크기지정 
		  maxHeight: 300,
		  maxWidth: 300,
		  minHeight: 200,
		  minWidth :200
		}); 

   
  } );
 
 
 
//선택창으로 돌아가기
document.querySelector('#return_btn').addEventListener('click' , e=> {
	
	location.href = "/seat/select";
	
	
})


//save버튼을 눌렀을 때
document.querySelector('#save_btn').addEventListener('click' , e=> {

	document.querySelectorAll('.table_text').forEach(tableText=>{
		
	tableText.setAttribute("value" , tableText.value );

		
	});
	
	
	let fullhtml = document.querySelector('.table_wrap').innerHTML;
	let tableArr = [];
	
	document.querySelectorAll('.drag').forEach(e=>{
		
		
		tableArr.push({
			seat_idx : e.dataset.idx ,
			seat_name : "테이블명"
			
		});
		
		
	})
	
	
	//html전송
	fetch('/seat/save-modify' , {
		method: "POST",
		body: JSON.stringify({ "table" : fullhtml,
			tables: tableArr }),
		headers: {"Content-type": "application/json; charset=UTF-8"}	
	
	})
	
	
})

 
 //테이블 추가 버튼을 눌렀을 때 
	document.querySelector('#table_add').addEventListener('click' , e=> {
		
		let div = document.createElement('div');
		div.setAttribute("class" , "drag resize");
		div.setAttribute("data-idx" , randomAlpha());
		div.innerHTML = `<input type="text" value="새테이블" class="table_text"><div class="order-list"></div><i class="fas fa-minus-circle cat_delete_btn"></i>`;
		div.children[2].addEventListener('click' , e=> {
			
			div.remove();
		})
	
		$(div).draggable();
		$(div).resizable({
		  
		  //마우스 hover 아닐때 핸들러 숨기기
		  autoHide: true,
		  //minHeight, maxHeight, minWidth, maxWidth 최소,최대 크기지정 
		  maxHeight: 300,
		  maxWidth: 300,
		  minHeight: 150,
		  minWidth :150
		}); 
		

		$(".drag").css("position" , "absolute");
		document.querySelector('.table_wrap').appendChild(div);
		
		

		
	})
	
	
	document.querySelectorAll('.drag').forEach(e=>{
		
		e.childNodes[2].addEventListener('click' , event=> {

			e.remove();
		})
	
		
		
	})
	
	
/* 	
	//플로어 추가 버튼 누르면
	document.querySelector('#floor_add').addEventListener('click' , e=> {
		let cnt = "btnradio"+(document.querySelectorAll('.btn-check').length + 1);

		document.querySelector('.floor_group').innerHTML += `<input type='radio' class='btn-check' name='btnradio' id='`+cnt+`' autocomplete='off' >
		  <label class='btn btn-info floor' for='`+cnt+`'>새 플로어</label>`;
		document.querySelector('#'+cnt).checked = true;   
	

		
	})
	
	document.querySelector('.btn-check').addEventListener('CheckboxStateChange' , e=>{
		
		alert('체크');
		
	});
	 */
	

let removeAllTable = () => {
	
	document.querySelector('.table_wrap').innerHTML ="";
	
}

document.querySelector('#remove_all').addEventListener('click' , e=> { 
	
	setModalTitle('modal1' , '테이블 전체 삭제'); 
	setModalBody('modal1' , '테이블을 전체 삭제하시겠습니까?');
	setYesFunc = removeAllTable;
	modal1();
	
	
});



//랜덤한 4글자 알파벳 생성
let randomAlpha = ()=> {
	
	let alpha = '';
	for(let i =0 ; i < 4; i++) {
		let ran = Math.random() * 26 + 65;
		alpha += String.fromCharCode(ran);
	}
	
	
	return alpha;
	
	
	
}
