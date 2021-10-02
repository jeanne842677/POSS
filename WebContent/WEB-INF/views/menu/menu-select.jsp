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
   #content_wrap {
	    height: 100%;
	    min-width: 1130px;
	    padding: 10px;
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
        width: 100px;
	    min-width: 51px;
	    font-size: 30px;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    color: #343a40;
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
        display: flex;
    	align-items: center;
       
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
    .menu_zone{
	    width: 100%;
	    height: 68%; 
	    overflow-x:hidden;
        overflow-y:scroll; 
    }
    
    .menu_name{
        width: 100%;
   		height: 100%;
        padding:10px;
       	display: flex;
    	flex-wrap: wrap;
    	align-content: baseline;
    }
    
     .menu_zone::-webkit-scrollbar{
     	width:10px;
     }
     
     .menu_zone::-webkit-scrollbar-thumb {
	    background-color: #444;
	    border-radius: 10px;
	    background-clip: padding-box;
	    border: 2px solid transparent;
	  }
	  
	  .menu_zone::-webkit-scrollbar-track {
	    background-color: #00ff0000;
	    border-radius: 10px;
	    box-shadow: inset 0px 0px 5px white;
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
    
    .menu_name>div>img{
    	margin-bottom:10px;
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

    .cancel, .okBtn, .allcancel, .kakaopay, .cash{
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
   
</style>
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
<script type="text/javascript">
	
	let json ;

	<c:if test="${ not empty orderJoinList}">
	
	json = ${orderJoinList};
	
	</c:if>
	
	
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
    });
    
    

    
    let createMenu = (menu) => {
       
       document.querySelector('.menu_name').innerHTML = '';
          
          menu.forEach(m => {
             let menuDiv = document.createElement('div');
             menuDiv.setAttribute('class', 'meuelist');
             menuDiv.setAttribute('style', "background-color:"+ m.color);
             menuDiv.setAttribute("data-menuidx", m.menuIdx);
             menuDiv.innerHTML = `<div class="cat_box_icon"><img class='cat_box_icon_img' src='/resources/icon/` + m.icon + `.png'></div>
            <div class='menu_info'><div class='menutitle'>` + m.name +`</div><div class='menuprice'>`+ m.price +`</div></div>`;
          
            menuDiv.addEventListener('click' , e =>{
               let isReturn = 'false';
               let sameMenu = null;
               let mDiv =  menuDiv.dataset.menuidx;
               if(document.querySelector('.selectmenu')) {    
                  document.querySelectorAll('.selectmenu').forEach(e => {
                      if(e.dataset.menuidx == mDiv) {
                         sameMenu = e;
                         isReturn = 'true';
                      }
                   })
               }
               if(isReturn == 'true') {
                  plusCnt(sameMenu);
                  plusPrice(sameMenu);
                  plusTotal(sameMenu);
                    changeColor(sameMenu);
                  return;
               }
                   let addList = document.createElement("div");
                   addList.setAttribute("class","selectmenu");
                   addList.setAttribute("data-check","true");
                   addList.setAttribute("data-menuidx", m.menuIdx);
                   //색변환
                   addList.addEventListener('click', e => {
                      document.querySelectorAll('.selectmenu').forEach(i => {
                          i.style.background = 'white';
                          i.dataset.check = "false";
                       })
                       addList.style.background = 'rgb(181, 227, 216)';
                      addList.dataset.check = "true";
                   })
        
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
                         plusTotal(addList);
                      }
                      
                      minusDiv.onclick = function(){
                     let number = countDiv.innerHTML;
                       number = parseInt(number) - 1;
                        countDiv.innerHTML = number;
                       
                       let price = m.price;
                       let totalPrice = parseInt(resPrice.innerHTML);
                       totalPrice -= parseInt(price);
                       resPrice.innerHTML = totalPrice;
                       minusTotal(addList);
                       if(parseInt(number) == 0) {
                          addList.remove();       
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
                      
                      //총 주문금액
                      totalPrice(addList);
                    changeColor(addList);
            })
            document.querySelector('.menu_name').append(menuDiv); 
       })   ;
    
    };
    
//전체취소    
function allCancel() {
   document.querySelector('#totalPrice').innerHTML = 0;
   let cell = document.querySelector('#total_list');
   while (cell.hasChildNodes()) { 
      cell.removeChild(cell.firstChild); 
   }
}


//단일 취소
document.querySelector("#selectCancel").addEventListener('click', e => {
   let trueDom = null;
   document.querySelectorAll('.selectmenu').forEach(e => {
      if(e.dataset.check == 'true') {
         trueDom = e;
      }
   })
   let orderPrice =  document.querySelector('#totalPrice').innerHTML;
   let resPrice = trueDom.lastChild;
    let minus = parseInt(orderPrice) - parseInt(resPrice.innerHTML);
    document.querySelector('#totalPrice').innerHTML = minus;
    trueDom.remove();
   
   if(document.querySelector('.selectmenu')) {
      let lastNode = document.querySelector('#total_list').lastChild; 
      changeColor(lastNode);
      lastNode = null;
   }
})

//클릭시 해당 메뉴 선택 
function changeColor(selectmenu) {
   document.querySelectorAll('.selectmenu').forEach( e => {
       e.style.background = 'white';
       e.dataset.check = "false";
    })
    selectmenu.style.background = 'rgb(181, 227, 216)';
   selectmenu.dataset.check = "true";
}
//카운트 증가
function plusCnt(selectmenu) {
   let count = selectmenu.children[2].children[1].innerText;
   let count2 = parseInt(count) + 1;
   selectmenu.children[2].children[1].innerText = count2;
}
//메뉴별 가격증가
function plusPrice(selectmenu) {
   let onePrice = selectmenu.children[1].innerText;
   let resPrice = selectmenu.lastChild.innerText;
   let sumEach = parseInt(resPrice) + parseInt(onePrice);
   selectmenu.lastChild.innerText = sumEach;
}
//총 주문금액 증가
function plusTotal(selectmenu) {
   let orderPrice =  document.querySelector('#totalPrice').innerHTML;
   let onePrice = selectmenu.children[1].innerText;
    let sumTotal = parseInt(orderPrice) + parseInt(onePrice);
    document.querySelector('#totalPrice').innerHTML = sumTotal;
}
//총 주문금액 감소
function minusTotal(selectmenu) {
   let orderPrice =  document.querySelector('#totalPrice').innerHTML;
   let onePrice = selectmenu.children[1].innerText;
    let sumTotal = parseInt(orderPrice) - parseInt(onePrice);
    document.querySelector('#totalPrice').innerHTML = sumTotal;
}
//총 주문금액
function totalPrice(selectmenu) {
   let orderPrice =  document.querySelector('#totalPrice').innerHTML;
   let resPrice = selectmenu.lastChild.innerText;
    let sum = parseInt(orderPrice) + parseInt(resPrice);
    document.querySelector('#totalPrice').innerHTML = sum;
}



    //ok버튼 클릭시
	document.querySelector(".okBtn").addEventListener("click", e => {
    	
		let menuArr = [];
		
		document.querySelectorAll(".selectmenu").forEach(ele=> {
			
			let menuIdx = ele.dataset.menuidx
			let menuName = ele.children[0].innerText;
			let menuPrice = ele.children[1].innerText;
			let menuCnt = ele.children[2].children[1].innerText;
			
		
			let menuObj = {
					menuIdx : menuIdx,
					menuCnt : menuCnt
					
			};
			
			menuArr.push(menuObj);
			
		});
		

		let orderIdx;
		<c:if test="${not empty orderIdx }" >
			orderIdx = ${orderIdx} ;
		</c:if>
		
		//만약 주문 내역이 없으면?
		if(menuArr.length==0) {
			
			if(orderIdx) {
				
				fetch('/order/cencle?orderIdx='+orderIdx)
				.then(res=> {

					location.href ="/seat/select";
					
				});
				
				
			}else {
				location.href ="/seat/select";

			}
			
			
			return;
		}
		
		
		//만약 이미 오더된 상황이라면?
		if(orderIdx) {
			
			fetch('/order/modify-impl?orderIdx='+orderIdx ,
				{
				  method: "POST",
				  headers: {
				    "Content-Type": "application/json; charset=utf-8",
				  },
				  body: JSON.stringify({
				    orderList: menuArr
				  })
			})
			.then(res=> {

				location.href ="/seat/select";
				
			});
			
			
			
			return; 
			
			
		}
		
		
		//새 주문이라면?
		fetch('/order/order-impl?html_idx=${htmlIdx}&tableUUID=${tableUUID}&tableName=${tableName}&orderNum=${ orderNum }' , 
			{
			  method: "POST",
			  headers: {
			    "Content-Type": "application/json; charset=utf-8",
			  },
			  body: JSON.stringify({
			    orderList: menuArr
			  })
		})
		.then(res=>res.text())
		.then(text=> {
			
			location.href ="/seat/select";
			
			
			
		});
		
	
		
    	
    });
	
	
	//현금 결제 클릭시



	let createO = (json) => {
		json.forEach(m=> {
			
			

			  let isReturn = 'false';
	          let sameMenu = null;
	          let mDiv =  m.menuIdx;
	          if(document.querySelector('.selectmenu')) {    
	             document.querySelectorAll('.selectmenu').forEach(e => {
	                 if(e.dataset.menuidx == mDiv) {
	                    sameMenu = e;
	                    isReturn = 'true';
	                 }
	              })
	          }
	          if(isReturn == 'true') {
	             plusCnt(sameMenu);
	             plusPrice(sameMenu);
	             plusTotal(sameMenu);
	               changeColor(sameMenu);
	             return;
	          }
	              let addList = document.createElement("div");
	              addList.setAttribute("class","selectmenu");
	              addList.setAttribute("data-check","true");
	              addList.setAttribute("data-menuidx", m.menuIdx);
	              //색변환
	              addList.addEventListener('click', e => {
	                 document.querySelectorAll('.selectmenu').forEach(i => {
	                     i.style.background = 'white';
	                     i.dataset.check = "false";
	                  })
	                  addList.style.background = 'rgb(181, 227, 216)';
	                 addList.dataset.check = "true";
	              })
	   
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
	                  
	                 let count = m.cnt;
	                 
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
	                    plusTotal(addList);
	                 }
	                 
	                 minusDiv.onclick = function(){
	                let number = countDiv.innerHTML;
	                  number = parseInt(number) - 1;
	                   countDiv.innerHTML = number;
	                  
	                  let price = m.price;
	                  let totalPrice = parseInt(resPrice.innerHTML);
	                  totalPrice -= parseInt(price);
	                  resPrice.innerHTML = totalPrice;
	                  minusTotal(addList);
	                  if(parseInt(number) == 0) {
	                     addList.remove();       
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
	                 
	                 //총 주문금액
	                 totalPrice(addList);
	               changeColor(addList);
			
			
			
			
			
			
			
			
			
			
			
			
		});
		
	};

	
	
	if(json) {
		createO(json);
	}
	

	
	let payingInKakao = function() {
		let orderIdx;
		<c:if test="${not empty orderIdx }" >
			orderIdx = ${orderIdx} ;
		</c:if>
		
		fetch("/order/pay?option=P02&orderIdx="+orderIdx)
		.then(res=>{
			
			location.href= "/seat/select";
			
		});
		
	}
	
	let payingInCash = function() {
		let orderIdx;
		<c:if test="${not empty orderIdx }" >
			orderIdx = ${orderIdx} ;
		</c:if>
		
		fetch("/order/pay?option=P01&orderIdx="+orderIdx)
		.then(res=>{
			
			location.href= "/seat/select";
			
		});
		
	}
	
	
	
	function kakaoPay(){
        var IMP = window.IMP;
        IMP.init('imp37277937'); 
        var msg;
	
        let menuName ;
        <c:if test="${ not empty orderJoinList}">;
        menuName = ${orderJoinList}[0].name + " 외" ;
        
        </c:if>
        
        IMP.request_pay({
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : menuName,
            amount : document.querySelector('.paynum').innerText,
        }, function(rsp) {
            if ( rsp.success ) {
                
                jQuery.ajax({
                    url: "/payments/complete",
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        
                    }
                }).done(function(data) {
                    if ( everythings_fine ) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        
                        alert(msg);
                    } else {
                       
                    }
                });
                let price = document.querySelector('.paynum').innerText;
                //성공시 이동할 페이지
                setModalTitle('modal2','결제 성공');
                setModalBody('modal2','금액 : ' + price + '원');
                setOkayFunc = payingInKakao;
                modal2();
                
            } else {

            	removeModalFnc("okay");
                setModalTitle('modal2','결제 실패');
                setModalBody('modal2','결제가 실패되었습니다.');
                modal2();
                
            }
        });
	}
	
	

	document.querySelector('.cash').addEventListener('click' , e=> {
		
		
		 
		   let totalPrice = document.querySelector('.paynum').innerText;
		 	
		   if(totalPrice==0) {

			   removeModalFnc("okay");
		       setModalTitle('modal2','현금결제');
		       setModalBody('modal2', '결제할 금액이 없습니다.');
		       modal2();
		      
			
			   return;
		   }else {
		   
		   setModalTitle('modal1','현금결제');
		      setModalBody('modal1', '현금결제를 진행하시겠습니까?');
		      modal1();
		      setYesFunc = function testFnc(){

		          setModalTitle('modal2','현금결제');
		          setModalBody('modal2', '총 결제 금액 : ' + totalPrice + '원');
		          setOkayFunc = payingInCash;
			      modal2();
		          
		         }
		   }	      
	
	});

    
</script>
</body>
</html>