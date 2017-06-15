<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
=======
    pageEncoding="UTF-8"%>
>>>>>>> Daewon
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<<<<<<< HEAD
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/lee/resources/sideMenu/sideScript.js"></script>
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
<script type="text/javascript">
	$(document).ready(function(){
		var mem_idx = '${sessionScope.sidx}';
		var mem = {mem_idx:mem_idx};
		$.ajax({
			url : "duplicateRegist.ju"
			, type : "POST"
			, data : mem
			, dataType : "json" 
			, success : function(dr){
				for(var i = 0; i<dr.myrgst.length;i++){
					$("#"+dr.myrgst[i]).attr("disabled","disabled");
				}
			}
		});
	});
</script>
<style>
@media ( min-width :769px) {
	#changeForm {
		width: 100%;
	}
	#submenulabel {
		width: 675px;
		height: 134px;
	}
}

=======
   
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
>>>>>>> Daewon
@media ( max-width :768px) {
	#cssmenu {
		width: 100%;
	}
<<<<<<< HEAD
	#changeForm {
		width: 100%;
	}
	#submenulabel {
		width: 100%;
		height: 134px;
		margin-bottom: 50px;
	}
}

#changeMeForm{
	margin-bottom: 50px;	
}
#report>tbody>tr>td{
	margin-bottom: 20px;
=======
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width:100%;
	height: 134px;
	margin-bottom:50px;
	}
	
	
>>>>>>> Daewon
}
</style>
</head>
<body>
<<<<<<< HEAD
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="row">
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm"
			style="padding: 0px; background-color:">
			<!-- 컨텐츠 입력 -->
			<!-- 커넨츠 상단 바 -->
			<div id="submenulabel"
				style="width: 675px; height: 134px; background-image: url('/lee/resources/member/img/sul.png')">
				<div
					style="width: 100%; height: 100%; margin: 0px; padding: 50px; background-color: rgba(26, 164, 172, 0.5);">
					<h2 style="color: white;">수강목록</h2>
				</div>
			</div>
			<!-- 컨텐츠 실영역 -->
			<div style=" width: 100%;">
				<table class="table table-hover" id="report">
					<thead>
						<tr>
							<th style="width: 10%">번호</th>
							<th style="width: 35%">강의명</th>
							<th style="width: 10%">강사명</th>
							<th style="width: 20%">강의일시</th>
							<th style="width: 15%">강의시간</th>
							<th style="width: 10%">모집정원(명)</th>
						</tr>
					</thead>
					<tbody>
						<c:set var="slist" value="${sublist}" />
						<c:choose>
							<c:when test="${empty slist}">
								<tr>
									<td colspan="5">등록된 수강목록이 없습니다.</td>
								</tr>
							</c:when>
							<c:when test="${slist ne null}">
								<c:forEach items="${slist}" var="list">
									<tr>
										<td>${list.sj_num }</td>
										<td>${list.sj_name }</td>
										<td>${list.tc_name}</td>
										<td>${list.sj_sd } ~ ${list.sj_ed}</td>
										<td>${list.sj_st } ~ ${list.sj_et}</td>
										<td>${list.sj_max }</td>
									</tr>
									<tr>
										<td colspan="6">
											<hr>
											<h4>강의정보</h4>
											<hr>
											강의 설명 : ${list.sj_sum}<br>
											강사명 : ${list.tc_name }<br>
											강의 일시 : ${list.sj_sd }~${list.sj_ed}<br>
											강의 시간 : ${list.sj_st }~${list.sj_et}<br>
											강의 정원 : ${list.sj_max }<br>
											현재 신청 인원 : ${list.sj_num }<br>
											<c:if test="${list.sj_max gt list.sj_num }">
												<c:url var="rgst" value="/rgst.ju">
													<c:param name="sj_idx" value="${list.sj_idx }"/>
												</c:url>
												<button type="button" id="${list.sj_idx }" class="btn btn-info btn-lg" onclick="javascript:location.href='${rgst}'">신청하기</button>
											</c:if>
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<%@include file="../footer.jsp"%>
	</div>
=======
<%@include file="../header.jsp"%>
	<div class="row">
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm" style="padding: 0px; background-color: ">
		<!-- 컨텐츠 입력 -->
				<!-- 커넨츠 상단 바 -->
				<div id="submenulabel" style="width:675px; height:134px;  background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; margin:0px; padding:50px; background-color: rgba(26, 164, 172, 0.5 );">
						<h2 style="color:white;">수강목록</h2>
					</div>
				</div>		
				<!-- 컨텐츠 실영역 -->
				<h3></h3>
				<div style="background-color: #1AA4AC; opacity:0.5; height:950px;width:100%;">
								<table class="table table-hover" id="report">
					<thead>
						<tr>
						 	<th style="width:10%">번호</th>
						 	<th style="width:40%">강의명</th>
						 	<th style="width:15%">강사명</th>
						 	<th style="width:20%">강의일시</th>
						 	<th style="width:15%">모집정원(명)</th>
						 	
						</tr>
					</thead>
					<tbody>
<c:set var="slist" value="${sublist}"/>
<c:choose>
	<c:when test="${empty qnalist}">
		 			<tr>
					 	<td colspan="5">등록된 수강목록이 없습니다.</td>
					 	
					 </tr>
	</c:when>
	<c:when test="${slist ne null}">
		<c:forEach items="${slist}" var="list">
				
					<tr>
				
					
					 	<td>${list.rnum }</td>
					 	<td>${list.sj_name }</td>
					 	
				
						<td>${list.tc_name}</td>
					 	
					 	
					 	
					 	
					 	<td>${list.sj_sd }~${list.sj_ed}</td>
						<td>${list.sj_max }</td> 	
					 	
					 </tr>
					 <tr>
			            <td colspan="5">
			              
			            <hr>
	           			    <h4>강의정보</h4>
           			    <hr>
		                강의 설명 : ${list.sj_sum}
		                강사명 : ${list.tc_name } 
		            	강의 일시 : ${list.sj_sd }~${list.sj_ed}    
		            	강의 시간 : ${list.sj_st }~${list.sj_et }
	           			강의 정원 : ${list.sj_max }
	           			강의 장소 : ${list.sj_loc }호	
	           			   
           			    </td>
        			</tr>
		</c:forEach>
	</c:when>
</c:choose>	
					 </tbody>
				</table>
				</div>
				
		
		</div>
	</div>
<div class="col-md-12">
	<%@include file="../footer.jsp"%>
</div>
>>>>>>> Daewon
</body>
</html>