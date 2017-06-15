<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<style type="text/css">
</style>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<script type="text/javascript">
	function rrCheckMJ(){
		alert('쳌');
	}
</script>
</head>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<body>
	<div class="bookingGuide">
		<div class="allGuide">
			<h2>좌석 예약 시스템</h2>
		</div>
		<div class="rrBookGuide">
			열람실 예약 이용규칙<br>
			당일 예약 1회에 2시간씩<br>
			연장가능<br>
			07~23시<br>
		</div>
		<div class="crBookGuide">
			멀티미디어실 예약 이용규칙<br>
			당일예약 1회에 1시간씩<br>
			연장 불가능<br>
			09~18시<br>
		</div>
		<div class="srBookGuide">
			스터디룸 예약 이용규칙<br>
			사용 2주전부터 예약 가능 4시간단위로 하루에 3파트<br>
			연장 불가능<br>
			09시~21시<br>
			주말 이용불가, 1일 1회<br>
		</div>
	</div>
	<div class="bookingdiv">
		<div class="rrBook">
			<%@include file="rrBook.jsp" %>
		</div>
		<div class="crBook">
			<%@include file="crBook.jsp" %>
		</div>
		<div class="srBook container">
			<h2>스터디룸 예약 이용</h2>
			<button type="button" class="btn btn-info btn-lg" onclick="javascript:location.href='/lee/srBook.ju';">예약하기</button>
		</div>
	</div>
</body>
</html>