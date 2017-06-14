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
		
		/**room1 selected*/
		$("input:radio[id=r1]").click(function() {
			if ($("#r1div").css("display") == "none") {
				jQuery('#r2div').hide();
				jQuery('#r1div').show();
				$("#rr_cate").val('1');
				$("#rrBooking").attr("disabled", true);
				$("#rrtd>button").removeClass("btn-primary").addClass("btn-default");
			}
		});
		
		/**room2 selected*/
		$("input:radio[id=r2]").click(function() {
			if ($("#r2div").css("display") == "none") {
				jQuery('#r1div').hide();
				jQuery('#r2div').show();
				$("#rr_cate").val('2');
				$("#rrBooking").attr("disabled", true);
				$("#rrtd>button").removeClass("btn-primary").addClass("btn-default");
			}
		});
		
		/**change color of selecting seat*/
		$("#rrtd>button").on("click",function() {
			$("#rrtd>button").removeClass("btn-primary").addClass("btn-default");
			$(this).removeClass("btn-default").addClass("btn-primary");
		});
		
		$.ajax({
			url : "rr.ju"
			, type : "GET"
			, dataType : "json" 
			, success : function(rr){
				for(var i = 0; i<rr.rlist1.length;i++){
					$("#r1tab>tbody>tr>."+rr.rlist1[i].rr_seatno+">button").removeClass("btn-default").addClass("btn-danger");
					$("#r1tab>tbody>tr>."+rr.rlist1[i].rr_seatno+">button").attr("disabled",true);
				}
				for(var i = 0; i<rr.rlist2.length;i++){
					$("#r2tab>tbody>tr>."+rr.rlist2[i].rr_seatno+">button").removeClass("btn-default").addClass("btn-danger");
					$("#r2tab>tbody>tr>."+rr.rlist2[i].rr_seatno+">button").attr("disabled",true);
				}
			}
		});
		
	});

	function rbookseat(btn_seatno) {
		$("#rr_seatno").val(btn_seatno);
		$("#rrBooking").attr("disabled", false);
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
	<form action="rrBook.ju" name="rr_form">
		<input type="hidden" name="rr_seatno" id="rr_seatno">
		<input type="hidden" name="mem_idx" id="rrmem_idx" value="${sessionScope.normalMember}">
		<input type="hidden" name="rr_start_str" id="rr_start">
		<input type="hidden" name="rr_end_str" id="rr_end">
		<div class="container">
			<h2>열람실 이용</h2>
			<!-- Trigger the modal with a button -->
			<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
				data-target="#rrBook">이용하기</button>
			<!-- Modal -->
			<div class="modal fade" id="rrBook" role="dialog">
				<div class="modal-dialog">

					<!-- Modal content-->
					<div class="modal-content" id="seat">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<input type="radio" name="rr_cate" id="r1" checked value="1">room1
							<input type="radio" name="rr_cate" id="r2" value="2">room2
							<h4 class="modal-title" id="modal-title">열람실 이용하기</h4>
						</div>
						<div class="modal-body">
							<div id="r1div" class="rdiv">
								<table class="tab" id="r1tab">
									<c:forEach var="row" begin="1" step="1" end="11">
										<tr>
											<c:choose>
												<c:when test="${(row mod 3) eq 0}">
													<c:forEach var="col" begin="1" step="1" end="5">
														<td>&nbsp;&nbsp;</td>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach var="col" begin="1" step="1" end="5">
														<td id="rrtd" class="${row }${col}">															
															<button type="button" class="btn btn-default rrbtn"
																onclick="javascript:rbookseat('${row}${col}');">${row }-${col }</button>
														</td>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div id="r2div" style="display: none;" class="rdiv">
								<table class="tab" id="r2tab">
									<c:forEach var="row" begin="1" step="1" end="5">
										<tr>
											<c:forEach var="col" begin="1" step="1" end="11">
												<c:choose>
													<c:when test="${(col mod 3) eq 0}">
														<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
													</c:when>
													<c:otherwise>
														<td id="rrtd" class="${row }${col}">
															<button type="button" class="btn btn-default rrbtn"
																onclick="javascript:rbookseat('${row}${col}');">${row }-${col }</button>
														</td>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="rdiv2">
								이름 :
								<div id="rdiv2name"></div>
								<br> 열람실 :
								<div id="rdiv2cate"></div>
								<br> 좌석번호 :
								<div id="rdiv2seatno"></div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success" id="rrBooking"
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
