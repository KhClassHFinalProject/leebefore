<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<h2>FAQ 게시판</h2>
				</div>
				<div class="col-md-3" style="text-align: center;">
					<a class="btn btn-default" type="submit" href="noticeWrite.ju">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true">
							공지쓰기(오른쪽)</span>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">
					<table class="table table-striped table table-hover" border="1">
						<thead>
							<tr>
								<th>분류</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
							<tr>
								<td>1</td>
								<td>조회수많은게시물1</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>99999</td>
							</tr>
							<tr>
								<td>2</td>
								<td>조회수많은게시물2</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>2</td>
							</tr>
							<tr>
								<td>3</td>
								<td>조회수많은게시물3</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>2</td>
							</tr>
							<tr>
								<td>4</td>
								<td>조회수많은게시물4</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>2</td>
							</tr>
							<tr>
								<td>5</td>
								<td>조회수많은게시물5</td>
								<td>관리자</td>
								<td>2017-05-30</td>
								<td>2</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
