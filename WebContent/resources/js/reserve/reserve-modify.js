//****꼭 위에 jquery cdn 3줄 넣어야 동작해요*****
   //라디오버튼 선택시 해당 기간으로 설정

   //1주
   function week() {
      let seven = document.getElementById('7days');
      let test = '+' + seven.value + 'W';

      if (seven.checked) {
         $(function() {
            $("#start").datepicker();
            $("#end").datepicker();
            $("#start").datepicker('setDate', $("#start").val());
            $("#end").datepicker('setDate', test);
         });
      }
   }

   //end 날짜가 start 날짜보다 일찍 넘기지않게 비활성화
   $(function() {
      // start Date 설정시 end Date의 min Date 지정
      $("#start")
            .datepicker(
                  {
                     dateFormat : "yy-mm-dd",
                     dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
                     monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
                           "7월", "8월", "9월", "10월", "11월", "12월" ],
                     monthNamesShort : [ "1월", "2월", "3월", "4월", "5월",
                           "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
                     numberOfMonths : 1,
                     changeMonth : true,
                     showMonthAfterYear : true,
                     changeYear : true,
                     minDate : 'today',
                     onClose : function(selectedDate) {
                        $("#end").datepicker("option", "minDate",
                              selectedDate);
                     }
                  });

      // end Date 설정시 start Date max Date 지정
      $("#end").datepicker(
            {
               dateFormat : "yy-mm-dd",
               dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
               monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월",
                     "8월", "9월", "10월", "11월", "12월" ],
               monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
                     "7월", "8월", "9월", "10월", "11월", "12월" ],
               numberOfMonths : 1,
               changeMonth : true,
               showMonthAfterYear : true,
               changeYear : true,
               minDate : $("#start").val(),
               onClose : function(selectedDate) {
                  $("#start").datepicker("option", "maxDate",
                        selectedDate);
               }
            });

   });

   $(function() {
      $('#openTime').timepicker({
         timeFormat : 'HH:mm',
         interval : 30,
         startTime : '00:00',
         dynamic : false,
         dropdown : true,
         scrollbar : true,
         change : function(time) {
            $('#endTime').timepicker('option', 'minTime', time);
            $('#endTime').timepicker('setTime', time);

         }
      });

      $('#endTime').timepicker({
         timeFormat : 'HH:mm',
         interval : 30,
         dynamic : false,
         dropdown : true,
         scrollbar : true,
         maxTime : '23:30',
         minTime : $('#openTime').val()
      });

   });