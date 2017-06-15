<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <title>Insert title here</title>
 
 <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
 <style type="text/css">
 </style>
    
 <script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
 <script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
 
 <!-- /* 캘린더 부분 시작*/ -->
 <link rel='stylesheet' href='/lee/resources/fullcalendar/fullcalendar.css' />
 <link href='/lee/resources/fullcalendar/scheduler.css' rel='stylesheet' />
 
 <script src='/lee/resources/fullcalendar/lib/moment.min.js'></script>
 <script src='/lee/resources/fullcalendar/scheduler.js'></script>
 <script src='/lee/resources/fullcalendar/fullcalendar.js'>
 
 </script>
 <!-- /* 캘린더 부분 끝*/ -->
 
 <script type="text/javascript">
 
 var datedata;
 
 $(document).ready(function() {
  
  
  var d = new Date();
  
  
  
  
  var calendar = $('#calendar').fullCalendar({
   header: {
    left: 'today',
    center: 'title',
    right: 'month'
   },
   defaultDate: d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDay(),
   monthNames:['01', '02', '03', '04', '05', '06', '07',
     '08', '09', '10', '11', '12'],
   editable: true,
   eventOverlap:false,
   draggable: false,
   selectable: true,
   
   //일정입력
   select: function(start, end, allDay) {
    
    var title = prompt('일정을 입력하세요.');
    if (title) {
    
	     calendar.fullCalendar('renderEvent',
	      {
		       title: title,
		       start: start,
		       end:start,
		       allDay: allDay,
		       id: title+start+end,
		       
	      },
	      true // make the event "stick"
	     );
	     
			     $.ajax({
		             url : "addHoliday.ju",
		             type: "get",
		             data : {"memo":title,"solar_date":start.format('YYYY-MM-DD')},
		             success : function(){
		              $("#ajax").remove();
		              	
		                   if(!datedata){
		                    alert("데이터를 받지 못함");
		                   }else{
		                     
		                	   
		                	   calendar.fullCalendar('unselect');
		                   	
		                   }   
		             },
		             error: function(request,status,error){
		                 
		                 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
		               }
		          });
	     
    }
    
    
   },
   //일정선택
   eventClick: function(event,jsEvent,view){
    alert('이벤트 선택'+event.title);
     
           /* alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY); */
           alert('event 정보 (id): ' + event.id);
     /*   $('#myCalendar').fullCalendar('removeEventSource',event.start); */
     
   },
   //삭제하기...
   eventDragStop:function(event, jsEvent, ui, view , revertFunc){
	   		var x = $('#calendarTrash').position().left;
	   		var y = $('#calendarTrash').position().top;
	   		var hei = $('#calendarTrash').outerHeight();
	   		var wid =  $('#calendarTrash').outerWidth();
	   		var ex = jsEvent.pageX;
	   		var ey = jsEvent.pageY;
		   /*  alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY); */
		    
		    if( (ex >= x && ex <= x+wid) && (ey >= y && ey <= y+hei) ){
		    	
		    	var id = event.id;
		    	alert(event.id);
			    	 $.ajax({
			              url : "delHoliday.ju",
			              type: "get",
			              data : {"memo":event.title,"solar_date":event.start.format('YYYY-MM-DD')},
			              success : function(){
			               $("#ajax").remove();
			               
			               
			                    if(!datedata){
			                     alert("데이터를 받지 못함");
			                    }else{
			                    	
			                    	$('#calendar').fullCalendar('removeEvents',id);
			                    	
			                    }   
			              },
			              error: function(request,status,error){
			                  
			                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			                }
			           });
  			
		    }
		    
   },
   //이벤트 드래그로 이동
   eventDrop: function(event, delta, revertFunc) {
	
       alert(event+"일자의 "+event.title + "이 " + event.start.format() +" 일자로 이동됩니다."+delta);

       if (!confirm("정말 이동하시겠습니까 ?")) {
           revertFunc();
       }

   },
   eventLimit: true, 
   events: function(start, end, timezone, callback) {
    
    
    var calendar = $("#calendar").fullCalendar("getDate");
    
          $.ajax({
              url : "getHolidayFC.ju",
              type: "get",
              data : {"yr":calendar.format('YYYY')},
              dataType:"json",
              
              success : function(responseData){
                  
               $("#ajax").remove();
                  datedata = responseData.hdto;
                  
                    if(!datedata){
                     alert("데이터를 받지 못함");
                    }else{
                      var events = [];
                      for(var i=0 ; i < datedata.length ; i++){
                       
                       if(datedata[i].memo){
                        events.push({
                          title:datedata[i].memo,
                          start:datedata[i].solar_Date,
                          editable:true,
                          color: '#1AA4AC'
                        });
                        
                       }
                      }
                      callback(events);
                    }   
              },
              error: function(request,status,error){
                  
                  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
                }
           });
       
    
    
   }
  }); 
 });
 
 $(function () {
  $('#my-prev-button').click(function() {
   
      $('#calendar').fullCalendar('prev');
      
      
  });
  
  $('#my-next-button').click(function() {
   
      $('#calendar').fullCalendar('next');
      
     
  });
  
  
  
  
  
 });
 
 
 
 </script>
</head>
<body>
full calendar
<div class="row">
<button id="my-prev-button" class="btn btn-primary col-md-2" style="background-color:#1AA4AC">
       이전달</button>
<button id="my-next-button" class="btn btn-primary col-md-2 col-md-offset-5" style="background-color:#1AA4AC">
       다음달</button>
</div>
<br>
<div class="row">
 <div class="col-md-9"id='calendar'></div>
 <div class="col-md-1" id='calendarTrash'>
 <img src="../lee/resources/index/recyclebin.png" style="height:100px;"></div>
</div>
</body>
</html>