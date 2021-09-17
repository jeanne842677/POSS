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

    /* 메뉴아래 매출관리, 오늘 총 매출------------------------------------------------  */
    #title_area{
        width:100%;
        min-width: 550px;
    }

    .title{
        width:100%;
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

    



    
</style>
</head>
<body>
    <div class="wrap">
    <header id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                    <img src="/resources/image/LOGO6.png" class="logo">
                   
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

    <section id="title_area">
        <div class="title">
            <a>매출관리</a>
        </div>
        
        <div class="todaysales">
            <div class="todaysales_title">오늘 총 매출</div>
            <div class="todaysales_num">576,000 원</div>
        </div>
    </section>

    <section id="tabzone">
        <input type="button" id="tab1" class="tab1" onclick="tab1btnclick()" style="background-color: #f9f7e8; color:#343a40;" value="전체조회">
        <input type="button" id="tab2" class="tab2" onclick="tab2btnclick()" style="background-color: #ff8b8b; color:white;" value="매출내역">
    </section>


     <!-- 전체조회 ============================================================================ -->
     <div id="see_all" style="display:block">

    <section id="showterm">
        <p class="selectday">기간선택 &nbsp;</p>
        <input type="date" class="start" > 
        
        <div class="seebtn">
            <button type="button" class="btn btn-primary">조회</button>
        </div>
    </section>


   
    <div class="con1titlezone">
        <p class="con1_title">[ 매출분석 ]</p>
        <p class="con1_date">2021.08</p>
    </div>

    <section id="content1">
        <div class="analyze">
            <div class="smfont">결제 금액</div>
            <div class="rednum">4,032,000 원</div><br>
            <div class="smfont">결제 건수</div>
            <div class="resnum">480 건</div><br>
            <div class="smfont">평균 결제 금액</div>
            <div class="resnum">8,400 원</div>
        </div>

        <div class="onetopmenu">
            <div class="circle">
            <div class="smfont">인기 상품</div>
            <div class="resnum"><i class="far fa-thumbs-up"></i>TOP 1</div>
            <div class="rednum">아메리카노</div>
            <div class="midfont">총 <b class="bold">480</b> 주문 수 중 <b class="bold">180</b> 주문</div>
            </div>    
        </div>

        <div class="rankmenu">
            <div class="menuname2">2 라떼</div>
            <div class="menuname2">3 허니자몽</div>
            <div class="menuname2">4 아이스초코</div>
            <div class="menuname2">5 망고 에이드</div>
        </div>

        <div class="ordernum">
            <div class="ordernum1">101 주문</div>
            <div class="ordernum1">89 주문</div>
            <div class="ordernum1">65 주문</div>
            <div class="ordernum1">45 주문</div>
        </div>
    </section>

  <hr>

    <section id="title_area2">
        <div class="title2">
            <a>[매출캘린더]</a>
        </div>
        
        <div class="monthsales">
            <div class="monthsales_title">이번달 총 매출 금액</div>
            <div class="monthsales_num">576,000 원</div>
        </div>
     </section>

    <section id="content2">  
            <!-- calender 시작 -->
            <iframe src="calender/index.html" style="z-index:900; width:100%; height:720px "></iframe>  
            <!-- calender 끝 -->
    </section>
    </div>
<!-- 전체조회 end========================================================================= -->


<!-- 매출내역 ============================================================================= -->
<div id="slaes_history" style="display:none;">

    <section id="showterm"></section>

    <p style="height: 500px;"> 매출내역 페이지~~~~</p>
</div>
<!-- 매출내역 end ============================================================================= -->




<footer id="footer"></footer>
</div>


    



<script type="text/javascript">

    function tab1btnclick() {
        let tab1 = document.getElementById('see_all');
        let tab2 = document.getElementById('slaes_history');

        
        if(tab1.style.display === 'none')  {
          tab1.style.display = 'block';
          tab2.style.display = 'none';
          document.getElementById('tab1').style.backgroundColor="#f9f7e8";
          document.getElementById('tab1').style.color="#343a40";
          document.getElementById('tab2').style.backgroundColor="#ff8b8b";
          document.getElementById('tab2').style.color="white";
        }
      } 

      function tab2btnclick() {
        let tab1 = document.getElementById('see_all');
        let tab2 = document.getElementById('slaes_history');
        
        if(tab2.style.display === 'none')  {
          tab2.style.display = 'block';
          tab1.style.display = 'none';
          document.getElementById('tab2').style.backgroundColor="#f9f7e8";
          document.getElementById('tab2').style.color="#343a40";
          document.getElementById('tab1').style.backgroundColor="#ff8b8b";
          document.getElementById('tab1').style.color="white";
        }
      } 



    

</script>


</div>
</body>
</html>