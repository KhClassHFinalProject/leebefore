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
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
	.btn-primary{
		background-color:#0BD392;
		border-color: #09BD8D;
	}
	.btn-primary:HOVER{
		background-color:#1AA4AC;
		border-color: #3CDBDE;
	}
	.radiobox input[type=text]{
	background-color: white;
	}
	@MEDIA ( min-width : 768px) {
			body{
				margin:50px;
			}
			#basic-addon1{
				height:34px;
				padding-right:20px;
				padding-top:10px;
				background-color:white; 
				border: 0px;
			}
			/* #idinput-group{
				width: 70%;
			}
			
			#idinput-group .col-md-4{
				margin:0;
				padding:0; 
				width:250px;
			}
			
			#idid{
				width:250px;
			}
			
			
			#idinput-group .col-lg-3{
				padding:0;
			}
			#idinput-group .col-lg-3 .input-gourp{
				width:20%;
			} */
	}

	@MEDIA ( max-width : 767px) {
			/* #idinput-group{
				width: 70%;
			}
			
			#idinput-group .col-md-4{
				margin:0;
				padding:0; 
				width:250px;
			}
			
			#idid{
				width:250px;
			}
			
			#basic-addon1{
				height:34px;
				padding-right:20px;
				padding-top:10px;
				background-color:white; 
				border: 0px;
			}
			#idinput-group .col-lg-3{
				padding:0;
			}
			#idinput-group .col-lg-3 .input-gourp{
				width:20%;
			}
		 */
	}
	
	
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	</script>
	<script>
	var code ='';
	//아이디(이메일) 중복확인 시작
	function mailCheck() {
		
	var email = $("#idid").val() +'@'+$("#emailInput").val();
		
			$.ajax({
		        url : "mailCheck.ju",
		        type: "get",
		        data : { "email" : email },
		        success : function(responseData){
		            $("#ajax").remove();
		            var data = JSON.parse(responseData);
		            if(data){
		            	alert("이미 존재하는 ID입니다");
		                return false;
		            }
		            
		            var htmlString = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>";
		            $('#idcheckSuc').html(htmlString);
		            $('#idid').attr('readonly','readonly');
		           	alert('사용가능한 아이디 입니다.');
		           	
		        }
		    });
	};
	//연락처 중복확인 시작
	 function hpCheck() {
		
		var mem_hp = $("#phph0").val()+'~'+$("#phph").val()+'~'+$("#phph2").val();
			
				$.ajax({
			        url : "checkHp.ju",
			        type: "get",
			        data : { "mem_hp" : mem_hp },
			        success : function(responseData){
			            $("#ajax").remove();
			            var data = JSON.parse(responseData);
			            if(data){
			            	alert("이미 존재하는 번호입니다");
			                return false;
			            }
			            
			            var htmlString = "<span class='glyphicon glyphicon-ok' aria-hidden='true'></span>";
			            $('#hpcheckSuc').html(htmlString);
			            
			            $('#pwpw').attr('readonly','readonly');
			            $('#pwpw2').attr('readonly','readonly');
			           	alert('사용가능한 번호 입니다.');
			           	
			        }
			    });
		}; 
	
	//이메일 인증 시작
	
	var emailcode;
	
		function mailAccept() {
			
			var mem_id = $("#idid").val() +'@'+$("#emailInput").val();
				
					$.ajax({
				        url : "mailAccept.ju",
				        type: "get",
				        data : {"mem_id":mem_id},
				        success : function(responseData){
				        	
				            $("#ajax").remove();
				            /* var data = responseData.code; */
				            console.log(responseData);
				            var data = responseData;
				            
				            if(!data){
				            	alert("인증번호 발급실패 인증번호 버튼을 다시한번 눌러주세요.");
				            }else{
					            console.log(data);
					            emailcode = data;
					            code = data;
					            alert('인증코드가 전송되었습니다. 메일을 확인하세요.');
					            alert(data);
				            }
				           	
				        },
				        error: function(error){
				        	
				        }
			    });
		}; 
	function mailcodeCheck(){
		var emailid =document.getElementById('emailid').value;
	
		if(emailid==emailcode){
			alert(emailcode+'/이메일 인증완료');
			$('#memberJoin').css('display','block');
			
		}else{
			alert('이메일 인증실패. 정확한 인증코드를 입력해 주세요.');
			
		}
		
		
	}
		
	//이메일 인증 끝
	
	function mailselect(email){
		
		$('#emailInput').val(email);
		$('#emailInput').attr('readonly', 'readonly');
		return;
		
	};
	
	function selfinput(){
		var s = $('#emailInput');
		s.val('');
		s.removeAttr('readonly');
		return;
	};
	

	 
	$(function () {
		
	
		$('#addrSearchBt').click(function(){
			
			$('.search_button').addClass('btn btn-primary');
		});
		
		
    	$('#accordion').on('shown.bs.collapse', function (e) {
        	var offset = $('.panel.panel-default > .panel-collapse.in').offset();
        	if(offset){
            	$('html,body').animate({
                	scrollTop: $('.panel-title a').offset().top -20
            	}, 500); 
        	}
    	});
    	//이용약관 스크롤 부분
    	
    	//방침동의 체크박스
    	$("#memberAgreeCB").click(function(){
    		
    		if($("#memberAgreeCB").is(":checked")){
    			$("#memberAgree").css("display","block");
    		};
    		
    		
    	});
    	
    	$('#memberAgree').click(function(){
    		$('#headingOne').css('color', '#0BD392');	
    		$('#headingOneA').append("[완료]");
    	});
    	
    	
    	$('#memberInput').click(function(){

			
    		var pan = true;
    		
    		$("#collapseTwo").find('input').each(function(){
    			 
    		    if($(this).prop('required') && $(this).val()==''){
    		    	pan= false;
    		    	alert('가입 양식을 모두 입력해 주세요');
    		       this.focus();
    		       
    		       return false;
    		    } else {
    		    	
    		    }
    		    
    		});
    		
    		if(pan){
    			$('#headingTwo').css('color', '#0BD392');	
    			$('#headingTwoA').append("[완료]");
    			$('#memberInput2').trigger('click');
    			
    			$("#mem_id").val($("#idid").val() +'@'+$("#emailInput").val());
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
    		}
    		
    	});
    	
    	
    	$('#sel1').change(function() {
    		
    		if($('#sel1').val()=="selfinput"){
    			$('#sel1').css("display", "none");
    			$('#selfinput').css("display", "table");
    		}	
    	});
    	
    	// 입력제한 문자 시작
		/* $("").keyup(function(event){
			if(event.keyCode !=8){
				var result = "keycode="+ event.keyCode + " value="+ String.fromCharCode(event.keyCode);
				var preHtml = $("#result").html();
				$("#result").html(preHtml+ "<br />" +result);
			}
			if($(this).val() ==""){
				$("#result").empty();
			}
		}); */
	/* 번호만 */
		$("#phph").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		$("#phph2").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		
		
		
		$("#jumin").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
			
		
			
		});
		
		$("#jumin2").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^0-9]/gi,''));
			}
		});
		/* 번호만 */
		
		/* 특수문자 한글 금지 */
		$("#idid").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)){
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
			}
		});
		
		$("#pwpw").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)){
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
			}
			
			if($('#pwpw2').val()!=""){
				if($('#pwpw2').val()==$('#pwpw').val()){
					$('#hpcheckSuc2').text('비밀번호 확인');
				}else{
					$('#hpcheckSuc2').text('비밀번호가 다릅니다.');
				}
			}else{
				
			}
			
		});
		$("#pwpw2").keyup(function(event){
			
			if (!(event.keyCode >=37 && event.keyCode<=40)){
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-zA-Z0-9]/gi,''));
			}
			
		
			if($('#pwpw2').val()==$('#pwpw').val()){
				$('#hpcheckSuc2').text('비밀번호 확인');
			}else{
				$('#hpcheckSuc2').text('비밀번호가 다릅니다.');
			}
		
		});
		/* 특수문자 한글 금지 */
		
		/* $("#notHangul").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
			}
		});
		
		 */
		
	// 입력제한 문자 끝
    	
	});
	
		
	//주소 api
	function inputAddr(){
		var postcode = document.getElementById("postcode").value;
		var address = document.getElementById("address").value;
		var details = document.getElementById("details").value;
		var extra_info = document.getElementById("extra_info").value;
		
		document.getElementById("zipNo").value = postcode;
		document.getElementById("roadAddrPart1").value = address;
		document.getElementById("addrDetail").value = details;
		document.getElementById("roadAddrPart2").value = extra_info;
		
		$("#searchAddress").removeClass("in");
	};
	
	 $(function() { $("#postcodify").postcodify({
	        insertPostcode5 : "#postcode",
	        insertAddress : "#address",
	        insertDetails : "#details",
	        insertExtraInfo : "#extra_info",
	        hideOldAddresses : false
	    }); });
	//이메일 인증
	
	
	 
	 //회원가입 완료 버튼
	 
	 
	 
				</script>
				
