<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<link href="/lee/resources/fullcalendar/fullcalendar.min.css" rel="stylesheet">
<script src='/lee/resources/fullcalendar/lib/moment.min.js'></script>
<script src='/lee/resources/fullcalendar/fullcalendar.min.js'></script>
<script type="text/javascript">
	$(document).ready(function() {
		var roomName, timeName;
		
		var now = new Date();
		var nowDate = now.getFullYear();
		nowDate += (now.getMonth() + 1)>9?"-"+(now.getMonth() + 1):"-0"+(now.getMonth() + 1);
		nowDate += now.getDate()>9?"-"+now.getDate():"-0"+now.getDate();

		$('#calendar').fullCalendar({
			header: {
				left: 'today',
		        center: 'title',
		        right: 'month'
			},
		    defaultDate: moment().format('YYYY-MM-DD'),
		    selectable: true,
		    selectHelper: true,
		    select: function(start) {
				var eventData = {start:start.format('YYYY-MM-DD')};
				var startDate = start.format("YYYY-MM-DD");
		        $("#srCancel").hide();
            	$("#resdate").val(startDate); 
            	$("#selectedDate").text(startDate); 
            	
				if(startDate.substr(8,2)<=nowDate.substr(8,2)||startDate.substr(8,2)>(parseInt(nowDate.substr(8,2))+14)){
					$("#srBooking").attr("disabled",true);
					jQuery('#roomStatus').hide();
					jQuery('.sdiv').hide();
					return;
				}
				
		        $.ajax({
					url:"srCal.ju",
					type:"POST",
					data:eventData,
					dataType:"json",
					success:function(cal){
						jQuery('#roomStatus').show();
			           	for(var i = 1; i<=4;i++){
	            			for(var j = 1; j<=4;j++){
	            				$(".rt_check>.time"+i+">.room"+j).css("background","#0BD392");
								$(".rt_check>.time"+i+">.room"+j).text("empty");
								$(".rt_check>.time"+i+">.room"+j).removeClass("using");
	            			}
	            		}
			           	
		            	for(var i = 0; i<cal.srarr.length;i++){
							var rn = cal.srarr[i].sr_roomno;
							var tn = cal.srarr[i].sr_time;
							$(".rt_check>.time"+tn+">.room"+rn).css("background","red");
							$(".rt_check>.time"+tn+">.room"+rn).text("using");
							$(".rt_check>.time"+tn+">.room"+rn).addClass("using");
		            	}
		            	
		            }
		        })
				$('#calendar').fullCalendar('unselect');
			},
		    editable: true,
		    eventLimit: true, // allow "more" link when too many events
		    events: []
		});
		
		$("#timetr>td").click(function(){
			$("#srCancel").hide();
			$("#timetr>td").css("background-color","#0BD392");
			$(".using").css("background-color","red");
			$("#timetable>tbody>tr").removeClass("info");
			
			$(".room").css("background-color","#0BD392");
			var status = $(event.target).text();
			if(status=="using"){
				$(".sdiv").hide();
				$("#srBooking").attr("disabled",true);
				roomName = event.target.className.substr(4,1);
				timeName = $(event.target).parent().attr("class").substr(4,1);
				var userId = "testmj"; 
/* 				var userId = ${sessionScope.sidx};  */
				var rt_info = {roomno:roomName,time:timeName,resdate:$("#resdate").val()};
				
				$.ajax({
					url : "srUserCheck.ju"
					, type : "POST"
					, dataType : "json" 
					, data : rt_info
					, success : function(uCheck){
							console.log("userCheck : " + uCheck.userCheck);
							console.log("userId : " + userId);
						if(uCheck.userCheck == userId){
							$("#srCancel").show();
						}
					}
				});
				
				
				return;
			}
			$(".sdiv").show();
			$(event.target).css("background-color","#1AA4AC");
			roomName = event.target.className.substr(4,1);
			timeName = $(event.target).parent().attr("class");
			$("#"+timeName).addClass("info");
			timeName = timeName.substr(4,1);
			//시간선택
			$("input:radio[name=sr_time]:input[value="+timeName+"]").attr("disabled",false);
			$("input:radio[name=sr_time]:input[value="+timeName+"]").attr("checked",true);
			
			//방 선택
			$(".roomtab>tbody>tr>#"+roomName).css("background-color","#1AA4AC");
			$("#sr_roomno").val(roomName);
			
			$("#srBooking").attr("disabled",false);
			
		});
		
		$("#srCancel").click(function(){
			location.href="/lee/srCancel.ju?sr_roomno="+roomName+"&sr_time="+timeName;
		});
		
			console.log('happy61');
	});

