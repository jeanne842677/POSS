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
   <link rel="stylesheet" href="/resources/css/waiting/waiting-confirm.css">
   <script defer type="text/javascript" src="/resources/js/waiting/waiting-confirm.js"></script>
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


</body>
</html>