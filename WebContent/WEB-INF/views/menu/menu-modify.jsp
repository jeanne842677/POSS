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
    <script src="https://kit.fontawesome.com/485bb3ceac.js" crossorigin="anonymous"></script>
    <title>possPage</title>
<style type="text/css">
        html, body {
        width:100%;
        min-width:1130px;
        min-height: 700px;
        height:100%;
        background-color: #ddd;
    }

    

    /* div{
        border: solid 1px;
    } */
    
    /* header ---------------------------------------- */
	  #header {
	    width: 100%;
	    height: 8.5% fixed;
	    background-color: #78c2ad;
	    color: white;
	    display: flex;
	    justify-content: space-between;
	    line-height: 80px;
	    font-size: 30px;
	    min-width: 1130px;
	}

    .back{
        width:3%;
        height:80px;
        text-align:center;
        min-width: 25px;
    }


    .now_order{
        width:83%;
        height:80px;
        font-weight: bold;
        min-width: 520px;
        padding-left:10px
    }
 

    /* 토글버튼 */
    .modify_toggle{
        width:10%;
        min-width: 80px;
        height:80px;
        
    }

    .form-switch .form-check-input{
        border : solid 5px white;
        height: 1.4em;
        width:2.5em;
    }

    .form-check {
        height: 80px;
        display: flex;
        justify-content: space-around;
        align-items: center;
    }
    /* ////토글버튼 끝 */

    /* 네비게이션 */
    #menubar{
        width:4%;
        height:80px;
        text-align: center;
        min-width: 58px;
    }

    #menuslide{
        width: 100%;
        z-index: 1000;
        position: absolute;
        float: right;
        display: flex;
        justify-content: end;
    }

    .slide{
        width: 300px;
        height: 250px;
        background-color: #f9f7e8;
        display: flex;
        position: absolute;
        margin: 80px 10px 10px 10px;
        border-bottom : solid 5px #ccc;
        border-left : solid 5px #ccc;
        border-right : solid 5px #ccc;
        justify-content: center;
    }

    .go{
        width:80%;
        color:#343a40;
        font-size: 23px;
        font-weight: 600;
        text-align: center;
    }

    .go_home, .go_sales, .go_reserve, .go_waiting{
        height: 20%;
        border-bottom : dotted 1px #666;
        line-height: 49px;
    }

    .go_board{
        height: 20%;
        line-height: 49px;
    }
                

    /* content_wrap------------------------------------------------------------------- */
    #content_wrap{
        height:100%;
        padding:10px;
        display: flex;
        justify-content: space-around;
    }

    /* content1 포스페이지 주문리스트------------------------------------------------------------- */
    #content1{
        width:40%;
        min-width: 495px;
        height:100%;
        background-color: transparent;
        color:black;
        padding:10px;
        display:flex;
        justify-content : center;
        align-items: center;
       font-size: 50px;
    }

    /* 테이블번호 */
    .table_num{
        width:100%;
        height:8%;
        display: flex;
        justify-content: space-between;
        border-bottom: solid 1px #888;
    }

    .tb_num{
        width:10%;
        min-width:51px;
        font-size:30px;
        display:flex;
        justify-content: center;
        align-items: center;
        color:#343a40;
        font-weight: bold;
        
    }
    /* 대기시간 */
    .wait_time{
        width:10%;
        min-width:58px;
        font-size:25px;
        display:flex;
        justify-content: center;
        align-items: center;
    }

    /* 주문목록 */
    .order_list{
        width:100%;
        min-width: 477px;
        height: 77%;
        padding: 10px 0px 10px 0px;
        overflow: auto;
    }

    /* 각주문 wrap */
    .selectmenu{
        width:100%;
        min-width: 420px;
        height:100px;
        display:flex;
        justify-content: space-around;
        background : rgb(181, 227, 216);
    }
    /* 메뉴이름 */
    .selectname{
        width:25%;
        min-width: 200px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 25px;
        color:#343a40;
    }
    /* 단가 */
    .oneprice{
        width:25%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 23px;
    }

    /* 개수조절 */
    .plma{
        width:25%;
        height:100%;
        display:flex;
        justify-content: space-around;
        align-items: center;
        font-size:25px;
        color:#343a40;
        font-weight: bold;
    }
    
    /* +,- 버튼 */
    .minus, .plus{
        width:30px;
        height:30px;
        background-color:#bbb;
        border-radius: 8px;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 20px;
        font-weight: bold;
        color:#343a40;
    }

    /* 메뉴당 개수*단가 */
    .resprice{
        width:25%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 25px;
        color:#343a40;
        font-weight: bold;
    }

    /* 주문금액wrap */
    .order_sum{
        width:100%;
        height: 15%;
        border-top: solid 1px #888;
       
    }
    /* 주문금액 */
    .sum{
        width:100%;
        height:50%;
        display: flex;
        justify-content: space-between;
        
    }

    .menusum{
        width:20%;
        min-width:102px;
        height:100%;
        font-size: 25px;
        display:flex;
        justify-content: center;
        align-items: center;
    }

    .ordernum{
        width:20%;
        min-width:142px;
        height:100%;
        font-size: 25px;
        display:flex;
        justify-content: center;
        align-items: center;
    }

    /* 총금액 */
    .pay{
        width:100%;
        height: 50%;
        display: flex;
        justify-content: space-between;
    }

    .paysum{
        width:20%;
        min-width:102px;
        height:100%;
        display:flex;
        font-size: 30px;
        font-weight: bold;
        justify-content: center;
        align-items: center;
    }

    .paynum{
        width:20%;
        min-width:142px;
        height:100%;
        display:flex;
        font-size: 30px;
        font-weight: bold;
        justify-content: center;
        align-items: center;
    }

    /* content2 포스페이지 메뉴리스트------------------------------------------------------------- */
    #content2{
        width:59%;
        height:100%;
        background-color: white;
        margin-left: 10px;
    }

    /* 메뉴카테고리 */
    .menu_cate{
        width:100%;
	    height:20%;
	    min-height:200px;
	    padding:10px;
	    display:flex;
	    align-items: center;
	    border-bottom: solid 1px #888;
	    overflow-y: hidden;
        
    
    }
    
    .menu_cate::-webkit-scrollbar{
     width:10px;
     height:10px;
	 }
	 
	 .menu_cate::-webkit-scrollbar-thumb {
	    background-color: #444;
	    border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
	  }
	  
	  .menu_cate::-webkit-scrollbar-track {
	    background-color: #00ff0000;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
	  }

    .cate , #addcateBtn{
        width:172px;
	    min-width:153px;
	    height:128px;
	    display:flex;
	    flex-direction:column;
	    align-items: center;
	    justify-content: center;
	    color:#343a40;
	    background-color: #f9f7e8;
	    font-size:30px;
	    font-weight: bold;
	    box-shadow: 5px 5px #aaa;
	    margin:0 10px;
	    position:relative;
	    border-radius: 5px;
    }
    
    .cat_box_icon {
       width:50px;
       height:50px; 
    
    }
    
    .cat_box_icon_img {
    
       width:100%;
       height:100%;
    }
    
    .cat_box_name {
    
    
    }

    

        /* 카테고리 추가 */
    #addcateBtn{
      
        color:white;
        background-color: #888;
        font-size:40px;
        font-weight: bold;
        box-shadow: 5px 5px #aaa;
  
    }


    /* 메뉴목록 */
    .menu_name{
        width:100%;
        height:68%;
        padding:10px;
        flex-wrap: wrap;
        display:flex;
        flex-wrap: wrap;
        overflow-x:hidden;
    	overflow-y:scroll;
    }
    
    .menu_name::-webkit-scrollbar{
     width:10px;
 }
 
 .menu_name::-webkit-scrollbar-thumb {
    background-color: #444;
    border-radius: 10px;
    background-clip: padding-box;
    border: 2px solid transparent;
  }
  
  .menu_name::-webkit-scrollbar-track {
    background-color: #00ff0000;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }

    #addmenuBtn{

    width:172px;
    height:30%;
    min-height: 110px;
    background-color:  #888;
    color:white;
    font-size:40px;
    font-weight: bold;
    box-shadow: 5px 5px #aaa;
    margin:10px;

}


    .menu_name>div{
         min-width: 153px;
    height: 25%;
    max-height: 128px;
    min-height: 128px;
    color: black;
    font-size: 100%;
    font-weight: bold;
    box-shadow: 5px 5px #aaa;
    margin: 10px;
    border-radius: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    }

    
    .img_view{
       width:100%;
       height: 80%;
        background-color: gray;
    }
    
    .img_view>img{
       width: 100%;;
       height: 100%;
    }
    
    .menu_info{
       display: flex;
       justify-content: space-around;
    }


    /* 결제방식 */
    .select_commit{
        width:100%;
        height:12%;
        background-color: #666;
        display:flex;
        justify-content: space-around;
        
    }

    .select_commit>*{
        color:white;
    }

    .cancel, .ok, .allcancel, .kakaopay, .cash{
        width:20%;
        display:flex;
        font-size: 25px;
        font-weight: bold;
        justify-content: center;
        align-items: center;
        color:white;
    }

    @media screen and (max-width: 1320px) {
        .hide{
            display: none;
        }
    
    }
  
    /* poss modify ========================================================================================================= */
    #toggle_on{
        width:100%;
        height:91.5%;
    }


    #toggle_off{
        width:100%;
        height:91.5%;
    }


    #menu_input_wrap , #cate_input_wrap {
        width:40%;
        min-width: 440;
        height:100%;
        background-color: white;
        padding:10px;
        min-width: 600px;
    }
   
       /* 메뉴추가 */

       /* 메뉴 입력창 */
       .writearea{
        width:100%;
        height:87%;
        border-bottom: solid 1px #888;
        
    }
    /* 입력칸 제목  메뉴명, 카테고리, 단가, 아이콘, 사진*/
    .inputmenu_tit, .inputcate_tit, .inputprice_tit, .inputicon_tit{
        width:20%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 23px;
        font-weight: bold;
        margin-right:20px;
        
    }

    .inputphoto_tit{
        width:20%;
        display: flex;
        justify-content: center;
        padding-top:25px;
        align-items: baseline;
        font-size: 25px;
        font-weight: bold;
    }

    /* 입력 폼 */
    .input1, .input2, .input3{
        width:60%;
        display: flex;
        justify-content: center;
        align-items: center;
   
    }

    .color {



    }

    .input4{
        width:70%;
        display: flex;
        justify-content: baseline;
        align-items: center;
        font-size:30px;
    }

    

    .input5{
        width:70%;
        display: flex;
        justify-content: center;
        padding-top:20px;
        align-items: baseline;
    }


    /* 입력창 각 영역 wrap */
    .inputmenu{
        width:100%;
        height:17.5%;
        display:flex;
    }

    .inputcate{
        width:100%;
        height:17.5%;
        display:flex;
        align-items: center;
    }

    .inputprice{
        width:100%;
        height:17.5%;
        display:flex;
    }

    .inputicon{
        width:100%;
        height:17.5%;
        display:flex;
        position: relative;
        align-items: center;
    }

    .inputphoto{
        width:100%;
        height:30%;
        display:flex;
    }

    /* 메뉴입력 submit */
    .okarea{
        width:100%;
        height:13%;
        display:flex;
        justify-content: space-around;
    }

    .cancelbtn, .submitbtn{
        width:50%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 25px;
        font-weight: bold;
    }


    
 #cat_icon  {
