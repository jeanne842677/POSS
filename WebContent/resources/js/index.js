let logout = function() {
			location.href = "/member/logout";
		}
		
		
		function showConfirmLogout() {
			
			setModalTitle('modal1', 'Poss 로그아웃');
			setModalBody('modal1', '로그아웃 하시겠습니까?');
			setYesFunc = logout;
			modal1();
		}