</head>

<body>

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!-- 주소 Modal 시작-->
<div class="modal fade" id="searchAddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">주소입력</h4>
      </div>
      <div class="modal-body">
								<!-- 검색 기능을 표시할 <div>를 생성한다 -->
					<div id="postcodify" style="overflow:scroll; width:100%;height:250px;"></div>
					<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 id를 부여한다 -->
					우편번호<input type="text" name="" id="postcode" value="" /><br />
					주소1<input type="text" name="" id="address" value="" /><br />
					상세주소<input type="text" name="" id="details" value="" /><br />
					주소2<input type="text" name="" id="extra_info" value="" /><br />
					<!-- jQuery와 Postcodify를 로딩한다 -->
					<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
					<!-- 위에서 생성한 <div>에 검색 기능을 표시하고, 결과를 입력할 <input>들과 연동한다 -->
							
	 	</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="inputAddr();">입력</button>
      </div>
    </div>
  </div>
</div>
<!-- 주소 Modal 끝-->

<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<div style="text-align:center;">
	<div style="display: inline-block;">
<img src="/lee/resources/index/logo2.png" style="width:500px;height:;"><br>
	</div>
</div>
<h1 style="color:#6f6f6f;">회원가입</h1>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin-bottom: 5px;">
  <div class="panel panel-default row">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a id="headingOneA" data-toggle="collapse" data-parent="#accordion" href="" aria-expanded="true" aria-controls="collapseOne">
         이용약관
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
    <!-- 이용약관 펼처지는 내용 시작 부분 -->
      <div class="panel-body" style="overflow:scroll; width:100%;height:250px;">
<!-- 이용약관 세부내용 -->
       <span style="font-size:15; line-height:2em; color:black;">
