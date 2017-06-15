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
					<h2>공지사항 게시판</h2>
					<c:set var="dto" value="${dto}"/>
				</div>
			</div>
			<div class="col-md-11">
				<table class="table table-striped table table-hover" border="1">
					<tr>
						<td colspan="2">${dto.nt_subject}</td>
						<td>${dto.nt_idx}</td>
						<td>${dto.nt_date}</td>
					</tr>
					<tr>
						<td colspan="2">첨부</td>
						<td>${dto.mem_idx}</td>
						<td>5</td>
					</tr>
					<tr>
						<td colspan="4"><div class="col-md-12">
								${dto.nt_content}
							</div></td>
					</tr>
					<tr>
						<td colspan="2">댓글 0개</td>
						<td><a href="noticeChange.ju?nt_idx=${dto.nt_idx}">수정</a></td>
						<td><a href="noticeDelete.ju?nt_idx=${dto.nt_idx}">삭제</a></td>
					</tr>
					<tr>
						<td colspan="4">댓글 쭉 나오게 함</td>
					</tr>
					<tr>
						<td colspan="3">△이전글 제목</td>
						<td>이전글 작성자</td>
					</tr>
					<tr>
						<td colspan="4">현재글 제목</td>
					</tr>
					<tr>
						<td colspan="3">▽다음글 제목</td>
						<td>다음글 작성자</td>
					</tr>

				</table>
			</div>
		</div>
	</div>
</body>
</html>
