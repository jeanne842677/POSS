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
   display: flex;
    justify-content: center;
	
}


.left_wrap{

	width: 22%;
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
	width:1200px;
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

.table_text  {
background-color: transparent;
border: none;

}

.table_text:focus {
outline:none;

}


.floor {
	padding: 0px;
	line-height: 60px;

}




.cat_delete_btn {
	display:none;

}

</style>

</head>
<body>
	<div class='wrap'>





		<!-- 상단 네비게이션 -->
		<header id="header">
         <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                 <a href="../index"><img src="/resources/image/LOGO6.png" class="logo"></a>
                
     <div class="menugroup">
         <ul class="navbar-nav me-auto" class="menu">
             <li class="nav-item">
               <a class="nav-link active" href="#">포스</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="/sales/confirm">매출관리</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="/board/notice">게시판</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" href="/waiting/waiting-page">웨이팅</a>
             </li>
             <li class="nav-item">
                 <a class="nav-link" href="/reserve/confirm">예약내역</a>
             </li>
             
         </ul>  
         </div>  
         </nav>
 </header>





		<!------------------------------------------------------->

		<div class="under_wrap">
         <div class="content">
			<div class="left_wrap">
				<div class="card border-warning mb-3" id="reserve" >
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
				<div class="card border-secondary mb-3" id="waiting" >
					<div class="card-header" id="waiting_header">웨이팅</div>
					<div class="card-body wait-card">
						
						<c:if test="${ not empty waitingList }">
							<c:forEach items="${ waitingList }" var="wl" varStatus="status">
						<div class="waiting" >
							<div class="time">${ timeList[status.index] }</div>
							<div class="name">${wl.phone }</div>
							<div class="num">${wl.waitingPeople }명</div>
						</div>
						<script type="text/ja,,,,,vascript">
							document.querySelectorAll('.waiting')[${status.index}].addEventListener( 'click' ,e=>{
								let waitingNum = ${wl.waitingNum};
								fetch('/waiting/update?waitingNum='+waitingNum)
								.then(res=> {
									document.querySelectorAll('.waiting')[${status.index}].remove();
									webSocket.send("remove-waiting");
									
								})
								
							})
						
						</script>
							</c:forEach>
						</c:if>
							
					
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

						
<div class="btn-group-vertical" role="group" aria-label="Basic radio toggle button group">
  <input type="radio" class="btn-check " name="btnradio" id="btnradio1" autocomplete="off" checked="checked">
  <label class="btn btn-info floor" for="btnradio1">1층</label>
<!--   <input type="radio" class="btn-check " name="btnradio" id="btnradio2" autocomplete="off" >
  <label class="btn btn-info floor" for="btnradio2">Radio 2</label>
  <input type="radio" class="btn-check " name="btnradio" id="btnradio3" autocomplete="off" >
  <label class="btn btn-info floor" for="btnradio3">Radio 3</label> -->
</div>
						
							

					</div>
					<div class="btn_bottom">
						
						<button type="button" class="btn btn-secondary" id="table_move">테이블 이동</button>
						<button type="button" class="btn btn-secondary" id="table_share">테이블 합석</button>
						<button type="button" class="btn btn-secondary" id="modify_btn">테이블 수정</button>


					</div>


				</div>

			</div>




		</div>

   </div>

	</div>
	
</body>
<script type="text/javascript">
	

	document.querySelectorAll('.table_text').forEach(tableText=>{
	
	tableText.setAttribute("readonly" , "readonly" );

	
	});

		
		//오더리스트 소환
		fetch(`/order/order-list?html_idx=${ tableHtml.tableIdx }`)
		.then(res=>res.json())
		.then(orderlist=> {
			
			document.querySelectorAll('.drag').forEach(e=>{
				
				orderlist.forEach(arr=> {
					
					if(e.dataset.idx == arr.seatUuid){
							e.children[1].innerHTML += arr.name + " " + arr.cnt + "개" + "<br>" ;
							e.setAttribute("data-ordernum" , arr.orderMasterIdx);
						}
					
		

					
					
				})
				
				
							//테이블 선택시 실행되는 메소드 (추가예정)
					e.addEventListener('click' , event=> {
						
						let idx= e.dataset.idx;
						let table = e.childNodes[0].value ; //테이블 이름
						let tableUUID =  e.dataset.idx;
						let htmlIdx = 	${ tableHtml.tableIdx }
						
						let orderIdx = e.dataset.ordernum;
						
						if( orderIdx ) {
							location.href="/order/modify?orderIdx="+orderIdx;
							
						}else {
							
							location.href="/menu/select?idx=" + htmlIdx + "&tableUUID=" + tableUUID + "&tableName=" + table;
						
						}
						
						
						
						
					});
				
			});
			
			
			
		} );
		
		


	
	
	
	document.querySelector('#modify_btn').addEventListener('click' , e=> {
		location.href='/seat/modify';
		
		
	});
	
	
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
	
	
	
	let obj ;
	
	/// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
	webSocket.onmessage = function(message) {
		
		console.dir(message.data);
		if(message.data=="waiting-add") {
			
			
			alert("새로운 웨이팅이 있습니다.");
			
			fetch("/waiting/new-waiting")
			.then(res=> res.json())
			.then(waiting => {
				obj = waiting;
				
				let time = waiting.time;
				
				let waitingDiv = document.createElement('div');
				waitingDiv.setAttribute("class" , "waiting");
				waitingDiv.innerHTML = "<div class='time'>"+ time+ "</div>" +
				"<div class='name'>" + waiting.waiting.phone+ " </div>" +
				"<div class='num'>" + waiting.waiting.waitingPeople+ "명 </div>" ;
				
				document.querySelector('.wait-card').append(waitingDiv);
				
				waitingDiv.addEventListener( 'click' ,e=>{
					let waitingNum = waiting.waiting.waitingNum;
					fetch('/waiting/update?waitingNum='+waitingNum)
					.then(res=> {
						waitingDiv.remove();
						webSocket.send("remove-waiting");
						
					})
					
				})
				
			})
			
		}
		
	};
	
	

    

</script>






</html>