<b>제 1 장 총 칙</b>
<br> 
<br>제 1 조 (목적)
<br>&nbsp;본 약관은 통합도서서비스 사이트가 제공하는 서비스(이하 “서비스”)의 이용 조건 및 절차, 이용자와 통합도서센터 역할을
<br>하는 LIBservice(이하 "LIBs")의 권리, 의무, 책임사항 및 기타 제반 사항을 규정함을 목적으로 합니다.
<br> 
<br>제 2 조 (정의)
<br>①  본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
<br>&nbsp;1. ‘사이트’라 함은 통합도서서비스 홈페이지를 말합니다.
<br>&nbsp;2. '회원'이라 함은 사이트에 접속하여 이 약관에 동의하고, 개인 정보를 제공하여 회원 등록을 한 자로서, 통합도서서<br>&nbsp;&nbsp;&nbsp;&nbsp;비스 참여 도서관에서 제공하는 자료와 서비스를 이용할 수 있는 자를 말합니다.
<br>&nbsp;3. '이용계약'이라 함은 본 약관을 포함하여 서비스 이용과 관련하여 센터와 회원 간에 체결하는 모든 계약을 말합니다.
<br>&nbsp;4. '회원ID(아이디)'라 함은 회원의 식별과 서비스 이용을 위하여 회원이 선정하고 센터에서 부여하는 영문자와 숫자의 <br>&nbsp;&nbsp;&nbsp;&nbsp;조합을 말합니다.
<br>&nbsp;5. '비밀번호'라 함은 이용자ID로 식별되는 회원의 본인 여부를 검증하기 위하여 회원이 설정한 고유의 문자와 숫자의 조<br>&nbsp;&nbsp;&nbsp;&nbsp;합을 말합니다.
<br>&nbsp;6. ‘게시물’이라 함은 회원이 서비스를 이용하면서 게시한 글, 사진, 동영상 등 각종 파일과 링크 등을 말합니다.
<br>&nbsp;7. '탈퇴'라 함은 센터 또는 회원이 이용계약을 종료하는 것을 말합니다.
<br>&nbsp;②  본 약관에서 사용하는 용어 중 제1항에서 정의하지 않은 용어는 관계 법령 및 사이트 별 안내에서 정하는 바에 따르<br>&nbsp;&nbsp;&nbsp;며, 그 외에는 일반 관례에 따릅니다.
<br> 
<br>제 3 조 (약관의 효력 및 변경) 
<br>①  본 약관은 사이트를 통해 온라인으로 공시되고, 합리적인 사유가 발생할 경우 센터는 관련 법령에 위배되지 않는 범위<br>&nbsp;&nbsp;&nbsp;안에서 개정할 수 있습니다. 개정된 약관은 정당한 절차에 따라 사이트를 통해 공지됨으로써 효력이 발휘됩니다.
<br>②  회원은 정기적으로 사이트를 방문하여 약관의 변경사항을 확인하여야 합니다. 변경된 약관에 대한 정보를 알지 못해 <br>&nbsp;&nbsp;&nbsp;발생하는 회원의 피해는 센터에서 책임지지 않습니다.
<br>③  회원은 변경된 약관에 동의하지 않을 경우 회원 탈퇴(해지)를 요청할 수 있습니다.
<br> 
<br>제 4 조 (약관 외 준칙) 
<br>①  센터는 필요한 경우 개별 서비스에 대하여 약관 및 이용 규정을 정할 수 있으며, 본 약관과 서로 상충되는 경우에는 서<br>&nbsp;&nbsp;&nbsp;비스별 안내의 내용을 우선하여 적용합니다.
<br>②  본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률<br>&nbsp;&nbsp;&nbsp;및 기타 관련 법령의 규정에 의합니다.
<br>
<br> 
<br><b>제 2 장 이용 계약의 성립 및 해지</b>
<br> 
<br>제 5 조 (이용계약의 성립)
<br>①  이용계약은 회원이 되고자 하는 자가 본 이용 약관에 동의와 이용 신청에 대하여 센터의 이용 승낙으로 성립됩니다.
<br>②  이용계약에 대한 동의는 이용 신청 당시 사이트의 ‘동의함’버튼을 누름으로써 의사 표시를 합니다.
<br> 
<br>제 6 조 (회원 가입 및 탈퇴)
<br>①  회원 가입은 신청자가 소정의 신청 양식에서 요구하는 사항을 기록하여 가입을 완료하는 것으로 성립됩니다.
<br>②  모든 회원은 반드시 회원 본인의 정보를 제공하여야만 서비스를 이용할 수 있으며, 타인의 정보를 도용하거나 허위의 <br>&nbsp;&nbsp;&nbsp;정보를 등록하는 등 본인의 진정한 정보를 등록하지 않은 회원은 서비스 이용과 관련하여 아무런 권리를 주장할 수<br>&nbsp;&nbsp;&nbsp;없으며, 관계 법령에 따라 처벌 받을 수 있습니다.
<br>③  다음 각 호의 1에 해당되는 경우 회원 가입을 취소할 수 있습니다.
<br>&nbsp;1. 다른 사람의 명의를 사용하여 신청하였을 경우
<br>&nbsp;2. 회원가입 신청서의 내용을 허위로 기재하였거나 신청하였을 경우
<br>&nbsp;3. 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 경우
<br>&nbsp;4. 다른 사람의 사이트 서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 경우
<br>&nbsp;5. 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우
<br>&nbsp;6. 기타 사이트가 정한 회원가입요건이 미비 되었을 때 
<br>④  회원은 이용 계약을 해지하고자 하는 때는 본인이 회원 탈퇴를 해야 합니다.
<br>⑤  회원이 작성한 게시물 및 제공한 정보는 센터의 정책에 의해 일정기간을 유지하고 보관 또는 소멸됩니다. 다만, 타인<br>&nbsp;&nbsp;&nbsp;에 의해 재게시되거나, 게시판, 커뮤니티, 카페 등 공유 및 알림의 목적으로 등록된 게시물 등은 삭제되지 않으니 사전<br>&nbsp;&nbsp;&nbsp;에 삭제 후 탈퇴하여야 합니다. 
<br> 
<br>제 7 조 (회원ID 부여 및 변경)
<br>①  센터는 회원에 대하여 약관 및 이용 규정에 정하는 바에 따라 회원ID를 부여할 수 있습니다. 
<br>②  회원ID는 원칙적으로 변경이 불가능하므로 부득이한 사유로 인하여 변경하고자 하는 경우에는 탈퇴하고 변경하고자 <br>&nbsp;&nbsp;&nbsp;하는 회원ID로 재가입해야 합니다.
<br>③  회원ID가 부정확하거나 불합리할 경우 센터의 판단에 따라 직권으로 변경될 수도 있습니다. 이 때 필요시 회원에게 사<br>&nbsp;&nbsp;&nbsp;전 통보할 수 있습니다.
<br>④  회원ID 및 비밀번호의 관리책임은 회원에게 있습니다. 이를 소홀히 관리하여 발생하는 서비스 이용 상의 손해 또는 제<br>&nbsp;&nbsp;&nbsp;3자에 의한 부정 이용 등에 대한 책임은 모두 회원에게 있으며 센터는 그에 대해 책임지지 않습니다.
<br> 
<br>제 8 조 (이용 신청의 승낙과 제한)
<br>①  센터는 이용신청에 대하여 업무 수행 상 또는 기술상 지장이 없는 경우에 접수 순서에 따라 서비스 이용을 승낙하는 <br>&nbsp;&nbsp;&nbsp;것을 원칙으로 합니다.
<br>②  이용자의 신청내용이 센터에서 규정한 제반사항을 위반한 경우 승낙을 보류할 수 있습니다.
<br>③  센터는 서비스 이용신청이 다음 각 호의 1에 해당하는 경우에는 그 신청에 대하여 승낙 제한사유가 해소될 때까지 승<br>&nbsp;&nbsp;&nbsp;낙을 유보할 수 있습니다.
<br>&nbsp;1. 사이트 설비의 여유가 없는 경우
<br>&nbsp;2. 사이트의 기술상 지장이 있는 경우
<br>&nbsp;3. 기타 사유로 이용승낙이 곤란한 경우
<br>④  센터는 회원 가입 절차 완료 이후 제2항 각 호에 따른 사유가 발견된 경우 이용 승낙을 철회할 수 있습니다.
<br> 
<br>제 9 조  (개인정보의 보호 및 사용)
<br>①  센터는 회원정보를 "개인정보보호법"에 의해 보호합니다.
<br>②  회원의 개인정보는 오직 본인만이 열람/수정/삭제 할 수 있습니다. 또한 비밀번호 등이 타인에게 노출되지 않도록 철<br>&nbsp;&nbsp;&nbsp;저히 관리해야하며, 본인의 회원ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 센터에 신고하<br>&nbsp;&nbsp;&nbsp;여야 합니다. 신고를 하지 않아 발생하는 모든 책임은 회원 본인에게 있습니다.
<br>③  센터는 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 다<br>&nbsp;&nbsp;&nbsp;만, 다음과 같은 경우에 법이 허용하는 범위 내에서 회원의 개인정보를 제3자에게 제공할 수 있습니다.
<br>&nbsp;1. 수사기관이나 기타 다른 정부기관으로부터 정보제공을 요청 받은 경우
<br>&nbsp;2. 회원의 법령 또는 약관의 위반을 포함하여 부정행위 확인 등의 정보보호 업무를 위해 필요한 경우
<br>&nbsp;3. 기타 법률에 의해 요구되는 경우
<br>
<br> 
<br><b>제 3 장 서비스의 이용</b>
<br>
<br>제 11 조 (서비스의 제공)
<br>①  센터는 회원의 이용신청을 승낙한 때부터 서비스를 개시합니다. 단, 일부 서비스의 경우에는 지정된 일자부터 서비스<br>&nbsp;&nbsp;&nbsp;를 개시합니다.
<br>②  서비스는 센터의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간 운영을 원칙으로 합니다. 단, 센터<br>&nbsp;&nbsp;&nbsp;는 시스템 정기점검, 증설 및 교체를 위해 센터가 정한 날이나 시간에 서비스를 일시 중단할 수 있으며, 예정되어 있는<br>&nbsp;&nbsp;&nbsp;작업으로 인한 서비스 일시 중단은 사이트를 통해 사전에 공지합니다.
<br>③  센터는 긴급한 시스템 점검, 증설 및 교체, 설비의 장애, 서비스 이용의 폭주, 국가비상사태, 정전 등 부득이한 사유가<br>&nbsp;&nbsp;&nbsp; 발생한 경우 사전 예고 없이 일시적으로 서비스의 전부 또는 일부를 중단할 수 있습니다. 
<br>④  센터는 서비스 개편 등 서비스 운영 상 필요한 경우 회원에게 사전 예고 후 서비스의 전부 또는 일부의 제공을 중단할 <br>&nbsp;&nbsp;&nbsp;수 있습니다.
<br>
<br> 
<br>제 12 조  (서비스의 변경)
<br>①  센터는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 <br>&nbsp;&nbsp;&nbsp;있습니다.
<br>②  서비스의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등<br>&nbsp;&nbsp;&nbsp;은 그 변경 전 7일 이상 해당 서비스 초기화면에 게시하여야 합니다.
<br>③  센터는 정책 및 운영의 필요에 따라 사전공지를 통해 무료로 제공되는 서비스의 일부 또는 전부를 수정, 중단, 변경할 <br>&nbsp;&nbsp;&nbsp;수 있으며, 이용회원에게는 별도의 보상을 하지 않습니다.
<br> 
<br>제 13 조 (게시물의 관리)  
<br>①  회원이 등록한 게시물 등으로 인하여 본인 또는 타인에게 손해나 기타 문제가 발생하는 경우 전적으로 회원에게 책임<br>&nbsp;&nbsp;&nbsp;이 있으며, 센터는 별도의 책임을 지지 않습니다.
<br>②  센터는 다음 각 호의 1에 해당하는 게시물 등을 회원의 사전 동의 없이 임시 게시 중단, 수정, 삭제, 이동 또는 등록 거<br>&nbsp;&nbsp;&nbsp;부 등의 관련 조치를 취할 수 있습니다.
<br>&nbsp;1. 본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우
<br>&nbsp;2. 다른 회원 또는 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우
<br>&nbsp;3. 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우
<br>&nbsp;4. 불법복제 또는 해킹을 조장하는 내용인 경우
<br>&nbsp;5. 영리를 목적으로 하는 광고일 경우
<br>&nbsp;6. 범죄와 결부된다고 객관적으로 인정되는 내용일 경우
<br>&nbsp;7. 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우
<br>&nbsp;8. 기타 관계법령에 위배된다고 판단되는 경우
<br>③  센터는 게시물 등에 대하여 제3자로부터 명예훼손, 지적재산권 등의 권리 침해를 이유로 게시중단 요청을 받은 경우 <br>&nbsp;&nbsp;&nbsp;이를 임시로 게시중단(전송중단)할 수 있으며, 게시중단 요청자와 게시물 등록자 간에 소송, 합의 기타 이에 준하는 관<br>&nbsp;&nbsp;&nbsp;련기관의 결정 등이 이루어져 도서관에 접수된 경우 이에 따릅니다.
<br>④  해당 게시물 등에 대해 임시게시 중단이 된 경우, 게시물을 등록한 회원은 재게시(전송재개)를 센터에 요청할 수 있으<br>&nbsp;&nbsp;&nbsp;며, 게시 중단일로부터 3개월 내에 재게시를 요청하지 아니한 경우 센터는 이를 삭제할 수 있습니다.
<br> 
<br>제 14 조 (게시물의 저작권)
<br>①  서비스에 대한 저작권 및 지적재산권은 센터에 귀속됩니다.
<br>②  회원이 서비스 내에 게시한 게시물의 저작권은 게시한 회원에게 귀속됩니다. 단, 센터는 서비스의 운영, 전시, 전송, <br>&nbsp;&nbsp;&nbsp;배포, 홍보의 목적으로 회원의 별도의 허락 없이 무상으로 저작권법에 규정하는 공정한 관행에 합치되도록 합리적인<br>&nbsp;&nbsp;&nbsp;범위 내에서 다음과 같이 회원이 등록한 게시물을 사용할 수 있습니다.
<br>&nbsp;1. 서비스 내에서 회원 게시물의 복제, 수정, 개조, 전시, 전송, 배포 및 저작물의 원래의 속성을 해치지 않는 범위 내에서<br>&nbsp;&nbsp;&nbsp;&nbsp;의 편집 저작물의 작성
<br>&nbsp;2. 공공기관, 민간기관, 포털, 방송사, 통신사 등 서비스 연계기관에게 회원의 게시물 내용을 제공, 전시 혹은 홍보
<br>③  센터는 전항 이외의 방법으로 회원의 게시물을 이용하고자 하는 경우, 전화, 팩스, 전자우편 등의 방법을 통해 사전에 <br>&nbsp;&nbsp;&nbsp;회원의 동의를 얻어야 합니다. 회원은 언제든지 고객센터를 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등<br>&nbsp;&nbsp;&nbsp;의 조치를 취할 수 있습니다.
<br>④  회원의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 회원이 부담하여야 합니다.
<br> 
<br>제 15 조 (서비스 이용제한) 
<br>①  센터는 회원이 서비스 이용내용에 있어서 본 약관 제 17조의 내용을 위반하거나, 다음 각 호의 1에 해당하는 경우 서<br>&nbsp;&nbsp;&nbsp;비스 이용제한, 초기화, 이용계약 해지 및 기타 해당 조치를 할 수 있습니다. 
<br>&nbsp;1. 회원정보에 부정한 내용을 등록하거나 타인의 회원ID, 비밀번호 기타 개인정보를 도용하는 행위 또는 회원ID를 타인<br>&nbsp;&nbsp;&nbsp;&nbsp;과 거래하거나 제공하는 행위 
<br>&nbsp;2. 공공질서 및 미풍양속에 위반되는 저속, 음란한 내용 또는 타인의 명예나 프라이버시를 침해할 수 있는 내용을 전송,<br>&nbsp;&nbsp;&nbsp;&nbsp;게시, 전자우편 또는 기타의 방법으로 타인에게 유포하는 행위 
<br>&nbsp;3. 다른 회원을 희롱 또는 위협하거나, 특정 회원에게 지속적으로 고통 또는 불편을 주는 행위 
<br>&nbsp;4. 센터로부터 특별한 권리를 부여 받지 않고 센터가 제공하는 프로그램을 변경하거나, 서버를 해킹하거나, 사이트 또는<br>&nbsp;&nbsp;&nbsp;&nbsp; 게시된 정보의 일부분 또는 전체를 임의로 변경하는 행위 
<br>&nbsp;5. 서비스를 통해 얻은 정보를 센터의 사전 승낙 없이 서비스 이용 외의 목적으로 복제하거나, 이를 출판 및 방송 등에 사<br>&nbsp;&nbsp;&nbsp;&nbsp;용하거나, 제 3자에게 제공하는 행위 
<br>&nbsp;6. 센터의 운영진, 직원 또는 관계자를 사칭하거나 고의로 서비스를 방해하는 등 정상적인 서비스 운영에 방해가 될 경<br>&nbsp;&nbsp;&nbsp;&nbsp;우 
<br>&nbsp;7. 방송통신심의위원회 등 관련 공공기관의 시정 요구가 있는 경우 
<br>&nbsp;8. 약관을 포함하여 센터가 정한 제반 규정을 위반하거나 범죄와 결부된다고 객관적으로 판단되는 등 제반 법령을 위반<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;하는 행위 
<br>②  회원은 본 조에 따른 이용제한 등에 대해 센터가 정한 절차에 따라 이의신청을 할 수 있으며 정당하다고 인정하는 경<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;우 즉시 서비스의 이용을 재개합니다.
<br> 
<br> 
<br><b>제 4 장 계약 당사자의 의무 및 책임</b>
<br> 
<br>제 16 조 (센터의 의무)
<br>①  센터는 회원이 희망한 서비스 제공 개시일에 특별한 사정이 없는 한 서비스를 이용할 수 있도록 하여야 합니다.
<br>②  센터는 계속적이고 안정적인 서비스의 제공을 위하여 설비에 장애가 생기거나 멸실된 때에는 부득이한 사유가 없는 <br>&nbsp;&nbsp;&nbsp;한 지체 없이 이를 수리 또는 복구해야 합니다.
<br>③  센터는 회원이 안전하게 서비스를 이용할 수 있도록 개인정보보호를 위한 보안시스템을 구축하며 개인정보 보호정책<br>&nbsp;&nbsp;&nbsp;을 공시하고 준수하여야 합니다.
<br>④  센터는 회원으로부터 제기되는 의견이나 불만이 정당하다고 객관적으로 인정될 경우에는 적절한 절차를 <br>&nbsp;&nbsp;&nbsp;거쳐 즉시 처리하여야 합니다. 다만, 즉시 처리가 곤란한 경우는 회원에게 그 사유와 처리일정을 통보하여야 합니다.
<br>⑤  센터는 회원의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.
<br>
<br> 
<br>제 17 조 (회원의 의무)
<br>①  회원은 회원가입 신청 또는 회원정보 변경 시 모든 사항을 사실에 근거하여 본인의 정확한 정보로 작성하여야 하며, <br>&nbsp;&nbsp;&nbsp;허위 또는 타인의 정보를 등록할 경우 이와 관련된 모든 권리를 주장할 수 없습니다.
<br>②  회원은 관계 법령, 본 약관의 규정, 이용 안내 및 센터가 공지한 주의사항, 센터가 통지하는 사항 등을 준수하여야 하<br>&nbsp;&nbsp;&nbsp;며, 기타 센터의 업무에 방해가 되는 행위, 센터의 명예를 손상시키는 행위, 타인에게 피해를 주는 행위를 해서는 안됩<br>&nbsp;&nbsp;&nbsp;니다.
<br>③  회원은 본인의 회원ID와 비밀번호를 제3자에게 이용하게 해서는 안되며, 이용계약사항이 변경된 경우에 해당 절차를 <br>&nbsp;&nbsp;&nbsp;거쳐 이를 센터에 즉시 알려야 합니다.
<br>④  회원은 센터의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없으며, 그 영리행위의 결과에 대해 센터<br>&nbsp;&nbsp;&nbsp;는 책임을 지지 않습니다. 또한 회원은 이와 같은 영리행위로 센터가 손해를 입은 경우, 회원은 센터에 대해 손해배상 <br>&nbsp;&nbsp;&nbsp;의무를 지며, 센터는 해당 회원에 대해 서비스 이용제한 및 적법한 절차를 거쳐 손해배상 등을 청구할 수 있습니다. 
<br>⑤  회원은 센터의 명시적 동의가 없는 한 서비스의 이용권한, 기타 이용계약상의 지위를 타인에게 양도, 증여할 수 없으<br>&nbsp;&nbsp;&nbsp;며 이를 담보로 제공할 수 없습니다.
<br>⑥  회원은 서비스를 이용하여 얻은 정보를 센터의 사전승낙 없이 복사, 복제, 변경, 번역, 출판·방송 기타의 방법으로 사<br>&nbsp;&nbsp;&nbsp;용하거나 이를 타인에게 제공할 수 없습니다.
<br>⑦  회원은 센터 및 제 3자의 지적 재산권을 포함한 제반 권리를 침해하거나 다음 각 호의 행위를 하여서는 안됩니다.
<br>&nbsp;1. 다른 회원의 ID를 부정 사용하는 행위
<br>&nbsp;2. 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위
<br>&nbsp;3. 선량한 풍속, 기타 사회질서를 해하는 행위
<br>&nbsp;4. 타인의 명예를 훼손하거나 모욕하는 행위
<br>&nbsp;5. 타인의 지적재산권 등의 권리를 침해하는 행위
<br>&nbsp;6. 해킹행위 또는 컴퓨터바이러스의 유포행위
<br>&nbsp;7. 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위
<br>&nbsp;8. 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위
<br>
<br> 
<br><b>제 5 장 손해배상 및 기타사항</b>
<br> 
<br>제 18 조 (손해배상)
<br>&nbsp;센터와 회원은 서비스 이용과 관련하여 고의 또는 과실로 상대방에게 손해를 끼친 경우에는 이를 배상하여야 합니다.
<br>
<br> 
<br>제 19 조 (면책조항)
<br>① 센터는 천재지변, 전쟁, 기간통신사업자의 서비스 중지 및 기타 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 <br>&nbsp;&nbsp;&nbsp;없는 경우에는 서비스 제공에 대한 책임이 면제됩니다.
<br>② 센터는 서비스용 설비의 보수, 교체, 정기점검, 공사 등 부득이한 사유로 발생한 손해에 대한 책임이 면제됩니다.
<br>③ 센터는 회원의 컴퓨터 오류에 의해 손해가 발생한 경우, 또는 회원이 신상정보 및 전자우편 주소를 부실하게 기재하여 <br>&nbsp;&nbsp;&nbsp;손해가 발생한 경우 책임을 지지 않습니다.
<br>④ 센터는 회원이 서비스를 이용하여 기대하는 결과를 얻지 못하거나 상실한 것에 대하여 책임을 지지 않으며, 서비스를 <br>&nbsp;&nbsp;&nbsp;이용하면서 얻은 자료로 인한 손해에 대하여 책임을 지지 않습니다. 
<br>⑤ 센터는 회원이 서비스에 게재한 각종 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 대하여 책임을 지지 않으며, 회원 <br>&nbsp;&nbsp;&nbsp;상호간 및 회원과 제 3자 상호 간에 서비스를 매개로 발생한 분쟁에 대해 개입할 의무가 없고, 이로 인한 손해를 배상<br>&nbsp;&nbsp;&nbsp;할 책임도 없습니다.
<br>⑥ 센터는 회원의 게시물을 등록 전에 사전심사 하거나 상시적으로 게시물의 내용을 확인 또는 검토하여야 할 의무가 없<br>&nbsp;&nbsp;&nbsp;으며, 그 결과에 대한 책임을 지지 아니합니다.
<br>
<br> 
<br>제 20 조 (관할 법원)
<br>&nbsp;본 서비스 이용으로 발생한 분쟁에 대해 소송이 제기되는 경우 대한민국 서울중앙지방법원을 관할 법원으로 합니다.
<br>
<br> 
<br>부칙
<br>&nbsp;1. 본 약관은 2010년 10월 1일부터 적용됩니다.    
<br>
</span>
	 <hr>
	 <input id="memberAgreeCB" type="checkbox" required>서비스 이용약관 및 개인정보 취급 방침 동의<br>
		
    	
    </div>
  		 <div id="agreeBT">
	      <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	      <button id="memberAgree" class="collapsed btn btn-primary" style="display: none; margin:10px; ">
	      동의</button></a>
	     </div>	
	     
      </div>
     
  </div>
