<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Document</title>
   
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css"> 
<%@ include file="/WEB-INF/views/include/head.jsp" %>  
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
    

<style type="text/css">
html, body {
   width: 100%;
   min-width: 1130px;
}
/* 
div {
        border: solid thin;
    }  */

/* header (네비게이션영역)-------------------------------------------------------- */
#header {
   width: 100%;
   height: 80px;
   background-color: #aaa;
}

/*로고*/
.logo {
   width: 155px;
}

/*네비게이션 wrap*/
.navbar-nav {
   -ms-flex-direction: row;
   flex-direction: row;
   justify-content: space-around;
   min-width: 390px;
}

/*메뉴*/
.navbar {
   width: 100%;
   height: 80px;
   display: flex;
   justify-content: space-between;
   font-size: 25px;
   font-weight: bold;
   padding-top: 0;
}

.menugroup {
   width: 43%;
}

/* 메뉴글씨 */
.navbar-dark .navbar-nav .nav-link {
   color: #343a40;
   flex-shrink: 0;
}

.section-wrap {
   width: 1130px;
   display: block;
   margin: auto;
   overflow: auto;
}

/* 메뉴아래 매출관리, 오늘 총 매출------------------------------------------------  */
#title_area {
   width: 100%;
   min-width: 550px;
   height: 100px;
}

.title {
   width: 1130px;
   height: 100px;
   display: flex;
   justify-content: center;
   flex-shrink: 0;
   line-height: 100px;
   position: absolute;
   font-size: 25px;
   color: #343a40;
   font-weight: bolder;
   padding: 10px 0px 0px 0px;
}

 .setting{
        font-size: 40px;
        display: flex;
        justify-content: flex-end;
        padding: 40px 10px 10px 10px;
    }
    
    .setting>i{
        z-index:100;
    }
/* tab영역------------------------------------------------------- */
#tabzone {
   width: 100%;
   height: 40px;
   display: flex;
}

#tabzone>* {
   text-align: center;
   width: 150px;
   margin-left: 10px;
   font-weight: bold;
   border-radius: 5px;
}

.tab1 {
   color: white;
   background-color: #ff8b8b;
   border-style: none;
}

.tab2 {
   color: #343a40;
   background-color: #f9f7e8;
   border-style: none;
}

.tab3 {
   color: white;
   background-color: #ff8b8b;
   border-style: none;
}

/* tap, 조회 */
#search-tab {
   width: 100%;
   height: 150px;
   margin-bottom: 4vw;
}

/* tap, 조회 전체영역 */
.info-form {
   width: 100%;
   height: 100%;
}

/* tap */
.info-tab {
   width: 100%;
   height: 50px;
}

/* tap 버튼 */
.info-tab>button {
   width: 200px;
   height: 100%;
   background-color: rgb(249, 247, 232);
   color: black;
}

.info-tab>button:hover {
   background-color: rgb(255, 167, 167);
   color: white;
}

/* 조회 */
.info-input {
   	width: 100%;
    height: 80px;
    overflow: hidden;
    background-color: rgb(249, 247, 232);
    display: flex;
    align-items: center;
    padding: 0 2vw 0 2vw;
    justify-content: flex-start;
}

/* input-wrap1,2,3 */
.input-wrap1 {
   	width: auto;
    display: flex;
    justify-content: flex-start;
}

.input-wrap2 {
    width: 260px;
    display: flex;
    justify-content: flex-start;
    flex-shrink: 0;
}

.input-wrap3 {
   	width: 12%;
    display: flex;
    flex-shrink: 0;
    justify-content: center;
}

/* 휴대폰 번호 입력란, 카테고리란 */
#tel, #time {
   width: 170px;
   height: 30px;
   font-size: 11px;
}

#tel::placeholder {
   text-align: center;
}

/* 회원 선택 */
.select_member {
   	width: 36%;
    margin-right: 20px;
    align-items: center;
}

.name {
   display: flex;
   align-items: center;
   width: 75px;
}

/* 기간선택 */
.select_date>* {
   margin: 2px 0px 2px 0px;
}

.select_date {
   min-width: 180px;
}

.start, .end {
   width: 130px;
   height: 30px;
   font-size: 13px;
}

.date {
   display: flex;
}

/* 조회버튼 */
#btn-search {
   width: 100px;
   height: 40px;
   background-color: rgb(97, 191, 173);
   color: white;
   border: none;
}

/* 라디오 버튼 wrap */
.radio {
   font-size: 20px;
}

.radio>* {
   margin: 0 10px 0 10px;
}

/* 기간선택 창------------------------------------------------------ */
#showterm {
   width: 100%;
   height: 80px;
   background-color: #f9f7e8;
   display: flex;
   align-items: center;
}

#showterm>* {
   
}



/* footer ----------------------------------------------------------*/
#footer {
   width: 100%;
   width: 100%;
   height: 30px;
   background-color: #78c2ad;
}

/* 표  */
#content {
   display: flex;
   justify-content: center;
   width: 100%;
   height: 65vh;
   margin-top: 9px;
}

.content-wrap {
   width: 100%;
   height: 100%;
   overflow: auto;
}

.content-wrap::-webkit-scrollbar{
     width:10px;
 }
 
 .content-wrap::-webkit-scrollbar-thumb {
    background-color: #444;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  
  .content-wrap::-webkit-scrollbar-track {
    background-color: #ccc;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }

.table th {
   	text-align: center;
    position: sticky;
    top: 0px;
    background-color: #aaa;
    color: #fff;
    z-index: 10;
}

.table td {
   text-align: center;
}

#btn-table {
   border-radius: 5%;
   height: 30px;
   line-height: 20px;
}

.btn-secondary.disabled, .btn-secondary:disabled {
   background-color: #ccc;
   border-color: #ccc;
}

/* 모달창 */
.modal {
   margin-top: 30vh;
}

.modify {
   position: absolute;
   right: 65px;
   color: rgb(97, 191, 173);
   background-color: white;
   border: none;
}

.form-control{
font-size:14px;
}


</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
<form method="post">
<div class="wrap">
    <header id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                    <a href="/index"><img src="/resources/image/LOGO6.png" class="logo"></a>
                   
        <div class="menugroup">
            <ul class="navbar-nav me-auto" class="menu">
                <li class="nav-item">
                  <a class="nav-link" href="#">포스</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/sales/${userId }/confirm">매출관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/board/${userId }/notice">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/waiting/${userId }/waiting-page">웨이팅</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/reserve/${userId }/confirm">예약내역</a>
                </li>
                
            </ul>  
            </div>  
            </nav>
    </header>
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




<script type="text/javascript">
function cancel(reserveIndex,userId) {
	let rtest = reserveIndex;
	let id = userId;
   	setModalTitle('modal1','예약취소');
   	setModalBody('modal1', '정말로 예약을 취소 하시겠습니까?');
   	modal1();
   	setYesFunc = function testFnc(reserveIndex){
   		modal2();
   		setModalTitle('modal2','예약취소 완료');
   	    setModalBody('modal2', '예약이 취소되었습니다.');
   		setOkayFunc = function rCancel(){
   			location.href = '/reserve/'+id+'reserve-cancel?reserveIdx='+rtest;
   		}
   	}
};



      

</script>


</body>
</html>