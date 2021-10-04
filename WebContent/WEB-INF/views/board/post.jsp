<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>글 상세페이지</title>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/all.css" rel="stylesheet">
<link href="/resources/css/board/post.css" rel="stylesheet">
<script defer type="text/javascript" src="/resources/js/board/post.js"></script>

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
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
   <div class="wrap_all">
      <div class='wrap_board'> 
         <div class='mobile_nav'>
            <label>예약하기</label>
            <label>예약확인</label>
            <label class="now">게시판</label>
         </div>
         <div class='board_title'>
            <div class="back" style=" cursor: pointer;" onclick="location.href='/board/${board.userId}/notice';"><i class="fas fa-arrow-left" id='arrow'></i></div>
            <label id='board_test'>${board.title}</label>
         </div>
         <div class='board_list'>
            <label type="text" readonly="readonly" id="content">${board.boardContent}</label>
            <button type="button" class="btn btn-primary" id='edit_btn1' onclick="confirmPw2(${board.boardPw}, '${board.userId}')">삭제</button>
            <button type="button" class="btn btn-primary" id='edit_btn' onclick="confirmPw(${board.boardPw}, '${board.userId}')">수정</button>
         </div>
         <div class="reply_title">댓글</div>
         
         <div class='reply_list'>
            <form id='reply_all' class='reply_info' action="/board/${board.userId}/reply-write" method='post'>
               <input type='text' id='reply_writer' name='writer' class="form-control form-control-sm" placeholder="작성자">
               <input type='password' maxlength=4 id='reply_pw' name='password' class="form-control form-control-sm" placeholder="암호">
               <input type='text' id='reply' name='content' class="form-control form-control-sm" placeholder="댓글 내용">
               <span id="pwCheck" class="valid-msg"> </span>
               <button id='submit' class="btn btn-primary">등록</button>
         	</form>
      
            <div class='reply_content'>
               <table>
                  <thead>
                     <tr align="center">
                        <th width="50px"></th>
                        <th width="250px"></th>
                        <th width="50px"></th>
                     </tr>
                  </thead>
                  <c:if test="${not empty replyList}">
         		  <c:forEach items="${replyList}" var="rl">
                  <tbody>
                  	<tr>
                  		<td>${rl.replyWriter}</td>
                  		<td>${rl.reply}</td>
                        <td><button id="delete" onclick="deleteReply(${rl.replyIdx},${rl.replyPw}, '${board.userId}')">삭제</button></td>
                  	</tr>
                  </tbody>
                  </c:forEach>
            	  </c:if>
               </table>
            </div>
         </div>
         
      </div>
   </div>
</body>



</html>