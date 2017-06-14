<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
	
	$(document).ready(function() {
		/**change color of selecting seat*/
		$("#crtd>button").on("click",function() {
			$("#crtd>button").removeClass("btn-primary").addClass("btn-default");
			$(this).removeClass("btn-default").addClass("btn-primary");
		});
		
		$.ajax({
			url : "rr.ju"
			, type : "GET"
			, dataType : "json" 
			, success : function(rr){
				for(var i = 0; i<rr.rlist3.length;i++){
					$("#r3tab>tbody>tr>."+rr.rlist3[i].rr_seatno+">button").removeClass("btn-default").addClass("btn-danger");
					$("#r3tab>tbody>tr>."+rr.rlist3[i].rr_seatno+">button").attr("disabled",true);
				}
			}
			
		});
	});

	function cbookseat(btn_seatno) {
		$("#cr_seatno").val(btn_seatno);
		$("#crBooking").attr("disabled", false);
	}
</script>
<style type="text/css">
.modal-body {
	width: 350px;
	height: 400px;
}

.rdiv {
	float: left;
}

.rdiv2 {
	float: right;
	width: 100px;
	height: 200px;
}

.tab {
	width: 200px;
	height: 200px;
}

.rrbtn {
	width: 50px;
}
</style>
</head>
<body>
	<form action="crBook.ju" name="cr_form">
		<input type="hidden" name="rr_seatno" id="cr_seatno">
		<input type="hidden" name="mem_idx" id="crmem_idx" value="${sessionScope.normalMember}">
		<input type="hidden" name="rr_cate" value="3">
		<div class="container">
			<h2>자료실 이용</h2>
			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
				data-target="#crBook">이용하기</button>
			<!-- Modal -->
			<div class="modal fade" id="crBook" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content" id="seat">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" id="modal-title">자료실 이용하기</h4>
						</div>
						<div class="modal-body">
							<div id="r3div" class="rdiv">
								<table class="tab" id="r3tab">
									<c:forEach var="row" begin="1" step="1" end="5">
										<tr>
											<c:choose>
												<c:when test="${(row mod 3) eq 0}">
													<c:forEach var="col" begin="1" step="1" end="5">
														<td>&nbsp;&nbsp;</td>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach var="col" begin="1" step="1" end="5">
														<td id="crtd" class="${row }${col}">															
															<button type="button" class="btn btn-default rrbtn"
																onclick="javascript:cbookseat('${row}${col}');">${row }-${col }</button>
														</td>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="cdiv2">
								이름 :
								<div id="cdiv2name"></div><br>
								열람실 : 
								<div id="cdiv2cate"></div><br>
								좌석번호 :
								<div id="cdiv2seatno"></div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success" id="crBooking"
								disabled="disabled">예약하기</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal" onclick="javascript:location.reload();">닫기</button>
						</div>
					</div>
				</div>
			</div>

		</div>
	</form>
</body>
</html>
