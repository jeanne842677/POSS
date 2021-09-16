<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
html, body{
	width: 100%;
	display: flex;
	justify-content: center;
	overflow: auto;
}

.wrap_board {
	width: 360px;
	height: 640px;
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
	width:100%;
	display: flex;
	align-items: center;
	height: 50px;
	background-color: rgb(249, 247, 232);
}

.back{
	width:10%;
	display:flex;
	justify-content: end;
	align-items: center;
	
}


.board_title>#board_test{
	width:80%;
	padding-left: 20px;
	font-weight: bold;
}

.board_list{
	height: 300px;
	padding-left: 5px;
	display: inline-block;
}

.board_list>*{
	margin-top: 10px;
	width: 350px;
}

#content{
	resize: none;
	border: thin;
	border-style: solid;
	border-color: #ccc;
	margin-bottom:10px;
	padding:10px;
	border-radius: 5px;
	height: 300px;
}

.reply_list{
	margin-top: 20px;
}


#reply_all{
	height:120px;
}


#reply_writer{
	width:100px;
	float:left;
	margin:0px 10px 10px 0px;
}

#reply_pw{
	width:100px;
	margin:0px 10px 10px 0px;
}

#reply{
	width:290px;
	float:left;
	margin:0px 10px 10px 0px;
}



table{
	border-collapse: separate;
	border-spacing: 0 10px;
}

tbody>tr{
	border-top: thin;
   	border-top-style: solid;
   	border-top-color: gray;
	border-bottom: thin;
	border-bottom-style: solid;
	border-bottom-color: gray;
	padding-bottom: 50px;
}

#submit, #delete{
	width: 55px;
	height: 30px;
	display:flex;
	align-items: center;
	justify-content: center;
	background-color: rgb(97, 191, 173);
	font-size: 12px;
	border: thin;
	border-radius: 5px;
}

#edit_btn{
	width: 66px;
    height: 25px;
    display: flex;
    align-items: center;
    justify-content: center;
    float: right;
    margin-right: 10px;
    background-color: #61bfad;
    font-size: 12px;
}


</style>
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
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
		<label id='board_test'>[질문] 예약 가능한가요?</label>
	</div>
	<div class='board_list'>
		<label type="text" readonly="readonly" id="content">예약 가능한가여?</label>
	</div>
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
	<button type="button" class="btn btn-primary" id='edit_btn' onclick="location.href='poss3.html'">글수정</button>
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
		alert("빠짐없이 입력하세요");
		return;
	}
	
	let delTd = document.createElement('td');
	delTd.innerHTML = '<button id="delete">삭제</button>';
	delTd.addEventListener('click', () => {
		tr.remove();
	})
	
	tr.appendChild(delTd);
	document.querySelector('tbody').appendChild(tr);
})

</script>
</html>