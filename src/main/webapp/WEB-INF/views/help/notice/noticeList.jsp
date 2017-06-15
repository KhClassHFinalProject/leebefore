<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<div class="col-md-3" style="text-align: center;">
					<a class="btn btn-default" type="submit" href="noticeWrite.ju">
						<span class="glyphicon glyphicon-pencil" aria-hidden="true">
							공지쓰기</span>
					</a>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">
					<table class="table table-striped table table-hover" border="1">
						<thead>
							<tr>
								<th>번호</th>
								<th>분류</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:if test="${empty list}">
									<td colspan="6" align="left">등록된 공지사항이 없습니다.</td>
								</c:if>
							</tr>
							<c:forEach var="dto" items="${list}">
								<tr>
									<td>${dto.nt_idx}</td>
									<td>${dto.nt_cate}</td>
									<td><a href="noticeContent.ju?nt_idx=${dto.nt_idx}">${dto.nt_subject}</a></td>
									<td>${dto.mem_idx}</td>
									<td>${dto.nt_date}</td>
									<td>${dto.nt_readnum}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="row">
					<form action="noticeList.ju" id="frm">
							<div class="col-md-2">
								<select class="form-control" name="type">
									<option value="nt_subject">전체</option>
									<option value="mem_idx">작성자</option>
									<option value="nt_subject">제목</option>
								</select>
							</div>
							<div class="col-md-4 input-group">
								<input  type="text" class="form-control" placeholder="검색어를 입력하세요" name="query">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button" onclick="submit()">Go!</button>
								</span>
							</div>
							<div class="col-md-12" style="text-align: center">
								<ul class="pagination pagination-sm">
									<c:choose>
										<c:when test="${page==1}">
												<li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
											</c:when>
											<c:otherwise>
												<li><a href="noticeList.ju?page=${page-1}"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
											</c:otherwise>
									</c:choose>
									<c:forEach begin="${startPage}" end="${endPage}" var="i">
										<c:choose>
											<c:when test="${i eq page}">
												<li class="active"><a href="noticeList.ju?page=${i}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="noticeList.ju?page=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${page==endPage}">
												<li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a>
											</c:when>
											<c:otherwise>
												<li><a href="noticeList.ju?page=${page+1}"><span class="glyphicon glyphicon-chevron-right"></span></a>
											</c:otherwise>
									</c:choose>
								</ul>
							</div>
							<input type="hidden" name="page" value="${page}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function submit(){
		$('#frm').submit();
	}
	</script>
</body>
</html>
