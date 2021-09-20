<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

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
   min-width: 1130px;
}

/* div {
        border: solid thin;
    }  */
     
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

/* 메뉴아래 매출관리, 오늘 총 매출------------------------------------------------  */
#title_area {
   width: 100%;
   min-width: 550px;
   height: 100px;
}

.title {
   width: 1130px;
   height: 100px;
   display: flex;
   justify-content: center;
   flex-shrink: 0;
   line-height: 100px;
   position: absolute;
   font-size: 25px;
   color: #343a40;
   font-weight: bolder;
   padding: 10px 0px 0px 0px;
}
/* 메인 ----------------------------------------- */
.main {
   width: 100%;
   display: flex;
   justify-content: center;
}

.main_wrap {
   width: 1130px;
}

.content1 {
   width: 100%;
   height: 50vh;
   border: 2px solid rgb(255, 167, 167);
   border-radius: 50px;
   background-color: white;
   margin-top: 5vh;
   margin-bottom: 5vh;
   position: relative;
}

.content2 {
   width: 100%;
   height: 50vh;
   border: 2px solid rgb(255, 167, 167);
   border-radius: 50px;
   background-color: white;
   margin-top: 5vh;
   margin-bottom: 5vh;
   position: relative;
   display: flex;
   justify-content: center;
   align-items: center;
}

.content3 {
   width: 100%;
   height: 100vh;
   border: 2px solid rgb(255, 167, 167);
   border-radius: 50px;
   background-color: white;
   margin-top: 5vh;
   margin-bottom: 5vh;
   position: relative;
   padding-left: 5vw;
   padding-right: 5vw;
}

/* content1 ----------------------------------------- */
#title1 {
   width: 100%;
   height: 10vh;
   display: flex;
   justify-content: center;
   align-items: center;
}

#title1>div {
   width: 180px;
   height: 40px;
   background-color: rgb(255, 167, 167);
   color: white;
   font-weight: bolder;
   text-align: center;
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 50px;
}
#main1 {
	width: 100%;
	height: 28vh;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cal_wrap {
    width : 80%;
    height: 40%;
    border: none;
    display: flex;
    justify-content: center;
    align-items: center;
}

.cal_wrap>table {
   width: 60%;
   height: 70%;
   text-align: center;
   background-color: white;
   box-shadow: 5px 5px 5px gray;
}

.cal_wrap>table>caption {
   caption-side: top;
   text-align: center;
}

/* content3 ----------------------------------------- */
#title3 {
   width: 100%;
   height: 10vh;
   display: flex;
   justify-content: center;
   align-items: center;
}

#title3>div {
   width: 180px;
   height: 40px;
   background-color: rgb(255, 167, 167);
   color: white;
   font-weight: bolder;
   text-align: center;
   display: flex;
   align-items: center;
   justify-content: center;
   border-radius: 50px;
}

#time_title {
   width: 100%;
   display: flex;
   justify-content: space-around;
   align-items: center;
   text-align: center;
   margin-bottom: 40px;
}

#time_title>div {
   text-align: center;
   margin-top: 60px;
}

#time_table {
   width: 100%;
   height: 60vh;
   display: flex;
   align-items: center;
   text-align: center;
}

#time_table>table {
   text-align: center;
   width: 50%;
   height: 60%;
}


.form-check{
   display: flex;
   justify-content: center;
   font-size: 20px;
}


/* footer ----------------------------------------- */
.footer {
   width: 100%;
   height: 5vh;
   background-color: rgb(97, 191, 173);
}

