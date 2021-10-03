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
    <title>possPage</title>

</head>
<body>


    <div id="header">
        <div class="back" style=" cursor: pointer;" onclick="location.href='/seat/select-seat';"><i class="fas fa-chevron-left"></i> </div>
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

        <div id="content1">
              <div>
                 클릭하세요~
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


<script type="text/javascript">

   let idx = 0;
   let iconSrc = function(iconName) {
	      
	      return "/resources/icon/" + iconName + ".png";

	      
	   };
	   
    // 토글 ON/OFF 페이지 전환
    function posspage(){
        let tab1 = document.getElementById('toggle_off');
        let tab2 = document.getElementById('toggle_on');
        let toggle = document.getElementById('flexSwitchCheckDefault');

    }

    // 메뉴바
   document.querySelector("#menubar").addEventListener("click", e => {
       let slide = document.getElementById('menuslide');
        
       if(slide.style.display == 'none'){
             slide.style.display = 'flex';    
       } else {
          slide.style.display = 'none';
       }
    })

    
    
    
    //카테고리 눌렀을때
  
       
       
       

    
    //카테고리 추가버튼 눌렀을때 
    document.querySelector("#addcateBtn").addEventListener("click", e=> {
       

         
      document.getElementById("cate_input_wrap").action ="/menu/add-cate"
      document.getElementById("cate_form_btn").innerHTML = "입력";
      
       document.getElementById("cate_input_wrap").style.display ="block";
        document.getElementById("content1").style.display = "none";
        
        
    })
    
    


    
    

      //취소버튼 눌렀을 때 
    document.querySelectorAll(".cancelbtn").forEach(ele=> {


        ele.addEventListener("click", e=> {


        document.getElementById("cate_input_wrap").style.display ="none";
        document.getElementById("content1").style.display = "block";
        

   })



    })
    

 

   
    
    //아이콘 눌렀을 때 
    document.querySelectorAll('.icon').forEach(e=> {


        e.addEventListener('click' , event=>{
         let iconName = event.target.dataset.icon;
            document.querySelector('#cat_icon').value = iconName;
            document.querySelector('.select-icon').src = iconSrc(iconName);
            document.querySelector('.select-icon').style.display="block";
            document.querySelector('#cate_icon_wrap').style.display="none";
        


        })



    })
    
    
     //아이콘 선택했을 때 
    document.querySelector(".select-icon").addEventListener("click", e=> {
       
          document.querySelector(".icon_wrap").style.display ="block";
       
       
    })



    
    document.querySelector('#cate_input_wrap').addEventListener('submit', e => {
       let nameCheck = /^.{1,20}$/; 
       let inputName = document.querySelector('#cat_name').value;
       console.dir(inputName);
       if(!nameCheck.test(inputName)){
          e.preventDefault();
          inputName.innerText = "";
          document.querySelector('#nameCheck').innerHTML ='(최대 20글자)'; 
       }
    })
</script>
</body>
</html>