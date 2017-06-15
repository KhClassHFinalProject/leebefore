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
	<script type="text/javascript">
	</script>
	
	<link rel="stylesheet" href="/lee/resources/index/index.css">

  <script>
  $(function(){
	  $("#search-input").focus( function() {
		  
	      $("#search-statusBar").css("display","none");
	  });
	  $("#search-input").blur( function() {
		  
	      $("#search-statusBar").css("display","inline");
	  });
  });
  </script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <style>
  body {
	font-family: Arial, Helvetica, sans-serif;
}
table {
	font-size: 1em;
}
.ui-draggable, .ui-droppable {
	background-position: top;
}
/* 패럴관련 css */
 #parallax_wrapper {
        position: relative;
        z-index: 0;
        -webkit-transition: all 0.25s ease-in;
        transition: all 0.25s ease-in;
      }
      #parallax_field {
        overflow: hidden;
        position: absolute;
        left: 0;
        top: 0;
        height: 700px;
        width: 100%;
      }
      #parallax_field #parallax_bg {
        position: absolute;
        top: -150px;
        /* left: -20px; */
        width: 120%;
        height: 150%;
        z-index: 1;
      }
      #parallax_illustration {
        display: block;
        margin: 0 auto;
        width: 940px;
        height: 500px;
        position: relative;
        overflow: hidden;
        clear: both;
      }
      #parallax_illustration img {
        position: absolute;
      }
      #parallax_illustration #parallax_error_text {
        top: 72px;
        left: 72px;
        z-index: 10;
      }
      #parallax_illustration #parallax_octocat {
        top: 94px;
        left: 306px;
        z-index: 9;
      }
      #parallax_illustration #parallax_speeder {
        top: 50px;
        left: 532px;
        z-index: 8;
      }
      #parallax_illustration #parallax_octocatshadow {
        top: 357px;
        left: 211px;
        z-index: 7;
      }
      #parallax_illustration #parallax_speedershadow {
        top: 363px;
        left: 802px;
        z-index: 6;
      }
      #parallax_illustration #parallax_building_1 {
        top: 383px;
        left: 467px;
        z-index: 5;
      }
      #parallax_illustration #parallax_building_2 {
        top: 103px;
        left: 762px;
        z-index: 4;
      }
  
  </style>
</head>
<body>
<%@include file="header.jsp" %>
<!-- 검색 컨테이너 -->
<div class="jumbotron">
<div id="parallax_wrapper">
<div id="imgg">    
      <div id="parallax_field">
        <img alt="" class="js-plaxify" data-invert="true" data-xrange="0" data-yrange="20" height="100%" id="parallax_bg" width="940"
        src="/lee/resources/index/main.png">
      </div>
      <div id="parallax_illustration">
        <div id="auth"></div>

        <img alt="404 &ldquo;This is not the web page you are looking for&rdquo;" class="js-plaxify" data-xrange="20" data-yrange="10" height="90" id="parallax_error_text" width=""
        src="/lee/resources/index/i/i1.png">

        <img alt="" class="js-plaxify" data-xrange="10" data-yrange="10" height="90" id="parallax_octocat" width=""
        src="/lee/resources/index/i/i2.png">

        <img alt="" class="js-plaxify" data-xrange="10" data-yrange="10" height="90" id="parallax_speeder" width=""
        src="/lee/resources/index/i/i3.png">

        <img alt="" class="js-plaxify" data-xrange="10" data-yrange="10" height="90" id="parallax_octocatshadow" width=""
        src="/lee/resources/index/i/i4.png">

        <img alt="" class="js-plaxify" data-xrange="10" data-yrange="10" height="90" id="parallax_speedershadow" width=""
        src="/lee/resources/index/i/i5.png">

        <img alt="" class="js-plaxify" data-invert="true" data-xrange="50" data-yrange="20" height="90" id="parallax_building_1" width=""
        src="/lee/resources/index/i/i6.png">

        <img alt="" class="js-plaxify" data-invert="true" data-xrange="75" data-yrange="30" height="90" id="parallax_building_2" width=""
        src="/lee/resources/index/i/i7.png">
      </div>
