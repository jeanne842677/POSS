

	let modal1 = () => {


	    document.querySelector('.dimm').style.display = 'block';
	    document.querySelector('#modal1').style.display = 'block';

	};
	
	let modal2 = () => {


	    document.querySelector('.dimm').style.display = 'block';
	    document.querySelector('#modal2').style.display = 'block';

	};
	
	let modal3 = () => {


	    document.querySelector('.dimm').style.display = 'block';
	    document.querySelector('#modal3').style.display = 'block';

	};




	//x버튼 눌렀을 때 
	document.querySelector('#close_btn1').addEventListener('click',e=>{

	    
	    
	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal1').style.display = 'none';

	});

	document.querySelector('#close_btn2').addEventListener('click',e=>{

	    

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal2').style.display = 'none';

	});


	//모달1 예 눌렀을 때 
	document.querySelector('#yes').addEventListener('click',e=>{

	    

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal1').style.display = 'none';

	});

	//모달1 아니오 눌렀을 때 
	document.querySelector('#no').addEventListener('click',e=>{

	    

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal1').style.display = 'none';

	});

	//모달 2 확인 눌렀을 때 
	document.querySelector('#okay').addEventListener('click',e=>{

	    

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal2').style.display = 'none';

	});
	
	//모달 3 확인 눌렀을 
	document.querySelector('#confirm').addEventListener('click',e=>{

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#confirm').style.display = 'none';

	});



	//모달 타이틀 세팅하기 (모달종류, 넣을제목)
	let setModalTitle = (modalId , title) => {




	    let titleId = document.querySelector('#'+modalId+'-title');
	    
	    titleId.innerHTML = title;


	}

	//모달 내용 세팅하기
	let setModalBody= (modalId , body) => {




	    let titleId = document.querySelector('#'+modalId+'-body');
	    
	    titleId.innerHTML = '<p>'+body+'</p>';


	}



	//모달 yes버튼에 함수 붙이기
	let setYesFc = function(func) {

	    document.querySelector('#yes').addEventListener('click',(e)=>{

	        document.querySelector('.dimm').style.display = 'none';
	        document.querySelector('#modal1').style.display = 'none';

	        func();

	    });
	    


	}

	//모달 no버튼에 함수 붙이기
	let seNoFc = function(func) {
		
		document.querySelector('#no').addEventListener('click',(e)=>{

			document.querySelector('.dimm').style.display = 'none';
			document.querySelector('#modal1').style.display = 'none';
			
			func();
			
		});
		
		
		
	}


	let clickYes = function(setYesFunc) {

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal1').style.display = 'none';
	    setYesFunc();

		
		
	}


	let setYesFunc= function() {
		

	}


	let clickNo = function(setNoFunc) {

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal1').style.display = 'none';
	    setNoFunc();

		
		
	}


	let setNoFunc= function() {

	}


	let clickOkay = function(OkayFunc) {

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal2').style.display = 'none';
	    OkayFunc();

		
		
	}


	let setOkayFunc= function() {
		
		
	}
	
	let clickConfirm = function(ConfirmFunc) {

	    document.querySelector('.dimm').style.display = 'none';
	    document.querySelector('#modal3').style.display = 'none';
	    ConfirmFunc();

		
		
	}


	let setConfirmFunc= function() {
		
		
	}




	let removeModalFnc = function(str) {
		let nullFunc = function() {
			
			
			
		}
		
		if(str=="okay") {
			
			setOkayFunc = nullFunc;
			
		}else if(str="yes") {
			
			setYesFunc = nullFunc;
		}else if(str="no") {
			

			setNoFunc = nullFunc;
			
		}
		
		
	}

	
	

