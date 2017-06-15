<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="/lee/resources/mainMenu/jquery.smartmenus.min.js"></script>
<link rel="stylesheet" href="/lee/resources/mainMenu/css/sm-core-css.css">
<link rel="stylesheet" href="/lee/resources/mainMenu/css/sm-clean/sm-clean.css">
<style type="text/css">
	body{
		width: 90%;
		margin: auto;
	}
	@media (max-width: 768px) {
		body{
			width: auto;
			margin: 0 10%;
		}
	}
	#mainImg{
		height: 100px;
		/* background: yellow; */
	}
	
	.main-menu-btn {
		position: relative;
		display: inline-block;
		width: 28px;
		height: 28px;
		text-indent: 28px;
		white-space: nowrap;
		overflow: hidden;
		cursor: pointer;
		-webkit-tap-highlight-color: rgba(0,0,0,0);
	}
	/* hamburger icon */
	.main-menu-btn-icon, .main-menu-btn-icon:before, .main-menu-btn-icon:after {
		position: absolute;
		top: 50%;
		left: 2px;
		height: 2px;
		width: 24px;
		background: #bbb;
		-webkit-transition: all 0.25s;
		transition: all 0.25s;
	}
	.main-menu-btn-icon:before {
		content: '';
		top: -7px;
		left: 0;
	}
	.main-menu-btn-icon:after {
		content: '';
		top: 7px;
		left: 0;
	}
	/* x icon */
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon {
		height: 0;
		background: transparent;
	}
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon:before {
		top: 0;
		-webkit-transform: rotate(-45deg);
		transform: rotate(-45deg);
	}
	#main-menu-state:checked ~ .main-menu-btn .main-menu-btn-icon:after {
		top: 0;
		-webkit-transform: rotate(45deg);
		transform: rotate(45deg);
	}
	/* hide menu state checkbox (keep it visible to screen readers) */
	#main-menu-state {
		position: absolute;
		width: 1px;
		height: 1px;
		margin: -1px;
		border: 0;
		padding: 0;
		overflow: hidden;
		clip: rect(1px,1px,1px,1px);
	}
	/* hide the menu in mobile view */
	#main-menu-state:not(:checked) ~ #main-menu {
		display: none;
	}
	#main-menu-state:checked ~ #main-menu {
		display: block;
	}
	@media (min-width: 768px) {
		/* hide the button in desktop view */
		.main-menu-btn {
			position: absolute;
			top: -99999px;
		}
		/* always show the menu in desktop view */
		#main-menu-state:not(:checked) ~ #main-menu {
			display: block;
		}
	}
	
	@media (min-width: 768px) {
		#main-menu > li {
			float: none;
			display: table-cell;
			width: 1%;
			text-align: center;
		}
	}
	
	.loginColor{
		color : #0bd392;
	}
	.loginColor:HOVER {
		color: #1aa4ac;
	}
</style>

<script type="text/javascript">
	$(function() {
		$('#main-menu').smartmenus(
			{
				mainMenuSubOffsetX: -1
				, subMenusSubOffsetX: 10
				, subMenusSubOffsetY: 0
			}
		);
	});
</script>

<header>
	
	<div class="row">
		<div id="mainImg" class="col-md-3">
			<img src="/lee/resources/index/logo2.png" style="width:130%;height:100%;">
		</div>
		<div class="col-md-2 col-md-offset-7 loginClass">		
				<c:set var="sid" value="${sessionScope.sid}"/>
				<c:choose>
					<c:when test="${empty sid}">
						<a href="/lee/login.ju"><span class="glyphicon glyphicon-log-in loginColor" aria-hidden="true">로그인</span></a>
						<a href="/lee/memberJoin.ju"><span class="glyphicon glyphicon-user loginColor" aria-hidden="true">회원가입</span></a>
					</c:when>
					<c:otherwise>
						${sessionScope.sname}님 환영합니다
						<a href="/lee/logout.ju?sid=${sid}"><span class="glyphicon glyphicon-log-out loginColor" aria-hidden="true">로그아웃</span></a>
					</c:otherwise>
				</c:choose>
				
		</div>
	</div>
	
	<div class="row">
		<nav id="main-nav" role="navigation">
			<input id="main-menu-state" type="checkbox" />
			<label class="main-menu-btn" for="main-menu-state">
			  <span class="main-menu-btn-icon"></span> Toggle main menu visibility
			</label>
			<ul id="main-menu" class="sm sm-clean">
				<li><a href="/lee/index.ju">Home</a></li>
				<li><a href="/lee/libMaster.ju">도서관 소개</a>
					<ul>
						<li><a href="/lee/libMaster.ju">도서관장 인사말</a></li>
						<li><a href="/lee/libHistory.ju">도서관 연혁</a></li>
						<li><a href="/lee/libInside.ju">층별소개</a></li>
						<li><a href="/lee/libMap.ju">오시는길</a></li>
						<li><a href="/lee/libStatus.ju">장서정보(소장도서정보)</a></li>
						<li><a href="/lee/libGuide.ju">이용안내</a></li>
						<li><a href="/lee/analSearch.ju">도서관 통계</a></li>
					</ul>
				</li>
				<li><a href="/lee/bkList.ju">일반도서 검색</a></li>
				<li><a href="/lee/ebookMain.ju">전자도서관</a>
					<ul>
						<li><a href="/lee/ebook.ju">전자도서</a></li>
						<li><a href="/lee/eAudio.ju">오디오북</a></li>
						<li><a href="/lee/eMagazine.ju">E-Magazine</a></li>
						<li><a href="/lee/eEdu.ju">교육</a></li>
					</ul>
				</li>
				<li><a href="/lee/bookingIndex.ju">이용예약</a>
					<ul>
						<li><a href="/lee/rrBook.ju">열람실</a></li>
						<li><a href="/lee/srBook.ju">스터디룸</a></li>
						<li><a href="/lee/crBook.ju">자료실예약</a></li>
					</ul>
				</li>
				<li><a href="/lee/learningIndex.ju">평생교육</a></li>
				<li><a href="/lee/noticeList.ju">고객지원서비스</a>
					<ul>
						<li><a href="/lee/noticeList.ju">공지사항</a></li>
						<li><a href="/lee/missingList.ju">분실물</a></li>
						<li><a href="/lee/faqList.ju">FAQ</a></li>
						<li><a href="/lee/questList.ju">QnA</a></li>
						<li><a href="/lee/orderBkList.ju">희망도서신청</a></li>
						<li><a href="/lee/reviewList.ju">책추천 및 감상평</a></li>
					</ul>
				</li>
			</ul>
		</nav>
	</div>

</header>