</script>
<style type="text/css">
.modal-body {
	width: 350px;
	height: 400px;
}

.room{
	background-color: #0BD392; 
}

.roomtab{
	width: 300px;
	height: 200px;
	text-align: center;
	margin: 20px auto;
}
#s1div {
	float: left;
}

#s2div {
	float: right;
}

.tab {
	width: 200px;
	height: 200px;
}

.roompath{
	background-color: black;
}
</style>
</head>
<body>
	<form name="sr_form" action="srBook.ju" method="post">
	<input type="hidden" name="sr_roomno" id="sr_roomno">
	<input type="hidden" name="resdate" id="resdate" value="">
	<div id='calendar'></div>
	<div>
		<h2 id="selectedDate"></h2>
		<table class="table" border="1" id="roomStatus" style="display:none;">
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th>1번방</th>
					<th>2번방</th>
					<th>3번방</th>
					<th>4번방</th>
				</tr>
			</thead>
			<tbody class="rt_check">
				<tr class="time1" id="timetr">
					<th>09~12시</th>
					<td class="room1">empty</td>
					<td class="room2">empty</td>
					<td class="room3">empty</td>
					<td class="room4">empty</td>
				</tr>
				<tr class="time2" id="timetr">
					<th>12~15시</th>
					<td class="room1">empty</td>
					<td class="room2">empty</td>
					<td class="room3">empty</td>
					<td class="room4">empty</td>
				</tr>
				<tr class="time3" id="timetr">
					<th>15~18시</th>
					<td class="room1">empty</td>
					<td class="room2">empty</td>
					<td class="room3">empty</td>
					<td class="room4">empty</td>
				</tr>
				<tr class="time4" id="timetr">
					<th>18~21시</th>
					<td class="room1">empty</td>
					<td class="room2">empty</td>
					<td class="room3">empty</td>
					<td class="room4">empty</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="s1div" class="sdiv" style="display:none;">
		<table class="roomtab">
			<tr>
				<td colspan="2" rowspan="7" class="room" id="1">1번방</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan="4" rowspan="2" class="room" id="2">2번방</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan="4" class="roompath">25</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td rowspan="4" class="roompath">32</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td colspan="2" rowspan="7" class="room"id="4">4번방</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" class="roompath">57</td>
				<td></td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4" rowspan="2" class="room" id="3">3번방</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			</tr>
		</table>
	</div>
	<div id="s2div" style="display: none;" class="sdiv">
		<div id="s2div_1">
			<table class="table table-hover" id="timetable">
				<tr id="time1">
					<td><input type="radio" name="sr_time" value="1" class="sr_time" disabled="disabled">09시 ~ 12시</td>
				</tr>
				<tr id="time2">
					<td><input type="radio" name="sr_time" value="2" class="sr_time" disabled="disabled">12시 ~ 15시</td>
				</tr>
				<tr id="time3">
					<td><input type="radio" name="sr_time" value="3" class="sr_time" disabled="disabled">15시 ~ 18시</td>
				</tr>
				<tr id="time4">
					<td><input type="radio" name="sr_time" value="4" class="sr_time" disabled="disabled">18시 ~ 21시</td>
				</tr>
			</table>
		</div>
	</div>
	<button type="submit" class="btn btn-success" id="srBooking" disabled="disabled">예약하기</button>
	<button type="button" class="btn btn-danger" id="srCancel" style="display:none;">예약취소하기</button>
	</form>
</body>
</html>
