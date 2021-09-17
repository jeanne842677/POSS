<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<meta charset="UTF-8">
<title>내정보 수정</title>
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
	display: flex;
	justify-content: center;;
}

/* 예약페이지 링크 영역 */
.reservation_page_link{
	width: 30%;
	display: flex;
	justify-content: space-around;
	display: flex;
	margin-left: 20px;
	margin-top: 25px;
}

.reservation_page_link>*{
	flex-shrink: 0;
}

/* 예약페이지 바로가기 버튼 */
#reservation_link_btn{
	border-radius: 15px;
	font-size: 10px;
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
    <div class="wrap">
    	<header id="header">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
            	<div class="nav_wrap">
            		<img src="/resources/image/LOGO2.png" class="logo">
        			<div class="nav_group">
        				<div class="hello">
                  			안녕하세요
            			</div>
            		<div class="user_name">
               			<strong>구현해조</strong> 
               		</div>
               		<div class="nim">님!</div>
            			<button type="button" class="btn btn-secondary" id="main_button" onclick="location.href='/index'">> 메인으로</button>
            		</div>  
            	</div>
            </nav>
    	</header>
	
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
				<div>${myInfo.store_name}</div>
		    	<div>${myInfo.address}</div>
		    	<div>${myInfo.name}</div>
		    	<div>${myInfo.phone}</div>
		    	<div>${myInfo.userId}</div>
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
	</div>
	
	<div class="delete">
		<div><button type="button" class="btn btn-secondary" id="delete_account_btn" onclick="showConfirmDeleteAccount();">> 회원탈퇴</button></div>
	</div>
	
</div>

<script type="text/javascript">

function showConfirmDeleteAccount() {
	if(confirm("정말로 POSS를 탈퇴하시겠습니까?")){
		alert("탈퇴 되었습니다.");
	}else{
		alert("취소 되었습니다.");
		}
	}
	
function modifyInfo(){
	
	let test = prompt("비밀번호 입력하세요~");
	
	if(test != ${myInfo.password}){
		alert("돌아가");
		return;
	}
	
	location.href = "/member/modify-info";
	
}



</script>



</body>
</html>