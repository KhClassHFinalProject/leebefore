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
					<h2>공지사항 게시판</h2>
				</div>
			</div>
			<div class="col-md-10">
				<form name="noticeChange" action="noticeChangeok.ju">
					<table class="table table-striped table table-hover" border="1">
						<tr>
							<th>제목제목제목제목제목</th>
							<th colspan="2">2017-05-31</th>
						</tr>
						<tr>
							<td>첨부</td>
							<td>서영주</td>
							<td>5</td>
						</tr>
						<tr>
							<td colspan="3"><div class="col-md-12">
									<textarea class="form-control col-sm-5" rows="10">adadad</textarea>
								</div></td>
						</tr>
						<tr>
							<td colspan="3">
									<div class="form-group"></div>
									<button type="submit" class="btn btn-default">수정</button>
									<button type="reset" class="btn btn-default">취소</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
