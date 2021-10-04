<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/member/mypage.css?ver=1">
<script defer type="text/javascript" src="/resources/js/member/mypage.js?ver=1"></script>

<style type="text/css">
@font-face{
   font-family:'nanuml';
   src:url(/resources/font/NanumSquareRoundOTFL.otf) format('truetype');
}

body{
   font-family:nanuml;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/include/modal.jsp" %>
       <header id="header">
            <nav class="navbar">
               <div class="nav_wrap">
                  <img src="/resources/image/LOGO2.png" class="logo">
                 <div class="nav_group">
                    <div class="hello">
                           안녕하세요
                     </div>
                  <div class="user_name">
                        <strong>${authentication.name}</strong> 
                     </div>
                     <div class="nim">님!</div>
                     <button type="button" class="btn btn-secondary" id="main_button" onclick="location.href='/index'">> 메인으로</button>
                  </div>  
               </div>
            </nav>
       </header>
    <div class="wrap">
   <div class="my_info_text">내정보</div>
   <div class="info_wrap">
      <div class="my_info">
      &nbsp;<div class="info_title">
            <div>매장명</div>
             <div>매장주소</div>
             <div>대표자명</div>
             <div>대표번호</div>
             <div>아이디</div>
         </div>
         <div class="info">
            <div>${authentication.store_name}</div>
             <div>${authentication.address}</div>
             <div>${authentication.name}</div>
             <div>${authentication.phone}</div>
             <div>${authentication.userId}</div>
         </div>
      </div>
   </div>
   
   
   <div class="modify_my_info">
      <button class="btn btn-lg btn-primary" type="button" id="modify_btn" onclick="modifyInfo()">내정보 수정</button>
   </div>
   
   <div class="line"></div>
   
   <div class="link_wrap">
      <div class="reservation_page_link">
         <div class="text">예약페이지 URL</div>
         <div>https://localhost:9090/reserve/${authentication.userId}/reservation-form</div>
         <button class="btn btn-lg btn-primary" type="button" id="reservation_link_btn" onclick="location.href='/reserve/${authentication.userId}/reservation-form'">> 바로가기</button>
      </div>
      <div class="board_page_link">
         <div class="text">게시판페이지  URL</div>
         <div>https://localhost:9090/board/${authentication.userId}/notice</div>
         <button class="btn btn-lg btn-primary" type="button" id="reservation_link_btn" onclick="location.href='/board/${authentication.userId}/notice'">> 바로가기</button>
      </div>
      </div>
   </div>
   
   <div class="info_page_link">
         <div class="text">POSS 소개 페이지  URL</div>
         <div>https://localhost:9090/member/info-page</div>
         <button class="btn btn-lg btn-primary" type="button" id="reservation_link_btn" onclick="location.href='/member/info-page'">> 바로가기</button>
      </div>
      </div>
   </div>
   
   <div class="delete">
      <div><button type="button" class="btn btn-secondary" id="delete_account_btn">> 회원탈퇴</button></div>
   </div>




</body>
<script type="text/javascript">
function modifyInfo(){
	modal3();
	setModalTitle('modal3','비밀번호 확인');
   	setConfirmFunc = function confirmPw(){
   		if(document.getElementById("confirmPw").value == '${authentication.password}'){
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 완료');
   	   	    setModalBody('modal2', '비밀번호가 확인되었습니다.');
   	   		setOkayFunc = function confirmTrue(){
   				location.href = "/member/modify-info";
   			}
   		} else {
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 실패');
   	   	    setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
   	   		setOkayFunc = function rCancel(){
   	   		location.href = "/member/mypage?userId=${authentication.userId}";
   	   		}
   		}
   	}
	
}

</script>
</html>