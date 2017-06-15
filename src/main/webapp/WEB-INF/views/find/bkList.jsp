<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap-theme.min.css">
<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
<!-- 내가 추가한 js 및 css 부분 -->
<style type="text/css">
.pagination>li>a, 
.pagination>li>span{
	cursor: pointer;
}
</style>
<script type="text/javascript" src="/lee/resources/find/js/bkList.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">도서 정보</h4>
      </div>
      <div class="modal-body" id="modal-body">

      </div>
	  <div class="modal-body">
    	<h5 class="modal-title">상세정보</h5>
	  	<div class="col-xs text-left padding1" id="info"></div>
	  </div>
      <div class="modal-footer">
      
        <button type="button" class="btn btn-default" data-dismiss="modal">목록으로</button>
      </div>
    </div>
  </div>
</div>
<!-- 	header -->
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	

	<!-- info -->
		<div class="row">
	<!-- side -->
			<div class="col-md-3">
				<jsp:include page="/WEB-INF/views/find/bkSide.jsp"></jsp:include>

			</div>
			<div class="col-md-9">
				<div class="row">
	<!--search -->
					<jsp:include page="/WEB-INF/views/find/searchBar.jsp"></jsp:include>
					<h4 id="a">자료검색</h4>

					<table class="table table-hover">
						<tbody id="tbody">
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
<!-- 내가 추가한 js 및 css 부분 -->
<script type="text/javascript">
$(document).ready(detailSearch());
</script>
</body>
</html>
