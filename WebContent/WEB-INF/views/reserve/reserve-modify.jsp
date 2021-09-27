<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- datepicker 기간제어 하는데 필요한거 start -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
<!-- datepicker 기간제어 하는데 필요한거 end -->

<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">   
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

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
	flex-direction: column;
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

.radio{
	margin-top: 30px;
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

.select_time{
	margin-top: 20px;
}


/* footer ----------------------------------------- */
.footer {
   width: 100%;
   height: 5vh;
   background-color: rgb(97, 191, 173);
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

</style>
</head>
<body>
<form action="/reserve/${userId}/reserve-modify" method="post">
<div class="wrap">
    <header id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                    <a href="/index"><img src="/resources/image/LOGO6.png" class="logo"></a>
                   
        <div class="menugroup">
            <ul class="navbar-nav me-auto" class="menu">
                <li class="nav-item">
                  <a class="nav-link" href="#">포스</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/sales/${userId }/confirm">매출관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/board/${userId }/notice">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/waiting/${userId }/waiting-page">웨이팅</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/reserve/${userId }/confirm">예약내역</a>
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
					<div class="select_date">
                		<div class="date" id="date" value="">기간선택&nbsp;<label>
                    		<input type="text" class="start" id="start" name="start" value="${reserveConfig.startPeriod}" autocomplete="off"/> - </label>
                    		<input type="text" class="end" id="end" name="end" value="${reserveConfig.endPeriod}" autocomplete="off"/>
                    	</div>
            		</div>
					
					<div class="select_time">
                		<div class="date" id="date" value="">시간선택&nbsp;<label>
                    		<input type="text" class="timepicker" value="${reserveConfig.openTime}" id="openTime" name="openTime" autocomplete="off" placeholder="매장 여는시간"/> - </label>
                    		<input type="text" class="timepicker" value="${reserveConfig.closeTime}" id="endTime" name="endTime" autocomplete="off" placeholder="매장 마감시간"/>
                    	</div>
            		</div>
            		
					<div class='radio'> 
	                    <button type='submit' id='btn-search' class="btn btn-primary">설정</button>
					</div>
				</div>
				
         </div>
        
   
      </div>
   </main>

   <footer class='footer'></footer>


</div>
</form>
<script type="text/javascript">
//****꼭 위에 jquery cdn 3줄 넣어야 동작해요*****
//라디오버튼 선택시 해당 기간으로 설정

//1주
function week() {
      let seven = document.getElementById('7days');
	  let test = '+' + seven.value + 'W';
	  
      if(seven.checked){
         $(function(){  
            $("#start").datepicker();
            $("#end").datepicker();         
            $("#start").datepicker('setDate', $("#start").val());
            $("#end").datepicker('setDate', test);
         });
      }
}

//end 날짜가 start 날짜보다 일찍 넘기지않게 비활성화
$(function() {
        // start Date 설정시 end Date의 min Date 지정
        $("#start").datepicker({
            dateFormat: "yy-mm-dd",
            dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
            monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true,
            changeYear: true,
            minDate:'today',
            onClose: function(selectedDate) {
                $("#end").datepicker( "option", "minDate", selectedDate);
            }
        });
        
         // end Date 설정시 start Date max Date 지정
        $("#end").datepicker({
            dateFormat: "yy-mm-dd",
            dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
            monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true,
            changeYear: true,
            minDate:$("#start").val(),
            onClose: function(selectedDate) {
                $("#start").datepicker("option", "maxDate", selectedDate);
            }
        });

   });
   


$(function() {
	$('#openTime')
	.timepicker({
	    timeFormat: 'HH:mm',
	    interval: 30,
	    startTime: '00:00',
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true,
	    change: function(time){
	    	$('#endTime').timepicker('option', 'minTime', time);
	    	$('#endTime').timepicker('setTime', time);
	    	
	    }
	});
	
	$('#endTime')
	.timepicker({
	    timeFormat: 'HH:mm',
	    interval: 30,
	    dynamic: false,
	    dropdown: true,
	    scrollbar: true,
	    maxTime: '23:30',
	    minTime: $('#openTime').val()
	});
	
});

</script>
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>