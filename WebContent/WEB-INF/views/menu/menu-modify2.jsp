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
    <link rel="stylesheet" href="/resources/css/menu/menu-modify2.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
    <script defer type="text/javascript" src="/resources/js/menu/menu-modify2.js"></script>
    <title>possPage</title>
<style type="text/css">
@font-face{
	font-family:'nanumr';
	src:url(/resources/font/NanumSquareRoundOTFR.otf) format('truetype');
}

body{
	font-family:nanumr;
}
</style>
</head>
<body>


    <div id="header">
        <div class="back" style=" cursor: pointer;" onclick="location.href='/seat/select'"><i class="fas fa-chevron-left"></i> </div>
        <div class="now_order">현재주문 3건 | 09월 06일 오전 9:25</div>
        <div class="modify_toggle">
           <div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault" onclick="location.href='/menu/select'">
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

        <div id="content1" style="display: none;">
              <div>
                 클릭하세요~
              </div>
        </div>


   
   <!-- 카테고리 입력창   enctype="multipart/form-data"-->
    <form id="cate_input_wrap" style="display: block;"  method="post" action="/menu/modify-cate?catIdx=${thisCat.catIdx}">
        <div class="writearea">
            <div class="inputmenu">
                <div class="inputmenu_tit">카테고리명</div>
                <div class="input1">
                <input  type="text" name="name" class="form-control" id="cat_name" required="required" value="${thisCat.name}">
                </div>
                <div id="nameCheck1" class="valid-msg" > </div>
            </div>
            <div class="inputcate">
                <div class="inputcate_tit">색깔</div>
                <input class="color" type="color" name="color" id="cat_color" value='${thisCat.color}'>
            </div>
  
            <div class="inputicon">
                <div class="inputicon_tit">아이콘</div>
                <div class="input4"><img class="select-icon" id="select_cat_icon" src="/resources/icon/${ thisCat.icon }.png">
                <input type="text" id="cat_icon" name="icon" readonly value="${thisCat.icon }"></div>
                <button id="icon_cencle" class="btn btn-danger icon_cencle" type="button"> 선택안함 </button>
            <div class="icon_wrap" id="cate_icon_wrap">
            
            
      <%@ include file="/WEB-INF/views/menu/icon.jsp" %>   
            
            
            </div>
         </div>
           
        </div>
        
        <div class="okarea">
            <div class="cancelbtn" style=" cursor: pointer;" >취소</div>
            <button type="submit" class="submitbtn" style=" cursor: pointer;" id="cate_form_btn">수정</button>
        </div>
    </form>




        <!--메뉴 입력창-->
        <form id="menu_input_wrap" style="display:none;" method="post" action="/menu/add-menu?catIdx=${thisCat.catIdx}"> 
            <div class="writearea">
                <div class="inputmenu">
                    <div class="inputmenu_tit">메뉴명</div>
                    <div class="input1">
                       <input required="required" name="name" type="text" class="form-control" id="menu_name">
                    </div>
                    <div id="nameCheck2" class="valid-msg" > </div>
                </div>
                <div class="inputcate">
                    <div class="inputcate_tit">카테고리</div>
                    <div class="input2">
                       <div id="this_cat_name" >
                           ${thisCat.name}
                       </div>
                    </div>
                </div>
                <div class="inputprice">
                    <div class="inputprice_tit">단가</div>
                    <div class="input3"><input type="number" name="price" required="required" class="form-control" id="price"></div>
                </div>
                 <div class="inputcate">
                <div class="inputcate_tit">색깔</div>
                <input class="color" type="color" name="color" id="menu_color" value='#F3969A'>
                  </div>
                <div class="inputicon">
                    <div class="inputicon_tit">아이콘</div>
                    <div class="input4">
                    <img class="select-icon" id="select_menu_icon" src="/resources/icon/ade.png">
                     <input type="text" id="menu_icon" name="icon" readonly value="ade"></div>
               
               <div class="icon_wrap" id="menu_icon_wrap">
               
            
                  <%@ include file="/WEB-INF/views/menu/icon.jsp" %>   
                   </div>
               </div>
               
            </div>
            
            <div class="okarea">
                <div class="cancelbtn" style=" cursor: pointer;" >취소</div>
                <button class="submitbtn" style=" cursor: pointer;" id="addmenu">입력</button>
            </div>
        </form>



 <!-- 카테고리창 부분 -->
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
                       document.getElementById("cate_input_wrap").action ="/menu/modify-cate?catIdx=${mcl.catIdx}";
                       document.getElementById("cate_form_btn").innerHTML = "수정";
                 
                         
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
            <c:forEach items="${menuList}" var="ml" varStatus="status"> 
                   <div class='menulist' style="background-color: ${ ml.color}" >  
                      <i class="fas fa-minus-circle menu_delete_btn"></i>
                      <div class="cat_box_icon"><img class="cat_box_icon_img" src="/resources/icon/${ml.icon}.png"></div>
                      <div class='menu_info'><div class='menutitle'>${ ml.name }</div><div class='menuprice'>${ ml.price }</div></div>
                  </div>
                  
                    
                 <script>
                       
                 document.getElementsByClassName('menu_delete_btn')[${status.index}].addEventListener('click' , e=> {
                   e.stopPropagation(); //이벤트 전파방지
                  
                   location.href="/menu/delete-menu?catIdx=${ml.catIdx}&menuIdx=${ml.menuIdx}";
                
               });
                 </script>
             </c:forEach>
                <div id="addmenuBtn" class="btn btn-light">
                    <div class="addtitle"><i class="fas fa-plus-circle"></i></div>
                </div>

            </div>
   
    </div>
</div>

</section>


</body>
</html>