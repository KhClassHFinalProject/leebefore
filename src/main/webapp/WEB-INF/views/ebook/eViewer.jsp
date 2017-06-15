<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
		#control{
			text-align: center;
			margin-top: 30px;
			margin-bottom: 30px;
		}
		#myiconmenu{
			z-index: 10;
		}
		#Inconfig{
			cursor: pointer;
		}
		#zoomDiv>button, #zoomDiv>button:HOVER{
			opacity: 1
		}
		nav>div{
			padding: 5% 0;
		}
		.btn-link{
			color: red;
		}
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	
	<!-- booklet -->
	<link rel="stylesheet" href="/lee/resources/eViewer/booklet/jquery.booklet.latest.css" type="text/css" media="screen, projection, tv">
	<script type="text/javascript" src="/lee/resources/eViewer/booklet/jquery-ui-1.10.4.min.js"></script>
	<script type="text/javascript" src="/lee/resources/eViewer/booklet/jquery.easing.1.3.js"></script>
	<script type="text/javascript" src="/lee/resources/eViewer/booklet/jquery.booklet.latest.js"></script>
	
	<!-- right -->
	<link rel="stylesheet" href="/lee/resources/eViewer/jPushMenu/jPushMenu.css?v=2" type="text/css" >
	<script type="text/javascript" src="/lee/resources/eViewer/jPushMenu/jPushMenu.js"></script>
	
	<!-- zoom -->
	<script type="text/javascript" src="/lee/resources/eViewer/wheelzoom.js"></script>
	
	<script type="text/javascript">
		$(function() {
			window.moveTo(0,0);
			
			//single book
			$('#mybook').booklet(
				{
					width: "1160px"
					, height: "760px"
					, closed: true 				/*표지 1장?*/
					, autoCenter: true		/*표지 일경우 중앙으로*/
					, arrows: true
					, arrowsHide: true
					, hash: true					/*#/page/1*/
					, name : $("body").data("subject")
					, next: "#customNext"
					, prev: "#customPrev"
					, menu: "#customMenu"
					, auto: true
					, play: "#customPlay"
					, pause: "#customPause"
					, delay: 1000
					/* , startingPage : 10 시작 페이지*/
				}
			);
			$("#customPause").click().css("display", "none");
			
			$("#customPause").click(
				function() {
					$("#customPlay").css("display", "inline-block");
					$("#customPause").css("display", "none");
				}
			);
			$("#customPlay").click(
				function() {
					$("#customPlay").css("display", "none");
					$("#customPause").css("display", "inline-block");
				}
			);
			
			$("#customStart").click(
				function() {
					location.replace("#/page/1");
				}
			);
			$("#customEnd").click(
				function() {
					location.href="#/page/" + $("#customEnd").data("end");
				}
			);
			
			/*북마크 만들기*/
			function bookMakerLi(endMaker) {
				var bookMarkerList=$("#bookMarkUl").html();
				var nowBookMarkCount=$("#bookMarkUl>div").length;
				var endMakerPage=endMaker.split("/");
				bookMarkerList+='<div class="form-group">';
				bookMarkerList+='	<button type="button" class="btn btn-default"  role="button" data-maker="' + endMaker + '">' + endMakerPage[2] + ' 페이지</button>';
				bookMarkerList+='	<button type="button" class="btn btn-link">';
				bookMarkerList+='		<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>';
				bookMarkerList+='	</button>';
				bookMarkerList+='</div>';
				$("#bookMarkUl").html(bookMarkerList);
				bookMakerGo();
				bookMakerDelet();
			}
			
			//수정?
			var param=document.location.search.split("=");
			var idxName=param[1].slice(0, 2).toUpperCase();
			if(idxName!="EB"){
				$("#bookmarker").parent().remove();
				$("#bookMarkUl").remove();
			}
			else{
				var bkArr=$("#bookMarkUl").data("bk").split("~");
				for(var i=0 ; i<bkArr.length ; i++){
					if(bkArr[i]!=""){ bookMakerLi(bkArr[i]); }
				}
			}
			/*북마크 등록*/
			$("#bookmarker").click(
				function() {
					var el_idx=$("body").data("idx");
					var lb_idx=$("body").data("loan");
							
					var thisHref=$(location).attr("href");
					var thisPages=$(location).attr("href").split("#");
					var thisPage="#"+thisPages[1];
					var buttonEven=$(".form-group>button:even");
					if(buttonEven.length>=6){//6으로 변경할 것
						alert("북마크 최대는 6개 입니다.");
						return null;
					}
					else{
						for(var i=0 ; i<buttonEven.length ; i++){
							if(buttonEven.eq(i).data("maker")==thisPage){
								alert("이미 추가된 페이지 입니다.");
								return null;
							}
						}
						
						$.ajax({
							type : "GET"
			    			, url : "eViewerBookMakerAdd.ju"
			    			, data : {page : thisPage, el_idx : el_idx, lb_idx : lb_idx}
			    			, dataType : "json"
			    			, success: function(data){
								alert("현재 페이지가 북마크에 추가 되었습니다.");
								bookMakerLi(thisPage);
			    			} // success
						}); // ajax
					} // else
				} // function
			);
			/*북마크 클릭*/
			function bookMakerGo() {
				$("#bookMarkUl>div>.btn-default").click(
					function() {
						var bookMakerIndex=$("#bookMarkUl>div>.btn-default").index(this);
						location.href=$("#bookMarkUl>div>.btn-default").eq(bookMakerIndex).data("maker");
					}
				);
			}
			/*북마크 삭제*/
			function bookMakerDelet() {
				$(".btn-link").click(
					function() {
						var el_idx=$("body").data("idx");
						var lb_idx=$("body").data("loan");
						
						var deletMakerNum=$(".btn-link").index(this);
						var thisPage=$(".form-group:eq(" + deletMakerNum + ")>button").eq(0).data("maker");
						var deletBoolean=confirm("해당 북마크가 삭제 됩니다.\n삭제하시겠습니까?");
						if(deletBoolean){
							$.ajax({
								type : "GET"
				    			, url : "eViewerBookMakerDel.ju"
				    			, data : {page : thisPage, el_idx : el_idx, lb_idx : lb_idx}
				    			, dataType : "json"
				    			, success: function(data){
									$(".form-group").eq(deletMakerNum).remove();
				    			} // success
							}); // ajax
						} // if
					} // function
				);
			}
			
			/*휠 줌인 줌아웃*/
			wheelzoom(document.querySelectorAll("img"), {zoom:0.05});
			
			/*오른쪽 메뉴*/
			$(".toggle-menu").jPushMenu();
			
			/*오른쪽 메뉴 열렸을때 h3*/
			$("#Inconfig").click(
				function() {
					$("#config").click();
				}
			);
			
			/*오른쪽 메뉴 : 쪽수 입력 후 엔터시 이동*/
			$("#pagego").keypress(function(e) { 
			    if (e.keyCode == 13){
			    	$("#pagegoSub").click();
			    }
			});
			
			/*오른쪽 메뉴 : 쪽수 입력 후 클릭시 이동*/
			$("#pagegoSub").click(
				function() {
					var page=$("#pagego").val();
					if(page%2==0){
						page=parseInt(page)+1;
					}
					location.href="#/page/" + page; 
				}
			);
			
			/*시간설정*/
			$("#timeSelect>button").click(
				function() {
					$("#timeSelect>button").removeClass("btn-primary").addClass("btn-default");
					$(this).removeClass("btn-default").addClass("btn-primary");
					var settingTime=$(this).text().substr(0, 1)*1000;
					$('#mybook').booklet( "option", "delay", settingTime);
					var playDisplay=$("#customPlay").css("display");
					if(playDisplay=="inline-block"){
						/*일시정지*/
						$("#customPause").click();
					}
					else if (playDisplay=="none") {
						/*사용중*/
					}
				}
			);
			
			/*모달*/
			var idx=$("body").data("idx");
			if(idx.indexOf("EB")==0){ //전자도서
				var beforeRead=$(".modal-body").data("end");
					if(beforeRead!="#/page/1"){
						$("#endModal").modal("show");
						var pages=beforeRead.split("/");
						$(".modal-body>div>span").text(pages[pages.length-1] + " 페이지");
						$(".modal-footer>.btn-primary").click(
							function() {
								location.href=beforeRead;
								$(".modal-footer>.btn-default").click();
							}
						); // click
					}
			} // 전자도서 if
			
			/*마지막 페이지 저장*/
			$(window).on("beforeunload", 
				function() {
					var el_idx=$("body").data("idx");
					var lb_idx=$("body").data("loan");
		    		var thisHref=$(location).attr("href");
					var thisPages=$(location).attr("href").split("#");
					var thisPage="#"+thisPages[1];
					$.ajax({
		    			type : "GET"
		    			, url : "eViewerEndMaker.ju"
		    			, data : {endPage : thisPage, el_idx : el_idx, lb_idx : lb_idx}
		    			, dataType : "json"
		    			, success: function(data){
		    			}
		    		});
				} // beforeunload function
		    ); // beforeunload
			
		}); // 기본 함수
		
	    
	</script>
	
