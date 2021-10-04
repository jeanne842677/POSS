function confirmPw(pwParams,userId){
	let password = pwParams;
	let boardId = userId;
	
	modal3();
	setModalTitle('modal3','비밀번호를 입력하세요');
   	setConfirmFunc = function confirmPw(){
   		if(document.getElementById("confirmPw").value == password){
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 완료');
   	   	    setModalBody('modal2', '비밀번호가 확인되었습니다.');
   	   		setOkayFunc = function confirmTrue(){
   				location.href = '/board/'+boardId+'/modify-form';
   			}
   		} else {
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 실패');
   	   	    setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
   	   		setOkayFunc = function rCancel(){
   	   		location.href = '/board/'+boardId+'/post?boardIdx=${board.boardIdx}';
   	   		}
   		}
   	}
}

function confirmPw2(pwParams,userId){
	
	let password = pwParams;
	let boardId = userId;
	
	modal3();
	setModalTitle('modal3','비밀번호를 입력하세요');
   	setConfirmFunc = function confirmPw(){
   		if(document.getElementById("confirmPw").value == password){
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 완료');
   	   	    setModalBody('modal2', '게시글이 삭제되었습니다.');
   	   		setOkayFunc = function confirmTrue(){
   	   			location.href = '/board/'+boardId+'/delete';
   			}
   		} else {
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 실패');
   	   	    setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
   	   		setOkayFunc = function rCancel(){
   	   			location.href = '/board/'+boardId+'/post?boardIdx=${board.boardIdx}';
   	   		}
   		}
   	}

}

function deleteReply(replyIdx, replyPw, userId) {
	
	let password = replyPw;
	let replIdx = replyIdx;
	let replyId = userId;
	
	modal3();
	setModalTitle('modal3','비밀번호를 입력하세요');
   	setConfirmFunc = function confirmPw(){
   		if(document.getElementById("confirmPw").value == password){
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 완료');
   	   	    setModalBody('modal2', '댓글이 삭제되었습니다.');
   	   		setOkayFunc = function confirmTrue(){
   	   			location.href = '/board/'+replyId+'/reply-delete?replyIdx='+replIdx;
   			}
   		} else {
   			modal2();
   	   		setModalTitle('modal2','비밀번호 확인 실패');
   	   	    setModalBody('modal2', '비밀번호가 올바르지 않습니다.');
   	   		setOkayFunc = function rCancel(){
   	   			location.href = '/board/'+replyId+'/post?boardIdx=${board.boardIdx}';
   	   		}
   		}
   	}
}

(() => {
	document.querySelector('#reply_all').addEventListener('submit', e => {
			
			let pwReg = /^\d{4}$/;
			
			if(!pwReg.test(reply_pw.value)){
				e.preventDefault();
				document.querySelector('#reply_pw').value = "";
				document.querySelector('#pwCheck').innerHTML ='비밀번호는 숫자 4자리입니다.'; 
			}
	})
})();
