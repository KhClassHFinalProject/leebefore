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
								$(".rt_check>.time"+i+">.room"+j).attr("id","");
	            			}
	            		}
			           	
		            	for(var i = 0; i<cal.srarr.length;i++){
							var rn = cal.srarr[i].sr_roomno;
							var tn = cal.srarr[i].sr_time;
							$(".rt_check>.time"+tn+">.room"+rn).css("background","red");
							$(".rt_check>.time"+tn+">.room"+rn).text("using");
							$(".rt_check>.time"+tn+">.room"+rn).addClass("using");
							$(".rt_check>.time"+tn+">.room"+rn).attr("id","using");
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
			var status = $(event.target).text();
			if(status=="using"){
				$(".sdiv").show();
				$("#srBooking").attr("disabled",true);
				roomName = event.target.className.substr(4,1);
				timeName = $(event.target).parent().attr("class").substr(4,1);
				var rt_info = {roomno:roomName,time:timeName,resdate:$("#resdate").val()};
				$("#srCancel").show();
				$(event.target).css("background-color","orange");
				$.ajax({
					url : "srRoomInfo.ju"
					, type : "POST"
					, dataType : "json" 
					, data : rt_info
					, success : function(uCheck){
						var time = uCheck.roomInfo.sr_time;
						switch (time){
						case 1:
							var time_s = "09시 ~ 12시";
							break;
						case 2:
							var time_s = "12시 ~ 15시";
							break;
						case 3:
							var time_s = "15시 ~ 18시";
							break;
						case 4:
							var time_s = "18시 ~ 21시";
							break;
						}
						$("#midx").text(uCheck.roomInfo.mem_idx);
						$("#rno").text(uCheck.roomInfo.sr_roomno);
						$("#tno").text(time_s);
					}
				});
			}
		});
		
		
		$("#srCancel").click(function(){
			location.href="/lee/srAdminCancel.ju?sr_roomno="+roomName+"&sr_time="+timeName;
		});
		
		$(".throom").click(function(){
			$("#timetr>td").css("background-color","#0BD392");
			$(".using").css("background-color","red");
			var roomno = $(event.target).attr("id").substr(6,1);
			
			console.log(roomno);
			$(".room"+roomno).css("background-color","#1AA4AC")
			$("#sr_roomno").val(roomno);
			for(var i = 1; i<=4;i++){
				if($(".time"+i+">.room"+roomno).text()=="using"){
					$(".time"+i+">.room"+roomno).css("background-color","red");
				}
			}
			for(var i = 1; i<=4;i++){
				if($(".time"+i+">.room"+roomno).text()=="using"){
					$(".time"+i+">.room"+roomno).css("background-color","red");
					return;
				}
			}
			$("#srBooking").attr("disabled",false);
		});
			console.log('happy70');
	});

</script>
<style type="text/css">
body{
	width: 90%;
}
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

	<form name="sr_form" action="adminRoomDisabled.ju" method="post">
	<input type="hidden" name="sr_roomno" id="sr_roomno">
	<input type="hidden" name="resdate" id="resdate" value="">
	<div id='calendar' style="width:50%;"></div>
	<div style="width:40%;">
		<h2 id="selectedDate"></h2>
		<table class="table" border="1" id="roomStatus" style="display:none;">
			<thead>
				<tr>
					<th>&nbsp;</th>
					<th id="throom1" class="throom">1번방</th>
					<th id="throom2" class="throom">2번방</th>
					<th id="throom3" class="throom">3번방</th>
					<th id="throom4" class="throom">4번방</th>
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
		<fieldset>
			<legend>방 정보</legend>
			<ul>
				<li>
					<label>회원번호 : </label>
					<span id="midx"></span>
				</li>
				<li>
					<label>방번호 : </label>
					<span id="rno"></span>
				</li>
				<li>
					<label>시간 : </label>
					<span id="tno"></span>
				</li>
			</ul>
		</fieldset>
	</div>
	<button type="submit" class="btn btn-success" id="srBooking" disabled="disabled">예약 정지하기</button>
	<button type="button" class="btn btn-danger" id="srCancel" style="display:none;">예약 취소하기</button>
	</form>
</body>
</html>