background-color: transparent;
border: none;
width:120px;
font-size: 20px;
margin-left: 10px;

}

#cat_icon {
outline:none;

}

.icon_wrap {
   position: absolute;
   top:90px;
   left:110px;
       
    background-color: RGB(242, 242, 242);
     width:440px;
    height: 210px;
    overflow: auto;
    display: none;
    border: solid RGB(189, 189, 189) thin;
   

}

.icon_wrap::-webkit-scrollbar {
  width: 10px;  /* 세로축 스크롤바 길이 */
  color:black;
  
}

.icon_wrap::-webkit-scrollbar-track {
  background-color: gray;
}


.icon_wrap::-webkit-scrollbar-thumb {

    background-color: black;

}


.icon {

    width:50px;
    padding: 5px;
    margin: 3px;

}

.icon:hover {


background-color: RGB(226, 226, 226);
border-radius: 10px;

}

.select-icon {
   
   
   width:50px;
   height:50px;
   display:none;

}

#icon_cencle {

   width:100px;
   height: 35px;
   margin-right:10px;
   

}

.cat_delete_btn  {

   position: absolute;
   right:5px;
   top:5px;

}

.menulist {

}

.valid-msg {
   display: flex;
   align-items: center;
   color:red;   
   font-size:15px;
}


</style>
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
                    <li class="go_home" style=" cursor: pointer;" onclick="location.href='#';" >메인메뉴</li>
                    <li class="go_sales" style=" cursor: pointer;" onclick="location.href='#';">매출관리</li>
                    <li class="go_reserve" style=" cursor: pointer;" onclick="location.href='#';">예약내역</li>
                    <li class="go_waiting" style=" cursor: pointer;" onclick="location.href='#';">웨이팅</li>
                    <li class="go_board" style=" cursor: pointer;" onclick="location.href='#';">게시판</li>
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