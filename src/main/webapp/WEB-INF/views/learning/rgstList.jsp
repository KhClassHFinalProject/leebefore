<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
=======
>>>>>>> Daewon
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
   
   <link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
   <link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap-theme.min.css">
   <script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<<<<<<< HEAD
   <script type="text/javascript" src="/lee/resources/sideMenu/sideScript.js"></script>
=======
   <script type="text/javascript"
	src="/lee/resources/sideMenu/sideScript.js"></script>
>>>>>>> Daewon
	
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
<<<<<<< HEAD
<%@include file="/WEB-INF/views/header.jsp"%>
=======
<%@include file="../header.jsp"%>
>>>>>>> Daewon
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
<<<<<<< HEAD
				<c:choose>
					<c:when test="${empty mylist }">
						신청한 강의가 없습니다.
					</c:when>
					<c:when test="${mylist ne null }">
						<c:forEach items="${mylist }" var="list">
							<table>
								<thead>
									<tr>
										<th style="width: 40%">강의명</th>
										<th style="width: 10%">강사명</th>
										<th style="width: 20%">강의기간</th>
										<th style="width: 20%">강의시간</th>
										<th style="width: 10%">모집인원</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${list.sj_name }</td>
										<td>${list.tc_name }</td>
										<td>${list.sj_sd } ~ ${list.sj_ed }</td>
										<td>${list.sj_st } ~ ${list.sj_et }</td>
										<td>${list.sj_max }</td>
									</tr>
									<tr>
										<th style="width:20%">강의 설명</th>
										<td colspan="4" style="width:80%">${list.sj_sum }</td>
									</tr>
								</tbody>
							</table>
							<c:url var="delete" value="/deleteRgst.ju">
								<c:param name="sj_idx" value="${list.sj_idx }"/>
							</c:url>
							<button type="button" onclick="javascript:location.href='${delete}'">수강신청 취소하기</button>
						</c:forEach>
					</c:when>
				</c:choose>
				</div>
=======
				
				</div>
				
>>>>>>> Daewon
		</div>
	</div>
<div class="col-md-12">
	<%@include file="../footer.jsp"%>
</div>
</body>
</html>