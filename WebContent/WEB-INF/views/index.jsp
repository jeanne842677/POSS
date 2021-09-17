<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %>

<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<link rel="stylesheet" href="resources/css/all.css">
<script type="text/javascript" src="resources/js/clock.js"></script>
<script type="text/javascript" src="resources/js/weather.js"></script>

   

<style type="text/css">
html, body {
	width: 100vw;
	min-width: 1130px;
	height: 100vh;
	min-height: 640px;
	display: flex;
	justify-content: center;
}

.wrap{
	width: 100%;
	min-width: 360px;
	height: 100%;
	min-height: 640px;
}

/* div{
	border: solid thin;
}   */

/* 상단바 */
.navbar{
	width: 100%;
	justify-content: center;
	border-bottom: 1px solid;
}


/* 상단바 속 요소 그룹 */
.nav_group{
	display: flex;
}

/* 로고 */
.logo{
	width: 200px;
}

/* 가운데 정렬, 글자 깨짐 방지 */
#shrink{
	flex-shrink: 0;
	align-self: center;
}

/* 유저 이름 : 구현해조 */
.user_name{
    font-size: 20px;
    font-weight: bolder;
    color: black;
}

/* 안녕하세요, 유저이름, 님 간격 */
.hello,.user_name,.nim{
	margin-left: 10px;
	margin-top: 20px;
}

/* 내정보 간격 */
.my_info{
	margin-left: 20px;
	margin-top: 20px;
}

/* 내정보 버튼 */
#info_button{
	border-radius: 15px;
	font-size: 12px;
}


/* 시계 간격 */
.clock{
	margin-left: 500px;
	margin-top: 20px;
	font-size: 30px;
	flex-shrink:0;
	font-weight: bold;
	color: #343a40;
}

/* 로그아웃 간격 */
.logout{
	margin-left: 30px;
	margin-top: 20px;
}

/* 로그아웃 버튼 */
#logout{
	border-radius: 100%;
	width: 50px;
	height: 50px;
	background-color: rgb(255, 79, 79);
}

/* 메인메뉴 */
.main_menu_wrap{
	height: 80%;
	display: flex;
	justify-content: center;
	align-items: center;
}


/* 포스버튼 */
#pos_btn{
   width: 260px;
   height: 450px;
   font-size: 25px;
   background-color: rgb(255, 139, 139);
   color: white;
   font-weight: bolder;
   box-shadow: 3px 3px 3px #333;
   justify-content: center;
   align-items: center;
}


#pos_btn:focus{
  color: #fff;
  background-color: #cf8083;
  border-color: #c2787b;
  box-shadow: 0 0 0 0.25rem rgba(245, 166, 169, 0.5);
}

#pos_btn:checked{
  color: #fff;
  background-color: #c2787b;
  border-color: #b67174;
  
}

/* 포스메뉴에 달러 */
#dalar{
   font-size: 50px;
}

/* 매출관리 */
#sales_manage_btn{
   width: 210px;
   height: 210px;
   font-size: 20px;
   background-color: rgb(97, 191, 173);
   color: white;
   font-weight: bolder;
   box-shadow: 3px 3px 3px #333;
   align-content: center;
}


#sales_manage_btn:focus{
  color: #fff;
  background-color: #66a593;
  border-color: #609b8a;
  box-shadow: 0 0 0 0.25rem rgba(140, 203, 185, 0.5);
}

#sales_manage_btn:checked{
  color: #fff;
  background-color: #609b8a;
  border-color: #5a9282;
  
}

/* 매출관리 아이콘 */
#store_icon{
   font-size: 50px;
   color: white;
}

/* 웨이팅 버튼 */
#waiting_btn{
   width: 210px;
   height: 210px;
   font-size: 20px;
   background-color: rgb(249, 247, 232);
   color: black;
   font-weight: bolder;
   box-shadow: 3px 3px 3px #333;
   align-content: center;
}


