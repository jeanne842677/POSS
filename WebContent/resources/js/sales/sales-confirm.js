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
    
	    var chart = c3.generate({
	        data: {
	            columns: [
	                ['${nameArr[0]}', '${cntArr[0]}'],
	                ['${nameArr[1]}', '${cntArr[1]}'],
	                ['${nameArr[2]}', '${cntArr[2]}'],
	                ['${nameArr[3]}', '${cntArr[3]}'],
	                ['${nameArr[4]}', '${cntArr[4]}'],
	                
	            ],
	            type : 'donut',
	            colors: {
	            	'${nameArr[0]}' : 'rgb(255, 167, 167)',

	            	'${nameArr[1]}' : 'rgb(97, 191, 173)',

	            	'${nameArr[2]}' : '#6cc3d5',

	            	'${nameArr[3]}' : 'rgb(255, 213, 125)',

	            	'${nameArr[4]}' : 'rgb(249, 247, 232)'
	        	},
	        },
	        donut: {
	            title: "${nameArr[0]}"
	        }
	    });
