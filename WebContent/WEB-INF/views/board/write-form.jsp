<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/> 
<link rel="stylesheet" href="/resources/css/reset.css">
<link href="/resources/css/all.css" rel="stylesheet">
<link href="/resources/css/board/write-form.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<script defer type="text/javascript" src="/resources/js/board/write-form.js"></script>

</head>
<body>
	<form class="wrap_all" action="/board/${userId}/write" method="post" id="frm_write">
		<div class='wrap_board'> 
			<div class='mobile_nav'>
				<label>예약하기</label>
				<label>예약확인</label>
				<label class="now">게시판</label>
			</div>
			<div class='board_title'>
				<div class="back" style=" cursor: pointer;" onclick="location.href='/board/${userId}/notice'"><i class="fas fa-arrow-left" id='arrow'></i></div>
				<label id='board_test'>새로운 글 작성</label>
			</div>
			<div class='board_list'>
				<div class='content_info'>
					<input type="text" class="form-control form-control-sm" name="writer" id='writer' placeholder="작성자">
					<input type="text" class="form-control form-control-sm" name="title" id='title' placeholder="글 제목">
				</div>
				<textarea  class="form-control form-control-lg" name="content" id="content" placeholder="내용을 입력해주세요"></textarea>
			</div>
			<div class='is_private'>
					<label class="switch">
						<input type="checkbox" name="isPrivate">
						<span class="slider round"></span>
					</label>
					<label id="public">공개</label><label id="private" style="display:none;">비공개</label>
			</div>
			<div class='pw_setting'>
					<label>비밀번호</label>
					<input type="text" size="5" maxlength="4" name="password" id="password">
					<span id="pwCheck" class="valid-msg"> </span>
					<button type="submit" class="btn btn-primary" id='write_btn'>글쓰기</button>
			</div>
		</div>
	</form>



</body>
</html>