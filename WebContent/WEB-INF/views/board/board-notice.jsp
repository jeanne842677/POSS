<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<style type="text/css">

html, body{
	width: 100%;
	display: flex;
	justify-content: center;
}

.wrap_board {
	width: 360px;
	height: 640px;
	border: thin;
	border-style: solid;
	border-color: black;
}


.mobile_nav{
	display: flex;
	justify-content: space-around;
	align-items: center;
	font-weight: bold;
	height: 40px;
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
	justify-content: end;
	align-items: center;
	
}

.find{
	width:10%;
	display:flex;
	justify-content: baseline;
	align-items: center;
}

.board_list{
	
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
	width: 66px;
	height: 25px;
	display:flex;
	align-items: center;
	justify-content: center;
	float: right;
	margin-right: 10px;
	background-color: #61bfad;
	font-size: 12px;
}

/* pagenation */
#page{
	display:flex;
	width:100%;
	justify-content: center;
	margin-top:30px;
}

</style>
</head>
<body>

<div class='wrap_board'>
	<div class='mobile_nav'>
		<label>예약하기</label>
		<label>예약확인</label>
		<label>게시판</label>
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
	</div>

	<div id="page">
		<ul class="pagination pagination-sm">
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

</body>
</html>