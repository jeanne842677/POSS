/**
 * 
 */	


		/*CNT값을 즉시실행 함수로 감싸서 전역에서 격리시킨다.
		  이벤트리스너에 등록된 콜백함수들이 closure 역할을 해준다.
		
		*/
		
		(function() {
		
	
		let cnt = 0;
		let what = '이것';

		$('#next').addEventListener('click' , ()=> {
			
			let what = '안녕'
			cnt++
			if(cnt==4) {
				cnt=0;
			}
			
			move(cnt);
			
		});
		
		
		$('#pre').addEventListener('click' , ()=> {
			
			cnt--;
			if(cnt<0) {
				cnt=3;
			}			
			
			
			move(cnt);

			
			
		});
		
		
		let move = function(cnt) {
			
			document.querySelectorAll('.slid>li').forEach(function(e) {
				
				e.style.transform = `translateX(${-100*cnt}%)`;
				
				document.querySelectorAll('.buttons>i').forEach( e => {
					
					
					if(e.dataset.idx==cnt) {
						
						e.style.color='red';
					}else {
						e.style.color='pink';
						
					}
					
				});
				
				
				
				
			});
			
			
		}
		
		
		
		document.querySelectorAll('.buttons').forEach( element => {
			
			element.addEventListener('click', function(e) {
				
				let count = e.target.dataset.idx;
				
		
				move(count);
				
				cnt = count;
				
			});
			
			
			
			
		});
		

		
		
		})();
	