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
        color: #343a40; 
        background-color: #f9f7e8;
        border-style: none;
    }

    .tab2{
        color:white;
        background-color: #ff8b8b;
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
        width:270px; height:270px;
        min-width: 270px;

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
        height: 50px;
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
    	margin-top: 100px;
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
        height:auto;
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

.c3-chart-arcs-title {
	font-size: 20px;
	font-weight: bold;
}

#content{
      display: flex;
        justify-content: center;
        width: 100%;
        height: 65vh;
        margin-top: 100px;
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

</style>
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
	  

// 기간 선택 값 받아오기
	    function selectedmonth(){
	    const dday = document.querySelector("#thismonth").value;
	    }
    
	    var chart = c3.generate({
	        data: {
	            columns: [
	                ['${nameArr[0]}', '${cntArr[0]}'],
	                ['${nameArr[1]}', '${cntArr[1]}'],
	                ['${nameArr[2]}', '${cntArr[2]}'],
	                ['${nameArr[3]}', '${cntArr[3]}'],
	                ['${nameArr[4]}', '${cntArr[4]}'],
	                
	            ],
	            type : 'donut',
	            colors: {
	            	'${nameArr[0]}' : 'rgb(255, 167, 167)',

	            	'${nameArr[1]}' : 'rgb(97, 191, 173)',

	            	'${nameArr[2]}' : '#6cc3d5',

	            	'${nameArr[3]}' : 'rgb(255, 213, 125)',

	            	'${nameArr[4]}' : 'rgb(249, 247, 232)'
	        	},
	        },
	        donut: {
	            title: "${nameArr[0]}"
	        }
	    });

</script>
</body>
</html>