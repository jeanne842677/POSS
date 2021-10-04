<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Document</title>
   
<link rel="stylesheet" href="/resources/css/reserve/reserve-okay.css">
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css"> 
<%@ include file="/WEB-INF/views/include/head.jsp" %>  
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<script defer type="text/javascript" src="/resources/js/reserve/reserve-okay.js"></script>
    

</head>
<body>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
<form method="post">
<div class="wrap">
    <%@ include file="/WEB-INF/views/include/nav.jsp" %>
<div class="section-wrap">
    <section id="title_area">
        <div class="title">
            <a>예약내역</a>
        </div>
        <div class="setting" ><i class="fas fa-cog" onclick="location.href='/reserve/${userId }/modify'"></i></div>
        
    </section>

    <section id="tabzone">
       <input type="button" id="tab1" class="tab1" onclick="location.href='/reserve/${userId}/confirm'" value="전체조회">
        <input type="button" id="tab2" class="tab2" onclick="location.href='/reserve/${userId}/okay'" value="예약조회">
        <input type="button" id="tab3" class="tab3" onclick="location.href='/reserve/${userId}/cancel'"  value="취소조회">    
    </section>


     <!-- 전체조회 ============================================================================ -->
     <div id="see_all" >

    <section id="showterm">
        <div class='info-input'>
               
            <div class='input-wrap1'>
                <div class="select_member">
                    <div class="name">회원선택&nbsp;</div><input type='text' class="form-control" id='name' name='name' placeholder='회원 이름을 입력하세요'>
                </div>
                
                <div class="select_date">
                    <div class="date">기간선택&nbsp;</div><label><input type='date' name='startDate' class="start"> - </label>
                    <input type='date' name='endDate' class="end">
                </div>
                
                         
            </div>
            
            <div class='input-wrap2'>
                <div class='radio'>
                    <label><input type="radio" class="form-check-input" name="day" value="0"> 당일</label>
                    <label><input type="radio" class="form-check-input" name="day" value="2"> 3일</label>
                    <label><input type="radio" class="form-check-input" name="day" value="6"> 7일</label>      
                </div>
            </div>
            
            <div class='input-wrap3'>
                <button id='btn-search' type="submit" class="btn btn-primary">조회</button>
            </div>             
        </div>
    </section>

    <div id='content'>
        <div class='content-wrap'>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">예약요청일</th>
                  <th scope="col">예약일</th>
                  <th scope="col">방문시간</th>
                  <th scope="col">예약인원</th>
                  <th scope="col">테이블</th>
                  <th scope="col">예약자</th>
                  <th scope="col">연락처</th>
                  <th scope="col">방문상태</th>
                  <th scope="col">특이사항</th>
                  <th scope="col">예약거절</th>
                </tr>
              </thead>
              <tbody>
                 <c:if test="${not empty reserveList}">
                    <c:forEach items="${reserveList}" var="rl">
                    	<c:if test="${rl.isCancel eq 0}">
	                      <tr>
	                        <td>${rl.regDate}</td>
	                        <td>${rl.reDate}</td>
	                        <td>${rl.reTime}</td>
	                        <td>${rl.num}명</td>
	                        <td>1번</td>
	                        <td>${rl.name}</td>
	                        <td>${rl.phone}</td>
	                        <c:choose>
	                           <c:when test="${rl.isVisit eq 0}">
	                              <td>미방문</td>
	                           </c:when>
	                           <c:otherwise>
	                              <td>방문</td>>
	                           </c:otherwise>
	                        </c:choose>
	                        <td>${rl.content}</td>
	                        <c:choose>
	                           <c:when test="${rl.isCancel eq 0}">
	                              <td><button type="button" id='btn-table' class="btn btn-outline-secondary" onclick="cancel('${rl.reserveIdx}','${rl.userId}')">예약취소</button></td>
	                           </c:when>
	                           <c:otherwise>
	                              <td><button id='btn-table' class="btn btn-secondary disabled"  onclick="cancel()">예약취소</button></td>
	                           </c:otherwise>
	                        </c:choose>
	                      </tr>
	                      </c:if>
                   </c:forEach>
                </c:if>
              </tbody>
            </table>
        </div>
    </div>

        </div>
    </div>
   
    
    </div>
<!-- 전체조회 end========================================================================= -->
</form>
<footer id="footer"></footer>


</body>
</html>