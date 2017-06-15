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
<script type="text/javascript"
	src="/lee/resources/sideMenu/sideScript.js"></script>

<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
<style type="text/css">
.btn-primary {
	background-color: #0BD392;
	border-color: #09BD8D;
}

.btn-primary:HOVER {
	background-color: #1AA4AC;
	border-color: #3CDBDE;
}

.radiobox input[type=text] {
	background-color: white;
}

@MEDIA ( min-width : 768px) {
	body {
		margin: 50px;
	}
	#basic-addon1 {
		height: 34px;
		padding-right: 20px;
		padding-top: 10px;
		background-color: white;
		border: 0px;
	}
}
}
</style>

<script type="text/javascript">
	function checkPw() {
		var input_pwd = $("#input_pwd").val();
		var mem_idx = "${dto.mem_idx}";
			$.ajax({
			        url : "checkPw.ju",
			        type: "get",
			        data : {"input_pwd":input_pwd,"mem_idx":mem_idx},
			        dataType:"json",
			        
			        success : function(responseData){
			        	$("#ajax").remove();
			            
			           result = responseData;
			            
			            if(!result){
			            	alert("데이터를 받지 못함");
			            }else{
			            	
				            
				            if(result==1){
					            $('#checkPw').removeClass('in');
								$('body').removeClass('modal-open');
								$('#changeForm').css('display', 'block');
	
								$('#collapseTwo').show('slow');
								$('#collapseTwo').addClass('in');
								$('.modal').css('display', 'none');
								
								var addrstr = "${dto.mem_addr}";
								var addr = addrstr.split('~');
								var addr0 = addr[0];
								var addr1 = addr[1];
								var addr2 = addr[2];
								var addr3 = addr[3];
								$("#zipNo").val(addr0);
								$("#roadAddrPart1").val(addr1);
								$("#addrDetail").val(addr2);
								$("#roadAddrPart2").val(addr3);

								var birthstr = "${dto.mem_birth}";
								var birth = birthstr.split('~');
								$("#jumin").val(birth[0]);
								$("#jumin2").val(birth[1]);
								
				            }else{
				            	alert('암호가 일치하지 않습니다.');
				            }
			            }
			           	
			        },
			        error: function(request,status,error){
			        	
			        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			        }
		   		 });
		
	};

	function changeSubmit(){
		$("#mem_id").val($("#idid").val());
		$("#mem_pwd").val($("#pwpw").val());
		$("#mem_name").val($("#memname").val());
		$("#mem_hp").val($("#phph0").val()+'~'+$("#phph").val()+'~'+$("#phph2").val());
		$("#mem_addr").val($("#zipNo").val()+'~'+$("#roadAddrPart1").val()+'~'+$("#addrDetail").val()+'~'+$("#roadAddrPart2").val());
		$("#mem_hint").val($("#pwdhint option:selected").val());
		$("#mem_answer").val($("#pwdanswer").val());
		$("#mem_birth").val($("#jumin").val()+'~'+$("#jumin2").val());
		var likes = '';
		$("input[name=like]:checked").each(function() {
			  likes += $(this).val();
		$("#mem_like").val(likes);
		});
		$("#memChange").trigger("click");
	}
</script>
	
<style>
@media ( min-width :769px) {
	#changeForm {
		width: 100%;
	}
	#submenulabel {
		width: 675px;
		height: 134px;
	}
}

