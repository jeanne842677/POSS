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
	width: 100vw;
	min-width: 360px;
	height: 100vh;
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

/* 상단 네비게이션바 */
#nav {
	width: 100vw;
	height: 70px;
	background-color: rgb(97, 191, 173);
	flex-shrink: 0;
}

/* 1000px 기준으로 네비 항목들 변경 */
@media screen and (min-width: 1000px) {
	#ndn1 {
		display: none;
	}
}

@media screen and (max-width: 1000px) {
	#ndn2 {
		display: none;
	}
}

/* 네비게이션바 항목들 */
#nav_items>li>a {
	font-size: 20px;
	color: black;
	font-weight: bold;
	margin-left: 1.5vw;
}

/* 항목 색변경 호버 */
#nav_items>li>a:hover {
	color: white;
}

/* 오른쪽 정렬 */
#nav_items_wrap {
	position: absolute;
	right: 1vw;
}

/*로고*/
.logo {
	width: 10vw;
	min-width: 120px;
	position: absolute;
}


.under_wrap {

	width:100%;
	height:100%;
	background-color: lightgray;
	display: flex;;
	justify-content:space-around;

}



.left_wrap{

	width: 350px;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
}

.center_wrap {

	width: 1350px;
	display: flex;

}



.card {

	height: 370px;		

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
	margin-bottom: 80px;

}

.btn {

	border-radius: 1px 6px 6px 1px;
	width:150px;
	height:60px;
	font-size:20px;
	margin-bottom:2px;


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
	background-color: RGB(255, 206, 103);
	margin-bottom: 5px;
	display: flex;
	color:black;
	align-items: center;

}

.waiting {

	background-color: RGB(243, 150, 154);


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
	background-color: red;
	width:200px;
	height: 200px;
	border-radius: 5px;
	display:inline-block;

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


</style>

</head>
<body>
	<div class='wrap'>





		<!-- 상단 네비게이션 -->
		<nav class="navbar navbar-expand-lg navbar-dark" id='nav'>
			<img src="/resources/image/LOGO2.png" class="logo"
				onclick="javascript:location.href='main1.html'">
			<div class="container-fluid">
				<div class="navbar" id='nav_items_wrap'>
					<ul class="navbar-nav me-auto" class="menu" id='nav_items'>
						<li class="nav-item" id='ndn2'><a class="nav-link" href="#">포스</a>
						</li>
						<li class="nav-item" id='ndn2'><a class="nav-link" href="#">매출관리</a>
						</li>
						<li class="nav-item" id='ndn2'><a class="nav-link" href="#">게시판</a>
						</li>
						<li class="nav-item" id='ndn2'><a class="nav-link" href="#">예약관리</a>
						</li>
						<li class="nav-item" id='ndn2'><a class="nav-link"
							href="myPage.html">내정보</a></li>
						<li class="nav-item" id='ndn1'><a class="nav-link" href="#"><i
								class="fas fa-bars"></i></a></li>
					</ul>
				</div>
			</div>
		</nav>





		<!------------------------------------------------------->

		<div class="under_wrap">
			<div class="left_wrap">
				<div class="card border-warning mb-3" id="reserve" style="max-width: 21rem;">
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
				<div class="card border-secondary mb-3" id="waiting" style="max-width: 21rem;">
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
	
</body>


<script type="text/javascript">
	

	document.querySelectorAll('.table_text').forEach(tableText=>{
	
	tableText.setAttribute("readonly" , "readonly" );

	
	});
	
	
	//테이블 선택시 실행되는 메소드 (추가예정)
	document.querySelectorAll('.drag').forEach(e=>{
		
		e.addEventListener('click' , event=> {
			
			let idx= e.dataset.idx;
			let table = e.childNodes[0].value ;
			
			location.href="/menu/select?idx=" + idx + "&table=" + table;
			
			
			
			
			
		})

		
	});
	
	
	document.querySelector('#modify_btn').addEventListener('click' , e=> {
		location.href='/seat/modify';
		
	})
	
	
	

</script>






</html>