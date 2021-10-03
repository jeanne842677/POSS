<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>웨이팅 내역</title>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css"/>
   <link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">   
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
   

<style type="text/css">
html, body {
   width: 100%;
   min-width: 1130px;
}

/* div {
        border: solid thin;
    } */

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

.setting {
   font-size: 45px;
   display: flex;
   justify-content: flex-end;
   padding: 40px 10px 10px 10px;
}

.setting>i {
   z-index: 100;
}

/* tab영역------------------------------------------------------- */
#tabzone {
   width: 100%;
   height: 40px;
   display: flex;
}

#tabzone>* {
   text-align: center;
   width: 150px;
   margin-left: 10px;
   font-weight: bold;
   border-radius: 5px;
}

.tab1 {
   color: #343a40;
   background-color: #f9f7e8;
   border-style: none;
}

/* tap, 조회 */
#search-tab {
   width: 100%;
   height: 150px;
   margin-bottom: 4vw;
}

/* tap, 조회 전체영역 */
.info-form {
   width: 100%;
   height: 100%;
}

/* tap */
.info-tab {
   width: 100%;
   height: 50px;
}

/* tap 버튼 */
.info-tab>button {
   width: 200px;
   height: 100%;
   background-color: rgb(249, 247, 232);
   color: black;
}

.info-tab>button:hover {
   background-color: rgb(255, 167, 167);
   color: white;
}

/* 조회 */
.info-input {
   width: 100%;
   height: 80px;
   overflow: hidden;
   background-color: rgb(249, 247, 232);
   display: flex;
   align-items: center;
   padding: 0 2vw 0 2vw;
   justify-content: flex-start;
}

/* input-wrap1,2,3 */
.input-wrap1 {
   width: 60%;
   display: flex;
   justify-content: space-between;
}

.input-wrap2 {
   width: 27%;
   display: flex;
   flex-shrink: 0;
   padding-left: 20px;
}

/* 휴대폰 번호 입력란, 카테고리란 */
#tel, #time {
   width: 170px;
   height: 30px;
   font-size: 11px;
}

#tel::placeholder {
   text-align: center;
}

/* 회원 선택 */
.select_member {
   width: 27%;
   margin-top: auto;
   align-items: center;
}

.name {
   display: flex;
   align-items: center;
   width: 75px;
}

/* 기간선택 */
.select_date>* {
   margin: 2px 0px 2px 0px;
}

.select_date {
   min-width: 180px;
   display: flex;
   margin-left: 20px;
}

.start, .end {
   width: 130px;
   height: 30px;
   font-size: 13px;
}

.date {
   display: flex;
   align-self: center;
   padding-right: 20px;
}


.time {
   display: flex;
}

/* 조회버튼 */
#btn-search {
   width: 100px;
   height: 40px;
   background-color: rgb(97, 191, 173);
   color: white;
   border: none;
   margin-left: 30px;
}

/* 라디오 버튼 wrap */
.radio {
   font-size: 20px;
}

.radio>* {
   margin: 0 10px 0 10px;
}

/* 기간선택 창------------------------------------------------------ */
#showterm {
   width: 100%;
   height: 80px;
   background-color: #f9f7e8;
   display: flex;
   align-items: center;
}

#showterm>* {
   
}

/* footer ----------------------------------------------------------*/
#footer {
   width: 100%;
   width: 100%;
   height: 30px;
   background-color: #61bfad;
}

/* 표  */
#content {
   display: flex;
   justify-content: center;
   width: 100%;
   height: 65vh;
   margin-top: 9px;
}

.content-wrap {
   width: 100%;
   height: 100%;
   overflow: auto;
}

.table th {
   text-align: center;
}

.table td {
   text-align: center;
}

#btn-table {
   border-radius: 5%;
   height: 30px;
   line-height: 20px;
}

.btn-secondary.disabled, .btn-secondary:disabled {
   background-color: #ccc;
   border-color: #ccc;
}

.waiting_content{
   width:100%;
   display: flex;
   align-items: center;
   justify-content: space-around;
   height:50px;
   font-size: 13px;
   border-bottom: 1px solid #ddd;
}


#waiting_idx{
   display:flex;
   width:10%;
   justify-content: center;
}

#waiting_phone{
   display:flex;
   width:10%;
   justify-content: center;
}

#waiting_people{
   display:flex;
   width:10%;
   justify-content: center;
}

