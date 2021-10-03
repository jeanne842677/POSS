<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스테이블</title>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/css/seat/seat-modify.css">

</head>
<body>
	<div class='wrap'>





		<%@ include file="/WEB-INF/views/include/nav.jsp" %>






		<!------------------------------------------------------->

		<div class="under_wrap">
         <div class="content">
			<div class="left_wrap">
				<div class="card border-warning mb-3" id="reserve">
					<div class="card-header" id="reserve_header">예약</div>
					<div class="card-body">
						<div class="reserve">
							<div class="time">18:30</div>
							<div class="name">임지영</div>
							<div class="table_num">3번</div>
							<div class="num">5명</div>

						</div>

							
					</div>
				  </div>
				<div class="card border-secondary mb-3" id="waiting">
					<div class="card-header" id="waiting_header">웨이팅</div>
					<div class="card-body">
						<div class="waiting" >
							<div class="time">18:30</div>
							<div class="name">박다섯글자</div>
							<div class="table_num">1층 4번</div>
							<div class="num">5명</div>

						</div>
					</div>
				  </div>

			</div>
			<div class="center_wrap">
				<div class="table_wrap">		
					<c:if test="${ not empty tableHtml }">
						${ tableHtml.tableHtml }
					</c:if>
				</div>
								<div class="btn_wrap">
					<div class="btn_top">

						
<div class="btn-group-vertical floor_group" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check " name="btnradio" id="btnradio1" autocomplete="off" >
  <label class="btn btn-info floor" for="btnradio1">1층</label>
<!--   <input type="radio" class="btn-check " name="btnradio" id="btnradio2" autocomplete="off" >
  <label class="btn btn-info floor" for="btnradio2">Radio 2</label>
  <input type="radio" class="btn-check " name="btnradio" id="btnradio3" autocomplete="off" >
  <label class="btn btn-info floor" for="btnradio3">Radio 3</label> -->
</div>
						
							

					</div>
					<div class="btn_bottom">
						
						<button type="button" class="btn btn-secondary" id="table_add">테이블 추가</button>
						<!-- <button type="button" class="btn btn-secondary" id="floor_add">플로어 추가</button> -->
						<button type="button" class="btn btn-dark" id="remove_all">모두 삭제</button>
						<button type="button" class="btn btn-secondary" id="save_btn">저장</button>
						<button type="button" class="btn btn-secondary" id="return_btn">돌아가기</button>


					</div>


				</div>

			</div>









		</div>



   </div>

</div>
	


<%@ include file="/WEB-INF/views/include/modal.jsp" %>

<script type="text/javascript">

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


</script>



</body>


</html>