</style>
</head>
<body>
<div class="wrap">
    <header id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                    <a href="../index"><img src="/resources/image/LOGO6.png" class="logo"></a>
                   
        <div class="menugroup">
            <ul class="navbar-nav me-auto" class="menu">
                <li class="nav-item">
                  <a class="nav-link" href="#">포스</a>
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
   
   <main class='main'>
      <div class='main_wrap'>
         
         <div class='content1'>
            <div id='title1'>
               <div>예약 활성 기간 설정</div>
            </div>
               <!-- 캘린더 -->
				<div id='main1'>
					<div class='cal_wrap'> </div>
				</div>	   
         </div>
         <hr style='border-top: 3px dashed black'>
         
         <div class='content2'>
            <div>테이블</div>
         </div>
         <hr style='border-top: 3px dashed black'>
         
         <div class='content3'>
            <div id='title3'>
               <div>예약 활성 시간 설정</div>
            </div>
            <div id='time_title'>
               <div id='1hour'>1시간 단위</div>
               <div id='30min'>30분 단위</div>
            </div>
            <div id='time_table'>
               <table border="1" class='table table-bordered'>
                  <tr>
                     <th>시간</th>
                     <th>예약 활성</th>
                  </tr>
                  <tr>
                     <td class="center">12:00 ~ 13:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>13:00 ~ 14:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>14:00 ~ 15:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>15:00 ~ 16:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>16:00 ~ 17:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>17:00 ~ 18:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>18:00 ~ 19:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>19:00 ~ 20:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>20:00 ~ 21:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>21:00 ~ 22:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>22:00 ~ 23:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>23:00 ~ 24:00</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
               </table>
               
               <table border="1" class='table table-bordered'>
                  <tr>
                     <th>시간</th>
                     <th>예약 활성</th>
                  </tr>
                  <tr>
                     <td>12:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>13:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>14:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>15:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>16:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>17:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>18:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>19:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>20:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>21:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>22:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
                  <tr>
                     <td>23:30</td>
                     <td>
                        <div class="form-check form-switch">
                             <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
                             <label class="form-check-label" for="flexSwitchCheckChecked"></label>
                         </div>
                       </td>
                  </tr>
               </table>
               
            </div>
         </div>
   
      </div>
   </main>

   <footer class='footer'></footer>


</div>








<script type="text/javascript">

/* 캘린더 */
//캘린더 폼만들기
let makeform = function(selector) {

    let cal = document.querySelector(selector);
    console.dir(cal);
    
    //테이블 생성
    let table = document.createElement('table');
    table.setAttribute('border','1');
    table.setAttribute('width','500px');
    table.setAttribute('height','400px');
    
    //캡션 추가
    let caption = document.createElement('caption');
    caption.setAttribute('style','font-size:30px')
    table.append(caption);

    //캡션 디브 추가
    let captionDiv = document.createElement('div');
    caption.append(captionDiv);

    let prev = document.createElement('span');
    prev.setAttribute('onclick' , 'prevMonth()');
    prev.setAttribute('style','margin:20px');
    let month = document.createElement('span');
    let next = document.createElement('span');
    next.setAttribute('style','margin:20px');
    next.setAttribute('onclick','nextMonth()');
    captionDiv.append(prev);
    captionDiv.append(month);
    captionDiv.append(next);

    prev.innerHTML ='<';
    month.innerHTML ='8월';
    next.innerHTML ='>';


    //행 추가
    let low = document.createElement('tr');
    table.append(low);

    //요일 추가
    let dayArr = ['일','월', '화','수','목','금','토'];
    for(let i = 0 ; i < 7 ; i ++) {
        let day = document.createElement('th');
        day.innerHTML = dayArr[i];
        low.append(day);
    }


    for(let j = 0 ; j <5 ; j++) {
        let week = document.createElement('tr');
        table.append(week);
        for(let i = 0 ; i<7 ; i++) {
            let day = document.createElement('td');
            week.append(day); 
        }
    }

    cal.append(table);
    return cal;
}


let monthDraw = function(cal,date) {

    //오늘
    let today = new Date(date);

    //첫째날
    let firstDate = new Date(date); 
    firstDate.setDate(1); //일 구하기

    //마지막날
    let lastDate = new Date(date);
    lastDate.setMonth(lastDate.getMonth()+1);
    lastDate.setDate(0);

    let row = cal.childNodes[1].childNodes;
    row[0].childNodes[0].childNodes[1].innerHTML = today.getFullYear()+"년 " + (today.getMonth()+1) +"월"

    let dayIdx = 1;
    for(let i = 2 ; i <7 ; i++ ) {
        let col = row[i].childNodes;
        for(let j=0; j < 7 ; j++) {
            
            if(i==2 && j<firstDate.getDay()) {
                col[j].innerHTML = '';
            }else if(i==6 && dayIdx > lastDate.getDate()) {
                col[j].innerHTML = '';

            }else {
                col[j].innerHTML = dayIdx++;
            }
        }
    }
};

    let newDate = new Date();
    //데이 받아서 
    let cal = makeform('.cal_wrap');
    monthDraw(cal, newDate);

let prevMonth = function () {
    newDate.setMonth(newDate.getMonth()-1);
    monthDraw(cal,newDate);
};

let nextMonth = function () {
    newDate.setMonth(newDate.getMonth()+1);
    monthDraw(cal,newDate);
};
</script>
</body>
</html>