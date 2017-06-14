<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	
</script>
</head>
<body>
	<div class="managediv">
		<div class="mrbdiv">
			<%@include file="manageRrBook.jsp" %>
		</div>
		<div class="mcbdiv">
			<%@include file="manageCrBook.jsp" %>
		</div>
		<div class="mrbdiv">
		<div class="container">
			<h2>스터디룸 관리</h2>
			<button type="button" class="btn btn-info btn-lg" onclick="javascript:location.href='adminSrManage.ju';">관리하기</button>
		</div>
		</div>
	</div>
</body>
</html>