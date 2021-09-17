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
   

<style type="text/css">
html, body {
	width:100%;
}


/*  div,ul,li,a,span {
	border: solid thin;
}   */

/*네비게이션영역 */
#header{
	width:100%;
    height:100px;
    background-color: #aaa;
    background-color: white;
    justify-content: center;
}

/*로고*/
.logo {
    width:200px;
    position: absolute;
    left: 230px;
}

/*상단바*/
.navbar{
	width:100%;
	height: 90px;
	display:flex;
	font-size: 25px;
	border-bottom: 1px solid;
}

/* 상단바 세부 그룹 */
.nav_group{
	width:50%; 
	margin-left: 430px;
	display: flex;
}

.nav_group > * {
	flex-shrink:0;
}

/* 구현해조 */
.user_name{
   margin-top: 28px;
   font-size: 20px;
   margin-left: 10px;
   display: flex;
   font-weight: bolder;
   color: black;
}

/* 안녕하세요 */
.hello{
   font-size: 13px;
   margin-top: 33px;
   font-weight: bolder;
}

/* 님 */
.nim{
   font-size: 13px;
   margin-top: 33px;
   margin-left: 10px;
   font-weight: bolder;
}

/* 시계 */
.clock{
	flex-shrink:0;
	font-weight: bold;
	color: #343a40;
	margin-top: 27px;
	margin-left: 55%;
}


/* 내정보 버튼 */
#info_button{
	border-radius: 15px;
	font-size: 12px;
	height: 30px;
	margin-top: 27px;
	margin-left: 20px;
}

/* 로그아웃 버튼 */
#logout{
	border-radius: 100%;
	width: 50px;
	height: 50px;
	align-self: center;
	margin-top: 20px;
	margin-left: 20px;
}

/* 메뉴버튼들 wrap */
.main_menu_wrap{
   display: flex;
   justify-content: center;
   margin-top: 5%;
}

/* 포스버튼 */
#pos_btn{
   width: 260px;
   height: 450px;
   font-size: 25px;
   background-color: rgb(255, 139, 139);
   color: white;
   font-weight: bolder;
   /* box-shadow: 3px 3px 3px #333; */
   justify-content: center;
   align-items: center;
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
   /* box-shadow: 3px 3px 3px #333; */
   align-content: center;
}

/* 매출관리 아이콘 */
#store_icon{
   font-size: 50px;
   color: black;
}

/* 웨이팅 버튼 */
#waiting_btn{
   width: 210px;
   height: 210px;
   font-size: 20px;
   background-color: rgb(249, 247, 232);
   color: black;
   font-weight: bolder;
   /* box-shadow: 3px 3px 3px #333; */
   align-content: center;
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
  /*  box-shadow: 3px 3px 3px #333; */
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
   /* box-shadow: 3px 3px 3px #333; */
   color: white;
   margin-top: 25px;
}

/* 예약 아이콘 */
#reservation_manage_icon{
   font-size: 50px;
   color: black;
}

/* 오늘 예약 건수 버튼 */
#today_reservation_btn{
   width: 290px;
   height: 210px;
   font-size: 20px;
   background-color: white;
   font-weight: bolder;
   color: black;
   border: 2px;
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
   margin-top: 10px;
}
/* 예약건수 */
#trt_num{
   color: rgb(255, 139, 139);
   font-size: 32px;
   padding-left: 10px;
   padding-right: 10px;
}
/* 건 입니다. */
#trt_cnt{
   font-size: 20px;
   margin-top: 10px;
}
/* 오늘 날씨 */
.today_weather_btn{
   width: 290px;
   height: 210px;
   font-size: 19px;
   background-color: white;
   font-weight: bolder;
   border: 3px solid black;
   margin-top: 25px;
   border-radius: 5%;
   position: relative;
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
   justify-content: center;
   margin-left: 35px;
}





/* footer*/
/* #footer{
	width:100%;
    width:100%;
    height:30px;
    background-color: #61bfad;
}
 */
    



    
