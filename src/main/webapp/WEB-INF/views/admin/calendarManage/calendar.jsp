<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<link href='resources/js/fullcalendar.min.css' rel='stylesheet' />
<link href='resources/js/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='resources/js/moment.min.js'></script>
<script src='resources/js/jquery.min.js'></script>
<script src='resources/js/fullcalendar.min.js'></script>
<script>

$(document).ready(function() {
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		defaultDate: moment().format('YYYY-MM-DD'),
		navLinks: true, // can click day/week names to navigate views
		selectable: true,
		selectHelper: true,
		select: function(start, end) {
			var title=prompt('휴일 이름을 지정해보세yong');
			var eventData = {title:title,start: start.format(), end: end.format()};
			$.ajax({
				url:"calex.ju",
				type:"POST",
				data:eventData,
				success:function(){
					alert("yong");
				}
			})
			$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			$('#calendar').fullCalendar('unselect');
		},
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: []
	});
	
});



</script>
<style>

body {
	margin: 40px 10px;
	padding: 0;
	font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
	font-size: 14px;
}

#calendar {
	max-width: 900px;
	margin: 0 auto;
}

</style>
</head>
<body>

<div id='calendar'></div>

</body>
</html>
