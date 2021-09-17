<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세페이지</title>
<<<<<<< HEAD
<<<<<<< HEAD
=======
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/> 
<link rel="stylesheet" href="/resources/css/reset.css">
>>>>>>> refs/heads/dev
=======
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/> 
<link rel="stylesheet" href="/resources/css/reset.css">
>>>>>>> refs/heads/dev
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
	width:100%;
	display: flex;
	align-items: center;
	height: 50px;
	background-color: rgb(249, 247, 232);
}

.back{
	width:10%;
	display:flex;
	justify-content: center;
	align-items: center;
	
}


.board_title>#board_test{
	width:80%;
	padding-left: 20px;
	font-weight: bold;
}

.board_list{
	height: auto;
	padding-left: 5px;
	display: inline-block;
	width: 100%;
}

.board_list>*{
	margin-top: 10px;
	width:100%;
}

#content{
	border: solid 1px #ccc;
	resize: none;
	margin-bottom:10px;
	padding:30px 10px 30px 10px;
	height:auto;
	border-radius: 5px;
}

.reply_list{
	border-top: solid 2px #aaa;
	padding-top:30px;
	
}

.reply_title{
	margin:30px 10px 7px 0px;
	width:100%;
	padding-left:30px;
	color:#666;
	font-size:15px;
	font-weight: bold;
}


#reply_all{
	width:80%;
	margin:auto;
	height:80px;
}

.reply_content{
	height:100px;
}

#reply_writer{
	width:20%;
	float:left;
	margin-right:10px;
}

#reply_pw{
	width:20%;
}

#reply{
	width:81%;
	float:left;
	margin:10px 10px 10px 0px;
}

table{
	border-collapse: separate;
	border-spacing: 0 10px;
	width:80%;
	margin:auto;
}

tbody>tr{
	width:100%;
	border-top: thin;
   	border-top-style: solid;
   	border-top-color: gray;
	border-bottom: thin;
	border-bottom-style: solid;
	border-bottom-color: gray;
	padding-bottom: 50px;
}

#submit{
	width: 15%;
	height: 30px;
	display:flex;
	align-items: center;
	justify-content: center;
	background-color: rgb(97, 191, 173);
	font-size: 12px;
	border: thin;
	border-radius: 5px;
	margin:10px 10px 10px 0px;
}

#delete{
	width: 65px;
	height: 30px;
	display:flex;
	align-items: center;
	justify-content: center;
	background-color: rgb(97, 191, 173);
	font-size: 12px;
	border: thin;
	border-radius: 5px;
	margin:10px 10px 10px 0px;
}

#edit_btn{
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


</style>
<<<<<<< HEAD
<<<<<<< HEAD
<link href="resources/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/all.css" rel="stylesheet">
=======

>>>>>>> refs/heads/dev
=======

>>>>>>> refs/heads/dev
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
<<<<<<< HEAD
<<<<<<< HEAD
				<div class="back" style=" cursor: pointer;" onclick="location.href='poss2.html';"><i class="fas fa-arrow-left" id='arrow'></i></div>
				<label id='board_test'>[질문] 예약 가능한가요?</label>
			</div>
			<div class='board_list'>
				<label type="text" readonly="readonly" id="content">예약 가능한가여?</label>
				<button type="button" class="btn btn-primary" id='edit_btn' onclick="location.href='poss3.html'">글수정</button>
=======
				<div class="back" style=" cursor: pointer;" onclick="location.href='notice';"><i class="fas fa-arrow-left" id='arrow'></i></div>
				<label id='board_test'>[질문] 예약 가능한가요?</label>
			</div>
			<div class='board_list'>
				<label type="text" readonly="readonly" id="content">예약 가능한가여?</label>
				<button type="button" class="btn btn-primary" id='edit_btn' onclick="location.href='write-form'">글수정</button>
>>>>>>> refs/heads/dev
=======
				<div class="back" style=" cursor: pointer;" onclick="location.href='notice';"><i class="fas fa-arrow-left" id='arrow'></i></div>
				<label id='board_test'>[질문] 예약 가능한가요?</label>
			</div>
			<div class='board_list'>
				<label type="text" readonly="readonly" id="content">예약 가능한가여?</label>
				<button type="button" class="btn btn-primary" id='edit_btn' onclick="location.href='write-form'">글수정</button>
>>>>>>> refs/heads/dev
			</div>
			<div class="reply_title">댓글</div>
			
			<div class='reply_list'>
				<div id='reply_all' class='reply_info'>
					<input type='text' id='reply_writer' name='writer' class="form-control form-control-sm" placeholder="작성자">
					<input type='password' maxlength=4 id='reply_pw' name='password' class="form-control form-control-sm" placeholder="암호">
					<input type='text' id='reply' name='content' class="form-control form-control-sm" placeholder="댓글 내용">
					<button id='submit' class="btn btn-primary">등록</button>
				</div>
				
				<div class='reply_content'>
					<table>
						<thead>
							<tr align="center">
								<th width="50px"></th>
								<th width="250px"></th>
								<th width="50px"></th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
			
		</div>
	</div>
</body>

<script type="text/javascript">

document.querySelector("#submit").addEventListener("click", e => {
	let tr = document.createElement('tr');
	tr.setAttribute("align", "center");
	let flg = true;
	
	document.querySelectorAll("#reply_all input").forEach(e => {
		if(e.value){
			flg = false;
		} else {
			flg = true;
		}
		
		if(e.id != 'reply_pw'){
			let td = document.createElement('td');
			td.innerHTML = e.value;
			tr.appendChild(td);
		}
	})
	
	if(flg){
		alert("빈칸 없이 입력하세요.");
		return;
	}
	
	let delTd = document.createElement('td');
	delTd.innerHTML = '<button id="delete">삭제</button>';
	delTd.addEventListener('click', () => {
		var write;
		let pw = document.getElementById('reply_pw');
		write = prompt("비밀번호를 입력하세요.");
		if(write == pw){
			alert("정상적으로 삭제되었습니다.")
			tr.remove();
		}else{
			alert("비밀번호가 다릅니다.");
		}
		
	})
	
	tr.appendChild(delTd);
	document.querySelector('tbody').appendChild(tr);
})

</script>
</html>