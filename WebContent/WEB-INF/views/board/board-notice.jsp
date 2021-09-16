<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>poss 게시판 목록 페이지</title>
<link rel="stylesheet" type="text/css" href="bootstrap.css"/> 
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

label{
	color: black;
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
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/all.css" rel="stylesheet">
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
			<div class="back" style=" cursor: pointer;" onclick="location.href='poss2.html';"><i class="fas fa-arrow-left" id='arrow'></i></div>
			<label id='board_test'>게시판</label>
			<div class="find"><i class="fas fa-search" onclick="prompt('검색할 내용을 입력하세요')"></i></div>
		</div>
		<div class='board_list' id='list'>
			<div class='board_nav'>
				<label id='idx'>번호</label>
				<label id='title'>제목</label>
				<label id='writer'>작성자</label>
				<label id='date'>작성일</label>
			</div>
			<div class='board_content'>
				<div id='content_idx'>1</div>
				<div id='content_title' onclick="location.href='poss4.html'">[질문] 예약 가능한가요?</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>2</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>3</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>4</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>5</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>6</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>7</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>8</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>9</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>10</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>11</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>
			<div class='board_content'>
				<div id='content_idx'>12</div>
				<div id='content_title'>[질문] 예약 문의하고싶어효오오</div>
				<div id='content_writer'>권구현</div>
				<div id='content_date'>2021/08/30</div>
			</div>

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

		<button type="button" class="btn btn-primary" id='write_btn' onclick="location.href='poss3.html'">글쓰기</button>
	</div>
</div>
</body>
</html>