<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>글 상세페이지</title>
<style type="text/css">
html, body{
   width: 100%;
   height: 100%;
   display: flex;
   justify-content: center;
   margin: unset;
   overflow: auto;
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

#edit_btn1{
   width: 80px;
    height: 30px;
    display: flex;
    align-items: center;
    justify-content: center;
    float: right;
    margin-right: 20px;
    background-color: rgb(255, 167, 167);
    font-size: 12px;
}

.valid-msg{
	color:red;	
	font-size:10px;
	border: none;
}
</style>
<link href="/resources/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/all.css" rel="stylesheet">
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

<script type="text/javascript">

function confirmPw(pwParams,userId){
	let password = pwParams;
	let boardId = userId;
	
	modal3();
	setModalTitle('modal3','비밀번호를 입력하세요');
   	setConfirmFunc = function confirmPw(){
   		if(document.getElementById("confirmPw").value == password){
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 완료');
   	   	    setModalBody('modal2', '비밀번호가 확인되었습니다.');
   	   		setOkayFunc = function confirmTrue(){
   				location.href = '/board/'+boardId+'/modify-form';
   			}
   		} else {
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 실패');
   	   	    setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
   	   		setOkayFunc = function rCancel(){
   	   		location.href = '/board/'+boardId+'/post?boardIdx=${board.boardIdx}';
   	   		}
   		}
   	}
}

function confirmPw2(pwParams,userId){
	
	let password = pwParams;
	let boardId = userId;
	
	modal3();
	setModalTitle('modal3','비밀번호를 입력하세요');
   	setConfirmFunc = function confirmPw(){
   		if(document.getElementById("confirmPw").value == password){
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 완료');
   	   	    setModalBody('modal2', '게시글이 삭제되었습니다.');
   	   		setOkayFunc = function confirmTrue(){
   	   			location.href = '/board/'+boardId+'/delete';
   			}
   		} else {
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 실패');
   	   	    setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
   	   		setOkayFunc = function rCancel(){
   	   			location.href = '/board/'+boardId+'/post?boardIdx=${board.boardIdx}';
   	   		}
   		}
   	}

}

function deleteReply(replyIdx, replyPw, userId) {
	
	let password = replyPw;
	let replIdx = replyIdx;
	let replyId = userId;
	
	modal3();
	setModalTitle('modal3','비밀번호를 입력하세요');
   	setConfirmFunc = function confirmPw(){
   		if(document.getElementById("confirmPw").value == password){
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 완료');
   	   	    setModalBody('modal2', '댓글이 삭제되었습니다.');
   	   		setOkayFunc = function confirmTrue(){
   	   			location.href = '/board/'+replyId+'/reply-delete?replyIdx='+replIdx;
   			}
   		} else {
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 실패');
   	   	    setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
   	   		setOkayFunc = function rCancel(){
   	   			location.href = '/board/'+replyId+'/post?boardIdx=${board.boardIdx}';
   	   		}
   		}
   	}
}

(() => {
	document.querySelector('#reply_all').addEventListener('submit', e => {
			
			let pwReg = /^\d{4}$/;
			
			if(!pwReg.test(reply_pw.value)){
				e.preventDefault();
				document.querySelector('#reply_pw').value = "";
				document.querySelector('#pwCheck').innerHTML ='비밀번호는 숫자 4자리입니다.'; 
			}
	})
})();

</script>

</html>