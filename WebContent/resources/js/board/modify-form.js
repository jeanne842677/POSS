var check = $("input[type='checkbox']");
check.click(function(){
   $("#public").toggle();
   $("#private").toggle();
});

let switchFnc = document.querySelector("#switch");

if (switchFnc.value == 0){
	switchFnc.removeAttribute("checked");
} else {
	document.getElementById("public").style.display = "none";
	document.getElementById("private").style.display = "block";
}