</style>
</head>
<body>
    <div class="wrap">
    	<header id="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
            	<img src="/resources/image/LOGO2.png" class="logo">
        		<div class="nav_group">
        			<div class="hello">
                  		안녕하세요
            		</div>
            		<div class="user_name">
               			<strong>구현해조</strong> 
               		</div>
               		<div class="nim">님!</div>
           			
            		<button type="button" class="btn btn-secondary" id="info_button" onclick="location.href='/member/mypage'">> 내정보</button>
            		<div class="clock"> </div>
            		
            		<button type="button" class="btn btn-secondary" id="logout" onclick="showConfirmLogout();">
            			<div id="logout_btn" id="logout">
                    		<i class="fas fa-power-off"></i>
                     	</div>
            		</button>
            	</div>  
            </nav>
    	</header>
	
	
         <div class="main_menu_wrap">
            <div>
            <div class="column_0">
	            <button type="button" class="btn btn-secondary" id="pos_btn" onclick="location.href='/member/login-form'">
	                 <div id="dalar">$</div><div id="pos_text">포스</div>
	            </button>
	        </div>
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
              
            <button type="button" class="btn btn-warning" id="reservation_manage_btn"  onclick="location.href='/reserve/confirm'">
                  <div id="reservation_manage_icon">
                     <i class="fas fa-address-book"></i>
                  </div>
                 <div id="reservation_manage_text">예약내역</div>
              </button>
          </div>
          
          <div class="column_3">
             <button type="button" class="btn btn-outline-primary" id="today_reservation_btn">
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


<!-- <footer id="footer"></footer> -->



<script type="text/javascript">

   function renderCurrentTime() { //시간 받아오기
      let now = new Date();
      let hour = now.getHours();
      let minutes = now.getMinutes();
      
        if(hour<12){
             ampm="AM";
           }
        else{
             ampm="PM";
           }
         
      hour = hour < 10 ? "0"+hour:hour;
      minutes = minutes < 10 ? "0" + minutes:minutes;
      document.querySelector('.clock').innerHTML = `${ampm}  ${hour} : ${minutes}`;
      setTimeout(renderCurrentTime,1000);
   }
   
   renderCurrentTime();
   
</script>  

<script type="text/javascript"> //날씨 받아오기
let getLocationTemp = async () => {
    const OPEN_WEATHER_API_KEY = '2348247efd54eca9a724c64d99b2ce0c';
    let coords = await getCoords();
 
    let params = {
          lat:coords.latitude,
          lon:coords.longitude,
          appid:OPEN_WEATHER_API_KEY,
          units:'metric',
          lang:'kr'
    };
    
    let queryString = createQueryString(params);
    let url = `https://api.openweathermap.org/data/2.5/weather?${queryString}`;
    
    let response = await fetch(url);
    let obj =  await response.json();
    console.dir(obj);
    return {
       temp : obj.main.temp,
       place : obj.name,
       description : obj.weather[0].main,
       statu : obj.weather[0].icon
    }
 }
 
      let createQueryString = (params) => {
       let arr = [];
       for(key in params){
          arr.push(key + '=' + params[key]);
       }
       
       return arr.join('&');   
    } 
 
 let getCoords = () => {
    if(!navigator.geolocation) {
        return new Promise((resolve,reject)=>{
           reject();
         });
    }else{
         return new Promise((resolve,reject)=>{
            navigator.geolocation.getCurrentPosition((position) => {
               resolve(position.coords);
            });
         })
     }
 }
    
 
 (async ()=>{
    
    /* 지역과 기온 랜더링*/
    let locataionTemp = await getLocationTemp();
    document.querySelector('.location').innerHTML = locataionTemp.place;
    document.querySelector('.weather_temp').innerHTML = locataionTemp.temp + 'º ';
    document.querySelector('.weather_statu').innerHTML = locataionTemp.description;
    document.querySelector('.weather_icon').innerHTML = `<img src = 'http://openweathermap.org/img/wn/${locataionTemp.statu}@2x.png' class="weather">`;
 
 })();
 
 

</script>

<script type="text/javascript">

function showConfirmLogout() {
	if(confirm("로그아웃 하시겠습니까?")){
		alert("로그아웃 되었습니다.");
		location.href='/member/logout';
	}else{
		alert("취소 되었습니다.");
		}
	}




</script>




</body>
</html>