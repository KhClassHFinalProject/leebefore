<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Insert title here</title>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<link rel="stylesheet" href="/lee/resources/bootstrapk/css/bootstrap.min.css">
	<style type="text/css">
		#detailFind>h4>a{
			text-decoration: none;
		}
		#openFind>div>table>tbody>tr>th{
			vertical-align: middle;
		}
		#cateMd{
			display: none;
		}
		.order>span:HOVER{
			cursor : pointer;
		}
		.modal-body{
			margin: 2%;
		}
		.modal-body>div>div{
			padding: 1%;
		}
		@media (max-width: 768px) {
			.info{
				display: none;
			}
		}
	</style>
    
	<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/lee/resources/bootstrapk/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			/*사이드바*/
			$("#ebList").addClass("open").children("ul").show();
			$("#emList").removeClass("has-sub");
			$("#emList>ul").remove();
			$("#abList").removeClass("has-sub");
			$("#abList>ul").remove();
			$("#eduList").removeClass("has-sub");
			$("#eduList>ul").remove();
			
			/*사이드바 메뉴 클릭*/
			$("#ebList>ul>li>a").click(
				function(event) {
					detailSubject="";
					detailWrite="";
					detailPub="";
					cateLg=$(event.target).eq(0).data("lg");
					cateMd="99";
					if(!$(this).parent().hasClass("open")){ // 닫기는 작동안함
						$(".order>span").eq(1).click();
						elibDetailAjax(detailSubject, detailWrite, detailPub, cateLg, cateMd, 1, orderName);
					}
				} // click function
			);
			$("#ebList>ul>li>ul>li>a").click(
				function(event) {
					detailSubject="";
					detailWrite="";
					detailPub="";
					cateLg=$(event.target).parent().parent().parent().children("a").data("lg");
					cateMd=$(event.target).eq(0).data("md");
					
					$(".order>span").eq(1).click();
					elibDetailAjax(detailSubject, detailWrite, detailPub, cateLg, cateMd, 1, orderName);
				}
			);
			
			/*소 카테고리*/
			$("#cateLg").change(
				function() {
					var cateLgVal=$("#cateLg").val();
					if(cateLgVal==99){
						$("#cateMd").css("display", "none");
					}
					else{
						$.ajax({
							type : "GET"
							, url : "elibCate.ju"
							, data : {cateLgVal : cateLgVal}
							, dataType : "json"
							, success: function(data){
								var cateMdArr=data.cateMd;
								var cateMdOption="<optgroup><option value='99'>전체</option></optgroup><optgroup>"
								for(var i=0 ; i<cateMdArr.length ; i++){
									cateMdOption+="<option value='" + i + "'>" + cateMdArr[i] + "</option>";
								}
									cateMdOption+="</optgroup>";
								$("#cateMd").css("display", "inline-block").html(cateMdOption);
							}
						});
					}
			});
			
			/*처음 Ajax 실행*/
			elibListFirst(1, orderName);
			
			var simpleSearchText="";
			/*단순 검색 Ajax*/
			function elibSearchAjax(simpleSearchText, page, orderName) {
				$.ajax({
					type : "GET"
					, url : "elibSimpleSearch.ju"
					, data : {simpleSearchText : simpleSearchText, page : page, orderName : orderName, idxParam : "EB"}
					, dataType : "json"
					, success : function(data){
						var arr=data.elibArr;
						var intoHTML="";
						if(arr.length==0){
							intoHTML+='<tr>';
							intoHTML+='	<td class="text-center">';
							intoHTML+='검색 결과가 없습니다.';
							intoHTML+='	</td>';
							intoHTML+='</tr>';
						}
						for(var i=0 ; i<arr.length ; i++){
							intoHTML+='<tr data-idx=' + arr[i].el_idx + '>';
							intoHTML+='	<td>';
							intoHTML+='		<div class="media">';
							intoHTML+='			<div class="media-left media-middle text-center">';
							intoHTML+='				<img class="media-object" src=" ' + arr[i].el_path + ' " style="width: 97px; height: 110px;"><br>';
							intoHTML+='			</div>';
							intoHTML+='			<div class="media-body">';
							intoHTML+='				<h4 class="media-heading"> ' + arr[i].el_subject + ' </h4>';
							intoHTML+='				<div class="row">';
							intoHTML+='					<div class="col-md-2">저자</div>';
							intoHTML+='					<div class="col-md-10"> ' + arr[i].el_writer + ' </div>';
							intoHTML+='					<div class="col-md-2">추천 수</div>';
							intoHTML+='					<div class="col-md-10"> ' + arr[i].el_recocount + ' </div>';
							intoHTML+='				</div>';
							intoHTML+='				<div class="row info">';
							intoHTML+='					<div class="col-md-12">';
							intoHTML+='						<dl>';
							intoHTML+='							<dt>간략소개</dt>';
							intoHTML+='							<dd>';
							intoHTML+= arr[i].el_info;
							intoHTML+='							</dd>';
							intoHTML+='						</dl>';
							intoHTML+='					</div>';
							intoHTML+='				</div><!-- class info -->';
							intoHTML+='			</div><!-- class media-body -->';
							intoHTML+='		</div><!-- class media -->';
							intoHTML+='	</td>';
							intoHTML+='</tr>';
						}
						$("#contentTbody").html(intoHTML);
						$("#pagingNav").html(data.paging);
						$("#pagingNav").removeClass().addClass("simple");
						contentClick();
						
						$("#pagingNav>ul>li").removeClass("active");
						var pagingLength=$("#pagingNav>ul>li").length;
						for(var i=0 ; i<pagingLength ; i++){
							if( $("#pagingNav>ul>li").eq(i).data("page")==page ){
								$("#pagingNav>ul>li").eq(i).addClass("active");
							}
						}
						
						$("#pagingNav>ul>li").click(
							function() {
								var page=$(this).data("page");
								/*해당 버튼 사용 불가*/
								if($(this).hasClass("disabled")==true || $(this).hasClass("active")==true){
									return null;
								}
								$("body").scrollTop(0);
								/*<< >> 판단*/
								if( page=="before" || page=="after" ){
									if( page=="before" ){ page=$(this).next().data("page")-1; }
									else if( page=="after" ){ page=$(this).prev().data("page")+1; }
								}
								else{
									$("#pagingNav>ul>li").removeClass("active");
									$(this).addClass("active");
								}
								/*어떤 검색인지 표기*/
								elibSearchAjax(simpleSearchText, page, orderName);
							} // click function
						); // click
						
					} // success function
				});
			}
			/*단순 검색 Ajax 실행*/
			$("#simpleSearchText").keypress(
				function(e) {
					if(e.keyCode==13){
				    	$("#ebookSearch").click();
				    }
				}
			);
			$("#ebookSearch").click(
				function() {
					simpleSearchText=$("#simpleSearchText").val();
					elibSearchAjax(simpleSearchText, 1, orderName);
					$("#pagingNav").removeClass().addClass("simple");
					$("#pagingNav>ul>li").removeClass("active");
					$("#pagingNav>ul>li").eq(1).addClass("active");
				}
			);
			
			var detailSubject="";
			var detailWrite="";
			var detailPub="";
			var cateLg="";
			var cateMd="";
			/*상세 검색 Ajax*/
			function elibDetailAjax(detailSubject, detailWrite, detailPub, cateLg, cateMd, page, orderName) {
				$.ajax({
					type : "GET"
					, url : "elibDetailSearch.ju"
					, data : {detailSubject : detailSubject , detailWrite : detailWrite , detailPub : detailPub , cateLg : cateLg , cateMd : cateMd , page : page, orderName : orderName, idxParam : "EB"}
					, dataType : "json"
					, success: function(data){
						var arr=data.elibArr;
						var intoHTML="";
						if(arr.length==0){
							intoHTML+='<tr>';
							intoHTML+='	<td class="text-center">';
							intoHTML+='검색 결과가 없습니다.';
							intoHTML+='	</td>';
							intoHTML+='</tr>';
						}
						for(var i=0 ; i<arr.length ; i++){
							intoHTML+='<tr data-idx=' + arr[i].el_idx + '>';
							intoHTML+='	<td>';
							intoHTML+='		<div class="media">';
							intoHTML+='			<div class="media-left media-middle text-center">';
							intoHTML+='				<img class="media-object" src=" ' + arr[i].el_path + ' " style="width: 97px; height: 110px;"><br>';
							intoHTML+='			</div>';
							intoHTML+='			<div class="media-body">';
							intoHTML+='				<h4 class="media-heading">' + arr[i].el_subject + '</h4>';
							intoHTML+='				<div class="row">';
							intoHTML+='					<div class="col-md-2">저자</div>';
							intoHTML+='					<div class="col-md-10">' + arr[i].el_writer + '</div>';
							intoHTML+='					<div class="col-md-2">추천 수</div>';
							intoHTML+='					<div class="col-md-10">' + arr[i].el_recocount + '</div>';
							intoHTML+='				</div>';
							intoHTML+='				<div class="row info">';
							intoHTML+='					<div class="col-md-12">';
							intoHTML+='						<dl>';
							intoHTML+='							<dt>간략소개</dt>';
							intoHTML+='							<dd>';
							intoHTML+=arr[i].el_info;
							intoHTML+='							</dd>';
							intoHTML+='						</dl>';
							intoHTML+='					</div>';
							intoHTML+='				</div><!-- class info -->';
							intoHTML+='			</div><!-- class media-body -->';
							intoHTML+='		</div><!-- class media -->';
							intoHTML+='	</td>';
							intoHTML+='</tr>';
						}
						$("#contentTbody").html(intoHTML);
						$("#pagingNav").html(data.paging);
						$("#pagingNav").removeClass().addClass("detail");
						contentClick();
						
						$("#pagingNav>ul>li").removeClass("active");
						var pagingLength=$("#pagingNav>ul>li").length;
						for(var i=0 ; i<pagingLength ; i++){
							if( $("#pagingNav>ul>li").eq(i).data("page")==page ){
								$("#pagingNav>ul>li").eq(i).addClass("active");
							}
						}
						
						$("#pagingNav>ul>li").click(
							function() {
								var page=$(this).data("page");
								/*해당 버튼 사용 불가*/
								if($(this).hasClass("disabled")==true || $(this).hasClass("active")==true){
									return null;
								}
								$("body").scrollTop(0);
								/*<< >> 판단*/
								if( page=="before" || page=="after" ){
									if( page=="before" ){ page=$(this).next().data("page")-1; }
									else if( page=="after" ){ page=$(this).prev().data("page")+1; }
								}
								else{
									$("#pagingNav>ul>li").removeClass("active");
									$(this).addClass("active");
								}
								/*어떤 검색인지 표기*/
								elibDetailAjax(detailSubject, detailWrite, detailPub, cateLg, cateMd, page, orderName);
							} // click function
						); // click
						
					} // success function
				});
			}
			/*상세 검색 Ajax 실행*/
			$("#detailSearch").click(
				function() {
					detailSubject=$("#detailSubject").val();
					detailWrite=$("#detailWrite").val();
					detailPub=$("#detailPub").val();
					cateLg=$("#cateLg").val();
					if(cateLg==99){
						cateMd="";
					}
					else{
						cateMd=$("#cateMd").val();
					}
					elibDetailAjax(detailSubject, detailWrite, detailPub, cateLg, cateMd, 1, orderName);
					$("#pagingNav").removeClass().addClass("detail");
					$("#pagingNav>ul>li").removeClass("active");
					$("#pagingNav>ul>li").eq(1).addClass("active");
				}
			);
			
			/*추천, 최신순 변경*/
			var orderName="new";
			$(".order>span").eq(0).css("font-weight", "400");
			$(".order>span").click(
				function() {
					var orderSpanIndex=$(".order>span").index(this);
					var fontWeight=$(".order>span").eq(orderSpanIndex).css("font-weight");
					if(fontWeight=="400"){
						orderName=$(".order>span").eq(orderSpanIndex).data("order");
						$(".order>span").eq(orderSpanIndex).css("font-weight", "bold");
						$(".order>span").eq(orderSpanIndex).siblings().css("font-weight", "400");
						var pagingNavClassName=$("#pagingNav")[0].className;
						if(pagingNavClassName=="noSearch"){
							elibListFirst(1, orderName);
						}
						else if(pagingNavClassName=="simple"){
							elibSearchAjax(simpleSearchText, 1, orderName);
						}
						else if(pagingNavClassName=="detail"){
							elibDetailAjax(detailSubject, detailWrite, detailPub, cateLg, cateMd, 1, orderName);
						}
					}
					else if(fontWeight="bold"){
						/*이미 해당 순서로 정렬됨*/
						return null;
					}
				}
			);
			
		}); //기본 끝나는 곳
		
		/*처음 미검색 Ajax*/
		function elibListFirst(page, orderName) {
			$.ajax({
				type : "GET"
				, url : "elibFirst.ju"
				, data : {page : page, orderName : orderName, idxParam : "EB"}
				, dataType : "json"
				, success: function(data){
					var arr=data.elibArr;
					var intoHTML="";
					if(arr.length==0){
						intoHTML+='<tr>';
						intoHTML+='	<td class="text-center">';
						intoHTML+='검색 결과가 없습니다.';
						intoHTML+='	</td>';
						intoHTML+='</tr>';
					}
					for(var i=0 ; i<arr.length ; i++){
						intoHTML+='<tr data-idx=' + arr[i].el_idx + '>';
						intoHTML+='	<td>';
						intoHTML+='		<div class="media">';
						intoHTML+='			<div class="media-left media-middle text-center">';
						intoHTML+='				<img class="media-object" src=" ' + arr[i].el_path + ' " style="width: 97px; height: 110px;"><br>';
						intoHTML+='			</div>';
						intoHTML+='			<div class="media-body">';
						intoHTML+='				<h4 class="media-heading">' + arr[i].el_subject + '</h4>';
						intoHTML+='				<div class="row">';
						intoHTML+='					<div class="col-md-2">저자</div>';
						intoHTML+='					<div class="col-md-10">' + arr[i].el_writer + '</div>';
						intoHTML+='					<div class="col-md-2">추천 수</div>';
						intoHTML+='					<div class="col-md-10">' + arr[i].el_recocount + '</div>';
						intoHTML+='				</div>';
						intoHTML+='				<div class="row info">';
						intoHTML+='					<div class="col-md-12">';
						intoHTML+='						<dl>';
						intoHTML+='							<dt>간략소개</dt>';
						intoHTML+='							<dd>';
						intoHTML+=arr[i].el_info;
						intoHTML+='							</dd>';
						intoHTML+='						</dl>';
						intoHTML+='					</div>';
						intoHTML+='				</div><!-- class info -->';
						intoHTML+='			</div><!-- class media-body -->';
						intoHTML+='		</div><!-- class media -->';
						intoHTML+='	</td>';
						intoHTML+='</tr>';
					}
					$("#contentTbody").html(intoHTML);
					$("#pagingNav").html(data.paging);
					$("#pagingNav").removeClass().addClass("noSearch");
					contentClick();
					
					$("#pagingNav>ul>li").removeClass("active");
					var pagingLength=$("#pagingNav>ul>li").length;
					for(var i=0 ; i<pagingLength ; i++){
						if( $("#pagingNav>ul>li").eq(i).data("page")==page ){
							$("#pagingNav>ul>li").eq(i).addClass("active");
						}
					}
					
					$("#pagingNav>ul>li").click(
						function() {
							var page=$(this).data("page");
							/*해당 버튼 사용 불가*/
							if($(this).hasClass("disabled")==true || $(this).hasClass("active")==true){
								return null;
							}
							$("body").scrollTop(0);
							/*<< >> 판단*/
							if( page=="before" || page=="after" ){
								if( page=="before" ){ page=$(this).next().data("page")-1; }
								else if( page=="after" ){ page=$(this).prev().data("page")+1; }
							}
							else{
								$("#pagingNav>ul>li").removeClass("active");
								$(this).addClass("active");
							}
							/*어떤 검색인지 표기*/
							elibListFirst(page, orderName);
						} // click function
					); // click
				} // success
			});
		}
		
		
		/*컨텐츠 클릭*/
		function contentClick() {
			$("#contentTbody>tr>td").click(
				function() {
					var selectNum=$("#contentTbody>tr>td").index(this);
					var el_idx=$("#contentTbody>tr").eq(selectNum).data("idx");
					$.ajax({
						type : "GET"
						, url : "elibContent.ju"
						, data : {el_idx : el_idx}
						, dataType : "json"
						, success: function(data){
							var arr=data.elibArr;
							var mem=data.mem;
							var intoHeaderHTML="";
							intoHeaderHTML+='<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>';
							intoHeaderHTML+='<h4 class="modal-title" id="myModalLabel">' + arr.el_subject + '</h4>';
							
							var intoBodyHTML="";
							intoBodyHTML+='<div class="panel panel-default" >';
							intoBodyHTML+='	<div class="row">';
							intoBodyHTML+='		<div class="col-md-12">';
							intoBodyHTML+='			<div class="media">';
							intoBodyHTML+='				<div class="media-left media">';
							intoBodyHTML+='					<img class="media-object" src=" ' + arr.el_path + ' " style="width: 100px; height: 150px;"  alt="..." >';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='				<div class="media-body">';
							intoBodyHTML+='					<div class="text-left">';
							intoBodyHTML+='						<div class="col-md-2">저자</div><div class="col-md-10">' + arr.el_writer + '</div>';
							intoBodyHTML+='						<div class="col-md-2">출판사</div><div class="col-md-10">' + arr.el_pub + '</div>';
							intoBodyHTML+='						<div class="col-md-2">추천 수</div><div class="col-md-10" id="reco">' + arr.el_recocount + '</div>';
							intoBodyHTML+='						<div class="col-md-2">대출</div><div class="col-md-10" id="loan">0/5</div>';
							intoBodyHTML+='					</div>';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='				<div class="text-right">';
							if(mem==0){
								intoBodyHTML+='					<span data-toggle="tooltip" data-placement="bottom" title="로그인 해야 사용 할 수 있습니다.">';
								intoBodyHTML+='						<button class="btn btn-default" id="loanButton" type="button" disabled="disabled" >대출하기 </button>';
								intoBodyHTML+='					</span> ';
								intoBodyHTML+='					<span data-toggle="tooltip" data-placement="bottom" title="로그인 해야 사용 할 수 있습니다.">';
								intoBodyHTML+='						<button class="btn btn-default" id="recommendButton" type="button"  disabled="disabled" >추천하기</button> ';
								intoBodyHTML+='					</span> ';
							}
							else{
								intoBodyHTML+='					<button class="btn btn-default" id="loanButton" type="button" onClick="ebookLoan(\'' + arr.el_idx + '\')" >대출하기 </button>';
								intoBodyHTML+='					<button class="btn btn-default" id="recommendButton" type="button" onClick="elibRecommend(\'' + arr.el_idx + '\' )" >추천하기</button>';
							}
							intoBodyHTML+='					<button class="btn btn-default" onClick="ebookRefresh(\'' + arr.el_idx + '\')">';
							intoBodyHTML+='						<span class="glyphicon glyphicon-refresh" aria-hidden="true"></span><span id="refreshSpan">대여 가능</span>';
							intoBodyHTML+='					</button>';
							intoBodyHTML+='				</div>';
							intoBodyHTML+='			</div>';
							intoBodyHTML+='		</div>';
							intoBodyHTML+='	</div>';
							intoBodyHTML+='</div>';
							intoBodyHTML+='<div class="row">';
							intoBodyHTML+='	<table class="table">';
							intoBodyHTML+='		<tr>';
							intoBodyHTML+='			<td>';
							intoBodyHTML+='				<h4>작품소개</h4>';
							intoBodyHTML+=arr.el_info;
							intoBodyHTML+='			</td>';
							intoBodyHTML+='		</tr>';
							intoBodyHTML+='	</table>';
							intoBodyHTML+='</div>';
							$(".modal-header").html(intoHeaderHTML);
							$(".modal-body").html(intoBodyHTML);
							if(mem==0){
								$("#loanButton").parent().tooltip();
								$("#recommendButton").parent().tooltip();
							} // null function
						$("#myModal").modal("show");
						$("#refreshSpan").parent().click();
						} // success
					});
				}
			);
		}
		
		/*새로고침*/
		function ebookRefresh(el_idx) {
			$.ajax({
				type : "GET"
				, url : "ebookRefresh.ju"
				, data : {el_idx : el_idx}
				, dataType : "json"
				, success: function(data){
					var resultCount=data.resultCount;
					if(resultCount==5){
						$("#refreshSpan").text("대여 불가능");
					}
					else{
						$("#refreshSpan").text("대여 가능");
					}
					$("#loan").text(resultCount + "/5");
				} // success: function
			}) // ajax
		}
		/*대출*/
		function ebookLoan(el_idx) {
			$.ajax({
				type : "GET"
				, url : "ebookLoan.ju"
				, data : {el_idx : el_idx}
				, dataType : "json"
				, success: function(data){
					var resultCount=data.resultCount;
					if(resultCount==0){
						alert("대출이 불가능 합니다."+data.msg);
					}
					else if(resultCount>0){
						ebookRefresh(el_idx);
						alert("대여기간은 " + data.endDate + "까지 입니다.");
					}
				} // success: function
			});
		}
		/*추천*/
		function elibRecommend(el_idx) {
			$.ajax({
				type : "GET"
				, url : "elibRecommend.ju"
				, data : {el_idx : el_idx}
				, dataType : "json"
				, success: function(data){
					var resultCount=data.resultCount;
					var recommend=data.recommend;
					if(resultCount>=1){
						$("#reco").text(recommend);
						alert("추천 되었습니다.");
						var num=$("#contentTbody>tr").length;
						for(var i=0 ; i<num ; i++){
							if($("#contentTbody>tr").eq(i).data("idx")==el_idx){
								$("#contentTbody>tr:eq(" + i + ")>td>.media>.media-body>.row>div").eq(3).text(recommend);
							}
						}
					}
					else{
						alert("이미 추천 했습니다.");
					}
				}
			}); // success: function
		}
		
	</script>
	
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

	<!-- 사이드바+컨텐츠 -->
	<div class="row">
		<div class="col-md-3">
			<jsp:include page="/WEB-INF/views/ebook/elibSide.jsp"></jsp:include>
		</div>
		
		<!-- 컨텐츠 -->
		<div class="col-md-8">
			
			<!-- 검색바 -->
			<div class="row" style="background: url('/lee/resources/elib/EBback.jpg'); background-size : cover; padding: 80px 0;">
				<div class="input-group">
					<input type="text" class="form-control" placeholder="전자도서" name="simpleSearchText" id="simpleSearchText">
					<span class="input-group-btn">
						<button class="btn btn-default" type="button" id="ebookSearch">
							<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
						</button>
					</span>
				</div>
			</div>
			
			<!-- 상세검색 -->
			<div class="row">
				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
					<div class="panel panel-default">
					
						<!-- 상세검색 상단 -->
						<div class="panel-heading text-center" role="tab" id="detailFind">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#openFind" aria-expanded="true" aria-controls="collapseOne">
									상세검색
								</a>
							</h4>
						</div>
						
						<!-- 상세검색색 부분 -->
						<div id="openFind" class="panel-collapse collapse" role="tabpanel" aria-labelledby="detailFind">
							<div class="panel-body">
							
								<table class="table">
									<tbody>
										<tr>
											<th class="col-md-1 text-right">책 이름</th>
											<td class="col-md-4" colspan="2"><input type="text" class="form-control" placeholder="책 이름" name="detailSubject" id="detailSubject"></td>
										</tr>
										<tr>
											<th class="col-md-1 text-right">저자</th>
											<td class="col-md-4" colspan="2"><input type="text" class="form-control" placeholder="저자" name="detailWrite" id="detailWrite"></td>
										</tr>
										<tr>
											<th class="col-md-1 text-right">출판사</th>
											<td class="col-md-4" colspan="2"><input type="text" class="form-control" placeholder="출판사" name="detailPub" id="detailPub"></td>
										</tr>
										<tr>
											<th class="col-md-1 text-right">카테고리</th>
											<td class="col-md-2">
												${bookLgSelect }
											</td>
											<td class="col-md-2">
												<select id="cateMd" class="form-control">
												</select>
											</td>
										</tr>
										<tr>
											<td class="text-center" colspan="3"><button class="btn btn-default" id="detailSearch">상세검색</button></td>
										</tr>
									</tbody>
								</table>
								
							</div>
						</div><!-- 상세검색부분 End -->
					</div>
				</div>
			</div><!-- 상세검색 End -->
			
			<!-- 검색리스트 -->
			<div class="row">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>
								<div class="row">
								<div class="col-md-6 text-left">
									<span>자료검색</span>
								</div>
								<div class="col-md-6 text-right order">
									<span data-order="recommend">추천 순</span>
									&nbsp;&nbsp;&nbsp;&nbsp;
									<span data-order="new">최신 순</span>
								</div>
								</div>
							</th>
						</tr>
					</thead>
					
					<tbody id="contentTbody">
					<!-- Ajax로 들어감 -->
					</tbody>
					
					<tfoot class="text-center">
						<tr>
							<td>
								<nav id="pagingNav" class="noSearch">
									<ul class="pagination">
										<li data-page="before"><a href="#" onclick="return false" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
										<li data-page="1"><a href="#" onclick="return false">1</a></li>
										<li data-page="2"><a href="#" onclick="return false">2</a></li>
										<li data-page="3"><a href="#" onclick="return false">3</a></li>
										<li data-page="4" class="disabled"><a href="#" onclick="return false">4</a></li>
										<li data-page="5"><a href="#" onclick="return false">5</a></li>
										<li data-page="after"><a href="#" onclick="return false" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>	</li>
									</ul>
								</nav>
							</td>
						</tr>
					</tfoot>
				</table>
			</div><!-- 검색리스트 End-->
			
		</div><!-- 컨텐츠 End-->
	</div><!-- 사이드바+컨텐츠 End-->

<!-- Modal -->
	<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
				</div>
				<div class="modal-body">
					<!-- 선택한 책 -->
				</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-info" data-dismiss="modal">닫기</button>
			</div>
			</div>
		</div>
	</div>
	
</body>
</html>