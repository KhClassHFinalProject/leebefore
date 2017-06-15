<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
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
	<script type="text/javascript"
	src="/lee/resources/sideMenu/sideScript.js"></script>

<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
<style type="text/css">
	.btn-primary{
		background-color:#0BD392;
		border-color: #09BD8D;
	}
	.btn-primary:HOVER{
		background-color:#1AA4AC;
		border-color: #3CDBDE;
	}
	
	</style>

<script type="text/javascript">


	
	</script>
<style>
@media ( min-width :769px) {
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width: 675px;
	height: 134px;
	padding:0px;
	}
	#memberIdcardDiv{
	margin:150px;
	width: 550px;
	height:350px;
	padding-left: 93px;
	border: 1px solid grey;
	border-radius: 24px;
	}
	
}
@media ( max-width :768px) {
	#cssmenu {
		width: 100%;
	}
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width:100%;
	height: 134px;
	margin-bottom:50px;
	padding:0px;
	}
	
	#memberIdcardDiv{
		transform:rotate(90deg);
		margin:0px 100px 0px 100px;
		
	}
	#memberIdcard{
		width: 450px;
	}
	#displaybarcode{
		margin-bottom:200px;
	}
	
}

	

</style>
</head>
<body>
<c:set var="date" value="${date}"/>
<c:set var="ip" value="${ip}"/>
<c:set var="country" value="${country}"/>
	<%@include file="../header.jsp"%>
	<div class="row">
	
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			
			<div class="" id="changeForm"
				style="padding: 0px;">
				
					
				<!-- 컨텐츠 입력 -->
			
					<div class="col-md-12" id="submenulabel"
						style=" background-image: url('/lee/resources/member/img/sul.png')">
						<div
							style="width: 100%; height: 100%; margin: 0px; padding: 50px; background-color: rgba(26, 164, 172, 0.5);">
							<h2 style="color: white;">로그인 정보 확인</h2>
						</div>
					</div>
					
					<!-- 기록 확인 부분 -->
					<div class="col-md">
						<table class="table table-hover">
							<tr>
								<th>접속일</th>
								<th>접속IP주소</th>
								<th>접속국가</th>
							</tr>
							<c:if test="${empty date}">
							<tr>
								<td colspan="3">최근 로그인 기록이 없습니다</td>
							</tr>
							</c:if>
							<c:forEach begin="0" end="${fn:length(date)}" step="1" varStatus="i">
							<tr>
								<td>${date[fn:length(date)-i]}</td>
								<td>${ip[fn:length(date)-i]}</td>
								<td>${country[fn:length(date)-i]}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
					
					
			</div>	
			<div class="col-md-12" style="margin: 150px;">
					
					</div>
			
		</div>
	</div>
	
	<div class="col-md-12">
	<%@include file="../footer.jsp"%>
	</div>
	
</body>
</html>