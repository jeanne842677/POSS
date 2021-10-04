<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 설정 페이지</title>
<!-- datepicker 기간제어 하는데 필요한거 start -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet"
   href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<!-- datepicker 기간제어 하는데 필요한거 end -->

<link rel="stylesheet" href="/resources/css/reserve/reserve-modify.css">
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script defer type="text/javascript" src="/resources/js/reserve/reserve-modify.js"></script>
<style type="text/css">
@font-face{
	font-family:'nanuml';
	src:url(/resources/font/NanumSquareRoundOTFL.otf) format('truetype');
}

body{
	font-family:nanuml;
}

@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

.title{
	font-family:nanumr;
}

</style>
</head>
<body>
      <div class="wrap">
         <%@ include file="/WEB-INF/views/include/nav.jsp" %>

         <main class='main'>
         <div class="back" style=" cursor: pointer;" onclick="history.back()"><i class="fas fa-arrow-left" id="arrow" aria-hidden="true"></i></div>
         
            <div class='main_wrap'>
         <form action="/reserve/${userId}/reserve-modify" method="post">
               <div class='content1'>
                  <div id='title1'>
                     <div>예약 활성 기간 설정</div>
                  </div>
                  <!-- 캘린더 -->
                  <div id='main1'>
                     <div class="select_date">
                        <div class="date" id="date" value="">
                           기간선택&nbsp;<label> <input type="text" class="start"
                              id="start" name="start" value="${reserveConfig.startPeriod}"
                              autocomplete="off" /> -
                           </label> <input type="text" class="end" id="end" name="end"
                              value="${reserveConfig.endPeriod}" autocomplete="off" />
                        </div>
                     </div>

                     <div class="select_time">
                        <div class="date" id="date" value="">
                           시간선택&nbsp;<label> <input type="text" class="timepicker"
                              value="${reserveConfig.openTime}" id="openTime"
                              name="openTime" autocomplete="off" placeholder="매장 여는시간" /> -
                           </label> <input type="text" class="timepicker"
                              value="${reserveConfig.closeTime}" id="endTime" name="endTime"
                              autocomplete="off" placeholder="매장 마감시간" />
                        </div>
                     </div>

                     <div class='radio'>
                        <button type='submit' id='btn-search' class="btn btn-primary">설정</button>
                     </div>
                  </div>
               </div>
               
               <div class='content2'>
                  <div id='title1'>
                     <div>가게 소개 설정</div>
                  </div>
                  <!-- 캘린더 -->
                  <div id='main1'>
                     <div class='content_info'>
                        <textarea class="form-control form-control-lg" name="content"
                           id="content" placeholder="가게 소개를 입력해주세요">${reserveConfig.storeInfo}</textarea>
                     </div>
                     <div class='radio'>
                        <button type='submit' id='btn-search' class="btn btn-primary">설정</button>
                     </div>
                  </div>
               </div>
               </form>
               <div class='content3'>
                  <div id='title1'>
                     <div>가게 이미지 설정</div>
                  </div>
                  <!-- 캘린더 -->
                  <div id='main1'>
                  <form action="/reserve/${userId}/upload" method="post" enctype="multipart/form-data">
                     <div class="tit_board">
                           	파일 : <input type="file" name="files" id="contract_file"/>
                     </div>
                     <div class='radio'>
                        <button type='submit' id='btn-search' class="btn btn-primary">설정</button>
                     </div>
                     </form>
                  </div>

               </div>
            </div>
         </main>

         <footer class='footer'></footer>


      </div>

   <script
      src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
</body>
</html>