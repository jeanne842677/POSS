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
       <script type="text/javascript" src="resources/js/datepicker-ko.js"></script>
       <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">	
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
   

<style type="text/css">
   html, body {
        width:100%;
        min-width:1130px;
    }

    /* div {
        border: solid thin;
    } */


    /* header (네비게이션영역)-------------------------------------------------------- */
    #header{
        width:100%;
        height:80px;
        background-color: #aaa;
    }

    /*로고*/
    .logo {
        width:155px;
    }

    /*네비게이션 wrap*/
    .navbar-nav {
        -ms-flex-direction: row;
        flex-direction: row;
        justify-content: space-around;
        min-width: 390px;
        }

    /*메뉴*/
    .navbar{
        width:100%;
        height: 80px;
        display:flex;
        justify-content: space-between;
        font-size: 25px;
        font-weight: bold;
        padding-top:0;
    }

    .menugroup{
        width:43%; 
    }

    /* 메뉴글씨 */
    .navbar-dark .navbar-nav .nav-link{
        color: #343a40;
        flex-shrink:0;
    }



    .section-wrap{
        width: 1130px;
        display: block;
        margin: auto;
    }


    /* 메뉴아래 매출관리, 오늘 총 매출------------------------------------------------  */
    #title_area{
        width:100%;
        min-width: 550px;
    }

    .title{
        width: 1130px;
        height:100px;  
        display: flex;
        justify-content: center;
        flex-shrink: 0;
        line-height: 100px;
        position: absolute;
        font-size:25px;
        color: #343a40;
        font-weight: bolder;
        padding:10px 0px 0px 0px;
    }

    .todaysales{
        width: 20%;
        min-width: 300px;
        height: 100px;
        float: right;
        display: flex;
        justify-content: center;
        text-align: center;
        flex-direction: column;
        padding:10px 0px 0px 0px;
    }

    .todaysales_title{
        height:50%;  
        line-height: 65px; 
        font-size: 16px; 
        color: #343a40; 
        font-weight: bold;
    }

    .todaysales_num{
        height:50%;
        font-size: 25px;
        font-weight: bold;
        color: #fe4f4f;
    }

    /* tab영역------------------------------------------------------- */
    #tabzone{
        width: 100%;
        height:40px;
        display:flex;
    }

    #tabzone>*{
        text-align: center;
        width:150px;
        margin-left:10px;
        font-weight: bold;
        border-radius: 5px;
    }

    .tab1{
        color:white;
        background-color: #ff8b8b;
        border-style: none;
    }

    .tab2{
        color: #343a40; 
        background-color: #f9f7e8;
        border-style: none;
    }

    

    /* 기간선택 창------------------------------------------------------ */
    #showterm{
        width:100%;
        height:80px;
        display:flex;
        background-color: #f9f7e8;
        display:flex;
        align-items: center;
    }

    #showterm>*{
        margin-left:10px;
    }
    

    /* 매출분석, 기간----------------------------------------------- */
    .con1titlezone{
        width:100%;
        height: 50;
        display:flex;
        justify-content: space-between;
        padding:20px 50px 20px 50px;
        font-size: 23px;
        font-weight: bold;
        color: #343a40;
    }

    /* 매출분석, 메뉴분석---------------------------------------- */
    #content1{
        width:100%;
        min-width: 800px;
        height: 300px;
        display:flex;
        align-items: center;
        justify-content: space-around;
        margin:0px 0px 10px 0px;
    }

    /* 글자 설정 */
    .smfont, .rednum, .resnum, .bold{
        flex-shrink: 0;
    }

    .smfont{
        font-size:15px;
        color:#343a40;
    }

    .rednum{
        font-size:25px;
        font-weight: bold;
        color:#fe4f4f;
    }

    .resnum{
        font-size:25px;
        font-weight: bold;
        color:#343a40;
    }

    .bold{
        font-weight: bold;
    }


    /* 매출분석 */
    .analyze{
        width:30%;
        padding:0px 0px 0px 100px;
    }

    .analyze>*{
        margin:0px 0px 10px 0px;
        width:180px;
    }
    
    /* top메뉴 */
    .onetopmenu{
        width:30%;
        text-align: center;
        border:15px solid #ff8b8b;
        width:270px; height:270px;
        border-radius:270px;
        min-width: 270px;

    }
    .onetopmenu>*{
        justify-content: center;
        padding:52px 10px 10px 10px;
    }

    /* 메뉴 순위 */
    .ordernum {
        min-width: 200px;
        width:15%;
    }

    .rankmenu{
        min-width: 200px;
        width:10%;
    }

    .ordernum>*, .rankmenu>*{
        font-size:16px;
        margin:30px;
        font-weight:bold;
        color:#343a40;
    }

    .ordernum>*{
        padding-left:0px;
        
    }

   /* 매출캘린더 제목, 이번달 총 매출 금액-------------------------------- */
    #title_area2{
        width:100%;
        height: 50;
        display:flex;
        justify-content: space-between;
        padding:20px 50px 20px 50px;  
        min-width: none;
    }

    .title2{
        font-size: 23px;
        font-weight: bold;
        color: #343a40;
        line-height: 50px;
        min-width:140px;
    }

    .monthsales>*{
        margin:0px 0px 3px 0px;
        min-width:300px;
    }
    
    .monthsales_title{
        text-align: center;
        font-size: 16px;
        font-weight: bold;
        color: #343a40;
    }

    .monthsales_num{
       text-align: center;
        font-size: 25px;
        font-weight: bold;
        color: #fe4f4f;
    }

     /* 캘린더--------------------------------------------------- */
    #content2{
        width:100%;
        display: flex;
        justify-content: center;
    }

    /* footer ----------------------------------------------------------*/
    #footer{
        width:100%;
        width:100%;
        height:30px;
        background-color: #61bfad;
    }

    /* 표  */
	#content{
		display: flex;
        justify-content: center;
        width: 100%;
        height: 65vh;
        margin-top: 9px;
	}

	.content-wrap{
		width: 100%;
		height: 100%;
		overflow: auto;
	}
	
	.table th{
		text-align: center;
	}

	.table td{
		text-align: center;
	}

	#btn-table{
		border-radius: 5%;
		height:30px;
		line-height: 20px;
	}

    
    
/* datepicker */
    .ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
    width: 47%;
    float: right;
    }

    .ui-datepicker .ui-datepicker-title select.ui-datepicker-year {
    float: left;
    width: 50%;
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
                  <a class="nav-link" href="#">포스
                    <span class="visually-hidden">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="/sales/confirm">매출관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/board/notice">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">웨이팅</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/reserve/confirm">예약내역</a>
                  </li>
            </ul>  
            </div>  
            </nav>
    </header>
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

    <section id="showterm">
        <p class="selectday">기간선택 &nbsp;</p>
        <input type="text" id ="thismonth" class="start" > 
        
        <div class="seebtn">
            <button type="button" onclick="selectedmonth()" class="btn btn-primary">조회</button>
        </div>
    </section>

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
  document.getElementById('thismonth').value= new Date().toISOString().slice(0, 7);
  const dday = document.querySelector("#thismonth").value;
  document.querySelector(".con1_date").innerText=dday;

// 기간 선택 값 받아오기
    function selectedmonth(){
    const dday = document.querySelector("#thismonth").value;
    document.querySelector(".con1_date").innerText=dday;
    }
    

</script>

</div>
</body>
</html>