<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>


<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/menu/menu-select.css">
    <link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
    <script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
    <script defer type="text/javascript" src="/resources/js/menu/menu-select.js"></script>
    <title>possPage</title>
</head>
<body>


    <div id="header">
        <div class="back" style=" cursor: pointer;" onclick="location.href='/seat/select'"><i class="fas fa-chevron-left"></i> </div>
        <div class="now_order">현재주문 3건 | 09월 06일 오전 9:25</div>
        <div class="modify_toggle">
        	<div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" onclick="location.href='/menu/modify'">
          	</div>
        </div>
        <div id="menubar" type="button"><i class="fas fa-bars"></i></div>
        <div id="menuslide" style="display:none;">
            <div class="slide">
                <ul class="go">
                    <li class="go_home" style=" cursor: pointer;" onclick="location.href='/index';" >메인메뉴</li>
                    <li class="go_sales" style=" cursor: pointer;" onclick="location.href='/sales/${userId}/confirm';">매출관리</li>
                    <li class="go_reserve" style=" cursor: pointer;" onclick="location.href='/reserve/${userId}/confirm';">예약내역</li>
                    <li class="go_waiting" style=" cursor: pointer;" onclick="location.href='/reserve/${userId}/confirm';">웨이팅</li>
                    <li class="go_board" style=" cursor: pointer;" onclick="location.href='/board/${userId}/notice';">게시판</li>
                </ul>
            </div>
        </div>
    </div>

<section id="toggle_off" style="display:block;">
    <div id="content_wrap">

        <div id="content1">
            <div class="table_num">
                <div class="tb_num">${ orderNum }번</div>
                <div class="wait_time">0:00</div>
            </div>


            <div class="order_list" id="total_list">
           		
            </div>

                <div class="order_sum">
    

                    <div class="pay">
                        <div class="paysum">총 금액</div> <div class="paynum" id="totalPrice">0</div>
                    </div>
                </div>
        </div>

              <div id="content2">
          
            <div class="menu_cate">
            
            	<c:forEach items="${menuCatList}" var="mcl" varStatus="status"> 
              		  <div class="cate" style="background-color:${mcl.color}" >
              		  	<div class="cat_box_icon"><img class="cat_box_icon_img" src="/resources/icon/${mcl.icon}.png"></div>
              		  	<div class="cat_box_name">${mcl.name}</div>
              		  </div>
              		  
              		  <script>
          			document.getElementsByClassName('cate')[${status.index}].addEventListener('click' , e=> {
          				fetch('/menu/select-cate?catIdx=${mcl.catIdx}')
              			.then(res=> res.json())
              			.then(menu=> {
              				console.dir(menu);
							createMenu(menu);
              			})
              		});
              		  </script>
                  </c:forEach>

            </div>
            <div class="menu_zone">
	            <div class="menu_name" id="menu_edit">
	           	
	           
	           
	            </div>
            </div>
            <div class="select_commit">
                <div class="cancel" style=" cursor: pointer;" id="selectCancel" onclick="location.href='#';">취소</div>
                <div class="okBtn" style=" cursor: pointer;" onclick="location.href='#';"><i class="far fa-check-circle"></i><p class="hide">확인</p></div>
                <div class="allcancel" style=" cursor: pointer;" onclick="allCancel()"><i class="far fa-times-circle"></i><p class="hide">전체취소</p></div>
                <div class="kakaopay" style=" cursor: pointer;" onclick="kakaoPay()"><i class="far fa-credit-card"></i><p class="hide">카카오페이</p></div>
                <div class="cash" style=" cursor: pointer;" onclick="location.href='#';"><i class="far fa-money-bill-alt"></i><p class="hide">현금</p></div>
            
            </div>       
    </div>
</div>
            

</section>

<%@ include file="/WEB-INF/views/include/modal.jsp" %>

</body>
</html>