#waiting_time{
   display:flex;
   width:10%;
   justify-content: center;
}

.search_date{
font-weight: bold; 
color: black;
margin-left: 190px;
}

</style>
</head>
<body>
    <div class="wrap">
    <%@ include file="/WEB-INF/views/include/nav.jsp" %>

<div class="section-wrap">
    <section id="title_area">
        <div class="title">
            <a>웨이팅 내역</a>
        </div>
        
    </section>

    <section id="tabzone">
        <input type="button" id="tab1" class="tab1" onclick="tab1btnclick()" style="background-color: #f9f7e8; color:#343a40;" value="전체조회">
        </section>


     <!-- 전체조회 ============================================================================ -->
     <div id="see_all" style="display:block">

    <form action="/waiting/waiting-search" id="showterm">
        <div class='info-input'>
                <div class="select_date">
                  <div class="date" id="date">기간선택&nbsp;</div>
                  <div><input class="start" id="start" name="start" placeholder="시작 날짜"/> - 
                  <input class="end" id="end" name="end" placeholder="마지막 날짜"/></div>
                </div>
                <div>
                <button type='submit' id='btn-search' class="btn btn-primary">조회</button>
                </div>
                 <c:if test="${not empty searchWaitingList}">
                <div class="search_date">조회 기간&nbsp;&nbsp; ${start} ~ ${end}</div>
                </c:if>
        </div>
    </form>
   
                
                  

    <div id='content'>
        <div class='content-wrap'>
           <div class='waiting_content'>
               <div id='waiting_idx'>웨이팅 번호</div>
               <div id='waiting_phone'>핸드폰 번호</div>
               <div id='waiting_people'>인원</div>
               <div id='waiting_time'>시간</div>
            </div>
        <c:if test="${not empty waitingList and empty searchWaitingList}">
         <c:forEach items="${waitingList}" var="wl" varStatus="status">
            <div class='waiting_content'>
               <div id='waiting_idx'><c:out value="${wl.waitingNum}"/></div>
               <div id='waiting_phone'><c:out value="${wl.phone}"/></div>
               <div id='waiting_people'><c:out value="${wl.waitingPeople}"/></div>
           	   <div id='waiting_time'><c:out value="${timeList[status.index]}"/></div>
            </div>
         </c:forEach>
         </c:if> 
       <c:if test="${not empty searchWaitingList}">
         <c:forEach items="${searchWaitingList}" var="sl" varStatus="status">
            <div class='waiting_content'>
               <div id='waiting_idx'><c:out value="${sl.waitingNum}"/></div>
               <div id='waiting_phone'><c:out value="${sl.phone}"/></div>
               <div id='waiting_people'><c:out value="${sl.waitingPeople}"/></div>
           	   <div id='waiting_time'><c:out value="${searchTimeList[status.index]}"/></div>
            </div>
         </c:forEach>
         </c:if> 
        </div>
    </div>
   
    
    </div>
<!-- 전체조회 end========================================================================= -->




</div>
<footer id="footer"></footer>
</div>

<script type="text/javascript">
//선택날짜 기간 넘기지않게 비활성화
 $(function() {
        // start Date 설정시 end Date의 min Date 지정
        $( "#start" ).datepicker({
            dateFormat: "yy-mm-dd",
            dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
            monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            defaultDate: "+1w",
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true ,
            changeYear: true,
            maxDate:0,
            onClose: function( selectedDate ) {
                $( "#end" ).datepicker( "option", "minDate", selectedDate );
            }
        });
         // end Date 설정시 start Date max Date 지정
        $( "#end" ).datepicker({
            dateFormat: "yy-mm-dd",
            dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
            monthNames: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            defaultDate: "+1w",
            numberOfMonths: 1,
            changeMonth: true,
            showMonthAfterYear: true ,
            changeYear: true,
         	maxDate:0,
            onClose: function( selectedDate ) {
                $( "#start" ).datepicker( "option", "maxDate", selectedDate );
            }
        });

   });
// 현재 날짜 기본값으로 표시
document.getElementById('start').value = new Date().toISOString().substring(0, 10);
document.getElementById('end').value = new Date().toISOString().substring(0, 10);  


let scrollHeight = document.querySelector('.content-wrap').scrollHeight;
document.querySelector('.content-wrap').scrollTop = scrollHeight;


</script>
</body>
</html>