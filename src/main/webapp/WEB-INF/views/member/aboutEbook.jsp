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
	}
	
	
}
</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			<div id="changeForm"
				style="padding: 0px; background-color: ">
						
				<!-- 컨텐츠 입력 -->
				<!-- 커넨츠 상단 바 -->
				<div id="submenulabel" style="width:675px; height:134px;  background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; margin:0px; padding:50px; background-color: rgba(26, 164, 172, 0.5 );">
						<h2 style="color:white;">전자도서</h2>
					</div>
				</div>		
				<!-- 컨텐츠 실영역 -->
				<h3>E-book</h3>
				<!-- 전자책 -->
				<div class="row" id="loanbook">
<c:set var="eblist" value="${eblist}"/>					  
						     <c:choose>
							    <c:when test="${empty eblist}">
							        대출하신 e-book이 없습니다.    
							    </c:when>
							    <c:when test="${eblist ne null}">
							            <c:forEach items="${eblist}" var="list">
							           			 <div class="col-sm-6 col-md-4">
												     <div class="thumbnail ">
												     <div class="text-center" style="margin:auto; width:100%;height:200px;" id="imgpannel">
												      <img src="${list.el_path}" style="width:200px;height:200px;">
												     
												      </div>
												      <div class="caption ">
												        <h3>${list.el_subject}</h3>
												        <p>
												        대출일 : ${list.lb_sd}<br>
												        반납예정일 : ${list.lb_ed}<br>
												        기타사항 : ${list.lb_etc }<br>
												        연장횟수 : ${list.lb_delay}<br>
												        </p>
												        <p><a href="#" class="btn btn-primary" role="button">대출연장</a></p>
												      </div>
												    </div>
												  </div>
							        	</c:forEach>
							    </c:when>
							    
							</c:choose>
				
					
				</div>

				<hr>

		</div>
	</div>
	<div class="col-md-12">
	<%@include file="../footer.jsp"%>
	</div>
</div>
</body>
</html>