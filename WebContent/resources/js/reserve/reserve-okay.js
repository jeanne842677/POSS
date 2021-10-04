function cancel(reserveIndex,userId) {
	let rtest = reserveIndex;
	let id = userId;
   	setModalTitle('modal1','예약취소');
   	setModalBody('modal1', '정말로 예약을 취소 하시겠습니까?');
   	modal1();
   	setYesFunc = function testFnc(reserveIndex){
   		modal2();
   		setModalTitle('modal2','예약취소 완료');
   	    setModalBody('modal2', '예약이 취소되었습니다.');
   		setOkayFunc = function rCancel(){
   			location.href = '/reserve/' + 'reserve-cancel?reserveIdx='+rtest;
   		}
   	}
};
