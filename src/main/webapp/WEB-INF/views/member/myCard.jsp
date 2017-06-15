<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<!-- 바코드 생성기 시작 -->
<link rel="stylesheet" href="/lee/resources/member/barcode2/code128.css" type="text/css">

<script src="/lee/resources/member/barcode2/base2-jsb-fp.js" type="text/javascript" charset="utf-8"></script>

<script src="/lee/resources/member/barcode2/code128-base2.js" type="text/javascript"></script>
<script src="/lee/resources/member/barcode2/get.js" type="text/javascript"></script>
<!-- 바코드 생성기 끝 -->
<script>

$("body").ready(function(){
	var sidx = "${sessionScope.sidx}";
	var idxcode = sidx.substr(2);
	
	$("#barcode_input").val(idxcode);
});


$(function(){
	
	 $('#rotate90').on('click', function () {
		 
		 
		 
	 });
});


new jsb.Rule(".barcode, .barcode2", base2.Barcode.code128behaviour);
    
var qs=new getParameter();
console.log('qs = '+qs.barcode);
if(qs.barcode) {
	  /* var cls = qs.bigger ? 'barcode2' : 'barcode'; */ /*Bigger CheckBox로 크기 정하기*/
	  /* var cls = 'barcode'; */ /*바코드 작은사이즈*/
	  var cls = 'barcode2'; /*바코드 큰사이즈*/
	  if (qs.type) cls += ' '+qs.type;
	  
	 
		
		new jsb.Rule("#barcode_input", { 
			ondocumentready: function() {
				
				if (qs.type) document.getElementById('barcode_subtype').value = qs.type;
				
				if (qs.bigger) document.getElementById('bigger').checked = true;
				
				 $('#memberIdcard').html("<div class='"+cls+"'>"+qs.barcode+"</div>");
			}
		});
}	



	

</script>



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


	
	</script>
<style>
@media ( min-width :769px) {
	
	#changeForm{
		width: 100%;
		
	}
	#submenulabel{
	width: 675px;
	height: 134px;
	padding:0px;
	}
	#memberIdcardDiv{
	margin:150px;
	width: 550px;
	height:350px;
	padding-left: 93px;
	border: 1px solid grey;
	border-radius: 24px;
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
	padding:0px;
	}
	
	#memberIdcardDiv{
		transform:rotate(90deg);
		margin:0px 100px 0px 100px;
		
	}
	#memberIdcard{
		width: 450px;
	}
	#displaybarcode{
		margin-bottom:200px;
	}
	
}

	

</style>
</head>
<body>
	<%@include file="../header.jsp"%>
	<div class="row">
	
		<%@include file="sideMenu.jsp"%>

		<div class="col-md-9" id="changeMeForm">
			
			<div class="" id="changeForm"
				style="padding: 0px;">
				
					
				<!-- 컨텐츠 입력 -->
			
					<div class="col-md-12" id="submenulabel"
						style=" background-image: url('/lee/resources/member/img/sul.png')">
						<div
							style="width: 100%; height: 100%; margin: 0px; padding: 50px; background-color: rgba(26, 164, 172, 0.5);">
							<h2 style="color: white;">도서관 카드</h2>
						</div>
					</div>
					
					<!-- 카드 발급 부분 -->
					<div class="col-md-12" id="displaybarcode" style="padding:10px;">
						<form>
							 
							<input type="hidden" name="barcode" id="barcode_input" value="">	<!-- 	추후 value에 회원 idx 입력 -->
							<button class="btn btn-primary" id="generate">
								회원증 발급/재발급
								<span class='glyphicon glyphicon-repeat' aria-hidden='true'></span>
							</button>
							
						</form>
					</div>
					
					<div class="col-md-12" id="memberIdcardDiv"
						style="">

						<h3 style="font-weight: bolder;">회원증</h3>
						
						
						<div id="memberIdcard" style="margin:10px; padding:50px; ">
						</div>
							
							
					</div>
					
					
					
			</div>	
			<div class="col-md-12" style="margin: 150px;">
					
					</div>
			
		</div>
	</div>
	
	<div class="col-md-12">
	<%@include file="../footer.jsp"%>
	</div>
	
</body>
</html>