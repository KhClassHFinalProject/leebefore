<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/lee/resources/sideMenu/sideScript.js"></script>
<link rel="stylesheet" href="/lee/resources/sideMenu/css/sideStyle.css">

<style>
@media (max-width:768px) {
	#cssmenu{
		width:100%;
	}
}
</style>

<div>
	<div class="col-md-2">
		<div id='cssmenu'>
			<ul>
			   <li><a href='/lee/libMaster.ju' class="mainGo">도서관 소개</a></li>
			   <li class="has-sub" id="ebList"><a href='/lee/libMaster.ju'>도서관장 인사말</a></li> 
			   <li class="has-sub" id="ebList"><a href='/lee/libHistory.ju'>도서관 연혁</a></li> 
			   <li class="has-sub" id="ebList"><a href='/lee/libInside.ju'>층별소개</a></li> 
			   <li class="has-sub" id="ebList"><a href='/lee/libMap.ju'>오시는길</a></li>
			   <li class="has-sub" id="ebList"><a href='/lee/libStatus.ju'>장서정보</a></li>
			   <li class="has-sub" id="ebList"><a href='/lee/libGuide.ju'>이용안내</a> </li>
			   <li class="has-sub" id="ebList"><a href='/lee/analysis.ju'>도서관통계</a></li>
			</ul>
			</div>
	</div>
</div>