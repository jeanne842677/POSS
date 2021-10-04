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
<link rel="stylesheet" href="/resources/css/seat/select-seat.css">
<script defer type="text/javascript" src="/resources/js/seat/select-seat.js"></script>

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





</html>