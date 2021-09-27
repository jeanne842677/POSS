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
        min-width:965px;
        min-height: 700px;
        height:100%;
        background-color: #ddd;
    }

    

    /* div{
        border: solid 1px;
    } */
    
    /* header ---------------------------------------- */
    #header{
        width:100%;
        height:8.5% fixed;
        background-color: #78c2ad;
        color:white;
        display: flex;
        justify-content: space-between;
        line-height: 80px;
        font-size:30px;
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
        background-color: white;
        padding:10px;
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
        padding:10px;
        display:flex;
        align-items: center;
        border-bottom: solid 1px #888;
    }

    #cate{
        width:20%;
        min-width:153px;
        height:100%;
        display:flex;
        align-items: center;
        justify-content: center;
        color:#343a40;
        background-color: #f9f7e8;
        font-size:30px;
        font-weight: bold;
        box-shadow: 5px 5px #aaa;
        margin:10px;
    }

    

    /* 메뉴목록 */
    .menu_name{
        width:100%;
        height:68%;
        padding:10px;
        overflow: auto;
    }

    .menu_name>div{
        width:20%;
        min-width:153px;
        height:30%;
        min-height: 110px;
        background-color:  white;
        color: black;
        font-size: 2vh;
        font-weight: bold;
        box-shadow: 5px 5px #aaa;
        margin:10px;
    }

    
    .img_view{
    	width:100%;
    	height: 80%;
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



.icon {

    width:50px;
    padding: 5px;
    margin: 3px;

}


    /* 메뉴카테고리 */
    .menu_cate{
        width:100%;
        height:20%;
        padding:10px;
        display:flex;
        align-items: center;
        border-bottom: solid 1px #888;
        overflow: auto;
        
    
    }

    
    .cat_box_icon {
    	width:50px;
    	height:50px; 
    
    }
    

    .cat_box_icon_img {
    
    	width:100%;
    	height:100%;
    }



    .cate {
        width:172px;
        min-width:153px;
        height:90%;
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
    }
    
   
</style>
</head>
<body>


    <div id="header">
        <div class="back" style=" cursor: pointer;" onclick="location.href='/seat/select-seat';"><i class="fas fa-chevron-left"></i> </div>
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
            <div class="table_num">
                <div class="tb_num">1번</div>
                <div class="wait_time">0:00</div>
            </div>

            <div class="order_list" id="total_list">
           		
            </div>

                <div class="order_sum">
                    <div class="sum">
                        <div class="menusum">주문금액</div><div class="ordernum" id="orderPrice"></div>
                    </div>

                    <div class="pay">
                        <div class="paysum">총 금액</div> <div class="paynum" id="totalPrice"></div>
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
							createMenu(menu);
              			})
              		});
              		  </script>
                  </c:forEach>

            </div>
            
            <div class="menu_name" id="menu_edit">
           
           
           
            </div>
            
            <div class="select_commit">
                <div class="cancel" style=" cursor: pointer;" onclick="location.href='#';">취소</div>
                <div class="ok" style=" cursor: pointer;" onclick="location.href='#';"><i class="far fa-check-circle"></i><p class="hide">확인</p></div>
                <div class="allcancel" style=" cursor: pointer;" onclick="location.href='#';"><i class="far fa-times-circle"></i><p class="hide">전체취소</p></div>
                <div class="kakaopay" style=" cursor: pointer;" onclick="location.href='#';"><i class="far fa-credit-card"></i><p class="hide">카카오페이</p></div>
                <div class="cash" style=" cursor: pointer;" onclick="location.href='#';"><i class="far fa-money-bill-alt"></i><p class="hide">현금</p></div>
            </div>       
    </div>
</div>
            
</div>

</section>


<script type="text/javascript">

	let idx = 0;
	
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
    
    
    let createMenu = (menu) => {
    	
    	document.querySelector('.menu_name').innerHTML = '';
    		
    		menu.forEach(m => {
    			let menuDiv = document.createElement('div');
    			menuDiv.setAttribute('class', 'meuelist');
    			menuDiv.setAttribute('style', "background-color:"+ m.color);
    			menuDiv.innerHTML = `<div class="cat_box_icon"><img class='cat_box_icon_img' src='/resources/icon/` + m.icon + `.png'></div>
            <div class='menu_info'><div class='menutitle'>` + m.name +`</div><div class='menuprice'>`+ m.price +`</div></div>`;
    		
            menuDiv.addEventListener('click' , event=>{

            	let addList = document.createElement("div");
            	addList.setAttribute("class","selectmenu");

               	let nameDiv = document.createElement("div");
               	nameDiv.setAttribute("class", "selectname");
               	nameDiv.innerHTML += m.name;
               	addList.appendChild(nameDiv);
               	
            	let unitPrice = document.createElement("div");
               	unitPrice.setAttribute("class","oneprice");
               	unitPrice.innerHTML += m.price;
               	addList.appendChild(unitPrice);
               	

               	let testDiv = document.createElement("div");
               	testDiv.setAttribute("class", "plma");
               	testDiv.setAttribute("id", "plma");
             		
               	let count = 1;
               	
               	let minusDiv = document.createElement("div");
               	minusDiv.setAttribute("class", "minus");
               	minusDiv.setAttribute("id", "m");
               	minusDiv.setAttribute("type", "button");
               	minusDiv.innerHTML = '-';
               	
               	let countDiv = document.createElement("div");
               	countDiv.setAttribute("id", "count");
               	countDiv.innerHTML = count;
               	
               	let plusDiv = document.createElement("div");
               	plusDiv.setAttribute("class", "plus");
               	plusDiv.setAttribute("type", "button");
               	plusDiv.setAttribute("id", "p");
               	plusDiv.innerHTML = '+';
               	
               	plusDiv.onclick = function(){
        			let number = countDiv.innerHTML;
               		
               		number = parseInt(number) + 1;
               		
               		countDiv.innerHTML = number;
               		
               		let price =  m.price;
               		let totalPrice = parseInt(resPrice.innerHTML);
               		totalPrice += parseInt(price);
               		
               		resPrice.innerHTML = totalPrice;
               		
               		orderDiv.innerHTML = totalPrice + "원";
               		totalDiv.innerHTML = totalPrice + "원";
               		
               	}
               	
               	minusDiv.onclick = function(){
        			let number = countDiv.innerHTML;
               		
               		if(number > 1){
               			number = parseInt(number) - 1;
               			
               			countDiv.innerHTML = number;
               			
               			let price = m.price;
               			let totalPrice = parseInt(resPrice.innerHTML);
               			totalPrice -= parseInt(price);
               			
               			resPrice.innerHTML = totalPrice;
               			
               			orderDiv.innerHTML = totalPrice + "원";
                   		totalDiv.innerHTML = totalPrice + "원";
               		}
               	}

                
               	testDiv.appendChild(minusDiv);
               	testDiv.appendChild(countDiv); 
               	testDiv.appendChild(plusDiv);

               	addList.appendChild(testDiv);

               	let resPrice = document.createElement("div");
               	resPrice.setAttribute("class","resprice");
               	resPrice.innerHTML +=  m.price;
               	addList.appendChild(resPrice);
               	

               	document.getElementById("total_list").appendChild(addList);
               	
            })
            
            
            
            document.querySelector('.menu_name').append(menuDiv);
            
            
            
            
    	})              	
    	
    };
    


    
</script>
</body>
</html>