#waiting_btn:focus{
  color: #000;
  background-color: #f9fafb;
  border-color: #f9fafb;
  box-shadow: 0 0 0 0.25rem rgba(211, 212, 213, 0.5);
}

#waiting_btn:checked{
  color: #000;
  background-color: rgb(245, 245, 220);
  border-color: #f9fafb;
  
}


/* 웨이팅 아이콘 */
#waiting_icon{
   font-size: 50px;
   color: black;
}

/* 게시판 버튼 */
#notiboard_btn{
   width: 210px;
   height: 210px;
   font-size: 20px;
   background-color: rgb(249, 247, 232);
   color: black;
   font-weight: bolder;
   margin-top: 25px;
   box-shadow: 3px 3px 3px #333;
}

#notiboard_btn:focus{
  color: #000;
  background-color: #f9fafb;
  border-color: #f9fafb;
  box-shadow: 0 0 0 0.25rem rgba(211, 212, 213, 0.5);
}

#notiboard_btn:checked{
  color: #fff;
  background-color: #f9fafb;
  border-color: #f9fafb;
  
}


/* 게시판 아이콘 */
#board_icon{
   font-size: 50px;
   color: black;
}

/* 예약 내역 버튼 */
#reservation_manage_btn{
   width: 210px;
   height: 210px;
   font-size: 20px;
   background-color: rgb(255, 213, 125);
   font-weight: bolder;
   box-shadow: 3px 3px 3px #333;
   color: white;
   margin-top: 25px;
}

#reservation_manage_btn:focus{
  color: #fff;
  background-color: #d9af58;
  border-color: #cca552;
  box-shadow: 0 0 0 0.25rem rgba(255, 213, 126, 0.5);
}

#reservation_manage_btn:checked{
  color: #fff;
  background-color: #cca552;
  border-color: #bf9b4d;
  
}

/* 예약 아이콘 */
#reservation_manage_icon{
   font-size: 50px;
   color: white;
}

/* 오늘 예약 건수 버튼 */
#today_reservation_btn{
   width: 290px;
   height: 207px;
   font-size: 20px;
   background-color: white;
   font-weight: bolder;
   color: black;
   border: 2px;
   margin-top: 5px;
}

/* 오늘 예약은 */
#today_reservation_text{
   display: flex;
   justify-content: center;
}

/* 오늘의 예약은 */
#trt{
   font-size: 20px;
   text-align: center;
   
}
/* 총 */
#trt_total{
   font-size: 20px;
   margin-top: 11px;
}
/* 예약건수 */
#trt_num{
   color: rgb(255, 139, 139);
   font-size: 32px;
   padding-left: 10px;
   padding-right: 10px;
   text-shadow: 1px 2px 2px #333;
}
/* 건 입니다. */
#trt_cnt{
   font-size: 20px;
   margin-top: 10px;
}
/* 오늘 날씨 */
.today_weather_btn{
   width: 290px;
   height: 207px;
   font-size: 19px;
   background-color: white;
   font-weight: bolder;
   border-radius: 0.6rem;
   position: relative;
   margin-top: 27px;
   box-shadow: 0 0 0 0.25rem lightgray
}

/* 날씨 wrap */
.weather_wrap{
   display: flex;
   flex-direction: row-reverse;
   text-align: center;
}

/* 날씨 아이콘 */
.weather{
	position: absolute;
	bottom: 1px;
	right: 120px;
	width: 150px;
	height: 150px;
}
/* 동네 */
.location{
	margin-left: 10px;
	margin-top: 10px;
   	/* color: rgb(97, 191, 173); */
}

/* 기온 */
.weather_temp{
	margin-top: 13px;
	margin-left: 190px;
  	color: rgb(255, 139, 139);
   	font-size: 28px;
}

/* 날씨 상태 */
.weather_statu{
   font-size: 20px;
   margin-right: 30px;
}

