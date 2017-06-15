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
					<h2>QnA 게시판</h2>
					<c:set var="dto" value="${dto}"/>
				</div>
			</div>
			<div class="col-md-11">
				<table class="table table-striped table table-hover" border="1">
					<tr>
						<td colspan="2">${dto.qu_subject}</td>
						<td>${dto.qu_idx}</td>
						<td>${dto.qu_date}</td>
					</tr>
					<tr>
						<td colspan="2">첨부</td>
						<td>${dto.mem_idx}</td>
						<td>5</td>
					</tr>
					<tr>
						<td colspan="4"><div class="col-md-12">
								${dto.qu_content}
							</div></td>
					</tr>
					<tr>
						<td colspan="2">댓글 0개</td>
						<td><a href="questChange.ju?qu_idx=${dto.qu_idx}">수정</a></td>
						<td><a href="questDelete.ju?qu_idx=${dto.qu_idx}">삭제</a></td>
					</tr>
					<tr>
						<td colspan="4">댓글 쭉 나오게 함</td>
					</tr>
					<c:if test="${!empty next }">
						<tr>
							<td colspan="3"><a href="questContent.ju?qu_idx=${next.qu_idx}">△${next.qu_subject}</a></td>
							<td>${next.mem_idx}</td>
						</tr>
					</c:if>
					<c:if test="${!empty pre }">
						<tr>
							<td colspan="3"><a href="questContent.ju?qu_idx=${pre.qu_idx}">▽${pre.qu_subject}</a></td>
							<td>${pre.mem_idx}</td>
						</tr>
					</c:if>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