</head>
<body data-subject="${elibArr.el_subject }" data-idx="${elibArr.el_idx }" data-loan="${loanArr.lb_idx }">
<!-- 빌린책 마지막쪽 심기 -->
	<div class="modal fade" id="endModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			 <div class="modal-content">
				<div class="modal-body" data-end="${beforeRead }">
					<div>마지막에 읽은 페이지가 있습니다.</div> 
					<div>이동 하시겠습니까?</div>
					<div>마지막으로 읽은 페이지 : <span></span></div>
				</div>
		   <div class="modal-footer">
				<button type="button" class="btn btn-primary">이동</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
			</div>
		</div>
	</div>

	<div id="control">
		<button type="button" class="btn btn-default" name="customStart" id="customStart">
			<span class="glyphicon glyphicon-step-backward" aria-hidden="true">맨앞</span>
		</button>
		<button type="button" class="btn btn-default" name="customPrev" id="customPrev">
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true">이전</span>
		</button>

		<button type="button" class="btn btn-default" name="customPlay" id="customPlay">
			<span class="glyphicon glyphicon-play" aria-hidden="true"></span>	<!-- 재생 -->
		</button>
		<button type="button" class="btn btn-default" name="customPause" id="customPause">
			<span class="glyphicon glyphicon-pause" aria-hidden="true"></span>	<!-- 일시정지 -->
		</button>
		<!-- 자동 -->
		
		<button type="button" class="btn btn-default" name="customNext" id="customNext">
			다음<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		</button>
		<button type="button" class="btn btn-default" name="customEnd" id="customEnd" data-end="${endPage }">
			맨뒤<span class="glyphicon glyphicon-step-forward" aria-hidden="true"></span>
		</button>
		
		<button type="button" class="btn btn-default toggle-menu menu-right" name="config" id="config">설정</button>
	</div>
	
	<div id="mybook">
		<c:forEach var="getImgPath" items="${imgPath}">
			<div><img src="${getImgPath }" width="570px" height="750px"></div>
		</c:forEach>
		</div>
	
	<nav class="cbp-spmenu cbp-spmenu-vertical cbp-spmenu-right">
		<h3 class="text-center" id="Inconfig">설정</h3>
		<div class="text-center" id="zoomDiv">
			<button class="btn btn-default" type="button" disabled="disabled"><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"> : 휠 업</span></button>
			<button class="btn btn-default" type="button" disabled="disabled"><span class="glyphicon glyphicon-zoom-out" aria-hidden="true"> : 휠 다운</span></button>
		</div>
		<div class="text-center" id="timeSelect">
			<button class="btn btn-primary" type="button"><span class="glyphicon glyphicon-forward" aria-hidden="true">1초</span></button>
			<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-forward" aria-hidden="true">3초</span></button>
			<button class="btn btn-default" type="button"><span class="glyphicon glyphicon-forward" aria-hidden="true">5초</span></button>
		</div>
		<div class="input-group text-center">
			<input type="text" class="form-control" name="pagego" id="pagego">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button" name="pagegoSub" id="pagegoSub">이동</button>
			</span>
		 </div>
		 <div class="row text-center">
		 	<button class="btn btn-default" type="button" name="bookmarker" id="bookmarker" >북마크 등록</button>
		 </div>
		 <div class="text-center" id="bookMarkUl" data-bk="${bkArr }">
		 <!-- //BM -->
		 </div>
	</nav>

</body>
</html>