<!-- /////////////////////////////////////////////////////////////////// -->  
  <div class="panel panel-default row">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" id="headingTwoA" data-toggle="collapse" data-parent="#accordion" href="" aria-expanded="false" aria-controls="collapseTwo">
          개인정보입력
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body ">
      
      	<!-- 개인정보 입력폼 시작  -->
      	<!-- 아이디 -->
	      	<div class="row">
	      	<label class="col-md-12" for="sel1">아이디</label>
	      	
		        
		         	
				 	<div class="col-md-4" >
				 		<input type="text" id="idid"class="form-control" placeholder="6~20자 (한글 및 특수문자 금지)" aria-describedby="basic-addon2"  required>
				 	</div>	
				  	<div class="input-group-addon col-md-1" id="basic-addon1">@</div>
					
					 
				    <div class="input-group col-md-6 row" style="">
					    <div class="col-md-9">
					      <input id="emailInput" type="text" class="form-control" aria-label="..."readonly="readonly" maxlength="26" required>
					    </div>
				        <div class="input-group-btn col-md-3">
					        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">메일선택 <span class="caret"></span></button>
					        	<ul class="dropdown-menu dropdown-menu-right" role="menu">
					          <li onclick="javascript:mailselect('hanmail.net');"><a >hanmail.net</a></li>
					          <li onclick="javascript:mailselect('naver.com');"><a >naver.com</a></li>
					          <li onclick="javascript:mailselect('gmail.com');"><a >gmail.com</a></li>
					          <li onclick="javascript:mailselect('hotmail.com');"><a >hotmail.com</a></li>
					          <li onclick="javascript:mailselect('msn.co.kr');"><a >msn.co.kr</a></li>
					          <li class="divider"></li>
					          <li onclick="javascript:selfinput();"><a >직접입력</a></li>
					        </ul>
					    </div>
					   
	   				 </div>
	   				 <div class="col-md-1" id="idcheckSuc"></div>
	   		</div>	
			<div class="row">		
			<div class="col-md-12"><button id="checEmailid" class="btn btn-primary col-md-4" onclick="mailCheck();">
		      이메일 중복검사</button></div>
			</div>
		
		<script>
		$('#emailInput').change(function() {
			
		});
		</script>
