<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Document</title>
   
<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
   

<style type="text/css">
    
    /* 테두리선 */
    temp{
		border: thin solid;
	}
    
    html,body {
        width:100%;
        min-width: 1200px;
    }
    
    /* 전체 wrap */
	.wrap{
		width: 100%;
		min-width: 800px;
	}

	
    /* header */
    #header{
        width:100%;
        height:80px;
        background-color: #aaa;
        margin-bottom: 4vw;
    }

    .logo {
        width:170px;
        
    }

    .navbar-nav {
        display: -ms-flexbox;
        display: flex;
        -ms-flex-direction: row;
        flex-direction: row;
        padding-left: 0;;
        list-style: none;
        }

    .navbar {
    	display: flex;
        padding-top: 0;
        padding-bottom: 0;
    }

	.navbar a{
		flex-shrink: 0;
	}
	
    #header>.navbar{
        width:100%;
        height: 80px;
        float:right;
    }

    #header>.navbar>ul>li{
        margin-left:30px;
        margin-right:30px;
    }

    .navbar-dark .navbar-nav .nav-link {
        color: #343a40;
        font-size: 25px;
        font-weight: bold;
        margin-left: 30px;
        margin-right: 30px;
    }
/* 예진님 Nav 끝------------------ */

	/* tap, 조회 */
	#search-tab{
		width: 100%;
		height: 150px;
		margin-bottom: 4vw;
	}

	/* tap, 조회 전체영역 */
	.info-form{
		width: 100%;
		height: 100%;
	}
	
	/* tap */
	.info-tab{
		width: 100%;
		height: 50px;
	}
	
	/* tap 버튼 */
	.info-tab>button{
		width: 200px;
		height: 100%;
		background-color: rgb(249, 247, 232);
		color: black;
	}
	
	.info-tab>button:hover{
		background-color: rgb(255, 167, 167);
		color: white;
	}

	/* 조회 */
	.info-input{
		width: 100%;
		height: 100px;
		overflow: hidden;
		background-color: rgb(249, 247, 232);
		display: flex;
		align-items: center;
		padding: 0 2vw 0 2vw;
	}

	/* input-wrap1,2,3 */
	.input-wrap1{
		width: 60%;
		display: flex;
		justify-content: space-between;
	}
	
	.input-wrap2{
		width: 20%;
		display: flex;
		justify-content: space-between;
		flex-shrink: 0;
		margin-left: 10%;
	}
	
	.input-wrap3{
		display: flex;
		justify-content: flex-end;
		flex-shrink: 0;
		width: 10%;
	}
	
	/* 휴대폰 번호 입력란, 카테고리란 */
	#tel, #time{
		width: 250px;
	}

	#tel::placeholder{
		text-align: center;
	}

	/* 조회버튼 */
	#btn-search{
		width: 50px;
		height: 40px;
		background-color: rgb(97, 191, 173);
		color: white;
		border-radius: 15%;
		border: none;
	}

	/* 라디오 버튼 wrap */
	.radio{
		font-size: 20px;
	}

	.radio>*{
		margin: 0 10px 0 10px;
	}

	/* 표 */
	#content{
		display: flex;
		justify-content: center;
		width: 100%;
		height: 50vh;
	}

	.content-wrap{
		width: 90%;
		height: 100%;
		overflow: scroll;
	}
	
	.table th{
		text-align: center;
	}

	.table td{
		text-align: center;
	}

	#btn-table{
		background-color: rgb(97, 191, 173);
		color: white;
		border: none;
		border-radius: 5%;
	}
	
/* 
메인 민트색 : rgb(97, 191, 173)
베이지색 : rgb(249, 247, 232)
라즈베리색 : rgb(255, 167, 167)
진회색 : rgb(127, 127, 127)
진갈색 : rgb(79, 65, 51)
 */
</style>
</head>
<body>
<div class='wrap'>
    <header id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                    <img src="/resources/image/LOGO2.png" class="logo">
                   
			        <div class="navbar">
			            <ul class="navbar-nav me-auto" class="menu">
			                <li class="nav-item">
			                  <a class="nav-link" href="#">포스
			                    <span class="visually-hidden">(current)</span>
			                  </a>
			                </li>
			                <li class="nav-item">
			                  <a class="nav-link" href="#">매출관리</a>
			                </li>
			                <li class="nav-item">
			                  <a class="nav-link" href="#">게시판</a>
			                </li>
			                <li class="nav-item">
			                  <a class="nav-link active" href="#">예약관리</a>
			                </li>
			            </ul>  
			        </div>  
        		</div>
            </nav>
    </header>

	<div id='search-tab'>
			<form class='info-form'>
				<div class='info-tab'>
					<button type="button" class="btn" id='search-all' style='background-color: rgb(255, 167, 167); color: white'>전체조회</button>
					<button type="button" class="btn" id='search-reserve'>예약조회</button>
					<button type="button" class="btn" id='search-cancel'>취소조회</button>
					<!-- 탭 버튼 추가자리 -->
				</div>
				<div class='info-input'>
					
					<div class='input-wrap1'>
						<div>
							회원선택&nbsp<input type='tel' id='tel' placeholder='휴대폰 번호를 입력하세요'>
						</div>
						
						<div>
							기간선택&nbsp<input type='date'>&nbsp-&nbsp<input type='date'>
						</div>
						
						<div>
							시간선택&nbsp
							<select name="time_select" id='time'>
							<option selected disabled>카테고리를 선택하세요</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							</select>
						</div>						
					</div>
					
					<div class='input-wrap2'>
						<div class='radio'>
							<input type="radio" name="duration" checked value="0">당일
							<input type="radio" name="duration" value="3">3일
							<input type="radio" name="duration" value="7">7일			
						</div>
					</div>
					
					<div class='input-wrap3'>
						<button id='btn-search'>조회</button>
					</div>
						
				</div>
			</form>
	</div>
	
	<div id='content'>
		<div class='content-wrap'>
			<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">예약요청일</th>
			      <th scope="col">예약일</th>
			      <th scope="col">예약인원</th>
			      <th scope="col">테이블</th>
			      <th scope="col">예약자</th>
			      <th scope="col">연락처</th>
			      <th scope="col">방문상태</th>
			      <th scope="col">특이사항</th>
			      <th scope="col">예약거절</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td>2021.08.14</td>
			      <td>2021.08.14</td>
			      <td>3명</td>
			      <td>1번</td>
			      <td>이호준</td>
			      <td>010-0000-0000</td>
			      <td>방문</td>
			      <td>아기의자 1개 세팅</td>
			      <td><button id='btn-table'>예약취소</button></td>
			    </tr>
			  </tbody>
			</table>
		</div>
	</div>





</div>
</body>
</html>