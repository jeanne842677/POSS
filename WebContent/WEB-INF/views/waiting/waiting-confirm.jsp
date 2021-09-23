<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웨이팅 내역</title>
    
	<link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">	
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
   

<style type="text/css">
   html, body {
        width:100%;
        min-width:1130px;
    }

    /* div {
        border: solid thin;
    } */


    /* header (네비게이션영역)-------------------------------------------------------- */
    #header{
        width:100%;
        height:80px;
        background-color: #aaa;
    }

    /*로고*/
    .logo {
        width:155px;
    }

    /*네비게이션 wrap*/
    .navbar-nav {
        -ms-flex-direction: row;
        flex-direction: row;
        justify-content: space-around;
        min-width: 390px;
        }

    /*메뉴*/
    .navbar{
        width:100%;
        height: 80px;
        display:flex;
        justify-content: space-between;
        font-size: 25px;
        font-weight: bold;
        padding-top:0;
    }

    .menugroup{
        width:43%; 
    }

    /* 메뉴글씨 */
    .navbar-dark .navbar-nav .nav-link{
        color: #343a40;
        flex-shrink:0;
    }



    .section-wrap{
        width: 1130px;
        display: block;
        margin: auto;
    }


    /* 메뉴아래 매출관리, 오늘 총 매출------------------------------------------------  */
    #title_area{
        width:100%;
        min-width: 550px;
        height:100px;
    }

    .title{
        width: 1130px;
        height:100px;  
        display: flex;
        justify-content: center;
        flex-shrink: 0;
        line-height: 100px;
        position: absolute;
        font-size:25px;
        color: #343a40;
        font-weight: bolder;
        padding:10px 0px 0px 0px;
    }


    .setting{
        font-size: 45px;
        display: flex;
        justify-content: flex-end;
        padding: 40px 10px 10px 10px;
    }
    
    .setting>i{
        z-index:100;
    }

    /* tab영역------------------------------------------------------- */
    #tabzone{
        width: 100%;
        height:40px;
        display:flex;
    }

    #tabzone>*{
        text-align: center;
        width:150px;
        margin-left:10px;
        font-weight: bold;
        border-radius: 5px;
    }

    .tab1{
        color: #343a40; 
        background-color: #f9f7e8;
        border-style: none;
    }

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
		width: 62%;
		height: 80px;
		overflow: hidden;
		background-color: rgb(249, 247, 232);
		display: flex;
		align-items: center;
		padding: 0 2vw 0 2vw;
        justify-content: space-between
	}

	/* input-wrap1,2,3 */
	.input-wrap1{
		width:60%;
		display: flex;
		justify-content: space-between;
	}
	
	.input-wrap2{
		width: 27%;
		display: flex;
		justify-content: center;
		flex-shrink: 0;
	}




	

	

	/* 휴대폰 번호 입력란, 카테고리란 */
	#tel, #time{
		width: 170px;
		height:30px;
        font-size: 11px;
	}

	#tel::placeholder{
		text-align: center;
	}

	/* 회원 선택 */
	.select_member{
        width:27%;
        margin-top: auto;
		align-items: center;
	}
    .name{
        display:flex;
        align-items: center;
        width: 75px;
    }

	/* 기간선택 */
	.select_date>*{
		margin: 2px 0px 2px 0px; 
	}

	.select_date{
		min-width:180px;
	}

	.start, .end{
		width: 130px;
        height: 30px;
        font-size:13px;
	}

    .date{
        display:flex;
    }

	/* 시간 선택 */
	.select_time{
        width: 20%;
        margin-top: auto;
        align-items: center;
	}

    .time{
        display:flex;
    }

	/* 조회버튼 */
	#btn-search{
		width: 100px;
		height: 40px;
		background-color: rgb(97, 191, 173);
		color: white;
		border: none;
	}

	/* 라디오 버튼 wrap */
	.radio{
		font-size: 20px;
	}

	.radio>*{
		margin: 0 10px 0 10px;
	}


    /* 기간선택 창------------------------------------------------------ */
    #showterm{
        width:100%;
        height:80px;
        background-color: #f9f7e8;
        display:flex;
        align-items: center;
    }

    #showterm>*{
       
    }
    


    

   
     

    /* footer ----------------------------------------------------------*/
    #footer{
        width:100%;
        width:100%;
        height:30px;
        background-color: #61bfad;
    }

    /* 표  */
	#content{
		display: flex;
        justify-content: center;
        width: 100%;
        height: 65vh;
        margin-top: 9px;
	}

	.content-wrap{
		width: 100%;
		height: 100%;
		overflow: auto;
	}
	
	.table th{
		text-align: center;
	}

	.table td{
		text-align: center;
	}

	#btn-table{
		border-radius: 5%;
		height:30px;
		line-height: 20px;
	}


    .btn-secondary.disabled, .btn-secondary:disabled{
        background-color: #ccc;
        border-color: #ccc;
    }

 


    
