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
<style type="text/css">
/* 
메인 민트색 : rgb(97, 191, 173)
베이지색 : rgb(249, 247, 232)
라즈베리색 : rgb(255, 167, 167)
진회색 : rgb(127, 127, 127)
진갈색 : rgb(79, 65, 51)
 */
 html, body {
	width: 100%;
	min-width: 1590px;
	height: 100%;
	min-height: 640px;
	display: flex;
	justify-content: center;
	min-height: 600px;
}

.wrap {
	width: 100%;
	min-width: 360px;
	height: 100%;
	min-height: 640px;
	display: flex;
	flex-direction: column;
}

/* header (네비게이션영역)-------------------------------------------------------- */
#header {
	width: 100%;
	height: 80px;
	background-color: #aaa;
}

/*로고*/
.logo {
	width: 155px;
}

/*네비게이션 wrap*/
.navbar-nav {
	-ms-flex-direction: row;
	flex-direction: row;
	justify-content: space-around;
	min-width: 390px;
}

/*메뉴*/
.navbar {
	width: 100%;
	height: 80px;
	display: flex;
	justify-content: space-between;
	font-size: 25px;
	font-weight: bold;
	padding-top: 0;
}

.menugroup {
	width: 43%;
}

/* 메뉴글씨 */
.navbar-dark .navbar-nav .nav-link {
	color: #343a40;
	flex-shrink: 0;
}

.section-wrap {
	width: 1130px;
	display: block;
	margin: auto;
}

.under_wrap {

	width:100%;
	height:100%;
	background-color: lightgray;
	display: flex;;
	justify-content:center;

}

.content{
   display: flex;;
	
}


.left_wrap{

	width: 30%;
	display: flex;
	flex-direction: column;
	justify-content: center;
   align-items: center;
}

.center_wrap {
	display: flex;
   width:70%;
}



.card {
   width:98%;
	height: 47%;		

}

#reserve_header{ 

	background-color: RGB(255, 206, 103);
	color:black;
	

}


#waiting_header {



	background-color: RGB(243, 150, 154);
	color:black;

}


.table_wrap {
	width:1100px;
	background-color: white;
	overflow: hidden;
	position:relative;
}

.btn_wrap {

	display: flex;
	flex-direction: column;
	justify-content: space-between;

}

.btn_top {
	
	display: flex;
	flex-direction: column;
	margin-top: 10px;
}

.btn_bottom{

	display: flex;
	flex-direction: column;
	margin-bottom: 40px;

}

.btn {
	border-radius: 1px 6px 6px 1px;
	width:135px;
	height:60px;
	font-size:20px;
	margin-top:2px;


}
.card-body {
	overflow: scroll;
	
}
.card-body::-webkit-scrollbar {
  display: none;
}

.reserve , .waiting {
	width:100%;
	height: 50px;
	background-color: rgba(255, 207, 103, 0.7);
	margin-bottom: 5px;
	display: flex;
	color:black;
	align-items: center;

}

.waiting {

	background-color: rgb(243, 150, 154, 0.7);


}


.time {
	width:60px;
	margin-left: 10px;
	

}

.name {

	width:130px;
	text-align: center;

}

.table_num {
	width:60px;
	text-align: right;

}

.num {
	width:50px;
	text-align: right;
	margin-right: 10px;
}

.drag{
	position:absolute;
	background-color: rgba(181, 227, 216, 0.7);
	width:200px;
	height: 200px;
	border-radius: 5px;
	display:inline-block;
   border: solid 1px #ccc;
   padding: 10px;
}

input{
   width:100%;
}

.floor{
   display:flex;
   justify-content: center;
   align-items: center;
}



.cat_delete_btn {
	position: absolute;
	bottom: 15px;
	right:15px;
	

}

</style>

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