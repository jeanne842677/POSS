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
	