@media ( max-width :768px) {
	#cssmenu {
		width: 100%;
	}
	#changeForm {
		width: 100%;
	}
	#submenulabel {
		width: 100%;
		height: 134px;
		margin-bottom: 50px;
	}
}
</style>
</head>
<body class='modal-open'>
	<%@include file="../header.jsp"%>
	<div class="row">

		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			<div id="changeForm" style="padding: 0px; background-color:">
				<!-- 컨텐츠 입력 -->
				<!-- 커넨츠 상단 바 -->
				<div id="submenulabel"
					style="width: 675px; height: 134px; background-image: url('/lee/resources/member/img/sul.png')">
					<div
						style="width: 100%; height: 100%; margin: 0px; padding: 50px; background-color: rgba(26, 164, 172, 0.5);">
						<h2 style="color: white;">회원정보 수정</h2>
					</div>
				</div>
				<!-- 개인정보 수정 폼  -->
				<div class="panel panel-default row">
					<div class="panel-heading" role="tab" id="headingTwo">
						<h4 class="panel-title">
							<a class="collapsed" id="headingTwoA"> 개인정보 </a>
						</h4>
					</div>
					<div id="collapseTwo" class="panel-collapse collapse"
						role="tabpanel" aria-labelledby="headingTwo">

							<div class="panel-body">

								<!-- 개인정보 입력폼 시작  -->
								<!-- 아이디 -->
								<div class="row">
									<label class="col-md-12" for="sel1">아이디</label>



									<div class="col-md-4">
										<input type="text" id="idid" class="form-control"
											value="${dto.mem_id}" aria-describedby="basic-addon2"
											readonly required>
									</div>

									<div class="col-md-1" id="idcheckSuc"></div>
								</div>


								<br>
								<br>
								<br>
								<!-- 비밀번호 -->

								<div class="row">
									<label class="col-md-12" for="sel1">비밀번호</label>
									<div class="col-md-4">
										<!-- 비밀번호 -->
										<input type="password" id="pwpw" class="form-control"
											placeholder="6~20자 (한글 및 특수문자 금지)"
											aria-describedby="basic-addon2" required> <span
											id="hpcheckSuc"></span>
									</div>
								</div>
								<div class="row">
									<label class="col-md-12" for="sel1">비밀번호 확인</label>
									<div class="col-md-4">
										<input type="password" id="pwpw2" class="form-control"
											aria-describedby="basic-addon2" required> <span
											id="hpcheckSuc2"></span>
									</div>

								</div>

								<script>
									
								</script>
								<br>
		
								<!-- 이름 -->
								<div class="row">
									<label class="col-md-12" for="sel1">이 름</label>
									<div class="col-md-4">
										<!-- 이름 -->
										<input type="text" id="memname" class="form-control"
											value="${dto.mem_name}" aria-describedby="basic-addon2"
											maxlength="4" readonly required>
									</div>
									<script>
										$("#memname")
												.keyup(
														function(event) {
															if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
																var inputVal = $(
																		this)
																		.val();
																$(this)
																		.val(
																				inputVal
																						.replace(
																								/[a-z0-9]/gi,
																								''));
															}
														});
									</script>
								</div>
								<div class="row">
									<hr>
								</div>
								<div class="row">
									<!-- 연락처 -->
									<label class="col-md-12" for="sel1">연락처</label>
									<div class="col-md-12">
										<!-- 연락처1 -->
										<select class="form-control col-md-3" id=phph0
											style="width: 150px; border-top-left-radius: 0; border-bottom-left-radius: 0;">
											<option>010</option>
											<option>011</option>
											<option>017</option>
											<option>019</option>
										</select> <span class="input-group-addon col-md-1" id="basic-addon1"
											style="height: 34px; padding-right: 20px; padding-top: 10px; border-radius: 0; border: 0px; background-color: #fff; border-top-left-radius: 0; border-bottom-left-radius: 0;">
											<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
										</span>
										<!-- 연락처 2 -->
										<input type="text" id="phph" class="form-control col-md-3"
											aria-describedby="basic-addon2" style="width: 150px;"
											maxlength="4" required> <span
											class="input-group-addon col-md-1" id="basic-addon1"
											style="height: 34px; padding-right: 20px; padding-top: 10px; border-radius: 0; border: 0px; background-color: #fff; border-top-left-radius: 0; border-bottom-left-radius: 0;">
											<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
										</span>
										<!-- 연락처 3 -->
										<input type="text" id="phph2" class="form-control col-md-3"
											aria-describedby="basic-addon2" style="width: 150px;"
											maxlength="4" required> <br> <br>
									</div>
									<div class="col-md-12">
										<button id="checkHp" class="btn btn-primary col-md-4"
											onclick="hpCheck();">휴대전화 중복검사</button>
									</div>
								</div>
								<br>
								<br> <br>
								<br>
								<!-- 주소 -->
								<div class="row">
<script>

</script>
									<label class="col-md-12" for="sel1">주 소</label>


									<div class="col-md-12 row">
										<div class="col-md-2">
											<input class="form-control" type="text"
												aria-describedby="sizing-addon2" id="zipNo" name="zipNo"
												maxlength="7" readonly required>
										</div>
										<button class="btn btn-primary col-md-2" id='addrSearchBt'
											data-toggle="modal" data-target="#searchAddress">주소검색</button>
										<!-- 우편번호 -->
									</div>
								</div>
								<div class="row">
									<br>

									<div class="col-md-4">
										<input type="text" class="form-control"
											aria-describedby="sizing-addon2" id="roadAddrPart1" readonly>
									</div>
								</div>
								<div class="row">
									<!-- 주소1 -->
									<br>
									<div class="col-md-4">
										<!-- 주소2 -->
										<input type="text" class="form-control"
											aria-describedby="sizing-addon2" id="addrDetail" value=""
											readonly>
									</div>
								</div>
								<div class="row">
									<br>
									<div class="col-md-4">
										<!-- 주소3 -->
										<input type="text" class="form-control"
											aria-describedby="sizing-addon2" placeholder="상세주소"
											id="roadAddrPart2" value="" readonly>
									</div>
								</div>

								<br> <br>

								<!-- 비밀번호 힌트 -->
								<div class="row">

									<label class="col-md-12" for="sel1">비밀번호 힌트</label>
									<div class="col-md-4">
										<select class="form-control" id="pwdhint">
											<option value="0">나의 첫사랑 이름은 ?</option>
											<option value="1">내가 다녔던 초등학교는 ?</option>
											<option value="2">나에게 영감을 주는 사람은 ?</option>
											<option value="3">나에게 가장 소중한 사람은 ?</option>
											<option value="4">가장 여행가보고 싶은 나라는 ?</option>
											<option value="5">내 이상형의 조건은 ?</option>
										</select>
									</div>
								</div>

								<!-- 비밀번호 찾기 답 -->
								<div class="row" id="selfinput">

									<label class="col-md-12" for="sel1">비밀번호 답변</label>
									<div class="col-md-4">
										<input type="text" id="pwdanswer" class="form-control"
											aria-describedby="sizing-addon2">
									</div>
								</div>
								<br> <br>
								<!-- 생년월일 -->
