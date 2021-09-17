let getLocationTemp = async () => {
    const OPEN_WEATHER_API_KEY = '2348247efd54eca9a724c64d99b2ce0c';
    let coords = await getCoords();
 
    let params = {
          lat:coords.latitude,
          lon:coords.longitude,
          appid:OPEN_WEATHER_API_KEY,
          units:'metric',
          lang:'kr'
    };
    
    let queryString = createQueryString(params);
    let url = `https://api.openweathermap.org/data/2.5/weather?${queryString}`;
    
    let response = await fetch(url);
    let obj =  await response.json();
    console.dir(obj);
    return {
       temp : obj.main.temp,
       place : obj.name,
       description : obj.weather[0].main,
       statu : obj.weather[0].icon
    }
 }
 
      let createQueryString = (params) => {
       let arr = [];
       for(key in params){
          arr.push(key + '=' + params[key]);
       }
       
       return arr.join('&');   
    } 
 
 let getCoords = () => {
    if(!navigator.geolocation) {
        return new Promise((resolve,reject)=>{
           reject();
         });
    }else{
         return new Promise((resolve,reject)=>{
            navigator.geolocation.getCurrentPosition((position) => {
               resolve(position.coords);
            });
         })
     }
 }
    

(async ()=>{
    
    /* 지역과 기온 랜더링*/
   let locataionTemp = await getLocationTemp();
    document.querySelector('.location').innerHTML = locataionTemp.place;
    document.querySelector('.weather_temp').innerHTML = locataionTemp.temp + 'º ';
   document.querySelector('.weather_statu').innerHTML = locataionTemp.description;
   document.querySelector('.weather_icon').innerHTML = `<img src = 'http://openweathermap.org/img/wn/${locataionTemp.statu}@2x.png' class="weather">`;
 
 })();