</div>
</div>
 <!-- <img id="imgg" src="/lee/resources/index/main.png" > -->
 <div class="container text-center">
		 <div id="searchbar" style="position: relative 50%;">   
			    <div class="input-group input-group-lg">
				 	 <span class="input-group-addon" id="sizing-addon1">
					 	 <span class="glyphicon glyphicon-book" aria-hidden="true"></span>
					 	 </span>
				 	 <input id="search-input" type="text" class="form-control" placeholder="검색어 입력" aria-describedby="sizing-addon1">
				 	 <span id="search-statusBar">
				 	 	<span id="search-status" class="glyphicon glyphicon-search btn-lg"></span>
				 	 </span> 
				</div> 
		 </div>
 </div>
</div>
  
  <!-- 첫번째줄 -->
<div class="container-fluid bg-3 text-center">    
  <!-- <h3>Some of my Work</h3><br> -->
  
  <div class="row">
  	
    <div id="notice-bbs" class="col-sm-8" style="height:400px; ">
    <div class="thumbnail" style="text-align:center; height:100%; width:100%; margin-bottom:0px;">
     		 <h4>공지사항</h4>
      <!-- <img src="/lee/resources/index/bbs.png" class="img-responsive" style="width:100%; height:100%;" alt="Image"> -->
      	
          
      
      
      </div>
      
    </div>
    
    <div id="calen" class="col-sm-4 sidenav" style="height:400px; ">
      
      <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
      
      <script>
      
     var datedata;
     var wwidthc;
     var wheightc;
     var top01, left01,
     	top02, left02,
     	top03, left03,
     	top04, left04,
     	top05, left05,
     	top06, left06,
     	top07, left07,
     	topbg, lefbg;
      
        $( function() {
       
        $(document).mousemove(function(e){
            var top01move = (e.pageY-wwidthc)*0.05;
            var left01move = (e.pageX-wheightc)*0.05;
            
            $("#parallax_octocat").css({
            	'top':top01 + top01move,
            	'left':left01 + left01move
            });
            
            $("#parallax_error_text").css({
            	'top':top02 - top01move,
            	'left':left02 - left01move
            });
            
            $("#parallax_speeder").css({
            	'top':top03 - top01move,
            	'left':left03 + left01move
            });
            
            $("#parallax_octocatshadow").css({
            	'top':top04 + left01move,
            	'left':left04 - top01move
            });
            
            $("#parallax_speedershadow").css({
            	'top':top05 - left01move,
            	'left':left05 - top01move
            });
            
            $("#parallax_building_1").css({
            	'top':top06 - top01move,
            	'left':left06 - left01move
            });
            
            $("#parallax_building_2").css({
            	'top':top07 - top01move,
            	'left':left07 - left01move
            });
             
            
            console.log(top01move +', '+ left01move);
        });
        $(window).scroll(function () {
    		
	        	var height = $(document).scrollTop();
	        	$("#parallax_bg").css({
	            	'top':topbg + height*0.8
	            	
	            });
        	}); 
        
        
   		 $( "#datepicker" ).datepicker({
   			monthNames: [ "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12" ],
   			onSelect: function(dateText) {
   				
			   				var day_s = dateText.split("/");
			   				var day = parseInt(day_s[1])-1;
			   				document.getElementById("datepickerdetail").innerText =day_s[2]+"년"+day_s[0]+"월"+day_s[1]+"일";
			   				
			   				for(var k = 0 ; k < datedata.length ; k++){
			   					
			   					var bb = datedata[k].solar_Date.split('-');
				            	var dd = parseInt(bb[2])-1; 
				            	if(dd==day){
				            		if(datedata[k].memo){
				            			document.getElementById("datepickerdetail").innerText = document.getElementById("datepickerdetail").innerText +"\n"+ datedata[k].memo;
				            		}else{
					   					document.getElementById("datepickerdetail").innerText = day_s[2]+"년"+day_s[0]+"월"+day_s[1]+"일";
					   					
					   				}
				            		
				            	}
			   				}
			   				
			   				
			   				
   			  			}
   		 });
   		 
   		$( "#datepicker" ).on("DOMSubtreeModified",function() {
   					for(var k = 0 ; k < datedata.length ; k++){
	   					
   						if(datedata[k].memo){
			            		
			            		var bb = datedata[k].solar_Date.split('-');
				            	var dd = parseInt(bb[2])-1; 
				            	var change = document.getElementsByClassName('ui-state-default')[dd];
				            	$(change).css('border','3px solid red');
				            	
			            		
			            	}else{
			            		var change = document.getElementsByClassName('ui-state-default')[k];
				            	
				            	$(change).css('border','1px solid #c5c5c5');
			            	}
		            }
   					return;
   					
   		});
   		
   		/*  $("table").on('click','.ui-state-hover',function(){
   			 alert('날짜 버튼 눌림');
	   				for(var i = 0 ; i < datedata.length ; i++){
		            	if(datedata[i].memo){
		            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[i];
		            	$(change).css('border-color','red');
		            	}
		            }
   			 
   		 }); */
   		 
   		 $(document).on('click','.ui-datepicker-prev, .ui-datepicker-next',function(){
   				
	   	        	
	   	        	var yr = document.getElementsByClassName('ui-datepicker-year')[0].innerText;
	   	        	var mon = document.getElementsByClassName('ui-datepicker-month')[0].innerText;
	   	        	
	   	        	document.getElementById("datepickerdetail").innerHTML = "";
	   	        	console.log(yr+'/'+mon);
	   	        	$.ajax({
	   			        url : "getHoliday.ju",
	   			        type: "get",
	   			        data : {"yr":yr,"mon":mon},
	   			        dataType:"json",
	   			        
	   			        success : function(responseData){
	   			        	$("#ajax").remove();
	   			            
	   			            datedata = responseData.hdto;
	   			            
	   			            if(!datedata){
	   			            	alert("데이터를 받지 못함");
	   			            }else{
	   			            	
	   				            for(var i = 0 ; i < datedata.length ; i++){
	   				            	
	   				            	if(datedata[i].memo){
	   				            		
	   				            		var bb = datedata[i].solar_Date.split('-');
		   				            	var dd = parseInt(bb[2])-1; 
		   				            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[dd];
		   				            	
		   				            	$(change).css('border','3px solid red');
		   				            	
	   				            		
	   				            	}else{
	   				            		var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[i];
		   				            	
		   				            	$(change).css('border','1px solid #c5c5c5');
	   				            	}
	   				            }
	   			            }
	   			           	
	   			        },
	   			        error: function(request,status,error){
	   			        	
	   			        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error); 
	   			        }
	   		   		 });
   	        
   		 });
   		 
   		
   		
        });
        
        
        $("body").ready(function(){
        	
        	wwidthc = $(window).width()/2;
            wheightc = $(window).height()/2;
            top01 = parseInt($("#parallax_octocat").css('top'), 10);
            left01 = parseInt($("#parallax_octocat").css('left'), 10);
            
            top02 = parseInt($("#parallax_error_text").css('top'), 10);
            left02 = parseInt($("#parallax_error_text").css('left'), 10);
            
            top03 = parseInt($("#parallax_speeder").css('top'), 10);
            left03 = parseInt($("#parallax_speeder").css('left'), 10);
            
            top04 = parseInt($("#parallax_octocatshadow").css('top'), 10);
            left04 = parseInt($("#parallax_octocatshadow").css('left'), 10);
            
            top05 = parseInt($("#parallax_speedershadow").css('top'), 10);
            left05 = parseInt($("#parallax_speedershadow").css('left'), 10);
            
            top06 = parseInt($("#parallax_building_1").css('top'), 10);
            left06 = parseInt($("#parallax_building_1").css('left'), 10);
            
            top07 = parseInt($("#parallax_building_2").css('top'), 10);
            left07 = parseInt($("#parallax_building_2").css('left'), 10);
            
            topbg = parseInt($("#parallax_bg").css('top'), 10);
            leftbg = parseInt($("#parallax_bg").css('left'), 10);
            
            
        	var yr = document.getElementsByClassName('ui-datepicker-year')[0].innerText;
        	var mon = document.getElementsByClassName('ui-datepicker-month')[0].innerText;
        	
        	console.log(yr+'/'+mon);
        	$.ajax({
		        url : "getHoliday.ju",
		        type: "get",
		        data : {"yr":yr,"mon":mon},
		        dataType:"json",
		        
		        success : function(responseData){
		            
		        	$("#ajax").remove();
		            datedata = responseData.hdto;
		            
		            if(!datedata){
		            	alert("데이터를 받지 못함");
		            }else{
			            for(var i = 0 ; i < datedata.length ; i++){
			            	if(datedata[i].memo){
				            		
				            	var bb = datedata[i].solar_Date.split('-');
   				            	var dd = parseInt(bb[2])-1; 
   				            	var change = document.getElementsByClassName('ui-datepicker-calendar')[0].getElementsByClassName('ui-state-default')[dd];
   				            	$(change).css('border','3px solid');
   				            	$(change).css('border-color','red');
   				            	
				            		
				            	}
			            }
			            $(".ui-datepicker-today")[0].click();
			            
		            }
		           	
		        },
		        error: function(request,status,error){
		        	
		        	 alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		        	 
		        }
	   		 });
        	
        	
        	
        });
   
        </script>
      <div class="thumbnail" style="text-align:center; height:100%; padding:0px;">
     		 <h4>캘린더</h4>
      	<div id="datepicker" style="display:inline-block;"></div>
        <div class="caption">
	        <p>세부일정</p>
	       <div class="thumbnail">
	        <div id="datepickerdetail" style="margin-top:0px;width:250px;height:;font-size:large;">
	        </div>
	       </div>
        </div>  
      
      
      </div>
    </div>
  </div>
