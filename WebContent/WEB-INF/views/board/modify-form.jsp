<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/> 
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/all.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/board/modify-form.css">
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script defer type="text/javascript" src="/resources/js/board/modify-form.js"></script>
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
   <form class="wrap_all" action="/board/${board.userId}/modify" method="post" id="frm_modify">
      <div class='wrap_board'> 
         <div class='mobile_nav'>
            <label>예약하기</label>
            <label>예약확인</label>
            <label class="now">게시판</label>
         </div>
         <div class='board_title'>
            <div class="back" style=" cursor: pointer;" onclick="location.href='/board/${board.userId}/notice';"><i class="fas fa-arrow-left" id='arrow'></i></div>
            <label id='board_test'>원본 글 수정하기</label>
         </div>
         <div class='board_list'>
            <div class='content_info'>
               <input type="text" class="form-control form-control-sm" name="writer" id='writer' placeholder="작성자" value="${board.writer}">
               <input type="text" class="form-control form-control-sm" name="title" id='title' placeholder="글 제목" value="${board.title}">
            </div>
            <textarea  class="form-control form-control-lg" name="content" id="content" placeholder="내용을 입력해주세요">${board.boardContent}</textarea>
         </div>
         <div class='is_private'>
               <label class="switch">
                  <input type="checkbox" id='switch' name="isPrivate" checked value="${board.boardPrivate}">
                  <span class="slider round"></span>
               </label>
               <label id="public">공개</label><label id="private" style="display:none;">비공개</label>
         </div>
         <div class='pw_setting'>
               <label>비밀번호</label>
               <input type="text" size="5" maxlength="4" name="password" id="password" value="${board.boardPw}">
               <button type="submit" class="btn btn-primary" id='write_btn'>수정완료</button>
         </div>
      </div>
   </form>



</body>
</html>