<br><br><br>
		<!-- 비밀번호 -->
		
		<script>
		
		
		
		</script>
		<div class="row">
			<label class="col-md-12" for="sel1">비밀번호</label>
			<div class="col-md-4">
														<!-- 비밀번호 -->          
			  <input type="password" id="pwpw" class="form-control" placeholder="6~20자 (한글 및 특수문자 금지)" aria-describedby="basic-addon2"  required>	
			<span id="hpcheckSuc"></span>
			</div>
		</div>
		<div class="row">
			 <label class="col-md-12" for="sel1">비밀번호 확인</label>
			<div class="col-md-4">
			  <input type="password" id="pwpw2" class="form-control" aria-describedby="basic-addon2"  required>	
			<span id="hpcheckSuc2"></span>
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
		  <input type="text" id="memname" class="form-control" placeholder="6~20자 (한글 및 특수문자 금지)" aria-describedby="basic-addon2" maxlength="4"  required>	
		</div>
		<script>
		$("#memname").keyup(function(event){
			if (!(event.keyCode >=37 && event.keyCode<=40)) {
				var inputVal = $(this).val();
				$(this).val(inputVal.replace(/[a-z0-9]/gi,''));
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
		<div class="col-md-12" >
													<!-- 연락처1 -->
			<select class="form-control col-md-3" id=phph0 style="width:150px;border-top-left-radius:0;border-bottom-left-radius:0;">
				<option>010</option>
				<option>011</option>
				<option>017</option>
				<option>019</option>
			</select>
			<span class="input-group-addon col-md-1" id="basic-addon1" style="height:34px;padding-right:20px;padding-top:10px;border-radius:0;border:0px; background-color:#fff; border-top-left-radius:0;border-bottom-left-radius:0;" >
				<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
			</span>
													<!-- 연락처 2 -->
			<input type="text" id="phph" class="form-control col-md-3" aria-describedby="basic-addon2" style="width:150px;" maxlength="4" required>
			<span class="input-group-addon col-md-1" id="basic-addon1" style="height:34px;padding-right:20px;padding-top:10px;border-radius:0;border:0px; background-color:#fff; border-top-left-radius:0;border-bottom-left-radius:0;">
				<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
			</span>
													<!-- 연락처 3 -->
			<input type="text" id="phph2" class="form-control col-md-3" aria-describedby="basic-addon2" style="width:150px;" maxlength="4" required>
			<br>
			<br>
		</div>
		<div class="col-md-12">
			<button id="checkHp" class="btn btn-primary col-md-4" onclick="hpCheck();">
	      휴대전화 중복검사</button>
	     </div>
</div>
<br><br>
<br><br>
					<!-- 주소 -->
<div class="row">
			<label class="col-md-12" for="sel1">주 소</label>
			
			
        	<div class="col-md-12 row">
        	<div class="col-md-2">
        	<input class="form-control" type="text" aria-describedby="sizing-addon2" id="zipNo" name="zipNo" maxlength="7" readonly required>
        	</div>
        	<button class="btn btn-primary col-md-2" id='addrSearchBt' data-toggle="modal" data-target="#searchAddress">주소검색</button>
										        	<!-- 우편번호 -->
			</div>
</div>			
<div class="row">			
		<br>
		
		<div class="col-md-4">
			<input type="text" class="form-control" aria-describedby="sizing-addon2"
			id="roadAddrPart1" readonly>
		</div>
</div>
<div class="row">		
													<!-- 주소1 -->
		<br>
		<div class="col-md-4">
													<!-- 주소2 -->
			<input type="text" class="form-control" aria-describedby="sizing-addon2"
			id="addrDetail" value="" readonly>
		</div>
</div>
<div class="row">
		<br>
		<div class="col-md-4" >
													<!-- 주소3 -->
			<input type="text" class="form-control" aria-describedby="sizing-addon2" placeholder="상세주소"
			id="roadAddrPart2" value="" readonly>
		</div>
</div>

		<br>
        <br>

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
			<input type="text" id="pwdanswer"class="form-control" aria-describedby="sizing-addon2" >
			</div>
		</div>
        <br>
        <br>
        <!-- 생년월일 -->

<div class="row" id="birthday" >
        <label class="col-md-12" for="sel1">생년월일 / 성별</label> 
</div>
<div class="row">
        <div class="col-md-6">
        	<div class="row">
		        <div class="col-md-4">
						<input id="jumin" type="text" class="form-control" aria-describedby="sizing-addon2" maxlength="6" placeholder="예) 900401" required>
				</div>
				<div class="col-md-1">
				<span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
				</div>
				<div class="col-md-2">
						<input id="jumin2" type="text" class="form-control" aria-describedby="sizing-addon2" maxlength="1" required>
				</div>
				<div class="col-md-3">		
							<!-- * 기호 -->
							<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
							<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
							<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
							<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
							<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
							<span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span>
				
				</div>
			</div>
		</div>
</div>
<br>
<br>

        <!-- 관심사 -->
<div class="row">
        <label class="col-md-12" for="sel1">관심사</label>
</div>

         	<div class="checkbox" id="like">
         		<div class="radiobox" id="like">
						         		<div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="0">
									      </span>
									      <input type="text" class="form-control" aria-label="..." readonly value="나의 존재">
									    </div><!-- /input-group -->
									   <div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="1">
									      </span>
									      <input type="text" class="form-control" aria-label="..." readonly  value="삶과 죽음">
									    </div><!-- /input-group -->
									    <div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="2">
									      </span>
									      <input type="text" class="form-control" aria-label="..." readonly  value="사회">
									    </div><!-- /input-group -->
									    <div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="3">
									      </span>
									      <input type="text" class="form-control" aria-label="..." readonly  value="과학">
									    </div><!-- /input-group -->
									    <div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="4">
									      </span>
									      <input type="text" class="form-control" aria-label="..." readonly  value="문화생활">
									    </div><!-- /input-group -->
									    <div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="5">
									      </span>
									      <input type="text" class="form-control" aria-label="..." readonly  value="지구촌">
									    </div><!-- /input-group -->
									    <div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="6">
									      </span>
									      <input type="text" class="form-control" aria-label="..." readonly  value="갈등">
									    </div><!-- /input-group -->
									    <div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="7">
									      </span>
									      <input type="text" class="form-control" aria-label="..."  readonly value="과거와 현재 그리고 미래">
									    </div><!-- /input-group -->
									    <div class="input-group col-md-4">
									      <span class="input-group-addon">
									        <input type="radio" name="like" aria-label="..." value="8">
									      </span>
									      <input type="text" class="form-control" aria-label="..." readonly  value="새로배움">
									    </div><!-- /input-group -->
						         	
						         	</div>
         	</div>

        <br>
        <br>
         <button id="memberInput" class="collapsed btn btn-primary" data-toggle="collapse" data-parent="#accordion" aria-expanded="false" aria-controls="collapseTwo"  >
	      작성완료</button>
	      
	      <button id="memberInput2" class="collapsed btn btn-primary" data-toggle="collapse" href="#collapseThree" data-parent="#accordion" aria-expanded="false" aria-controls="collapseTwo" style="display:none;" >
	      이메일 인증으로 넘어가기</button>
        
      </div>
    </div>
  </div>
</div>
<!-- /////////////////////////////////////////////////////////////////// -->
  <div class="panel panel-default row">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="" aria-expanded="false" aria-controls="collapseThree">
          이메일 인증
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
    
      <div class="panel-body">
      	<input type="text" id="emailid" placeholder="인증번호 입력" >
      	<button id="mailLastCheck" class="collapsed btn btn-default" data-toggle="collapse" data-parent="#accordion" aria-expanded="false" aria-controls="collapseTwo" onclick="mailAccept()" >
	      이메일로 인증코드 받기</button>
	     <button id="mailLastCheck" class="collapsed btn btn-primary" data-toggle="collapse" data-parent="#accordion" aria-expanded="false" aria-controls="collapseTwo" onclick="mailcodeCheck()" >
	      이메일 인증하기</button>
      </div>
    </div>
  </div>
  <div>
<form id="joinForm" action="/lee/memberJoinOk.ju">

<input name="mem_id" id="mem_id" type="hidden">
<input name="mem_pwd" id="mem_pwd" type="hidden">
<input name="mem_name" id="mem_name" type="hidden">
<input name="mem_hp" id="mem_hp" type="hidden">
<input name="mem_addr" id="mem_addr" type="hidden">
<input name="mem_hint" id="mem_hint" type="hidden">
<input name="mem_answer" id="mem_answer" type="hidden">
<input name="mem_birth" id="mem_birth" type="hidden">
<input name="mem_like" id="mem_like" type="hidden">
<button type="submit" id="memberJoin" class="collapsed btn btn-primary" style="display: none;">
	      가입신청</button>
 </form>
 </div>
 

</body>
</html>