</style>
</head>
<body>
    <div class="wrap">
    <header id="header">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                    <a href="../index"><img src="/resources/image/LOGO6.png" class="logo"></a>
                   
        <div class="menugroup">
            <ul class="navbar-nav me-auto" class="menu">
                <li class="nav-item">
                  <a class="nav-link" href="#">포스
                    <span class="visually-hidden">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/sales/confirm">매출관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/board/notice">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link active" href="#">웨이팅</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/reserve/confirm">예약내역</a>
                  </li>
            </ul>  
            </div>  
            </nav>
    </header>
<div class="section-wrap">
    <section id="title_area">
        <div class="title">
            <a>웨이팅 내역</a>
        </div>
        
    </section>

    <section id="tabzone">
        <input type="button" id="tab1" class="tab1" onclick="tab1btnclick()" style="background-color: #f9f7e8; color:#343a40;" value="전체조회">
        </section>


     <!-- 전체조회 ============================================================================ -->
     <div id="see_all" style="display:block">

    <section id="showterm">
        <div class='info-input'>
					
            <div class='input-wrap1'>
                
                <div class="select_date">
                    <div class="date">기간선택&nbsp;</div><label><input type='date' class="start"> - </label>
                    <input type='date' class="end">
                </div>
                
                <div class="select_time">
                     <div class="time">시간선택&nbsp;</div>
                    <select name="time_select" id='time' class="form-select">
                    <option selected disabled>카테고리를 선택하세요</option>
                    <option value="1">9:00</option>
                    <option value="2">10:00</option>
                    <option value="3">11:00</option>
                    <option value="4">12:00</option>
                    <option value="5">12:00</option>
                    <option value="6">13:00</option>
                    <option value="7">14:00</option>
                    <option value="8">15:00</option>
                    <option value="9">16:00</option>
                    <option value="10">17:00</option>
                    <option value="11">18:00</option>
                    <option value="12">19:00</option>
                    <option value="13">20:00</option>
                    <option value="14">21:00</option>
                    <option value="15">22:00</option>
                    <option value="16">23:00</option>
                    <option value="17">24:00</option>
                    </select>
                </div>						
            </div>
            
            <div class='input-wrap2'>
                <button id='btn-search' class="btn btn-primary">조회</button>
            </div>
                
        </div>
    </section>

    <div id='content'>
        <div class='content-wrap'>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">웨이팅 번호</th>
                  <th scope="col">핸드폰 번호</th>
                  <th scope="col">인원</th>
                  <th scope="col">시간</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>1</td>
                  <td>010-0000-0000</td>
                  <td>3명</td>
                  <td>13:00</td>
                </tr>
               
              </tbody>
            </table>
        </div>
    </div>
   
    
    </div>
<!-- 전체조회 end========================================================================= -->




</div>



<footer id="footer"></footer>
</div>



</div>
</body>
</html>