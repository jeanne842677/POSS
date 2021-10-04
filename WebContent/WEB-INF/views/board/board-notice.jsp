<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>poss 게시판 목록 페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/board/board-notice.css">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/> 
<link rel="stylesheet" href="/resources/css/reset.css">
<script defer type="text/javascript" src="/resources/js/board/board-notice.js"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<style type="text/css">
@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

body{
	font-family:nanumr;
}
</style>
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




</body>
</html>