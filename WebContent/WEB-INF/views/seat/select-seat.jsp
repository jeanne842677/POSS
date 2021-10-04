<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스테이블</title>

<%@ include file="/WEB-INF/views/include/head.jsp" %>

<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/css/seat/select-seat.css?ver=1">

<style type="text/css">
@font-face{
	font-family:'nanuml';
	src:url(/resources/font/NanumSquareRoundOTFL.otf) format('truetype');
}

body{
	font-family:nanuml;
}
</style>
</head>
<body>
	<div class='wrap'>





		<!-- 상단 네비게이션 -->
		<%@ include file="/WEB-INF/views/include/nav.jsp" %>






		<!------------------------------------------------------->

		<div class="under_wrap">
         <div class="content">
			<div class="left_wrap">
				<div class="card border-warning mb-3" id="reserve" >
					<div class="card-header" id="reserve_header">예약</div>
					<div class="card-body">

							
					</div>
				  </div>
				<div class="card border-secondary mb-3" id="waiting" >
					<div class="card-header" id="waiting_header">웨이팅</div>
					<div class="card-body wait-card">
						
						<c:if test="${ not empty waitingList }">
							<c:forEach items="${ waitingList }" var="wl" varStatus="status">
						<div class="waiting" id="idx${wl.waitingNum}" >
							<div class="time">${ timeList[status.index] }</div>
							<div class="name">${wl.phone }</div>
							<div class="num">${wl.waitingPeople }명</div>
						</div>
						<script type="text/javascript"> 
							document.querySelector('#idx${wl.waitingNum}').addEventListener( 'click' ,e=>{
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
						<button type="button" class="btn btn-secondary" id="modify_btn">테이블 수정</button>


					</div>


				</div>

			</div>




		</div>

   </div>

	</div>
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
</body>





</html>