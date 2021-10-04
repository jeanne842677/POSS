<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/resources/css/waiting/waiting-page.css">
<style type="text/css">
@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

body{
	font-family:nanumr;
}
</style>
<title>웨이팅 페이지</title>
  </head>
  <body>
    <div class="wrap">
      <div class="left_wrap">
          <div class="logo"><a href="../index"><img src="/resources/image/LOGO2.png"></a></div>
        <div class="wait_team_wrap">
          <div class="wait_team">
            <div class="wait_team_num_wrap">
              <c:if test="${not empty waitingCnt}">
              <div> 현재 대기팀 </div>
              <div class="team_num">${waitingCnt}</div>
              </c:if>
            </div>
            <div style="font-size:20px;">휴대폰 번호를 입력하시면 <br> 문자로 알려드립니다.</div>
          </div>
        </div>
        <div class="wait_time_wrap">
         <c:if test="${not empty waitingCnt}">
          <span>예상시간</span>
          <span id="wait_time">${waitingCnt*10}</span>
          <span>분</span>
          </c:if>
        </div>
      </div>



      <div class="right_wrap">
        <div class=input_wrap>
          <div class="input_ph">
            <div class="ph_text">휴대폰 번호를 입력하세요.</div>
            <div class="phone_wrap">
              <span class="phone_num" >0</span>
              <span class="phone_num" >1</span>
              <span class="phone_num" >0</span>
              <span class="dash">-</span>
              <span class="phone_num" >0</span>
              <span class="phone_num" >0</span>
              <span class="phone_num" >0</span>
              <span class="phone_num" >0</span>
              <span class="dash">-</span>
              <span class="phone_num">0</span>
              <span class="phone_num">0</span>
              <span class="phone_num">0</span>
              <span class="phone_num">0</span>
            </div>
          </div>
          <div class="input_wait">
              <div style="margin-right: 10px;">인원 수 :</div>
              <span class="phone_num">0</span>
              <div>명</div>

          </div>

        </div>
        <div class="keyboard_wrap">
            <table border="1" class="keypad">
              <tr>
                <th data-num="1">1</th>
                <th data-num="2">2</th>
                <th data-num="3">3</th>
              </tr>
              <tr>
                <th data-num="4">4</th>
                <th data-num="5">5</th>
                <th data-num="6">6</th>
              </tr>
              <tr>
                <th data-num="7">7</th>
                <th data-num="8">8</th>
                <th data-num="9">9</th>
              </tr>
              <tr>
                <th data-num="-1" style="font-size: 35px;">뒤로</th>
                <th data-num="0">0</th>
                <th data-num="-2" style="font-size: 35px;" id="insert_waiting_info">등록</th>
              </tr>

            </table>

        </div>
      </div>
    </div>

<%@ include file="/WEB-INF/views/include/modal.jsp" %>



  </body>

</html>