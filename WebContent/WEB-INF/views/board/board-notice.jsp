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
   width:10%;
   display:flex;
   align-items: center;
   justify-content: center;
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

</style>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/all.css" rel="stylesheet">
</head>
<body>
<div class="wrap_all">
   <div class='wrap_board'>
      <div class='mobile_nav'>
         <label>예약하기</label>
         <label>예약확인</label>
         <label class="now">게시판</label>
      </div>
      <div class='board_title'>
         <div class="back" style=" cursor: pointer;" onclick="location.href='../index';"><i class="fas fa-arrow-left" id='arrow'></i></div>
         <label id='board_test'>게시판</label>
         <div class="find"><i class="fas fa-search" onclick="inputKeyword()"></i></div>
      </div>
      <div class='board_list' id='list'>
         <div class='board_nav'>
            <label id='idx'>번호</label>
            <label id='title'>제목</label>
            <label id='writer'>작성자</label>
            <label id='date'>작성일</label>
         </div>
         <c:if test="${not empty boardList and empty param.search}">
         <c:forEach items="${boardList}" var="bl">
            <div class='board_content' onclick="confirmPrivate(${bl.boardIdx}, ${bl.boardPrivate}, ${bl.boardPw})">
               <div id='content_idx'><c:out value="${bl.boardNo}"/></div>
               <div id='content_title'>
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
            <div class='board_content'>
               <div id='content_idx'><c:out value="${sl.boardNo}"/></div>
               <div id='content_title' onclick="location.href='/board/post?boardIdx=<c:out value="${sl.boardIdx}"/>'"><c:out value="${sl.title}"/></div>
               <div id='content_writer'><c:out value="${sl.writer}"/></div>
               <div id='content_date'><c:out value="${sl.regDate}"/></div>
            </div>
         </c:forEach>
         </c:if>
      </div>
      <div id="page">
         <ul class="pagination">
         <li class="page-item disabled">
            <a class="page-link" href="#">&laquo;</a>
         </li>
         <li class="page-item active">
            <a class="page-link" href="#">1</a>
         </li>
         <li class="page-item">
            <a class="page-link" href="#">2</a>
         </li>
         <li class="page-item">
            <a class="page-link" href="#">3</a>
         </li>
         <li class="page-item">
            <a class="page-link" href="#">4</a>
         </li>
         <li class="page-item">
            <a class="page-link" href="#">5</a>
         </li>
         <li class="page-item">
            <a class="page-link" href="#">&raquo;</a>
         </li>
         </ul>
      </div>

      <button type="button" class="btn btn-primary" id='write_btn' onclick="location.href='/board/write-form'">글쓰기</button>
   </div>
</div>




<!-- <script type="text/javascript">

let idx = 1;

document.querySelector('#write_btn').addEventListener('click', e => {
      
      let textTest1 = prompt('인덱스 입력');
      let textTest2 = prompt('제목 입력');
      let textTest3 = prompt('작성자 입력');
      let textTest4 = prompt('작성일 입력');
   
      let newDiv = document.createElement("div");
      newDiv.setAttribute("class", "board_content");
      newDiv.setAttribute("id", idx);
      
      let addDiv = document.getElementById("list");
      addDiv.appendChild(newDiv);
      
      let childDiv1 = document.createElement("div");
      childDiv1.setAttribute("id", "content_idx");
      childDiv1.innerHTML = textTest1;
      
      let childDiv2 = document.createElement("div");
      childDiv2.setAttribute("id", "content_title");
      childDiv2.innerHTML = textTest2;
      
      let childDiv3 = document.createElement("div");
      childDiv3.setAttribute("id", "content_writer");
      childDiv3.innerHTML = textTest3;
      
      let childDiv4 = document.createElement("div");
      childDiv4.setAttribute("id", "content_date");
      childDiv4.innerHTML = textTest4;

      let addChild = document.getElementById(idx);
      
      addChild.appendChild(childDiv1);
      addChild.appendChild(childDiv2);
      addChild.appendChild(childDiv3);
      addChild.appendChild(childDiv4);
      
      idx++;
});

</script> -->
<script type="text/javascript">
function inputKeyword() {
   let keyword = prompt("검색");
   location.href='/board/search?keyword='+keyword;
}

function confirmPrivate(idxParams, privateParams, pwParams){
	
	if(privateParams == 0){
		location.href = '/board/post?boardIdx='+idxParams;
	} else if(privateParams == 1){
		let confirmPw = prompt("비밀번호를 입력하세요");
		
		if(confirmPw == pwParams){
			location.href = '/board/post?boardIdx='+idxParams;
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