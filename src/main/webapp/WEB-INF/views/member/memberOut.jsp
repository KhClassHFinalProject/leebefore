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
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	<script type="text/javascript"
	src="/lee/resources/sideMenu/sideScript.js"></script>
	
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">
<style type="text/css">
	.btn-primary{
		background-color:#0BD392;
		border-color: #09BD8D;
	}
	.btn-primary:HOVER{
		background-color:#1AA4AC;
		border-color: #3CDBDE;
	}
	
	</style>

<script type="text/javascript">
	function memOut(){
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
				    			
				    			var conf = confirm('정말 탈퇴하시겠습니까 ?');
				    			if(conf){
				    				window.location.href="memberOutOk.ju";
				    			}else{
				    				window.location.reload();
				    			}
				    			
				            }else{
				            	alert('암호가 일치하지 않습니다.');
				            }
			            }
			           	
			        },
			        error: function(request,status,error){
			        	
			        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
			        }
		   		 });
		
	}
	
	</script>
<style>
@media ( min-width :769px) {
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width: 675px;
	height: 134px;
	}
	
	
}
@media ( max-width :768px) {
	#cssmenu {
		width: 100%;
	}
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width:100%;
	height: 134px;
	margin-bottom:50px;
	}
	
	
}
</style>
</head>
<body class='modal-open'>
<c:if test="${list ne 0}">
	<script>
		alert("대출중인 도서가 있어 탈퇴가 불가능합니다.");
		window.location.href="index.ju";
	</script>
</c:if>
	<%@include file="../header.jsp"%>
	<div class="row">
	
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			<div id="changeForm"
				style="padding: 0; background-color: ">
						
				<!-- 컨텐츠 입력 -->
					<div  id="submenulabel" style="width:675px; height:134px;  background-image:url('/lee/resources/member/img/sul.png')">
					<div style="width:100%; height:100%; margin:0px; padding:50px; background-color: rgba(26, 164, 172, 0.5 );">
						<h2 style="color:white;">회원탈퇴</h2>
					</div>
				</div>
				
				<div style="height:980px;">
				<!-- Modal -->
						<div class="modal fade in" id="checkPw" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="false"
							style="display: block; margin-top: 22%; margin-left: 20%;">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										</button>
										<h4 class="modal-title" id="myModalLabel">회원탈퇴(비밀번호입력)</h4>
									</div>
									<div class="modal-body">
										<input id="input_pwd" type="password" placeholder="비밀번호">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary" onclick="memOut();">비밀번호
											확인</button>
									</div>
								</div>
							</div>
						</div>
				</div>	

			</div>
		</div>
	<div class="col-md-12">
	<%@include file="../footer.jsp"%>
	</div>
	</div>
</body>
</html>