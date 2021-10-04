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
    
    
    
let thisTime = () => {
	
	let date = new Date();
	let str = date.getFullYear()+"년 "+ (date.getMonth()+1) + "월 " + date.getDate()+"일 " + date.getHours() + "시 " + date.getMinutes()+"분";
	return str;
}

document.querySelector('.now_order').innerHTML = thisTime();
	