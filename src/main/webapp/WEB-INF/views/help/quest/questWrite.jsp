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
			<h2>QnA게시판 쓰기</h2>
			<div class="row">
				<form name="qnaWrite" action="questWriteOk.ju">
					<table class="table table-striped table table-hover" border="1">
						<tr>
							<th class="text-center">제목</th>
							<td><input type="text" class="form-control"
								name="qu_subject" placeholder="제목을 입력하세요"></td>

						</tr>
						<tr>
							<th class="text-center">작성자</th>
							<td class="text-center">${sid}</td>
						</tr>
						<tr>
							<th class="text-center">카테고리</th>
							<td>
								<div class="radio">
									<label><input type="radio" name="qu_cate" value="0" checked> 수정해 여기 </label> 
									<label><input type="radio" name="qu_cate" value="1"> 도서관이용인지 전자책인지 etc인지 </label>
								</div>
							</td>

						</tr>

						<tr>
							<th class="text-center">내용</th>
							<td><textarea class="form-control" rows="10"
									name="qu_content" placeholder="내용을 입력하세요"></textarea></td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="form-group"></div>
								<button type="submit" class="btn btn-default">등록</button>
								<button type="reset" class="btn btn-default">재작성</button>
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
