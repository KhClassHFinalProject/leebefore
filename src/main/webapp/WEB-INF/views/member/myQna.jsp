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
	hr{
		margin:0px;
	}
	
	h4{
		text-align: center;
	}
	p{
		margin-left: 30px;
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
				style="padding: 0; background-color: ">
						
				<!-- 컨텐츠 입력 -->
					<div id="submenulabel" style="width:675px; height:134px;  background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; margin:0px; padding:50px; background-color: rgba(26, 164, 172, 0.5 );">
						<h2 style="color:white;">나의 문의</h2>
					</div>
				</div>
				<!-- 컨텐츠 실영역 -->
				<div>
				<script>
				    $(document).ready(function(){
				
				        $("#report tr:odd").addClass("odd");
				        $("#report tr:not(.odd)").hide(); 
				        $("#report tr:first-child").show('slow'); //열머리글 보여주기
				
				        $("#report tr.odd").click(function(){
				            $(this).next("tr").toggle();
				            $(this).find(".arrow").toggleClass("up");
				
				        });
				       
				
				    });

				</script>
				<table class="table table-hover" id="report">
					<thead>
						<tr>
						 	<th style="width:10%">번호</th>
						 	<th style="width:40%">제목</th>
						 	<th style="width:15%">공개여부</th>
						 	<th style="width:20%">작성날짜</th>
						 	<th style="width:15%">답변여부</th>
						 	
						</tr>
					</thead>
					<tbody>
<c:set var="qnalist" value="${qnalist}"/>
<c:choose>
	<c:when test="${empty qnalist}">
		 			<tr>
					 	<td colspan="5">작성된 글이 없습니다.</td>
					 	
					 </tr>
	</c:when>
	<c:when test="${qnalist ne null}">
		<c:forEach items="${qnalist}" var="list">
				<c:choose>
					<c:when test="${empty list.qu_qcontent}">
						<tr>	
					</c:when>
					<c:otherwise>
						<tr class="success">
					</c:otherwise>
				</c:choose>
					
					 	<td>${list.rnum }</td>
					 	<td>${list.qu_subject }</td>
					 	
				<c:choose>
					<c:when test="${list.qu_screct eq 1}">
						<td>미공개</td>	
					</c:when>
					<c:otherwise>
						<td>공개</td>
					</c:otherwise>
				</c:choose>	 	
					 	
					 	
					 	
					 	<td>${list.qu_date }</td>
				<c:choose>	
	           		<c:when test="${empty list.qu_qcontent}">
	           			<td>미답변</td>	
	           		</c:when>
	           		<c:when test="${list.qu_qcontent ne null}">
       					<td>답변</td>    
	           		</c:when>
	           	</c:choose>		 	
					 	
					 </tr>
					 <tr>
			            <td colspan="5">
			              
			            <hr>
	           			    <h4>내용</h4>
           			    <hr>
			                ${list.qu_content}
			            <hr>
	           			    <h4>답변</h4>
	           			<hr>
	           			    <p>
	           	<c:choose>	
	           		<c:when test="${empty list.qu_qcontent}">
	           				답변내용이 없습니다.
	           		</c:when>
	           		<c:when test="${list.qu_qcontent ne null}">
       					    ${list.qu_qcontent}
	           		</c:when>
	           	</c:choose>		  
	           		
	           			   
           			    </td>
        			</tr>
		</c:forEach>
	</c:when>
</c:choose>	
					 </tbody>
				</table>
				
				
				</div>
<hr>						

		</div>
	</div>
	<div class="col-md-12">
	<%@include file="../footer.jsp"%>
	</div>

</body>
</html>