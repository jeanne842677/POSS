<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>매출관리</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">	
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.css" integrity="sha512-GQSxWe9Cj4o4EduO7zO9HjULmD4olIjiQqZ7VJuwBxZlkWaUFGCxRkn39jYnD2xZBtEilm0m4WBG7YEmQuMs5Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.12.0/d3.js" integrity="sha512-SuXpPdajLF/GkLBHndpO/A05M1yY4UXJjeeYSbuXRat6E2AUmnG5CVQ0xPtI7IxfXjRmAHoOuOsCqd8yoPup+g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.js" integrity="sha512-11Z4MD9csmC3vH8Vd0eIPJBQu3uEHEqeznWEt3sLBCdQx3zm9mJbBcJH8WTcyGY9EXDE81BNpjE2vLosPK8cFQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="/resources/css/sales/sales-confirm.css">
<script defer type="text/javascript" src="/resources/js/sales/sales-confirm.js"></script>

</head>
<body>
    <div class="wrap">
    <%@ include file="/WEB-INF/views/include/nav.jsp" %>

<div class="section-wrap">
    <section id="title_area">
        <div class="title">
            <a>매출관리</a>
        </div>
        
        <div class="todaysales">
            <div class="todaysales_title">오늘 총 매출</div>
            <div class="todaysales_num">${todaySales} 원</div>
        </div>
    </section>

    <section id="tabzone">
        <input type="button" id="tab1" class="tab1" onclick="location.href='/sales/confirm'" value="전체조회">
        <input type="button" id="tab2" class="tab2" onclick="location.href='/sales/detail'" value="매출내역">
    </section>


     <!-- 전체조회 ============================================================================ -->
     <div id="see_all" style="display:block">
	<form action='/sales/confirm' method='POST'>
    <section id="showterm">
        <p class="selectday">기간선택 &nbsp;</p>
        <input type="text" id ="thismonth" name='thismonth' class="start">         
        <div class="seebtn">
            <button type="submit" onclick="selectedmonth()" class="btn btn-primary">조회</button>
        </div>
    </section>
	</form>

   
    <div class="con1titlezone">
        <p class="con1_title">[ 매출분석 ]</p>
        <p class="con1_date">${period}</p>
    </div>

    <section id="content1">
        <div class="analyze">
            <div class="smfont">결제 금액</div>
            <div class="rednum">${sales} 원</div><br>
            <div class="smfont">결제 건수</div>
            <div class="resnum">${salesCnt} 건</div><br>
            <div class="smfont">평균 결제 금액</div>
            <div class="resnum">${avg} 원</div>
        </div>

		
        <div class="onetopmenu" id="chart"></div>
		
		
        <div class="rankmenu">
       	   <c:forEach items='${nameArr}' var='name' varStatus="vs" begin='1'>
            <div class="menuname2">${vs.index + 1} ${name}</div>
           </c:forEach>
        </div>

        <div class="ordernum">
            <c:forEach items='${cntArr}' var='cnt' begin='1'>
	            <div class="menuname2">${cnt} 주문</div>
            </c:forEach>
        </div>
    </section>

  <hr>

    <section id="title_area2">
        <div class="title2">
            <a>[ 일별매출 ]</a>
        </div>
     </section>

    <section id="content2">  
        <div id='content'>
        <div class='content-wrap'>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">NO</th>
                  <th scope="col">영업일자</th>
                  <th scope="col">거래금액</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="i" begin="0" step="1" end="${arraySize-1}" varStatus="vs">
					<tr>
                     <td>${vs.index + 1}</td>
                     <td>${dailyDate[i]}</td>
                     <td>${dailyPrice[i]} 원</td>
                   </tr>
				</c:forEach>
              </tbody>
            </table>
        </div>
    </div>
    </section>
    </div>
<!-- 전체조회 end========================================================================= -->



</div>



<footer id="footer"></footer>
</div>


    




</body>
</html>