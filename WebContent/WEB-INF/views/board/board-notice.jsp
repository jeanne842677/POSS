<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>poss 게시판 목록 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/> 
<link rel="stylesheet" href="/resources/css/reset.css">
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>

   
<style type="text/css">
html, body{
   width: 100%;
   height: 100%;
   display: flex;
   justify-content: center;
   margin: unset;
}

.now{
   color:white;
}

.wrap_all{
   width:100%;
   height:100%;
   display:flex;
   justify-content: center;
}
.wrap_board {
   width:1130px;
   height:80%;
}


.mobile_nav{
   width:100%;
   display: flex;
   justify-content: space-around;
   align-items: center;
   font-weight: bold;
   height: 50px;
   background-color: rgb(97, 191, 173);
}

.mobile_nav>label:hover{
   color: white;
}

.board_title{
   display: flex;
   width:100%;
   align-items: center;
   height: 50px;
   background-color: rgb(249, 247, 232);
}

.board_title>#board_test{
   width:80%;
   padding-left: 20px;
   font-weight: bold;
}

.back{
   width:10%;
   display:flex;
   justify-content: center;
   align-items: center;
   
}

.find{
   width:30%;
   display:flex;
   align-items: center;
   justify-content: space-around;
}

.board_list{
   height:auto;
   margin-bottom:15px;
}

.board_nav{
   display: flex;
   width:100%;
   align-items: center;
   justify-content: center;
   height:35px;
   font-size: 13px;
   font-weight: bold;
   border-bottom: 2px solid #ccc;
}

.board_content{
   width:100%;
   display: flex;
   align-items: center;
   justify-content: center;
   height:50px;
   font-size: 13px;
   border-bottom: 1px solid #ddd;
}

#idx{
   display:flex;
   width:10%;
   justify-content: center;
}

#title{
   display:flex;
   width:50%;
   justify-content: center;
}

#writer{
   display:flex;
   width:15%;
   justify-content: center;
}

#date{
   display:flex;
   width:20%;
   justify-content: center;
}

#content_idx{
   display:flex;
   width:10%;
   justify-content: center;
}

#content_title{
   display:flex;
   width:50%;
   justify-content: baseline;
   padding:10px;
}

#content_writer{
   display:flex;
   width:15%;
   justify-content: center;
}

#content_date{
   display:flex;
   width:20%;
   justify-content: center;
}

#write_btn{
   width: 80px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    float: right;
    margin-right: 20px;
    background-color: #61bfad;
    font-size: 12px;
}

/* pagenation */
#page{
   display:flex;
   width:100%;
   justify-content: center;
   
}

#page>ul>li{
	margin:10px;
	font-size:22px;
}

#keywordBox {
	width: 50%;
	border-top: none;
	border-left: none;
	border-right: none;
	//border-bottom-color: ;
	background-color: transparent;
}


#keywordBox::placeholder {
	text-align: center;
}

#keywordBox:focus {
		outline:none;
		border-top: none;
		border-left: none;
		border-right: none;
		border-bottom-color: #61bfad;
		}
		
#search {
	width: 60px;
	height: 30px;
	display: flex;
    align-items: center;
    justify-content: center;
    background-color: #61bfad;
    font-size: 12px;
}

