<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title></title>
		<script type="text/javascript" src="/lee/resources/js/jquery-3.2.1.min.js"></script>
		<script src="/lee/resources/audio/voice/js/main.js"></script>
		<script src="/lee/resources/audio/voice/js/highlight.min.js"></script>
		<script src="/lee/resources/audio/voice/js/DetectRTC.js"></script>
		<script src="/lee/resources/audio/voice/js/global.js?ver=1.0"></script>
		<script src="/lee/resources/audio/voice/js/jquery.js?ver=1.0"></script>
		<link href="logo-webrtc.png" type="image/png" rel="icon">
		<link href="/lee/resources/audio/voice/css/style.css" type="text/css" rel="stylesheet">
		<link href="/lee/resources/audio/voice/css/github-gist.css" type="text/css" rel="stylesheet">
		<link href="/lee/resources/audio/voice/css/main.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<header>
		<h1>음성 인식</h1>
	</header>


	<!--

	1m 이내, 인식률 최대 80%이상
	1.2m 이내, 인식률 약 60~70%
	1.5m 초과, 인식률 약 10% 문자 인식 거의 못함
-->

	<div id="content">
		<span id="icon-music">♬</span>

		<div class="wrap">
			<p>아래 버튼을 누른 후 마이크에 이야기를 해보세요. (마이크와 가까울수록 인식률이 좋습니다)</p>
			<div id="result">
				<span class="final" id="final_span"></span> 
				<span class="interim" id="interim_span"></span>
			</div>
			<button id="btn-mic" class="off">
				마이크 <span></span>
			</button>
			<button id="btn-tts">Text to speech</button>
			<audio id="audio" src="/lee/resources/audio/voice/ending.mp3"></audio>
			<!--
		<div>
		  <button onclick="document.getElementById('audio').play()">Play the Audio</button>
		  <button onclick="document.getElementById('audio').pause()">Pause the Audio</button>
		  <button onclick="document.getElementById('audio').volume+=0.2">Increase Volume</button>
		  <button onclick="document.getElementById('audio').volume-=0.2">Decrease Volume</button>
		</div>
		-->
			<br>
			<br>

			<h3>예약어 (마이크를 켠 상태에서 아래 문자를 읽어보세요)</h3>
			<ul>
				<li>레드, 그린, 옐로우, 오렌지, 그레이, 골드, 블랙</li>
				<li>알람</li>
				<li>재생, 노래 켜, 노래 꺼, 음악 켜, 음악 꺼</li>
				<li>볼륨업, 볼륨다운</li>
				<li>스피치, 말해줘</li>
			</ul>
		</div>
	</div>
	<script>
		hljs.initHighlightingOnLoad();
	</script>
</body>
</html>