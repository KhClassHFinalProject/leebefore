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
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/WEB-INF/views/service/elibSide.jsp"></jsp:include>
		</div>
		<div class="col-md-7">
			<h2>공지사항 쓰기</h2>
			<div class="row">
				<form name="noticeWrite" action="noticeWriteok.ju">
					<table class="table table-striped table table-hover" border="1">
						<thead>
							<tr>
								<th class="text-center col-md-2">제목</th>
								<td>
									<div class="form-group">
										<input type="text" name="nt_subject" class="form-control" placeholder="제목을 입력하세요">
									</div>
								</td>
							</tr>
							<tr>
								<th class="text-center col-md-2">내용</th>
								<td>
									<div class="form-group">
										<textarea class="form-control col-sm-5" name="nt_content" rows="10" placeholder="내용을 입력하세요"></textarea>
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div class="form-group"></div>
									<button type="submit" class="btn btn-default">등록</button>
									<a class="btn btn-default" href="notice/noticeList.ju" role="button">취소</a>
								</td>
							</tr>
					</table>
				</form>
			</div>
			<hr>
		</div>
	</div>
</body>
</html>
