<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
   
   <link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
   <link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap-theme.min.css">
   <script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
   <script type="text/javascript"
	src="/lee/resources/sideMenu/sideScript.js"></script>
	
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
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

		<div class="col-md-9" id="changeMeForm" style="padding: 0px; background-color: ">
		<!-- 컨텐츠 입력 -->
				<!-- 커넨츠 상단 바 -->
				<div id="submenulabel" style="width:675px; height:134px;  background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; margin:0px; padding:50px; background-color: rgba(26, 164, 172, 0.5 );">
						<h2 style="color:white;">나의 수업</h2>
					</div>
				</div>		
				<!-- 컨텐츠 실영역 -->
				<h3></h3>
				<div style="background-color: #1AA4AC; opacity:0.5; height:950px;width:100%;">
				
				</div>
				
		</div>
	</div>
<div class="col-md-12">
	<%@include file="../footer.jsp"%>
</div>
</body>
</html>