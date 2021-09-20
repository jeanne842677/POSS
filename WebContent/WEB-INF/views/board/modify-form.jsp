<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성페이지</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.css"/> 
<link rel="stylesheet" href="/resources/css/reset.css">
<script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
<link href="/resources/css/all.css" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
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
   height: 450px;
   padding-left: 5px;
}

.board_list>*{
   margin-top: 10px;
   width: 350px;
}

.content_info{
   display: flex;
   justify-content: space-around;
   align-content: center;
}

.content_info>#writer{
   border: thin;
   border-style: solid;
   border-color: gray;
   border-radius: 5px;
   width: 80px;
}

.content_info>#title{
   border: thin;
   border-style: solid;
   border-color: gray;
   border-radius: 5px;
   width: 260px;
}

#content{
   resize: none;
   border: thin;
   border-style: solid;
   border-color: gray;
   border-radius: 5px;
   height: 400px;
   width:100%;
}

.is_private{
   padding-left: 10px;
    display: flex;
    justify-content: flex-start;
    align-items: center;
}

.switch {
  position: relative;
  display: inline-block;
  width: 54px;
  height: 28px;
}

/* Hide default HTML checkbox */
.switch input {
  opacity: 0;
  width: 0;
  height: 0;
}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 20px;
  width: 20px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

#public, #private{
   font-size: 14px;
    margin-left: 10px;
}

.pw_setting{
   padding-left: 10px;
   margin-top: 20px;
}

.pw_setting>*{
   border: thin;
    border-style: solid;
    border-color: gray;
    border-radius: 5px;
    font-size: 15px;
    width: 80px;
    height: 30px;
}

.pw_setting>label{
   background-color: #f9f7e8;
   margin-right: 1px;
    width: 80px;
    height: 30px;
    text-align: center;
    line-height: 30px;
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
    border: none;
}

</style>
</head>
<body>
   <form class="wrap_all" action="/board/modify" method="post" id="frm_modify">
      <div class='wrap_board'> 
         <div class='mobile_nav'>
            <label>예약하기</label>
            <label>예약확인</label>
            <label class="now">게시판</label>
         </div>
         <div class='board_title'>
            <div class="back" style=" cursor: pointer;" onclick="location.href='notice';"><i class="fas fa-arrow-left" id='arrow'></i></div>
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

<script type="text/javascript">
var check = $("input[type='checkbox']");
check.click(function(){
   $("#public").toggle();
   $("#private").toggle();
});

let switchFnc = document.querySelector("#switch");

if (switchFnc.value == 0){
	switchFnc.removeAttribute("checked");
} else {
	document.getElementById("public").style.display = "none";
	document.getElementById("private").style.display = "block";
}

</script>

</body>
</html>