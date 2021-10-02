

//캘린더 폼만들기
let makeform = function(selector) {

    let cal = document.querySelector(selector);
    console.dir(cal);
    
    //테이블 생성
    let table = document.createElement('table');
    table.setAttribute('border','1');
    table.setAttribute('width','100%');
    table.setAttribute('height','90%');
    
    //캡션 추가
    let caption = document.createElement('caption');
    caption.setAttribute('style','font-size:30px')
    table.append(caption);

    //캡션 디브 추가
    let captionDiv = document.createElement('div');
    caption.append(captionDiv);

    let prev = document.createElement('span');
    prev.setAttribute('onclick' , 'prevMonth()');
    prev.setAttribute('style','margin:20px');
    prev.setAttribute('type','button');

    let month = document.createElement('span');
    let next = document.createElement('span');
    next.setAttribute('style','margin:20px');
    next.setAttribute('onclick','nextMonth()');
	next.setAttribute('type','button');
    captionDiv.append(prev);
    captionDiv.append(month);
    captionDiv.append(next);

    prev.innerHTML ='<';
    month.innerHTML ='8월';
    next.innerHTML ='>';


    //행 추가
    let low = document.createElement('tr');
    table.append(low);

    //요일 추가
    let dayArr = ['일','월', '화','수','목','금','토','합계'];
    for(let i = 0 ; i < 8 ; i ++) {
        let day = document.createElement('th');
        day.innerHTML = dayArr[i];
        low.append(day);
        
    }
    

    

    for(let j = 0 ; j <6 ; j++) {
        let week = document.createElement('tr');
        table.append(week);
        
        for(let i = 0 ; i<8 ; i++) {
            let day = document.createElement('td');
            week.append(day);
            let dayDiv = document.createElement('div');
            day.append(dayDiv);
        }
        
        
    }

    

    cal.append(table);

    return cal;
    
}


let monthDraw = function(cal,date) {

    //오늘
    let today = new Date(date);
    
    //첫째날
    let firstDate = new Date(date); 
    firstDate.setDate(1); //일 구하기

    //마지막날
    let lastDate = new Date(date);
    lastDate.setMonth(lastDate.getMonth()+1);
    lastDate.setDate(0);

    let row = cal.childNodes[1].childNodes;
    row[0].childNodes[0].childNodes[1].innerHTML = today.getFullYear()+"년 " + (today.getMonth()+1) +"월"

    let dayIdx = 1;
    for(let i = 2 ; i <7 ; i++ ) {
        let col = row[i].childNodes;
        for(let j=0; j < 7 ; j++) {
            
            if(i==2 && j<firstDate.getDay()) {
                col[j].innerHTML = '';
            }else if(i==6 && dayIdx > lastDate.getDate()) {
                col[j].innerHTML = '';

            }else {
                col[j].innerHTML = dayIdx++;
      
            }


        }

 

    }


};


    let newDate = new Date();
    
    //데이 받아서 
    
    let cal = makeform('.cal_wrap');
    monthDraw(cal, newDate);



let prevMonth = function () {
        
    newDate.setMonth(newDate.getMonth()-1);
   
    monthDraw(cal,newDate);

};

let nextMonth = function () {
    newDate.setMonth(newDate.getMonth()+1);
    
    monthDraw(cal,newDate);


};