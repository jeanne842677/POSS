<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
<title>예약 조회페이지</title>

<link href="/resources/css/all.css" rel="stylesheet">
<link href="/resources/css/reset.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<script src="https://bootswatch.com/_vendor/jquery/dist/jquery.min.js"></script>
<script src="https://bootswatch.com/_vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/js/modal.js"></script>
<style type="text/css">
   html, body{
      width: 100%;
      height: 100%;
      display: flex;
      justify-content: center;
      
   }
   
   
   .wrap{
      width:100%;
      height:100%;
      display:flex;
      justify-content: center;
   }
   
   .wrap_res{
      width:1130px;
      height:100%;
   }

   .now{
   color:white;
   }
   
   /* div{
      border: solid thin;
   } */


   /* 상단 네비게이션---------------------------------------------- */
   .nav{
      width:100%;
      display: flex;
      justify-content: space-around;
      align-items: center;
      font-weight: bold;
      height: 50px;
      background-color: rgb(97, 191, 173);
      color:black;
   }
   
   
   .nav>div:hover{
      color: white;
   }

   
   /* text */
   .content{
      width: 100%;
      height:300px;
      padding: 10px;
      display: flex;
      justify-content: center;
   }

   .selectBox {
      width: 400px;
      height: auto;
      border: 5px solid rgba(97, 191, 174, 0.7);
      background-color: white;
      margin-top: 10px;
      padding:20px;
   }

   .box_wrap{
       display:flex;
       flex-direction:column;
   }

   .box_wrap>div{
       margin:10px;
   }

</style>
</head>
<body>

<form class="wrap" action="/reserve/${userId}/reservation-search" method="post" id="frm_lookup">
   <div class="wrap_res">
      <!-- 네비게이션 바 -->
      <div class="nav">
           <div onclick="location.href='/reserve/${userId}/reservation-form'">예약하기</div>
           <div class="now" onclick="location.href='/reserve/${userId}/reservation-lookup'">예약확인</div>
           <div onclick="location.href='/board/${userId}/notice'">게시판</div>
      </div>
      
      <div class="content">
         <div>
            <c:if test="${not empty reserveList}">
               <c:forEach items="${reserveList}" var="rl">
                  <div class="selectBox" onclick="gotoConfirm(${rl.reserveIdx},'${userId}')">
                    <div class="box_wrap">
                            <div id="name">예약자 : <c:out value="${rl.name}"/></div>
                            <div id="phone">연락처 : <c:out value="${rl.phone}"/></div>
                            <div id="cnt">인 원 : <c:out value="${rl.num}"/>인</div>
                            <div id="table">예약날짜 : <c:out value="${rl.reDate}"/></div>
                            <div id="table">예약시간 : <c:out value="${rl.reTime}"/></div>
                    </div>
                  </div>
               </c:forEach>
            </c:if>
            <c:if test="${empty reserveList}">
            	<div class="box_wrap">
					<div id="name">예약내역이 존재하지 않습니다.</div>
				</div>
			</c:if>
         </div>
      </div>
      
   </div>
</form>






<script type="text/javascript">
function gotoConfirm(reserveIdx, userId) {
   location.href='/reserve/'+userId+'/reservation-select?reserveIdx='+reserveIdx;
}
</script>
</body>
</html>