</div><br>


<!-- 두번째줄 -->
<div id="allbutton" class="container-fluid bg-3 text-center">

  <div class="row" style="width:100%;">
  <div class="indexbt1row">
	    <div class="col-sm-3">
	      <p>마이페이지</p>
	      <a href="/lee/changeMe.ju">
	      <img src="/lee/resources/index/button.gif" class="img-responsive" style="width:100%" alt="Image">
	      </a>
	    </div>
	    <div class="col-sm-3"> 
	      <p>버튼2</p>
	      <img src="/lee/resources/index/button.gif" class="img-responsive" style="width:100%" alt="Image">
	    </div>
   </div>
   <div class="indexbt2row">
	    <div class="col-sm-3"> 
	      <p>버튼3</p>
	      <img src="/lee/resources/index/button.gif" class="img-responsive" style="width:100%" alt="Image">
	    </div>
	    <div class="col-sm-3">
	      <p>버튼4</p>
	      <img src="/lee/resources/index/button.gif" class="img-responsive" style="width:100%" alt="Image">
	    </div>
	</div>
  </div>
</div><br>

<!-- 세번째줄 -->
<div id="favorbook" class="container-fluid bg-3 text-center">

  <div class="row" style="width:100%; height:400px;">
  
	    <div class="col-md-8" style="text-align:center; height:100%;">
	      <div class="thumbnail" style="text-align:center; height:100%;">
	        <p>이달의 추천도서</p>

						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel" style="background-color:#1AA4AC;height:356px; border-radius: 10px;">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
	
							<!-- Wrapper for slides -->
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="..." alt="...">
									<div class="carousel-caption">
									<h3>책1</h3>
	    							<p>책1입니다</p>
									</div>
								</div>
								
								<div class="item">
									<img src="..." alt="...">
									<div class="carousel-caption">
									<h3>책2</h3>
	    							<p>책2입니다</p>
									</div>
								</div>
								
								<div class="item">
									<img src="..." alt="...">
									<div class="carousel-caption">
									<h3>책3</h3>
	    							<p>책3입니다</p>
									</div>
								</div>
								
							</div>
	
							<!-- Controls -->
							<a class="left carousel-control" href="#carousel-example-generic"
								role="button" data-slide="prev" style="border-left-radius: 10px;"> <span
								class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" role="button" data-slide="next" style="border-top-right-radius: 10px;">
								<span class="glyphicon glyphicon-chevron-right"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>

				</div>
	    </div>
	    
	    <div class="col-md-4" style="text-align:center; height:100%;">
	      <div class="thumbnail" style="text-align:center; height:100%;">
	        <p>이달의 추천 E-book</p>
	        
	        <div class="thumbnail" style=" height:356px;">
		      <img src="..." alt="...">
		      <div class="caption">
		        <h3>E-book이름</h3>
		        <p>...</p>
		        <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p>
		      </div>
   			 </div>
   			 	
	      </div>
	    </div>
	
  </div>
</div><br>


    
<!-- <footer class="container-fluid text-center">
  
</footer> -->
<%@include file="footer.jsp" %>
</body>

</html>