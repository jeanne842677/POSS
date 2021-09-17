<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Document</title>
   
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

    .tab2{
        color:white;
        background-color: #ff8b8b;
        border-style: none;
    }

    .tab3{
        color:white;
        background-color: #ff8b8b;
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
		width: 100%;
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
		justify-content: flex-end;
		flex-shrink: 0;
	}
	
	.input-wrap3{
        width: 8%;
		display: flex;
		flex-shrink: 0;
		justify-content: center;
		
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
    

    /* 매출분석, 기간----------------------------------------------- */
    .con1titlezone{
        width:100%;
        height: 50;
        display:flex;
        justify-content: space-between;
        padding:20px 50px 20px 50px;
        font-size: 23px;
        font-weight: bold;
        color: #343a40;
    }

    /* 매출분석, 메뉴분석---------------------------------------- */
    #content1{
        width:100%;
        min-width: 800px;
        height: 300px;
        display:flex;
        align-items: center;
        justify-content: space-around;
        margin:0px 0px 10px 0px;
    }

    /* 글자 설정 */
    .smfont, .rednum, .resnum, .bold{
        flex-shrink: 0;
    }

    .smfont{
        font-size:15px;
        color:#343a40;
    }

    .rednum{
        font-size:25px;
        font-weight: bold;
        color:#fe4f4f;
    }

    .resnum{
        font-size:25px;
        font-weight: bold;
        color:#343a40;
    }

    .bold{
        font-weight: bold;
    }


    /* 매출분석 */
    .analyze{
        width:30%;
        padding:0px 0px 0px 100px;
    }

    .analyze>*{
        margin:0px 0px 10px 0px;
        width:180px;
    }
    
    /* top메뉴 */
    .onetopmenu{
        width:30%;
        text-align: center;
        border:15px solid #ff8b8b;
        width:270px; height:270px;
        border-radius:270px;
        min-width: 270px;

    }
    .onetopmenu>*{
        justify-content: center;
        padding:52px 10px 10px 10px;
    }

    /* 메뉴 순위 */
    .ordernum {
        min-width: 200px;
        width:15%;
    }

    .rankmenu{
        min-width: 200px;
        width:10%;
    }

    .ordernum>*, .rankmenu>*{
        font-size:16px;
        margin:30px;
        font-weight:bold;
        color:#343a40;
    }

    .ordernum>*{
        padding-left:0px;
        
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


    /* 모달창 */
    .modal{
        margin-top: 30vh;
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
                  <a class="nav-link active" href="/sales/confirm">매출관리</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/board/notice">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">웨이팅</a>
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
            <a>예약내역</a>
        </div>
        
    </section>

    <section id="tabzone">
        <input type="button" id="tab1" class="tab1" onclick="tab1btnclick()" style="background-color: #f9f7e8; color:#343a40;" value="전체조회">
        <input type="button" id="tab2" class="tab2" onclick="tab2btnclick()" style="background-color: #ff8b8b; color:white;" value="예약조회">
        <input type="button" id="tab3" class="tab3" onclick="tab3btnclick()" style="background-color: #ff8b8b; color:white;" value="취소조회">
    </section>


     <!-- 전체조회 ============================================================================ -->
     <div id="see_all" style="display:block">

    <section id="showterm">
        <div class='info-input'>
					
            <div class='input-wrap1'>
                <div class="select_member">
                    <div class="name">회원선택&nbsp;</div><input type='tel' class="form-control" id='tel' placeholder='휴대폰 번호를 입력하세요'>
                </div>
                
                <div class="select_date">
                    <div class="date">기간선택&nbsp;</div><label><input type='date' class="start"> - </label>
                    <input type='date' class="end">
                </div>
                
                <div class="select_time">
                     <div class="time">시간선택&nbsp;</div>
                    <select name="time_select" id='time' class="form-select">
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
                    <label><input type="radio" class="form-check-input" name="duration" checked value="0"> 당일</label>
                    <label><input type="radio" class="form-check-input" name="duration" value="3"> 3일</label>
                    <label><input type="radio" class="form-check-input" name="duration" value="7"> 7일</label>		
                </div>
            </div>
            
            <div class='input-wrap3'>
                <button id='btn-search' class="btn btn-primary">조회</button>
            </div>
                
        </div>
    </section>

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
                  <th scope="col">처리상태</th>
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
                  <td><button id='btn-table' class="btn btn-outline-secondary" onclick="cancel()">예약취소</button></td>
                  <td>-</td>
                </tr>
                <tr>
                  <td>2021.08.10</td>
                  <td>2021.08.10</td>
                  <td>2명</td>
                  <td>1번</td>
                  <td>길예진</td>
                  <td>010-0000-0000</td>
                  <td>방문</td>
                  <td>비건</td>
                  <td><button id='btn-table' class="btn btn-secondary disabled"  onclick="cancel()">예약취소</button></td>
                  <td>정상</td>
                </tr>
                <tr>
                    <td>2021.08.08</td>
                    <td>2021.08.08</td>
                    <td>3명</td>
                    <td>1번</td>
                    <td>이호준</td>
                    <td>010-0000-0000</td>
                    <td>방문</td>
                    <td>아기의자 1개 세팅</td>
                    <td><button id='btn-table' class="btn btn-secondary disabled"  onclick="cancel()">예약취소</button></td>
                    <td>취소</td>
                  </tr>
              </tbody>
            </table>
        </div>
    </div>
   
    
    </div>
<!-- 전체조회 end========================================================================= -->


<!-- 예약내역 ============================================================================= -->
<div id="reserve_history" style="display:none;">

    <section id="showterm">
        <div class='info-input'>
					
            <div class='input-wrap1'>
                <div class="select_member">
                    <div class="name">회원선택&nbsp;</div><input type='tel' class="form-control" id='tel' placeholder='휴대폰 번호를 입력하세요'>
                </div>
                
                <div class="select_date">
                    <div class="date">기간선택&nbsp;</div><label><input type='date' class="start"> - </label>
                    <input type='date' class="end">
                </div>
                
                <div class="select_time">
                     <div class="time">시간선택&nbsp;</div>
                    <select name="time_select" id='time' class="form-select">
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
                    <label><input type="radio" class="form-check-input" name="duration" checked value="0"> 당일</label>
                    <label><input type="radio" class="form-check-input" name="duration" value="3"> 3일</label>
                    <label><input type="radio" class="form-check-input" name="duration" value="7"> 7일</label>		
                </div>
            </div>
            
            <div class='input-wrap3'>
                <button id='btn-search' class="btn btn-primary">조회</button>
            </div>
                
        </div>

    </section>

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
                  <th scope="col">처리상태</th>
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
                  <td>취소</td>
                </tr>
                <tr>
                  <td>2021.08.14</td>
                  <td>2021.08.14</td>
                  <td>3명</td>
                  <td>1번</td>
                  <td>이호준</td>
                  <td>010-0000-0000</td>
                  <td>방문</td>
                  <td>아기의자 1개 세팅</td>
                  <td>취소</td>
                </tr>
              </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 예약내역 end ============================================================================= -->

<!-- 취소내역 ============================================================================= -->
<div id="cancel_history" style="display:none;">

    <section id="showterm">
        <div class='info-input'>
					
            <div class='input-wrap1'>
                <div class="select_member">
                    <div class="name">회원선택&nbsp;</div><input type='tel' class="form-control" id='tel' placeholder='휴대폰 번호를 입력하세요'>
                </div>
                
                <div class="select_date">
                    <div class="date">기간선택&nbsp;</div><label><input type='date' class="start"> - </label>
                    <input type='date' class="end">
                </div>
                
                <div class="select_time">
                     <div class="time">시간선택&nbsp;</div>
                    <select name="time_select" id='time' class="form-select">
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
                    <label><input type="radio" class="form-check-input" name="duration" checked value="0"> 당일</label>
                    <label><input type="radio" class="form-check-input" name="duration" value="3"> 3일</label>
                    <label><input type="radio" class="form-check-input" name="duration" value="7"> 7일</label>		
                </div>
            </div>
            
            <div class='input-wrap3'>
                <button id='btn-search' class="btn btn-primary">조회</button>
            </div>
                
        </div>
    </section>

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
                  <th scope="col">처리상태</th>
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
                  <td>정상</button></td>
                </tr>
                <tr>
                  <td>2021.08.14</td>
                  <td>2021.08.14</td>
                  <td>3명</td>
                  <td>1번</td>
                  <td>이호준</td>
                  <td>010-0000-0000</td>
                  <td>방문</td>
                  <td>아기의자 1개 세팅</td>
                  <td>정상</td>
                </tr>
              </tbody>
            </table>
        </div>
    </div>
</div>
<!-- 취소내역 end ============================================================================= -->

</div>



<footer id="footer"></footer>
</div>


<!-- 모달창 start -->
<div class="modal" style="display:none;" id="modal">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">예약 취소</h5>
          <button type="button" id="close_btn" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true"></span>
          </button>
        </div>
        <div class="modal-body">
          <p>정말로 예약을 취소하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" id="yes" class="btn btn-primary">예</button>
          <button type="button" id="no" class="btn btn-secondary" data-bs-dismiss="modal">아니요</button>
        </div>
      </div>
    </div>
  </div>
<!-- 모달창 end -->

<!-- 모달 예클릭 시 start -->
  <div class="modal" style="display:none;" id="modal2">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">예약 취소 완료</h5>
          <button type="button" id="close_btn" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
            <span aria-hidden="true"></span>
          </button>
        </div>
        <div class="modal-body">
          <p>예약이 취소되었습니다.</p>
        </div>
        <div class="modal-footer">
          <button type="button" id="okay" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div>
<!-- 모달 예클릭 시 end -->



<script type="text/javascript">

    function tab1btnclick() {
        let tab1 = document.getElementById('see_all');
        let tab2 = document.getElementById('reserve_history');
        let tab3 = document.getElementById('cancel_history');

        
        if(tab1.style.display === 'none')  {
          tab1.style.display = 'block';
          tab2.style.display = 'none';
          tab3.style.display = 'none';
          document.getElementById('tab1').style.backgroundColor="#f9f7e8";
          document.getElementById('tab1').style.color="#343a40";
          document.getElementById('tab2').style.backgroundColor="#ff8b8b";
          document.getElementById('tab2').style.color="white";
          document.getElementById('tab3').style.backgroundColor="#ff8b8b";
          document.getElementById('tab3').style.color="white";
        }
      } 

      function tab2btnclick() {
        let tab1 = document.getElementById('see_all');
        let tab2 = document.getElementById('reserve_history');
        let tab3 = document.getElementById('cancel_history');
        
        if(tab2.style.display === 'none')  {
          tab2.style.display = 'block';
          tab1.style.display = 'none';
          tab3.style.display = 'none';
          document.getElementById('tab2').style.backgroundColor="#f9f7e8";
          document.getElementById('tab2').style.color="#343a40";
          document.getElementById('tab1').style.backgroundColor="#ff8b8b";
          document.getElementById('tab1').style.color="white";
          document.getElementById('tab3').style.backgroundColor="#ff8b8b";
          document.getElementById('tab3').style.color="white";
        }
      } 

      function tab3btnclick() {
        let tab1 = document.getElementById('see_all');
        let tab2 = document.getElementById('reserve_history');
        let tab3 = document.getElementById('cancel_history');
        
        if(tab3.style.display === 'none')  {
          tab3.style.display = 'block';
          tab1.style.display = 'none';
          tab2.style.display = 'none';
          document.getElementById('tab3').style.backgroundColor="#f9f7e8";
          document.getElementById('tab3').style.color="#343a40";
          document.getElementById('tab1').style.backgroundColor="#ff8b8b";
          document.getElementById('tab1').style.color="white";
          document.getElementById('tab2').style.backgroundColor="#ff8b8b";
          document.getElementById('tab2').style.color="white";
        }
      }

    // 모달창
    
        let btn = document.getElementById('btn-table');
        let modal = document.getElementById('modal');
        let modal2 = document.getElementById('modal2');
        let closebtn = document.getElementById('close_btn');
        let btnyes = document.getElementById('yes');
        let btnno = document.getElementById('no');
        let btnok = document.getElementById('okay');

        btn.addEventListener('click',function(){
            modal.style.display='block';
        });

        closebtn.addEventListener('click',function(){
            modal.style.display='none';
        });

        btnno.addEventListener('click',function(){
            modal.style.display='none';
        });

        btnyes.addEventListener('click',function(){
            modal.style.display='none';
            modal2.style.display='block';
        });

        btnok.addEventListener('click',function(){
            modal2.style.display='none';
        });


      

</script>


</div>
</body>
</html>