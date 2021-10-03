<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
    <title>매출관리</title>
           <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
       <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
   <link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">   
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
   <link rel="stylesheet" href="/resources/css/sales/sales-detail.css">
   
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
        <input type="button" id="tab1" class="tab1" onclick="location.href='/sales/confirm'"  value="전체조회">
        <input type="button" id="tab2" class="tab2" onclick="location.href='/sales/detail'" value="매출내역">
    </section>  

<!-- 매출내역 ============================================================================= -->
<div id="slaes_history" style="display:block;">
   
   <form action='/sales/detail' onsubmit="selectedmonth()" method='POST'>
    <section id="showterm">
        <p class="selectday">기간선택 &nbsp;</p>
        <input type="text" id ="thismonth" name="thismonth" placeholder="날짜를 입력하세요" autocomplete="off" class="start" > 
        
        <div class="seebtn">
            <button type="submit" class="btn btn-primary">조회</button>
        </div>
    </section>
    </form>

    <div id='content'>
        <div class='content-wrap'>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">NO</th>
                  <th scope="col">영업일자</th>
                  <th scope="col">처리여부</th>
                  <th scope="col">거래내용</th>
                  <th scope="col">구분</th>
                  <th scope="col">거래금액</th>
                </tr>
              </thead>
              <tbody>
                 <c:forEach items="${salesList}" varStatus="vs" var="sl">
                   <tr>
                     <td>${vs.index +1}</td>
                     <td>${sl.regDate}</td>
                     <td>정상</td>
                     <td>${sl.title}</td>
                     <c:choose>
                        <c:when test="${sl.payment eq 'P01'}">
                           <td>현금</td>
                        </c:when>
                        <c:otherwise>
                           <td>카카오페이</td>
                        </c:otherwise>
                     </c:choose>
                     <td>${sl.sumPrice}원</td>
                   </tr>
                </c:forEach>
              </tbody>
            </table>
        </div>
    </div>
   
</div>
<!-- 매출내역 end ============================================================================= -->

</div>



<footer id="footer"></footer>
</div>


    



<script type="text/javascript">
//현재 월 이후로 막기
$(document).ready(function(){
    $("#thismonth").datepicker({
            closeText : "닫기",
            prevText : "이전달",
            nextText : "다음달",
            currentText : "오늘",
            changeMonth: true,
            changeYear: true,
            monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            dateFormat: 'yy-mm',
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            maxDate: 0,

        onClose: function(dateText, inst) {
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
        }
    });


    $("#thismonth").focus(function () {
        $(".ui-datepicker-calendar").hide();
        $("#ui-datepicker-div").position({
            my: "center top",
            at: "center bottom",
            of: $(this)
        });
    });
 

});

// 현재 월 기본값으로 표시
  const dday = document.querySelector("#thismonth").value;
  document.querySelector("#thismonth").value = dday;

// 기간 선택 값 받아오기
    function selectedmonth(){
       const dday = document.querySelector("#thismonth").value;
       document.getElementById('thismonth').value = dday;
    }
    

</script>

</body>
</html>