.column_0{
	display: flex;
	flex-direction: column;
}
.column_1{
   display: flex;
   flex-direction: column;
   justify-content: center;
   margin-left: 35px;
 
}
.column_2{
   display: flex;
   flex-direction: column;
   justify-content: center;
   margin-left: 35px;
}
.column_3{
   display: flex;
   flex-direction: column;
   justify-content: space-between;
   margin-left: 35px;
}

</style>
</head>
<body onload="renderCurrentTime()">
    <div class="wrap">
		<header id="header">
			<nav class="navbar">
				<div class="nav_group">
					<div class="logo"><img src="/resources/image/LOGO2.png" class="logo"></div>
					<div class="hello" id="shrink">안녕하세요</div>
					<div class="user_name" id="shrink">구현해조</div>
					<div class="nim" id="shrink">님!</div>
					
					<div class="my_info" id="shrink">
						<button type="button" class="btn btn-secondary" id="info_button" onclick="location.href='/member/mypage'">
							> 내정보
						</button>
					</div>
					<div class="clock" id="shrink"></div>
					<div class="logout"  id="shrink">
					<button type="button" class="btn btn-secondary" id="logout"
						onclick="showConfirmLogout();">
						<div id="logout_btn" id="logout">
							<i class="fas fa-power-off"></i>
						</div>
					</button>
					</div>
				</div>
			</nav>
		</header>
	
	
	 <div class="main_menu_wrap">
	 
            <div class="column_0">
	            <button type="button" class="btn btn-secondary" id="pos_btn"  onclick="location.href='/member/login-form'">
	                 <div id="dalar">$</div><div id="pos_text">포스</div>
	            </button>
         	</div>
         	
            <div class="column_1">
	             <button type="button" class="btn btn-primary" id="sales_manage_btn" onclick="location.href='/sales/confirm'">
	                <div id="store_icon">
	                   <i class="fas fa-cash-register"></i>
	                </div>
	                  <div id="sales_manage_text">매출관리</div>
	             </button>
	             
	             <button type="button" class="btn btn-light" id="notiboard_btn" onclick="location.href='/board/notice'">
	                     <div id="board_icon">
	                        <i class="far fa-comments"></i>
	                     </div>
	                    <div id="notiboard_text">게시판</div>
	             </button>
            </div>
          
          <div class="column_2">
             <button type="button" class="btn btn-light" id="waiting_btn" onclick="location.href='/waiting/waiting-page'">
                  <div id="waiting_icon">
                     <i class="fas fa-user-clock"></i>
                  </div>
                  <div id="waiting_text">웨이팅</div>
              </button>
              
            <button type="button" class="btn btn-warning" id="reservation_manage_btn" onclick="location.href='/reserve/confirm'">
                  <div id="reservation_manage_icon">
                     <i class="fas fa-address-book"></i>
                  </div>
                  <div id="reservation_manage_text">예약내역</div>
            </button>
          </div>
          
          <div class="column_3">
             <button type="button" class="btn btn-outline-primary" id="today_reservation_btn" onclick="location.href='/reserve/confirm'">
                 <div id="trt">오늘의 예약은</div>
                    <div id="today_reservation_text">
                       <div id="trt_total">총</div> 
                       <div id="trt_num">5</div> 
                       <div id="trt_cnt">건 입니다.</div> 
                    </div>
              </button>
             
             <div class="today_weather_btn">
                 <div class='location'></div>
                 <div class='weather_temp'></div>
                 <div class="weather_wrap">
	                 <div class="weather_statu"></div>
	                 <div class="weather_icon"></div>
                 </div>
              </div>
              
          </div>
          
       </div>
	
</div>


<script type="text/javascript">

function showConfirmLogout() {
	if(confirm("로그아웃 하시겠습니까?")){
		alert("로그아웃 되었습니다.");
	}else{
		alert("취소 되었습니다.");
	}
}




</script>




</body>
</html>