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
			   <li><a href='#/lee/ebook.ju' class="mainGo">일반도서 검색</a></li>
			   <li class="has-sub" id="ebList"><a href='#'>철학</a><!-- 1단 -->
			   	  <ul>
			   	  	<li class='sub'><a onclick="cateMove(0,0)">미학/예술철학</a> <!-- 2단 --></li>
			   	  	<li class='sub'><a onclick="cateMove(0,1)">종교학/신화학</a> <!-- 2단 --></li>
			   	  	<li class='sub'><a onclick="cateMove(0,2)">논리학</a> <!-- 2단 --></li>
			   	  	<li class='sub'><a onclick="cateMove(0,3)">윤리학</a> <!-- 2단 --></li>
			   	  	<li class='sub'><a onclick="cateMove(0,4)">철학/사상</a> <!-- 2단 --></li>
			   	  	<li class='sub'><a onclick="cateMove(0,5)">한국철학</a> <!-- 2단 --></li>
			   	  	<li class='sub'><a onclick="cateMove(0,6)">동양철학</a> <!-- 2단 --></li>
			   	  	<li class='sub'><a onclick="cateMove(0,7)">서양철학</a> <!-- 2단 --></li>
			   	 </ul>
			   </li> 
			   <li class="has-sub" id="ebList"><a href='#'>종교</a><!-- 1단 -->
			   	  <ul>
			   	  	<li class='has-sub'><a onclick="cateMove(1,0)">종교 일반</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(1,1)">기독교(개신교)</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(1,2)">천주교</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(1,3)">불교</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(1,4)">세계종교</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(1,5)">역학/사주</a> <!-- 2단 --></li>
			   	 </ul>
			   </li> 
			   
			   <li class="has-sub" id="ebList"><a href='#'>인문과학</a><!-- 1단 -->
			   	  <ul>
			   	  	<li class='has-sub'><a onclick="cateMove(2,0)">경제</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,1)">경영</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,2)">마케팅/세일즈</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,3)">투자/재테크</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,4)">CEO/비즈니스맨</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,5)">총람/연감</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,6)">정부간행물</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,7)">심리</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,8)">인문일반</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(2,9)">기호학/언어학</a> <!-- 2단 --></li>
			   	 </ul>
			   </li> 
			   <li class="has-sub" id="ebList"><a href='#'>자연과학</a><!-- 1단 -->
			   	  <ul>
			   	  	<li class='has-sub'><a onclick="cateMove(3,0)">과학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,1)">수학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,2)">물리학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,3)">화학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,4)">나노과학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,5)">생명과학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,6)">뇌과학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,7)">인체</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,8)">천문학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,9)">지구과학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,10)">공학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(3,11)">농/축/수산학</a> <!-- 2단 --></li>
			   	 </ul>
			   </li>
			   <li class="has-sub" id="ebList"><a href='#'>예술</a><!-- 1단 -->
			   	  <ul>
			   	  	<li class='has-sub'><a onclick="cateMove(4,0)">예술기행</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,1)">예술일반/예술사</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,2)">건축</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,3)">미술</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,4)">음악</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,5)">사진</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,6)">무용</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,7)">대중문화론</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,8)">TV/라디오</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,9)">연극/공연</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,10)">영화/드라마 </a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,11)">대중음악</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,12)">아트북</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(4,13)">예술치료</a> <!-- 2단 --></li>
			   	 </ul>
			   </li>
			   <li class="has-sub" id="ebList"><a href='#'>언어</a><!-- 1단 -->
			   	  <ul>
			   	  	<li class='has-sub'><a onclick="cateMove(5,0)">언어일반</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,1)">한국어</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,2)">중국어</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,3)">일본어 및 기타 아시아어</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,4)">영어</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,5)">독일어 및 기타 게르만어</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,6)">프랑스어</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,7)">스페인어</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,8)">이탈리어</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(5,9)">기타언어</a> <!-- 2단 --></li>
			   	 </ul>
			   </li>
			   <li class="has-sub" id="ebList"><a href='#'>문학</a><!-- 1단 -->
			   	  <ul>
			   	  	<li class='has-sub'><a onclick="cateMove(6,0)">소설</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(6,1)">에세이</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(6,2)">역사/장르문학</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(6,3)">테마소설</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(6,4)">고전문학/신화</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(6,5)">시/희곡</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(6,6)">비평/창작/이론</a> <!-- 2단 --></li>
			   	 </ul>
			   </li>
			   <li class="has-sub" id="ebList"><a href='#'>역사</a><!-- 1단 -->
			   	  <ul>
			   	  	<li class='has-sub'><a onclick="cateMove(7,0)">역사와 문화 교양서</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(7,1)">역사학 이론/비평</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(7,2)">한국사/한국문화</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(7,3)">동양사/동양문화</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(7,4)">서양사/서양문화</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(7,5)">세계사/세계문화</a> <!-- 2단 --></li>
			   	  	<li class='has-sub'><a onclick="cateMove(7,6)">기타 역사</a> <!-- 2단 --></li>
			   	 </ul>
			   </li>
			</ul>
			</div>
	</div>
</div>