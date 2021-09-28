<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>내정보</title>
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">

<style type="text/css">

html, body {
	width:100%;
}

/* 전체 감싸기 */
.wrap{
	display: flex;
	flex-direction: column;
	justify-content: center;
}

/* 상단바 감싸기 */
.nav_wrap{
	display: flex;
	justify-content: center;
}

/* div,ul,li,a,span {
	border: solid thin;
} */

/*네비게이션영역 */
#header{
	width:100%;
    height:100px;
    background-color: #aaa;
    background-color: white;
    justify-content: center;
}

/*로고*/
.logo {
    width:200px;
}

/*상단바*/
.navbar{
	width:100%;
	height: 90px;
	display:flex;
	font-size: 25px;
	border-bottom: 1px solid;
	justify-content: c;
}

/* 상단바 세부 그룹 */
.nav_group{
	margin-top: 3px;
	display: flex;
}

.nav_group > * {
	flex-shrink:0;
}

/* 구현해조 */
.user_name{
   margin-top: 28px;
   font-size: 20px;
   margin-left: 10px;
   display: flex;
   font-weight: bolder;
   color: black;
}

/* 안녕하세요 */
.hello{
   font-size: 13px;
   margin-top: 33px;
   font-weight: bolder;
}

/* 님 */
.nim{
   font-size: 13px;
   margin-top: 33px;
   margin-left: 10px;
   font-weight: bolder;
}


/* .info_wrap{
	margin-top: 30px;
} */

/* 메인으로 버튼 */
#main_button{
	border-radius: 15px;
	font-size: 12px;
	height: 30px;
	margin-top: 27px;
	margin-left: 20px;
}

/* 내정보 */
.my_info_text{
	font-size: 25px;
	font-weight:bold;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: 30px;
}

/* 매장명 등 감싸는 디브 */
.my_info{
	margin:auto;
	display: flex;
	justify-content: space-around;
	font-size: 20px;
	width: 50%;
	height: 200px;
}

.my_info>*{
	flex-shrink: 0;
}

/* 매장명 매장 주소 등 타이들 */
.info_title{
	display: flex;
	flex-direction: column;
	justify-content: space-between;
}

/* 매장명 매장 주소 등 */
.info{
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 200px;
}

#confirmPw{
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 200px;
}

/* 내정보 수정 */
.modify_my_info{
	margin-top: 50px;
	text-align: center;
}

/* 내정보 수정 버튼 */
#modify_btn{
	width: 750px;
	height: 35px;
	margin-left: 50px;
	font-size: 15px;
	flex-shrink: 0;
}

/* 밑선 */
.line{
	width: 900px;
	border-bottom: 1px black solid;
	align-self: center;
	margin-left: 60px;
	margin-top: 30px;
}

/* 링크 감싸는 */
.link_wrap{
	display: block;
}

/* 예약페이지 링크 영역 */
.reservation_page_link{
    width: 100%;
    display: flex;
    justify-content: center;
    display: flex;
    margin-top: 25px;
    align-items: center;
}

.reservation_page_link>*{
	flex-shrink: 0;
}

/* 예약페이지 바로가기 버튼 */
#reservation_link_btn{
	border-radius: 15px;
	font-size: 10px;
    margin-left:10px;
}



/* 게시판페이지 링크 영역 */
.board_page_link{
	width: 100%;
    display: flex;
    justify-content: center;
    display: flex;
    margin-top: 25px;
    align-items: center;
}

.board_page_link>*{
	flex-shrink: 0;
}

/* 게시판페이지 바로가기 버튼 */
#board_link_btn{
	border-radius: 15px;
	font-size: 10px;
    margin-left:10px;
}





/* 회원탈퇴 영역 */
.delete{
	display: flex;
	justify-content: center;
}

/* 회원탈퇴 버튼 */
#delete_account_btn{
	border-radius: 15px;
	font-size: 10px;
	flex-shrink: 0;
	margin-left: 900px;
	margin-top: 50px;
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
			<div>예약페이지 URL</div>
			<div>https://possreservation.co.kr</div>
			<button class="btn btn-lg btn-primary" type="button" id="reservation_link_btn">> 바로가기</button>
		</div>
		<div class="board_page_link">
			<div>게시판페이지  URL</div>
			<div>https://localhost:9090/board/${authentication.userId}/notice</div>
			<button class="btn btn-lg btn-primary" type="button" id="reservation_link_btn" onclick="location.href='/board/${authentication.userId}/notice'">> 바로가기</button>
		</div>
		</div>
	</div>
	
	<div class="delete">
		<div><button type="button" class="btn btn-secondary" id="delete_account_btn">> 회원탈퇴</button></div>
	</div>
	

<script type="text/javascript">

document.querySelector("#delete_account_btn").addEventListener("click", e => {
	
	let uri = "/member/deleteUser";

	if(confirm("정말로 POSS를 탈퇴하시겠습니까?")){
			let userId = window.prompt("아이디를 입력해주세요");
			let password = window.prompt("비밀번호를 입력해주세요");
		
			fetch(uri+"?userId="+userId+"&password="+ password, {method: "POST"})
			.then(res => res.text())
			.then(text => {
				if (text == "available") {
					alert("탈퇴 되었습니다.");
					location.href="/index";
		         } else if (text == "disable") {
		        	 alert("아이디 및 비밀번호가 일치하지 않습니다.");
		 			return;
		         }
			})
		
		
	}else{
		alert("취소 되었습니다.");
	}
})
	
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



</body>
</html>