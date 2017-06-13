<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="rrdto" value="${sessionScope.rrdto }"/>
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
/* 	$(document).ready(function(){
		$(".container>button").click(){
			$("#rrmem_idx").val("${normalMember}");
			$("#crmem_idx").val("${normalMember}");
		}
	}); */
</script>
</head>
<body>
	<div class="bookingGuide">
		<div class="allGuide">
			<h2>좌석 이용 시스템</h2>
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
	<c:set var="sid" value="${sid }" />
	<c:choose>
		<c:when test="${empty normalMember }">
			<div class="loginButton">
			<form method="post" name="barcodeLogin" action="bigBarcodeLogin.ju">
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#seatLogin">로그인</button>
				<!-- Modal -->
				<div class="modal fade" id="seatLogin" role="dialog">
					<div class="modal-dialog">
	
						<!-- Modal content-->
						<div class="modal-content" id="seat">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title" id="modal-title">로그인</h4>
							</div>
							<div class="modal-body">
								<div id="bardiv" class="lgdiv">
									<input type="text" name="mem_idx">
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-success" id="login">로그인</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal" onclick="javascript:location.reload();">닫기</button>
							</div>
						</div>
					</div>
				</div>
				</form>
			</div>
		</c:when>
		<c:when test="${!empty normalMember }">
			<div class="bookingdiv">
			<c:if test="${rrdto eq null}">
				<div class="rrBook">
					<%@include file="rrBook.jsp" %>
				</div>
				<div class="crBook">
					<%@include file="crBook.jsp" %>
				</div>
			</c:if>
			<c:if test="${rrdto ne null }">
			<div class="userInfo">
				<fieldset>
					<legend>현재 이용중인 좌석</legend>
					<label class="cate">이용중인 방 : 
					<c:choose>
						<c:when test="${rrdto.getRr_cate() eq 1 }">
							열람실1
						</c:when>
						<c:when test="${rrdto.getRr_cate() eq 2 }">
							열람실2
						</c:when>
						<c:when test="${rrdto.getRr_cate() eq 3 }">
							자료실
						</c:when>
					</c:choose>
					</label><br>
					<label class="seatno">이용 좌석번호 : ${rrdto.getRr_seatno() }</label><br>
					<label class="addTime"> 연장가능여부 : 
					<c:choose>
						<c:when test="${rrdto.getRr_add() eq '0' }">
							3번 가능
						</c:when>
						<c:when test="${rrdto.getRr_add() eq '1' }">
							2번 가능
						</c:when>
						<c:when test="${rrdto.getRr_add() eq '2' }">
							1번 가능
						</c:when>
						<c:when test="${rrdto.getRr_add() eq '불가' }">
							불가능
						</c:when>
						<c:otherwise>
							오류발생
						</c:otherwise>
					</c:choose>
					</label><br>
				</fieldset>
			</div>
				<c:if test="${rrdto.getRr_add() ne '불가'}">
					<c:url var="bigadd" value="bigAdd.ju">
						<c:param name="rr_idx" value="${rrdto.getRr_idx() }"/>
						<c:param name="rr_add" value="${rrdto.getRr_add() }"/>
					</c:url>
					<button type="button" class="btn btn-success" onclick="javascript:location.href='${bigadd}'">연장하기</button>
				</c:if>
				<c:url var="returnseat" value="returnSeat.ju">
					<c:param name="rr_idx" value="${rrdto.getRr_idx() }"/>
				</c:url>
				<button type="button" class="btn btn-danger" onclick="javascript:location.href='${returnseat}'">반납하기</button>
			</c:if>
			</div>
			<div class="container">
				<button type="button" class="btn btn-info btn-lg" onclick="javascript:location.href='/lee/seatLogout.ju'">로그아웃</button>
			</div>
		</c:when>
	</c:choose>
	
</body>
</html>