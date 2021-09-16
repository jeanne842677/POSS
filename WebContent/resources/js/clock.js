/**
 * 
 */
let renderCurrentTime = () => {
	let now = new Date();
    let hour = now.getHours();
    let minutes = now.getMinutes();
      
    	if(hour<12){
        	ampm="AM";
        }
        else{
           ampm="PM";
        }
         
    hour = hour < 10 ? "0"+hour:hour;
    minutes = minutes < 10 ? "0" + minutes:minutes;
    document.querySelector('.clock').innerHTML = `${ampm}  ${hour} : ${minutes}`;
    setTimeout(renderCurrentTime,1000);
   
}