</style>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/all.css" rel="stylesheet">
</head>
<body>
<div class="wrap_all">
   <div class='wrap_board'>
      <div class='mobile_nav'>
         <label onclick="location.href='/reserve/${userId}/reservation-form'">예약하기</label>
         <label onclick="location.href='/reserve/${userId}/reservation-lookup'">예약확인</label>
         <label class="now">게시판</label>
      </div>
      <div class='board_title'>
         <div class="back" style=" cursor: pointer;" onclick="location.href='/index';"><i class="fas fa-arrow-left" id='arrow'></i></div>
         <label id='board_test'>게시판</label>
         <div class="find">
         	<i class="fas fa-search">
         	</i><input type="text" id="keywordBox">
         	<button type="button" class="btn btn-primary" id="search" onclick="inputKeyword('${userId}')">검색</button>
         </div>
      </div>
      <div class='board_list' id='list'>
         <div class='board_nav'>
            <label id='idx'>번호</label>
            <label id='title'>제목</label>
            <label id='writer'>작성자</label>
            <label id='date'>작성일</label>
         </div>
         <c:if test="${not empty boardList and empty param.keyword}">
         <c:forEach items="${boardList}" var="bl">
            <div class='board_content' onclick="confirmPrivate(${bl.boardIdx}, ${bl.boardPrivate}, ${bl.boardPw}, '${bl.userId}')">
               <div id='content_idx'><c:out value="${bl.boardNo}"/></div>
               <div id='content_title' type="button">
               <c:if test="${bl.boardPrivate eq 1}"><i class="fas fa-lock"></i><c:out value="${bl.title}"/></c:if>
               <c:if test="${bl.boardPrivate eq 0}"><c:out value="${bl.title}"/></c:if>
               </div>
               <div id='content_writer'><c:out value="${bl.writer}"/></div>
               <div id='content_date'><c:out value="${bl.regDate}"/></div>
            </div>
         </c:forEach>
         </c:if>
         <c:if test="${not empty param.keyword}">
         <c:forEach items="${searchList}" var="sl">
            <div class='board_content' onclick="confirmPrivate(${sl.boardIdx}, ${sl.boardPrivate}, ${sl.boardPw}, '${sl.userId}')">
               <div id='content_idx'><c:out value="${sl.boardNo}"/></div>
               <div id='content_title'>
               <c:if test="${sl.boardPrivate eq 1}"><i class="fas fa-lock"></i><c:out value="${sl.title}"/></c:if>
               <c:if test="${sl.boardPrivate eq 0}"><c:out value="${sl.title}"/></c:if>
               </div>
               <div id='content_writer'><c:out value="${sl.writer}"/></div>
               <div id='content_date'><c:out value="${sl.regDate}"/></div>
            </div>
         </c:forEach>
         </c:if>
      </div>
      <div id="page">
         <c:if test="${empty param.keyword}">
	         <ul class="btn-group pagination">
			    <c:if test="${pageMaker.prev }">
			    <li>
			        <a href='<c:url value="/board/${userId }/notice?page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			    <li>
			        <a href='<c:url value="/board/${userId }/notice?page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			    <li>
			        <a href='<c:url value="/board/${userId }/notice?page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
			    </li>
			    </c:if>
			</ul>
		</c:if>
         <c:if test="${not empty param.keyword}">
	         <ul class="btn-group pagination">
			    <c:if test="${pageMaker.prev }">
			    <li>
			        <a href='<c:url value="/board/${userId }/search?keyword=${searchKeyword}&page=${pageMaker.startPage-1 }"/>'><i class="fa fa-chevron-left"></i></a>
			    </li>
			    </c:if>
			    <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
			    <li>
			        <a href='<c:url value="/board/${userId }/search?keyword=${searchKeyword}&page=${pageNum }"/>'><i class="fa">${pageNum }</i></a>
			    </li>
			    </c:forEach>
			    <c:if test="${pageMaker.next && pageMaker.endPage >0 }">
			    <li>
			        <a href='<c:url value="/board/${userId }/search?keyword=${searchKeyword}&page=${pageMaker.endPage+1 }"/>'><i class="fa fa-chevron-right"></i></a>
			    </li>
			    </c:if>
			</ul>
		</c:if>
      </div>
      <button type="button" class="btn btn-primary" id='write_btn' onclick="location.href='/board/${userId}/write-form'">글쓰기</button>
   </div>
</div>

<script type="text/javascript">
function inputKeyword(userId) {
   let keyword = document.querySelector("#keywordBox").value;
   if(keyword == "") {
	   location.href='/board/'+userId+'/notice';
   }else {
	   location.href='/board/'+userId+'/search?keyword='+keyword;
   }
}

function prev(inputPage) {
   
   let page = inputPage - 1;
   
   if(page == 0){
      alert("전 페이지가 존재하지 않습니다.");
      return;
   }
   
   location.href = "/board/${userId}/notice?page="+page;
}

function confirmPrivate(idxParams, privateParams, pwParams, userId){
   
   if(privateParams == 0){
      location.href = '/board/'+userId+'/post?boardIdx='+idxParams;
   } else if(privateParams == 1){
      let confirmPw = prompt("비밀번호를 입력하세요");
      
      if(confirmPw == pwParams){
         location.href = '/board/'+userId+'/post?boardIdx='+idxParams;
      } else {
         alert("다시 입력하세요!");
         return;
      }
      
   } else {
      alert("오류 발생");
   }
   
}

</script>
</body>
</html>