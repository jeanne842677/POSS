 // hover sad
 let team = document.getElementById("team");
 let sad = document.getElementById("sad");

 team.addEventListener('mouseover',function(){
     sad.style.display='block';
 });

 team.addEventListener('mouseleave',function(){
     sad.style.display='none';
 });




// 이미지슬라이더   
$(document).ready(function(){
$('.slider').bxSlider({
 auto: true, 
 speed: 500, 
 pause: 3000, 
 mode:'fade', 
 autoControls: true, 
 pager:true,

});
});