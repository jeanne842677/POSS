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
<script defer type="text/javascript" src="/resources/js/seat/seat-modify.js"></script>
<style type="text/css">
@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

body{
	font-family:nanumr;
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





</body>


</html>