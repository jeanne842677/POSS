//현재 월 이후로 막기
	$(document).ready(function(){
	    $("#thismonth").datepicker({
	            closeText : "닫기",
	            prevText : "이전달",
	            nextText : "다음달",
	            currentText : "오늘",
	            changeMonth: true,
	            changeYear: true,
	            monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	            monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
	            dateFormat: 'yy-mm',
	            changeMonth: true,
	            changeYear: true,
	            showButtonPanel: true,
	            maxDate: 0,
	
	        onClose: function(dateText, inst) {
	            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
	            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
	            $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
	        }
	    });
	
	
	    $("#thismonth").focus(function () {
	        $(".ui-datepicker-calendar").hide();
	        $("#ui-datepicker-div").position({
	            my: "center top",
	            at: "center bottom",
	            of: $(this)
	        });
	    });
	 
	
	});


// 현재 월 기본값으로 표시
	  document.getElementById('thismonth').value= new Date().toISOString().slice(0, 7); 
	  const dday = document.querySelector("#thismonth").value;
	  

// 기간 선택 값 받아오기
	    function selectedmonth(){
	    const dday = document.querySelector("#thismonth").value;
	    }
    