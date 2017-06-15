<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<style type="text/css">
</style>

<script type="text/javascript"
	src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<script type="text/javascript">
	</script>
</head>

<body>
	<div class="row">
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	</div>
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/WEB-INF/views/service/elibSide.jsp"></jsp:include>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-7">
					<h2>분실물 게시판</h2>
					<c:set var="dto" value="${dto}"/>
				</div>
			</div>
			<div class="col-md-11">
				<table class="table table-striped table table-hover" border="1">
					<tr>
						<td colspan="2">${dto.missing_subject}</td>
						<td>${dto.missing_idx}</td>
						<td>${dto.missing_date}</td>
					</tr>
					<tr>
						<td colspan="2">첨부</td>
						<td>${dto.mem_idx}</td>
						<td>5</td>
					</tr>
					<tr>
						<td colspan="4"><div class="col-md-12">
								${dto.missing_content}
							</div></td>
					</tr>
					<tr>
						<td colspan="2">댓글 0개</td>
						<td><a href="missingChange.ju?missing_idx=${dto.missing_idx}">수정</a></td>
						<td><a href="missingDelete.ju?missing_idx=${dto.missing_idx}">삭제</a></td>
					</tr>
					<tr>
						<td colspan="4">댓글 쭉 나오게 함</td>
					</tr>
					<c:if test="${!empty next }">
						<tr>
							<td colspan="3"><a href="missingContent.ju?missing_idx=${next.missing_idx}">△${next.missing_subject}</a></td>
							<td>${next.mem_idx}</td>
						</tr>
					</c:if>
					<c:if test="${!empty pre }">
						<tr>
							<td colspan="3"><a href="missingContent.ju?missing_idx=${pre.missing_idx}">▽${pre.missing_subject}</a></td>
							<td>${pre.mem_idx}</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
