<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<%@ include file="/WEB-INF/views/include/head.jsp"%>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://bootswatch.com/5/minty/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/menu/menu-modify.css">
    <script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
    <script defer type="text/javascript" src="/resources/js/menu/menu-modify.js?ver=1"></script>
    
    <title>possPage</title>
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


    <div id="header">
        <div class="back" style=" cursor: pointer;" onclick="location.href='/seat/select-seat';"><i class="fas fa-chevron-left"></i> </div>
        <div class="now_order"></div>
        <div class="modify_toggle">
           <div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="" onclick="location.href='/menu/select'">
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
              <div>
               	 메뉴를 클릭하세요
              </div>
        </div>


   
   <!-- 카테고리 입력창   enctype="multipart/form-data"-->
    <form id="cate_input_wrap" style="display: none;"  method="post" action="/menu/add-cate">
        <div class="writearea">
            <div class="inputmenu">
                <div class="inputmenu_tit">카테고리명</div>
                <div class="input1">
                   <input type="text" name="name" class="form-control" id="cat_name" required="required">
                </div>
                <div id="nameCheck" class="valid-msg" > </div>
            </div>
            <div class="inputcate">
                <div class="inputcate_tit">색깔</div>
                <input class="color" type="color" name="color" id="cat_color" value='#F9F7E8'>
            </div>
  
            <div class="inputicon">
                <div class="inputicon_tit">아이콘</div>
                <div class="input4"><img class="select-icon" id="select_cat_icon" src="/resources/icon/ade.png">
                <input type="text" id="cat_icon" name="icon" readonly value="ade"></div>
            <div class="icon_wrap" id="cate_icon_wrap">
            
            
      <%@ include file="/WEB-INF/views/menu/icon.jsp" %>   
            
            
            </div>
         </div>
           
        </div>
        
        <div class="okarea">
            <div class="cancelbtn" style=" cursor: pointer;" >취소</div>
            <button type="submit" class="submitbtn" style=" cursor: pointer;" id="cate_form_btn">입력</button>
        </div>
    </form>


        <div id="content2">
            <div class="menu_cate">
            
               <c:forEach items="${menuCatList}" var="mcl" varStatus="status"> 
                      <div class="cate" style="background-color:${mcl.color}" >
                      <i class="fas fa-minus-circle cat_delete_btn"></i>
                         <div class="cat_box_icon"><img class="cat_box_icon_img" src="/resources/icon/${mcl.icon}.png"></div>
                         <div class="cat_box_name">${mcl.name}</div>
                      </div>
                      
                      <script>
                       document.getElementsByClassName('cate')[${status.index}].addEventListener('click' , e=> {
                         location.href="/menu/menu-list?catIdx=${mcl.catIdx}";
                         
                    });
                       document.getElementsByClassName('cat_delete_btn')[${status.index}].addEventListener('click' , e=> {
                           e.stopPropagation(); //이벤트 전파방지
                          location.href="/menu/delete-cat?catIdx=${mcl.catIdx}";
                        
                       });
                       
                      </script>
                  </c:forEach>
           
     
                <div id="addcateBtn" class="btn btn-light"><i class="fas fa-plus-circle"></i></div>
            </div>
            
            <div class="menu_name" id="menu_edit">
            
            </div>
   
    </div>
</div>

</section>

</body>
</html>