<script>

</script>
								<div class="row" id="birthday">
									<label class="col-md-12" for="sel1">생년월일 / 성별</label>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="row">
											<div class="col-md-4">
												<input id="jumin" type="text" class="form-control"
													aria-describedby="sizing-addon2" maxlength="6"
													placeholder="예) 900401" readonly="readonly" required>
											</div>
											<div class="col-md-1">
												<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
											</div>
											<div class="col-md-2">
												<input id="jumin2" type="text" class="form-control"
													aria-describedby="sizing-addon2" readonly="readonly" maxlength="1" required>
											</div>
											<div class="col-md-3">
												<!-- * 기호 -->
												<span class="glyphicon glyphicon-asterisk"
													aria-hidden="true"></span> <span
													class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-asterisk"
													aria-hidden="true"></span> <span
													class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
												<span class="glyphicon glyphicon-asterisk"
													aria-hidden="true"></span> <span
													class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>

											</div>
										</div>
									</div>
								</div>
								<br> <br>

								<!-- 관심사 -->
								<div class="row">
									<label class="col-md-12" for="sel1">관심사</label>
								</div>

								<div class="checkbox" id="like">
									<div class="radiobox" id="like">
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="0">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="나의 존재">
										</div>
										<!-- /input-group -->
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="1">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="삶과 죽음">
										</div>
										<!-- /input-group -->
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="2">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="사회">
										</div>
										<!-- /input-group -->
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="3">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="과학">
										</div>
										<!-- /input-group -->
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="4">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="문화생활">
										</div>
										<!-- /input-group -->
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="5">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="지구촌">
										</div>
										<!-- /input-group -->
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="6">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="갈등">
										</div>
										<!-- /input-group -->
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="7">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="과거와 현재 그리고 미래">
										</div>
										<!-- /input-group -->
										<div class="input-group col-md-4">
											<span class="input-group-addon"> <input type="radio"
												name="like" aria-label="..." value="8">
											</span> <input type="text" class="form-control" aria-label="..."
												readonly value="새로배움">
										</div>
										<!-- /input-group -->

									</div>
								</div>

								<br> <br> <button id="memberInput" onclick="changeSubmit()"
									class="collapsed btn btn-primary">작성완료</button>
						
					</div>
					</div>
				</div>
			</div>
		</div>

	
	<!-- Modal -->
	<div class="modal fade in" id="checkPw" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="false"
		style="display: block; margin-top: 22%; margin-left: 20%;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					</button>
					<h4 class="modal-title" id="myModalLabel">회원정보변경(비밀번호입력)</h4>
				</div>
				<div class="modal-body">
					<input id="input_pwd" type="password" placeholder="비밀번호">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" onclick="checkPw();">비밀번호
						확인</button>
				</div>
			</div>
		</div>
	</div>

<form id="changeForm" action="changeMeOk.ju">

<input name="mem_id" id="mem_id" type="hidden">
<input name="mem_pwd" id="mem_pwd" type="hidden">
<input name="mem_name" id="mem_name" type="hidden">
<input name="mem_hp" id="mem_hp" type="hidden">
<input name="mem_addr" id="mem_addr" type="hidden">
<input name="mem_hint" id="mem_hint" type="hidden">
<input name="mem_answer" id="mem_answer" type="hidden">
<input name="mem_birth" id="mem_birth" type="hidden">
<input name="mem_like" id="mem_like" type="hidden">
<button type="submit" id="memChange" class="collapsed btn btn-primary" style="display: none;">
	      가입신청</button>
 </form>

	<div class="col-md-12" style="padding: 0px">
		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>